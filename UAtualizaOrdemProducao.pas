{-------------------------------------------------------------------------------
 Programa..: UAtualizaOrdemProducao
 Empresa...: Sulapsso Informatica
 Finalidade: Atualização de Ordens de Produção
 Autor          Data      Operação  Descrição
 Verlan Fernandes  JUL/2020 Criação
-------------------------------------------------------------------------------}


unit UAtualizaOrdemProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Menus, URetornaSQL, URetornaRecord,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAtualizaOrdemProducao = class(TForm)
    pnlCabecalho: TPanel;
    pnlRodape: TPanel;
    pnlGrid: TPanel;
    DBGrid1: TDBGrid;
    edtProcessoAtualizacao: TEdit;
    Label2: TLabel;
    edtCodMateriaPrima: TMaskEdit;
    cbxMateriaPrima: TComboBox;
    Panel1: TPanel;
    btnAddMaterial: TBitBtn;
    btnAtualizarOrdem: TBitBtn;
    btnSair: TBitBtn;
    cdsAddMateriais: TClientDataSet;
    dtsAddMateriais: TDataSource;
    cdsAddMateriaissequencia: TIntegerField;
    cdsAddMateriaisprod_codigo: TIntegerField;
    cdsAddMateriaisdescricao: TStringField;
    cdsAddMateriaisquantidade: TFloatField;
    Label4: TLabel;
    edtQuantidade: TMaskEdit;
    popGridOP: TPopupMenu;
    AtulizarOP1: TMenuItem;
    edtNrOrdem: TMaskEdit;
    Label1: TLabel;
    edtProdCodigo: TMaskEdit;
    edtProdNome: TMaskEdit;
    FdQryAtualizacao: TFDQuery;
    FdQryAuxPrecoItens: TFDQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddMaterialClick(Sender: TObject);
    procedure edtQuantidadeClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure AtulizarOP1Click(Sender: TObject);
    procedure cbxMateriaPrimaClick(Sender: TObject);
    procedure edtCodMateriaPrimaExit(Sender: TObject);
    procedure btnAtualizarOrdemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    //RetornaSQL : TRetornaSQL;

    procedure CarregaComboMatPrima();
    procedure Atualiza_Kardex_Hist_Est;
    procedure SaveKardex(const sProdCodigo, sTipo: string; dQuantidade: Real);
    procedure SaveHistoricoProduto(const sProdCodigo, sTipo: string; const iNrLancamento: Integer; dQuantidade: Real);
    procedure SaveEstMovimento(const sProdCodigo, sTipo: string; dQuantidade, dVlrTotal: Real);
    procedure SaveEstMes(const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal: Real);
    procedure SaveGeralNota(const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dVlrNota: Real);
    procedure SaveGeralNotaItem(const sNatureza, sSeq, sProdCodigo, sUN, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dQtde, dVlrItem: Real);
    procedure AtualizaSituacao(const nr_ordem, situacao: string);
    procedure DataAtualizacao(const nr_ordem: string; data_atualizacao: TDate);
    procedure AtualizaTotalNota(const sNatureza, sNrDocumento, sSerie, sCliente,
      sVlrTotal: string; dDataEmissao: TDate);
    procedure AtualizaPrecoNota(const sNatureza, sNrDocumento, sSerie, sCliente,
      sPrecoMedio: string; dDataEmissao: TDate);
  public
    { Public declarations }
    NR_ORDEM, PROD_CODIGO, PROD_NOME : string;
    VLR_TOTAL, QTD_SC, QTD_KG : Real;
  end;

var
  frmAtualizaOrdemProducao: TfrmAtualizaOrdemProducao;

implementation

{$R *.dfm}

uses uDtmSisGestao, uFuncoes;

procedure TfrmAtualizaOrdemProducao.AtulizarOP1Click(Sender: TObject);
begin
    if not cdsAddMateriais.IsEmpty then
        cdsAddMateriais.Delete;
end;

procedure TfrmAtualizaOrdemProducao.btnAddMaterialClick(Sender: TObject);
var
    sequencia : Integer;
begin
    sequencia := 0;
    if cdsAddMateriais.IsEmpty then
    begin
        dtmSisGestao.FdQryGeralDados.Active      := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select max(comp_seq) as sequencia from geral_produtos_composicao '+
                                                    ' where prod_codigo = '+ PROD_CODIGO);
        dtmSisGestao.FdQryGeralDados.Active      := true;
        sequencia := dtmSisGestao.FdQryGeralDados.FieldByName('sequencia').AsInteger + 1;
    end
    else
    begin
        cdsAddMateriais.Last;
        sequencia := cdsAddMateriaissequencia.AsInteger + 1;
    end;

    if (AllTrim(edtCodMateriaPrima.Text) <> '') and  (AllTrim(cbxMateriaPrima.Text) <> '') and
        (AllTrim(edtQuantidade.Text) <> ',') and (AllTrim(edtQuantidade.Text) <> '0,000') then
    begin
        cdsAddMateriais.Append;
        cdsAddMateriaissequencia.AsInteger   := sequencia;
        cdsAddMateriaisprod_codigo.AsInteger := StrToInt(edtCodMateriaPrima.Text);
        cdsAddMateriaisdescricao.AsString    := Copy(cbxMateriaPrima.Text,1,40);
        cdsAddMateriaisquantidade.AsFloat    := StrToFloat(edtQuantidade.Text);
        cdsAddMateriais.post;
    end;

    edtCodMateriaPrima.SetFocus;

end;

procedure TfrmAtualizaOrdemProducao.btnAtualizarOrdemClick(Sender: TObject);
begin

    if QTD_SC <> 0 then
    begin
        //Nota capa - produto acabado
        if dtmSisGestao.FdConnection.InTransaction then
            dtmSisGestao.FdConnection.Rollback;
        dtmSisGestao.FdConnection.StartTransaction;
        try
            SaveGeralNota('1', '7', NR_ORDEM, 'IND', '11676', Date, VLR_TOTAL);
            edtProcessoAtualizacao.Text := 'Gravando Nota Capa: Nr. ' + NR_ORDEM + '; Série - IND' ;
            edtProcessoAtualizacao.Refresh;

        except
            on e : Exception do
            begin
                dtmSisGestao.FdConnection.Rollback;
                Informacao('Erro ao gravar o registro. Tabela: geral_notas_capa' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
                Exit;
            end;
        end;
        dtmSisGestao.FdConnection.Commit;

    end;

    //Nota capa - Materia prima
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;
    try
        //Matéria Prima
        SaveGeralNota('2', '8', NR_ORDEM, 'MAP', '11676', Date, VLR_TOTAL);
        edtProcessoAtualizacao.Text := 'Gravando Nota Capa: Nr. ' + NR_ORDEM + '; Série MAP' ;
        edtProcessoAtualizacao.Refresh;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao gravar o registro. Tabela: geral_notas_capa' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;
    dtmSisGestao.FdConnection.Commit;

    {Atualiza Historico, Estoque, Kardex, etc ...}
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;
    try
        Atualiza_Kardex_Hist_Est();
    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao gravar atualizações. ' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;
    dtmSisGestao.FdConnection.Commit;

    {Atualiza Status e Data de Atualização}
    AtualizaSituacao(NR_ORDEM, 'F');
    DataAtualizacao(NR_ORDEM, Date);

    edtProcessoAtualizacao.Text := 'A T U A L I Z A Ç Ã O   C O N C L U Í D A !';
    edtProcessoAtualizacao.Refresh;
    Informacao('Atualização efetuada com sucesso! '+ #10+#13 + 'Nr.Ordem: '+ NR_ORDEM, 'Aviso...');
    btnSair.OnClick(Self);
    ModalResult := mrOk;

end;

procedure TfrmAtualizaOrdemProducao.btnSairClick(Sender: TObject);
begin
    cdsAddMateriais.Close;
    Close;
end;

procedure TfrmAtualizaOrdemProducao.CarregaComboMatPrima;
begin
    dtmSisGestao.FdQryGeralDados.Active      := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(' select prod_codigo, prod_descricao from geral_produtos where prod_atv = 1 '+
                                             ' order by prod_descricao');

    dtmSisGestao.FdQryGeralDados.Active := true;
    cbxMateriaPrima.Clear;
    cbxMateriaPrima.Items.Add(Copy(PadRight(' ',40,' '),1,40) + '   ' + PadLeft (' ',8,' '));
    dtmSisGestao.FdQryGeralDados.Next;
    dtmSisGestao.FdQryGeralDados.First;
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        Application.ProcessMessages;
        cbxMateriaPrima.Items.Add(Copy(PadRight(dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString,40,' '),1,40)
                                + ' - ' + PadLeft(dtmSisGestao.FdQryGeralDados.FieldByName('prod_codigo').AsString,8,'0'));
        dtmSisGestao.FdQryGeralDados.Next;
    end;
end;

procedure TfrmAtualizaOrdemProducao.cbxMateriaPrimaClick(Sender: TObject);
begin
    edtCodMateriaPrima.Text := Copy(PadLeft(cbxMateriaPrima.Text,0,'8'),44,8);
end;

procedure TfrmAtualizaOrdemProducao.edtCodMateriaPrimaExit(Sender: TObject);
var
   iInd : Integer;
   sCodigo : String;
   bAchou : Boolean;
begin
    sCodigo := PadLeft(Trim(edtCodMateriaPrima.Text),8,'0');

    bAchou := False;
    for iInd := 0 to (cbxMateriaPrima.Items.Count -1) do
    begin
      if sCodigo = Copy(cbxMateriaPrima.Items[iInd],44,8) then
      begin
           bAchou := True;
           Break;
      end;
    end;
    if not(bAchou ) then
    begin
        cbxMateriaPrima.ItemIndex := -1;
        Exit;
    end;
    cbxMateriaPrima.ItemIndex := iInd;
    cbxMateriaPrima.Text := cbxMateriaPrima.Items[cbxMateriaPrima.ItemIndex];

end;

procedure TfrmAtualizaOrdemProducao.edtQuantidadeClick(Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmAtualizaOrdemProducao.edtQuantidadeExit(Sender: TObject);
begin
    edtQuantidade.Text := Formata_Valor(AllTrim(edtQuantidade.Text),6,3);
end;

procedure TfrmAtualizaOrdemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //RetornaSQL.Destroy();
end;

procedure TfrmAtualizaOrdemProducao.FormCreate(Sender: TObject);
begin
    //RetornaSQL := TRetornaSQL.Create();
end;

procedure TfrmAtualizaOrdemProducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F5              : begin
                                if btnAtualizarOrdem.Enabled then
                                    btnAtualizarOrdem.OnClick(Self);
                             end;
    end;
end;

procedure TfrmAtualizaOrdemProducao.FormShow(Sender: TObject);
begin
    edtNrOrdem.Text    := NR_ORDEM;
    edtProdCodigo.Text := PROD_CODIGO;
    edtProdNome.Text   := PROD_NOME;
    CarregaComboMatPrima();
end;

procedure TfrmAtualizaOrdemProducao.SpeedButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmAtualizaOrdemProducao.Atualiza_Kardex_Hist_Est();
var
    dQtdGeral, dVlrTotal, dPreco, dPrecoMedio, dVlrTotalAtualiza : Real;
begin
    dQtdGeral   := 0;
    dVlrTotal   := 0;
    dPreco      := 0;
    dPrecoMedio := 0;
    dVlrTotalAtualiza := 0;
    //Produto Acabado
    if QTD_SC <> 0 then
    begin
        dPrecoMedio := VLR_TOTAL / QTD_SC;

        SaveKardex(PROD_CODIGO, '1', QTD_SC);
        edtProcessoAtualizacao.Text := 'Gravando Kardex: Produto ' + PROD_CODIGO ;
        edtProcessoAtualizacao.Refresh;

        if cdsAddMateriais.IsEmpty then
        begin
            SaveEstMovimento(PROD_CODIGO, '1', QTD_SC, VLR_TOTAL);
            edtProcessoAtualizacao.Text := 'Gravando Est. Movimento: Produto ' + PROD_CODIGO ;
            edtProcessoAtualizacao.Refresh;

            SaveEstMes(PROD_CODIGO, '1', '0', QTD_SC, VLR_TOTAL);
            edtProcessoAtualizacao.Text := 'Gravando Est. Mensal: Produto ' + PROD_CODIGO ;
            edtProcessoAtualizacao.Refresh;
        end;

        SaveGeralNotaItem('7', '1', PROD_CODIGO, '', NR_ORDEM, 'IND', '11676', Date, QTD_SC, dPrecoMedio);
        edtProcessoAtualizacao.Text := 'Gravando Nota Item: Nr. ' + NR_ORDEM + '; Série IND '+'; Produto '+PROD_CODIGO;
        edtProcessoAtualizacao.Refresh;

    end;

    FdQryAtualizacao.Active      := False;
    FdQryAtualizacao.SQL.Clear;
    FdQryAtualizacao.SQL.Add('select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, '+
                                              ' pc.comp_conversao, p.prod_descricao '+
                                              ' from geral_produtos_composicao pc, geral_produtos p ' +
                                              ' where pc.prod_codigo = '+ PROD_CODIGO +
                                              ' and pc.prod_mat_prima = p.prod_codigo '+
                                              ' and pc.comp_seq <> 0 '+
                                              ' order by pc.comp_seq ');
    FdQryAtualizacao.Active      := True;
    FdQryAtualizacao.First;
    while not FdQryAtualizacao.Eof do
    begin
        if FdQryAtualizacao.FieldByName('comp_conversao').AsString = 'N' then
        begin
            dQtdGeral := QTD_KG;
            dQtdGeral := ( (dQtdGeral * FdQryAtualizacao.FieldByName('comp_quantidade').AsFloat ) / 100 );

        end
        else if FdQryAtualizacao.FieldByName('comp_conversao').AsString = 'S' then
        begin
            dQtdGeral := QTD_SC;
            dQtdGeral := ( dQtdGeral * FdQryAtualizacao.FieldByName('comp_quantidade').AsFloat );
        end;

        //busca preco dos itens
        FdQryAuxPrecoItens.Active      := False;
        FdQryAuxPrecoItens.SQL.Clear;
        FdQryAuxPrecoItens.SQL.Add('select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                        ' and prod_codigo = '+ FdQryAtualizacao.FieldByName('prod_mat_prima').AsString);
        FdQryAuxPrecoItens.Active      := True;

        if not FdQryAuxPrecoItens.IsEmpty then
        begin
            dPreco    := FdQryAuxPrecoItens.FieldByName('preco_preco').AsFloat;
            dVlrTotal := (dPreco * dQtdGeral);

        end
        else
            dVlrTotal := 0;

        //Alimenta valores records
        SaveKardex(FdQryAtualizacao.FieldByName('prod_mat_prima').AsString, '2', dQtdGeral);
        edtProcessoAtualizacao.Text := 'Gravando Kardex: Mat. Prima ' + FdQryAtualizacao.FieldByName('prod_mat_prima').AsString ;
        edtProcessoAtualizacao.Refresh;

        SaveEstMovimento(FdQryAtualizacao.FieldByName('prod_mat_prima').AsString, '2', dQtdGeral, dVlrTotal);
        edtProcessoAtualizacao.Text := 'Gravando Est. Movimento: Mat. Prima ' + FdQryAtualizacao.FieldByName('prod_mat_prima').AsString;
        edtProcessoAtualizacao.Refresh;

        SaveEstMes(FdQryAtualizacao.FieldByName('prod_mat_prima').AsString, '1', '1', dQtdGeral, dVlrTotal);
        edtProcessoAtualizacao.Text := 'Gravando Est. Mensal: Mat. Prima ' + FdQryAtualizacao.FieldByName('prod_mat_prima').AsString;
        edtProcessoAtualizacao.Refresh;

        SaveGeralNotaItem('8', FdQryAtualizacao.FieldByName('comp_seq').AsString, FdQryAtualizacao.FieldByName('prod_mat_prima').AsString, '', NR_ORDEM, 'MAP', '11676', Date, dQtdGeral, dPreco);
        edtProcessoAtualizacao.Text := 'Gravando Nota Item: Nr. ' + NR_ORDEM + '; Série MAP '+'; Seq. '+FdQryAtualizacao.FieldByName('comp_seq').AsString +'; Mat. Prima '+FdQryAtualizacao.FieldByName('prod_mat_prima').AsString;
        edtProcessoAtualizacao.Refresh;

        FdQryAtualizacao.Next;

    end;

    dVlrTotal := 0;  //inicializa variável
    dVlrTotalAtualiza := 0;
    dPrecoMedio := 0;

    if not cdsAddMateriais.IsEmpty then
    begin
        cdsAddMateriais.First;
        while not cdsAddMateriais.Eof do
        begin
            //busca preco dos itens
            FdQryAuxPrecoItens.Active      := False;
            FdQryAuxPrecoItens.SQL.Clear;
            FdQryAuxPrecoItens.SQL.Add('select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                            ' and prod_codigo = '+ cdsAddMateriaisprod_codigo.AsString);
            FdQryAuxPrecoItens.Active      := True;

            if not FdQryAuxPrecoItens.IsEmpty then
            begin
                dPreco    := FdQryAuxPrecoItens.FieldByName('preco_preco').AsFloat;

            end
            else
                dPreco := 0;

            dVlrTotal := (dPreco * cdsAddMateriaisquantidade.AsFloat);
            dVlrTotalAtualiza := dVlrTotal + dVlrTotalAtualiza;

            SaveKardex(cdsAddMateriaisprod_codigo.AsString, '2', cdsAddMateriaisquantidade.AsFloat);
            edtProcessoAtualizacao.Text := 'Gravando Kardex: Mat. Prima ' + cdsAddMateriaisprod_codigo.AsString;
            edtProcessoAtualizacao.Refresh;

            SaveEstMovimento(cdsAddMateriaisprod_codigo.AsString, '2', cdsAddMateriaisquantidade.AsFloat, dVlrTotal);
            edtProcessoAtualizacao.Text := 'Gravando Est. Movimento: Mat. Prima ' + cdsAddMateriaisprod_codigo.AsString;
            edtProcessoAtualizacao.Refresh;

            SaveEstMes(cdsAddMateriaisprod_codigo.AsString, '1', '1', cdsAddMateriaisquantidade.AsFloat, dVlrTotal);
            edtProcessoAtualizacao.Text := 'Gravando Est. Mensal: Mat. Prima ' + cdsAddMateriaisprod_codigo.AsString;
            edtProcessoAtualizacao.Refresh;

            SaveGeralNotaItem('8', cdsAddMateriaissequencia.AsString, cdsAddMateriaisprod_codigo.AsString, '', NR_ORDEM, 'MAP', '11676', Date, cdsAddMateriaisquantidade.AsFloat, dPreco);
            edtProcessoAtualizacao.Text := 'Gravando Nota Item: Nr. ' + NR_ORDEM + '; Série MAP '+'; Seq. '+cdsAddMateriaissequencia.AsString +'; Mat. Prima '+cdsAddMateriaisprod_codigo.AsString;
            edtProcessoAtualizacao.Refresh;

            cdsAddMateriais.Next;
        end;

        //Atualiza (valor total)
        dVlrTotalAtualiza := dVlrTotalAtualiza + VLR_TOTAL;
        //MAP
        AtualizaTotalNota('8', NR_ORDEM, 'MAP', '11676', Elimina_Caracteres(FloatToStr(dVlrTotalAtualiza),',','.'), Date);

        //IND
        AtualizaTotalNota('7', NR_ORDEM, 'IND', '11676', Elimina_Caracteres(FloatToStr(dVlrTotalAtualiza),',','.'), Date);
        dPrecoMedio := (dVlrTotalAtualiza / QTD_SC);
        AtualizaPrecoNota('7', NR_ORDEM, 'IND', '11676', Elimina_Caracteres(FloatToStr(dPrecoMedio),',','.'), Date);


        SaveEstMovimento(PROD_CODIGO, '1', QTD_SC, dVlrTotalAtualiza);
        edtProcessoAtualizacao.Text := 'Gravando Est. Movimento: Produto ' + PROD_CODIGO ;
        edtProcessoAtualizacao.Refresh;

        SaveEstMes(PROD_CODIGO, '1', '0', QTD_SC, dVlrTotalAtualiza);
        edtProcessoAtualizacao.Text := 'Gravando Est. Mensal: Produto ' + PROD_CODIGO ;
        edtProcessoAtualizacao.Refresh;

    end;


end;

procedure TfrmAtualizaOrdemProducao.SaveKardex(const sProdCodigo, sTipo : string; dQuantidade : Real);
var
    rEstoque, rQuantidade : Real;
    sAuxValor : string;
begin
    with URetornaRecord.RetornaGeralKardex do
    begin
        EMPRE_CODIGO     := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO      := StrToInt(sProdCodigo);
        CLI_CODIGO       := 11676; //cliente Belem
        KARD_QUANTIDADE  := FormatFloat('0.000', dQuantidade);
        KARD_DATA        := DateToStr(Date);
        KARD_DOCUMENTO   := StrToInt(NR_ORDEM);
        KARD_TIPO        := sTipo;
        EMPRE_CODIGOF    := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        FUNC_CODIGO      := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add ( LowerCase('SELECT * FROM GERAL_KARDEX '+
                                                       ' WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) '+
                                                       ' order by kard_lancamento desc '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger  := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Active := True;

        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
            KARD_ESTOQUE := dtmSisGestao.FdQryGeral.FieldByName('KARD_ESTOQUE').AsString
        else
            KARD_ESTOQUE := '0.0000';

        // gera número sequencial no item
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT MAX(KARD_LANCAMENTO)+1 KARD_LANCAMENTO FROM GERAL_KARDEX '+
                                                       'WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger  := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Active := True;

        if dtmSisGestao.FdQryGeral.FieldByName('KARD_LANCAMENTO').IsNull then
            KARD_LANCAMENTO := 1
        else
            KARD_LANCAMENTO := dtmSisGestao.FdQryGeral.FieldByName('KARD_LANCAMENTO').AsInteger;


        sAuxValor := Trim(KARD_QUANTIDADE); // estoque Atual, sem a quantidade
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,',','.'),'.',',');
        rQuantidade  := StrToFloat(sAuxValor); // se GERALNATUREZA.NATU_ESTOQUE = '0' = Não Atualiza, mantém o estoque atual


        sAuxValor := Trim(KARD_ESTOQUE); // estoque Atual, sem a quantidade
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,',','.'),'.',',');
        rEstoque  := StrToFloat(sAuxValor); // se GERALNATUREZA.NATU_ESTOQUE = '0' = Não Atualiza, mantém o estoque atual

        if KARD_TIPO = '1' then  //ENTRADA
            rEstoque  := rEstoque + rQuantidade  // soma quantidade no estoque
        else
            rEstoque  := rEstoque - rQuantidade;  // diminui quantidade no estoque

        sAuxValor := FloatToStr(rEstoque);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,'.',','),',','.');
        KARD_ESTOQUE := sAuxValor;

        sAuxValor := Trim(KARD_QUANTIDADE);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,'.',','),',','.');
        KARD_QUANTIDADE := sAuxValor;

        sAuxValor := Trim(KARD_ESTOQUE);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,'.',','),',','.');
        KARD_ESTOQUE := sAuxValor;

    end;

    URetornaSQL.GravaKardex();

    //Dados Atualização Hist. Produto
    SaveHistoricoProduto(sProdCodigo, sTipo, URetornaRecord.RetornaGeralKardex.KARD_LANCAMENTO, dQuantidade);

end;

procedure TfrmAtualizaOrdemProducao.SaveHistoricoProduto( const sProdCodigo, sTipo : string; const iNrLancamento : Integer; dQuantidade : Real );
var
    dEstoqueAtualProduto, dHistpQtdEstoqueAtual : Real;
begin
    dEstoqueAtualProduto := 0;

    with URetornaRecord.RetornaGeralHistorico do
    begin
        HISTP_QTD_ESTOQUE_ATUAL   := '0';
        HISTP_QTD_ANTERIOR        := '0';
        HISTP_DATA_ULTIMA_SAIDA   := '';
        HISTP_DATA_ULTIMA_ENTRADA := '';
        HISTP_QTD_ULTIMA_SAIDA    := '0';
        HISTP_QTD_ULTIMA_ENTRADA  := '0';
        HISTP_NR_LANCAMENTO       := iNrLancamento;
        PROD_CODIGO               := StrToInt(sProdCodigo);
        EMPRE_CODIGO              := 1;//FUNCIONARIO.EMPRE_CODIGO;

        dtmSisGestao.FdQryConsulta.Active := false;
        dtmSisGestao.FdQryConsulta.SQL.Clear;
        dtmSisGestao.FdQryConsulta.SQL.Add('Select empre_codigo, '+
                                                   '       prod_codigo, '+
                                                   '       histp_qtd_estoque_atual, '+
                                                   '       histp_qtd_anterior,      '+
                                                   '       histp_data_ultima_saida, '+
                                                   '       histp_preco_compra, '+
                                                   '       histp_nr_lancamento    '+
                                                   ' from  geral_historico_produto '+
                                                   ' where (empre_codigo =:empresa)and (prod_codigo =:produto) ');

          dtmSisGestao.FdQryConsulta.Params.ParamByName('empresa').AsInteger  := EMPRE_CODIGO;
          dtmSisGestao.FdQryConsulta.Params.ParamByName('produto').AsInteger  := PROD_CODIGO;
          dtmSisGestao.FdQryConsulta.Active := True;

          if not dtmSisGestao.FdQryConsulta.FieldByName('prod_codigo').IsNull then
          begin
                if  dtmsisgestao.FdQryConsulta.fieldbyname('histp_qtd_estoque_atual').asstring <> '' then
                     HISTP_QTD_ANTERIOR      :=  dtmsisgestao.FdQryConsulta.fieldbyname('histp_qtd_estoque_atual').AsString
                else
                     HISTP_QTD_ANTERIOR      := '0';

          end;
          dtmSisGestao.FdQryConsulta.Active := false;

          if sTipo = '1' then  //SOMA ESTOQUE
          begin
             HISTP_DATA_ULTIMA_ENTRADA := DateToStr(Date);
             HISTP_QTD_ULTIMA_ENTRADA  := Elimina_Caracteres(FloatToStr(dQuantidade),',','.');
             dHistpQtdEstoqueAtual     := StrToFloat(HISTP_QTD_ANTERIOR) + dQuantidade;
          end;

          if sTipo = '2' then  //DIMINUI ESTOQUE
          begin
            HISTP_DATA_ULTIMA_SAIDA := DateToStr(Date);
            HISTP_QTD_ULTIMA_SAIDA  := Elimina_Caracteres(FloatToStr(dQuantidade),',','.');
            dHistpQtdEstoqueAtual   := StrToFloat(HISTP_QTD_ANTERIOR) - dQuantidade;
          end;

          HISTP_QTD_ESTOQUE_ATUAL  := FloatToStr(dHistpQtdEstoqueAtual);

    end;

    URetornaSQL.GravaHistoricoProduto();

end;

procedure TfrmAtualizaOrdemProducao.SaveEstMovimento(const sProdCodigo, sTipo: string; dQuantidade, dVlrTotal: Real);
var
    dQtdeTotal, dValorTotal, dPrecoMedio : Real;
begin
    dQtdeTotal  := 0;
    dValorTotal := 0;
    dPrecoMedio := 0;

    with URetornaRecord.RetornaGeralEstMov do
    begin
        EMPRE_CODIGO          := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO           := StrToInt(sProdCodigo);
        ESTMVTO_DATA          := DateToStr(Date);
        ESTMVTO_DOCUMENTO     := StrToInt(NR_ORDEM);
        REPRE_CODIGO          := '0';
        ESTMVTO_CUSTO         := '0';

        if stipo = '1' then  //ENTRADA
        begin
            ESTMVTO_SERIE         := 'IND';
            NATU_CODIGO           := 7;
        end
        else if stipo = '2' then  //SAIDA
        begin
            ESTMVTO_SERIE         := 'MAP';
            NATU_CODIGO           := 8;
        end;

        CLI_CODIGO            := 11676;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_MOVIMENTO WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) AND '+
                                                '(ESTMVTO_DATA = :ESTMVTODATA) AND (ESTMVTO_DOCUMENTO = :ESTMVTODOCUMENTO) AND (ESTMVTO_SERIE = :ESTMVTOSERIE)'));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger      := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger       := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTODATA').AsDate         := StrToDate(ESTMVTO_DATA);
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTODOCUMENTO').AsInteger := ESTMVTO_DOCUMENTO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTOSERIE').AsString      := ESTMVTO_SERIE;
        dtmSisGestao.FdQryGeral.Active := True;

        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
        begin
            dQtdeTotal    := dtmSisGestao.FdQryGeral.FieldByName('ESTMVTO_QUANTIDADE').AsFloat;
            dValorTotal   := dtmSisGestao.FdQryGeral.FieldByName('ESTMVTO_VALOR').AsFloat;

            dQtdeTotal          := dQtdeTotal + dQuantidade;
            ESTMVTO_QUANTIDADE  := Elimina_Caracteres(FloatToStr(dQtdeTotal),',','.');

            dValorTotal         := dValorTotal + dVlrTotal;
            ESTMVTO_VALOR       := Elimina_Caracteres(FloatToStr(dValorTotal),',','.');

            if dQtdeTotal <> 0 then
            begin
                dPrecoMedio     := dValorTotal / dQtdeTotal;
                ESTMVTO_CUSTO   := Elimina_Caracteres(FloatToStr(dPrecoMedio),',','.');
            end;

        end
        else
        begin
            dQtdeTotal          := dQtdeTotal + dQuantidade;
            ESTMVTO_QUANTIDADE  := Elimina_Caracteres(FloatToStr(dQtdeTotal),',','.');

            dValorTotal         := dValorTotal + dVlrTotal;
            ESTMVTO_VALOR       := Elimina_Caracteres(FloatToStr(dValorTotal),',','.');

            if dQtdeTotal <> 0 then
            begin
                dPrecoMedio     := dValorTotal / dQtdeTotal;
                ESTMVTO_CUSTO   := Elimina_Caracteres(FloatToStr(dPrecoMedio),',','.');
            end;
        end;

    end;

    URetornaSQL.GravaEstMovimento();

end;

procedure TfrmAtualizaOrdemProducao.SaveEstMes( const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal : Real );
var
    dQtdeEnt, dValorEnt, dQtdeSai, dValorSai  : Real;
    sData  : string;
begin
    with URetornaRecord.RetornaGeralEstMes do
    begin
        EMPRE_CODIGO       := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO        := StrToInt(sProdCodigo);
        sData              := DateToStr(Date);
        sData              := Copy(Trim(sData),7,4) + Copy(Trim(sData),4,2); // AAAAMM

        ESTMES_DATA        := StrToInt(sData);
        ESTMES_ENT_QTD	   := '0.0000';
        ESTMES_SAI_QTD     := '0.0000';
        ESTMES_ENT_VLR	   := '0.0000';
        ESTMES_SAI_VLR	   := '0.0000';
        ESTMES_CUSTO_FINAL := '0.0000';

        dQtdeEnt  := 0;
        dQtdeSai  := 0;
        dValorSai := 0;
        dValorEnt := 0;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add( LowerCase('SELECT * FROM GERAL_ESTATISTICA_MENSAL '+
                                                       ' WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) AND (ESTMES_DATA = :ESTMESDATA) '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger  := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMESDATA').AsInteger  := ESTMES_DATA;
        dtmSisGestao.FdQryGeral.Active := True;
        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
        begin
            dQtdeEnt  := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_ENT_QTD').AsFloat;
            dQtdeSai  := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_SAI_QTD').AsFloat;
            dValorEnt := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_ENT_VLR').AsFloat;
            dValorSai := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_SAI_VLR').AsFloat;

            //sTipo 1 = (+), sTipo 2 = (-) ----- sTipoProd 0 = ACABADO, sTipoProd 1 = MAT.PRIMA
            if (sTipo = '1') and (sTipoProd = '0') then  //(+) - PROD.ACABADO
            begin
                dQtdeEnt        := dQtdeEnt + dQuantidade;
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');

                dValorEnt       := dValorEnt + dVlrTotal;
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');

            end;

            if (sTipo = '2') and (sTipoProd = '0') then  //(-) - PROD ACABADO
            begin
                dQtdeEnt        := dQtdeEnt - dQuantidade;
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');

                dValorEnt       := dValorEnt - dVlrTotal;
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
            end;

            if (sTipo = '1') and (sTipoProd = '1') then  //(+) - MAT. PRIMA
            begin
                dQtdeSai        := dQtdeSai + dQuantidade;
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
            if (sTipo = '2') and (sTipoProd = '1') then  //(-) - MAT. PRIMA
            begin
                dQtdeSai        := dQtdeSai - dQuantidade;
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
        end
        else
        begin
            if (sTipo = '1') and (sTipoProd = '0') then  //(+) - PROD.ACABADO
            begin
                dQtdeEnt        := dQtdeEnt + dQuantidade;
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');

                dValorEnt       := dValorEnt + dVlrTotal;
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');

            end;

            if (sTipo = '2') and (sTipoProd = '0') then  //(-) - PROD ACABADO
            begin
                dQtdeEnt        := dQtdeEnt - dQuantidade;
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');

                dValorEnt       := dValorEnt - dVlrTotal;
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
            end;

            if (sTipo = '1') and (sTipoProd = '1') then  //(+) - MAT. PRIMA
            begin
                dQtdeSai        := dQtdeSai + dQuantidade;
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
            if (sTipo = '2') and (sTipoProd = '1') then  //(-) - MAT. PRIMA
            begin
                dQtdeSai        := dQtdeSai - dQuantidade;
                ESTMES_SAI_QTD  := Elimina_Caracteres(FloatToStr(dQtdeSai),',','.');
                ESTMES_ENT_QTD  := Elimina_Caracteres(FloatToStr(dQtdeEnt),',','.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;

        end;
    end;

    URetornaSQL.GravaEstMes();

end;

procedure TfrmAtualizaOrdemProducao.SaveGeralNota(const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string;
dDataEmissao: TDate; dVlrNota : Real);
begin
    try
        dtmSisGestao.FdQryGeralDados.Active      := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select NATU_CODFISCALDENTRO, NATU_NOME from geral_natureza where NATU_CODIGO = '+ sNatureza);
        dtmSisGestao.FdQryGeralDados.Active      := true;

        dtmSisGestao.FdQryGeral.Active      := false;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add('select cli_nome, cli_tipopessoa, cli_cnpjcpf, cli_ie from geral_cliente where cli_codigo = '+ sCliente);
        dtmSisGestao.FdQryGeral.Active      := true;

        with URetornaRecord.RetornaGeralNota do
        begin
            EMPRE_CODIGO       := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
            NOTA_NUMERO        := StrToInt(sNrDocumento);
            NOTA_SERIE         := sSerie;
            NOTA_MODELO        := '1B';
            CLI_CODIGO         := StrToInt(sCliente);
            CLI_NOME           := dtmSisGestao.FdQryGeral.FieldByName('cli_nome').AsString;
            CLI_CNPJCPF        := dtmSisGestao.FdQryGeral.FieldByName('cli_cnpjcpf').AsString;
            CLI_IE             := dtmSisGestao.FdQryGeral.FieldByName('cli_ie').AsString;
            CLI_TIPOPESSOA     := dtmSisGestao.FdQryGeral.FieldByName('cli_tipopessoa').AsString;
            NOTA_DT_EMISSAO    := DateToStr(dDataEmissao);
            NOTA_CFOP          := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_CODFISCALDENTRO').AsString;
            NATU_CODIGO        := sNatureza;
            NOTA_TIPO          := sNotaTipo;
            NATU_NOME          := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_NOME').AsString;
            NOTA_SITUACAO      := '';
            SITUACAO_CODIGO    := '1';
            SITUACAO_TIPO      := '0';
            NOTA_VALOR_NF      := Elimina_Caracteres(FloatToStr(dVlrNota),',','.');

        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active := false;
        dtmSisGestao.FdQryGeral.Active      := false;
    end;

    URetornaSQL.GravaGeralNotaInd();

end;

procedure TfrmAtualizaOrdemProducao.SaveGeralNotaItem(const sNatureza, sSeq, sProdCodigo,
  sUN, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dQtde, dVlrItem: Real);
begin
    try
        dtmSisGestao.FdQryGeralDados.Active      := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select NATU_CODFISCALDENTRO, NATU_NOME from geral_natureza where NATU_CODIGO = '+ sNatureza);
        dtmSisGestao.FdQryGeralDados.Active      := true;
        with URetornaRecord.RetornaGeralNotaItem do
        begin
            EMPRE_CODIGO       := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            NOTA_NUMERO        := sNrDocumento;
            NOTA_SERIE         := sSerie;
            CLI_CODIGO         := sCliente;
            NOTA_DT_EMISSAO    := DateToStr(dDataEmissao);
            NOTA_CFOP          := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_CODFISCALDENTRO').AsString;
            ITENS_SEQ          := sSeq;
            PROD_CODIGO        := sProdCodigo;
            ITENS_UNIDADE      := sUN;
            ITENS_QUANTIDADE   := Elimina_Caracteres(FloatToStr(dQtde),',','.');
            ITENS_PRECO_BRUTO  := Elimina_Caracteres(FloatToStr(dVlrItem),',','.');

        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active      := false;
    end;

    URetornaSQL.GravaGeralNotaItemInd();

end;

procedure TfrmAtualizaOrdemProducao.AtualizaSituacao(const nr_ordem, situacao: string);
var
    sqlUpdate : string;
begin
    sqlUpdate := 'update geral_ordem_producao set situacao = '+QuotedStr(situacao)+
                 ' where nr_ordem = '+ nr_ordem;

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro. Tabela: geral_ordem_producao' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure TfrmAtualizaOrdemProducao.DataAtualizacao (const nr_ordem : string ; data_atualizacao : TDate);
var
    sqlUpdate : string;
begin
    sqlUpdate := 'update geral_ordem_producao set data_atualizacao = :data_atualizacao '+
                 ' where nr_ordem = :nr_ordem ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Params.ParamByName('data_atualizacao').AsString := FormatDateTime('yyyy/mm/dd', data_atualizacao) ;
            Params.ParamByName('nr_ordem').AsString         := nr_ordem ;
            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmAtualizaOrdemProducao.AtualizaTotalNota(const sNatureza, sNrDocumento, sSerie, sCliente, sVlrTotal: string; dDataEmissao: TDate);
var
    sqlUpdate : string;
begin
    dtmSisGestao.FdQryGeral.Active := false;
    dtmSisGestao.FdQryGeral.SQL.Clear;
    dtmSisGestao.FdQryGeral.SQL.Add('select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = '+ sNatureza);
    dtmSisGestao.FdQryGeral.Active := true;

    sqlUpdate := 'update geral_notas_capa set NOTA_VALOR_NF = '+sVlrTotal +
                 ' where NOTA_NUMERO = :NOTA_NUMERO '+
                 ' and NOTA_SERIE = :NOTA_SERIE '+
                 ' and CLI_CODIGO = :CLI_CODIGO '+
                 ' and NOTA_DT_EMISSAO = :NOTA_DT_EMISSAO '+
                 ' and NOTA_CFOP = :NOTA_CFOP ';

    //if dtmSisGestao.scnSisGestao.InTransaction then
    //    dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
    //dtmSisGestao.scnSisGestao.StartTransaction(tdSisGestao);

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Params.ParamByName('NOTA_NUMERO').AsString   := sNrDocumento ;
            Params.ParamByName('NOTA_SERIE').AsString    := sSerie ;
            Params.ParamByName('CLI_CODIGO').AsString    := sCliente;
            Params.ParamByName('NOTA_DT_EMISSAO').AsDate := dDataEmissao ;
            Params.ParamByName('NOTA_CFOP').AsString     := dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString;

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
            Informacao('Erro ao atualizar o registro. Tabela: geral_notas_capa' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.scnSisGestao.Commit(tdSisGestao);}

    dtmSisGestao.FdQryGeral.Active := false;

end;

procedure TfrmAtualizaOrdemProducao.AtualizaPrecoNota(const sNatureza, sNrDocumento, sSerie, sCliente, sPrecoMedio: string; dDataEmissao: TDate);
var
    sqlUpdate : string;
begin
    dtmSisGestao.FdQryGeral.Active := false;
    dtmSisGestao.FdQryGeral.SQL.Clear;
    dtmSisGestao.FdQryGeral.SQL.Add('select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = '+ sNatureza);
    dtmSisGestao.FdQryGeral.Active := true;

    sqlUpdate := 'update geral_notas_itens set ITENS_PRECO_BRUTO = '+ sPrecoMedio +
                 ' where NOTA_NUMERO = :NOTA_NUMERO '+
                 ' and NOTA_SERIE = :NOTA_SERIE '+
                 ' and CLI_CODIGO = :CLI_CODIGO '+
                 ' and NOTA_DT_EMISSAO = :NOTA_DT_EMISSAO '+
                 ' and NOTA_CFOP = :NOTA_CFOP ';

    //if dtmSisGestao.scnSisGestao.InTransaction then
    //    dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
    //dtmSisGestao.scnSisGestao.StartTransaction(tdSisGestao);

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Params.ParamByName('NOTA_NUMERO').AsString   := sNrDocumento ;
            Params.ParamByName('NOTA_SERIE').AsString    := sSerie ;
            Params.ParamByName('CLI_CODIGO').AsString    := sCliente;
            Params.ParamByName('NOTA_DT_EMISSAO').AsDate := dDataEmissao ;
            Params.ParamByName('NOTA_CFOP').AsString     := dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString;

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
            Informacao('Erro ao atualizar o registro. Tabela: geral_notas_itens' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.scnSisGestao.Commit(tdSisGestao);}

    dtmSisGestao.FdQryGeral.Active := false;

end;

end.
