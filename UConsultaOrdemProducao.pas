{-------------------------------------------------------------------------------
 Programa..: UConsultaOrdemProducao
 Empresa...: Sulapsso Informatica
 Finalidade: Consulta de Ordens de Produção
 Autor          Data      Operação  Descrição
 Verlan Fernandes  JUL/2020 Criação
-------------------------------------------------------------------------------}


unit UConsultaOrdemProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, UCadastroComposicaoProdutoFinal,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppStrtch, ppMemo, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppVar, URetornaSQL, URetornaRecord;

type
  TfrmConsultaOrdemProducao = class(TForm)
    pnlCabecalho: TPanel;
    pnlGridPrincipal: TPanel;
    pnlRodape: TPanel;
    pnlPesquisar: TPanel;
    btnPesquisa: TBitBtn;
    pnlFiltro: TPanel;
    cbxProcurar: TComboBox;
    cbxResultados: TComboBox;
    Label1: TLabel;
    lblProcurarPor: TLabel;
    pnlDigitacao: TPanel;
    edtProcurar: TMaskEdit;
    lblProcurar: TLabel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnRelatorio: TBitBtn;
    btnAltera: TBitBtn;
    btnNovo: TBitBtn;
    btnUltimo: TBitBtn;
    btnSair: TBitBtn;
    dtsOrdemProducao: TDataSource;
    cdsOrdemProducao: TClientDataSet;
    btnExclui: TBitBtn;
    Panel1: TPanel;
    pgcGeral: TPageControl;
    tsOrdemProducao: TTabSheet;
    tsItens: TTabSheet;
    grdOrdemProducao: TDBGrid;
    Panel2: TPanel;
    grdItens: TDBGrid;
    cdsItensOrdem: TClientDataSet;
    dtsItensOrdem: TDataSource;
    cdsItensOrdemPROD_MAT_PRIMA: TIntegerField;
    cdsItensOrdemCOMP_SEQ: TIntegerField;
    cdsItensOrdemCOMP_CONVERSAO: TStringField;
    cdsItensOrdemATIVO: TStringField;
    cdsItensOrdemprod_descricao: TStringField;
    cdsItensOrdemPROD_CODIGO: TIntegerField;
    cdsItensOrdemcomp_formulacao: TBlobField;
    dtpDataEmissao: TDateTimePicker;
    cdsOrdemProducaoNR_ORDEM: TIntegerField;
    cdsOrdemProducaoDATA_EMISSAO: TDateField;
    cdsOrdemProducaoPROD_CODIGO: TIntegerField;
    cdsOrdemProducaoQTDE_SC: TFMTBCDField;
    cdsOrdemProducaoQTDE_KG: TFMTBCDField;
    cdsOrdemProducaoSITUACAO: TStringField;
    cdsOrdemProducaoDATA_ATUALIZACAO: TDateField;
    cdsOrdemProducaoVALOR_TOTAL: TFMTBCDField;
    cdsOrdemProducaoNR_LOTE: TStringField;
    cdsOrdemProducaoDATA_VALIDADE: TDateField;
    cdsOrdemProducaoempre_codigo: TIntegerField;
    cdsOrdemProducaoprod_ref_forn: TStringField;
    cdsOrdemProducaoprod_codigo_1: TIntegerField;
    cdsOrdemProducaoprod_descricao: TStringField;
    cdsOrdemProducaoprod_unid_venda: TStringField;
    cdsOrdemProducaoprod_unid_compra: TStringField;
    cdsOrdemProducaoprod_grupo: TIntegerField;
    cdsOrdemProducaoprod_subgrp: TIntegerField;
    cdsOrdemProducaoprod_qtd_compra: TFMTBCDField;
    cdsOrdemProducaoprod_peso_liquido: TFMTBCDField;
    cdsOrdemProducaoprod_nr_mes_v: TIntegerField;
    Panel5: TPanel;
    Label3: TLabel;
    edtQtdKG: TDBEdit;
    Label4: TLabel;
    edtQtdSC: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    edtQtdeTotalItem: TEdit;
    DBEdit2: TDBEdit;
    cdsItensOrdemprod_unid_compra: TStringField;
    popGridOP: TPopupMenu;
    mniAtulizarOP: TMenuItem;
    Label8: TLabel;
    edtVlrTotalItem: TEdit;
    edtVlrUnitItem: TEdit;
    Label9: TLabel;
    rdgSituacao: TRadioGroup;
    Panel3: TPanel;
    btnLimpar: TBitBtn;
    dtpDataEmissaoFim: TDateTimePicker;
    cdsItensOrdemCOMP_QUANTIDADE: TFloatField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    pprRelatorioOrdemProducao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lblCusto: TppLabel;
    lblTotal: TppLabel;
    lblFornecedor: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppCusto: TppDBText;
    ppTotal: TppDBText;
    ppFornecedor: TppDBText;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLabel17: TppLabel;
    ppLabel16: TppLabel;
    ppModoPreparo: TppMemo;
    ppShape2: TppShape;
    ppLabel19: TppLabel;
    pplblTotalOrdem: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    pplRelItensOrdemProd: TppDBPipeline;
    cdsRelItensOrdemProd: TClientDataSet;
    cdsRelItensOrdemProdCod_Item: TIntegerField;
    cdsRelItensOrdemProdDescricao: TStringField;
    cdsRelItensOrdemProdSequencia: TIntegerField;
    cdsRelItensOrdemProdCusto: TCurrencyField;
    cdsRelItensOrdemProdTotal_item: TCurrencyField;
    cdsRelItensOrdemProdnome_fornecedor: TStringField;
    cdsRelItensOrdemProdQtde: TFloatField;
    dtsRelItensOrdemProd: TDataSource;
    cdsAuxPrecoItens: TClientDataSet;
    cdsAuxPrecoItenspreco_preco: TFMTBCDField;
    ppProd_Cod: TppLabel;
    ppDescricao: TppLabel;
    ppFator: TppLabel;
    ppQtde: TppLabel;
    ppNrOrdem: TppLabel;
    ppDtEmissao: TppLabel;
    ppDtValidade: TppLabel;
    ppLabel15: TppLabel;
    ppLabel8: TppLabel;
    ppLabel20: TppLabel;
    ppLote: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape3: TppShape;
    ppSystemVariable1: TppSystemVariable;
    ppImage1: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    cdsAtualizacao: TClientDataSet;
    cdsOrdemProducaoDATA_ESTORNO: TDateField;
    cdsOrdemProducaoQTDE_PC: TFMTBCDField;
    ppLabel21: TppLabel;
    ppQtdePC: TppLabel;
    ppLine3: TppLine;
    ppShape4: TppShape;
    mniEstornarOP: TMenuItem;
    ppFooterBand1: TppFooterBand;
    lblFuncionario: TppLabel;
    ppLine6: TppLine;
    ppLabel3: TppLabel;
    procedure btnSairClick(Sender: TObject);
    procedure cbxProcurarChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcGeralChange(Sender: TObject);
    procedure cdsItensOrdemATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsItensOrdemCOMP_CONVERSAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure grdItensCellClick(Column: TColumn);
    procedure cdsItensOrdemAfterScroll(DataSet: TDataSet);
    procedure grdItensEnter(Sender: TObject);
    procedure grdItensExit(Sender: TObject);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsOrdemProducaoSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grdOrdemProducaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdOrdemProducaoEnter(Sender: TObject);
    procedure grdOrdemProducaoExit(Sender: TObject);
    procedure grdOrdemProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure grdOrdemProducaoCellClick(Column: TColumn);
    procedure cdsOrdemProducaoAfterScroll(DataSet: TDataSet);
    procedure grdOrdemProducaoDblClick(Sender: TObject);
    procedure rdgSituacaoClick(Sender: TObject);
    procedure mniAtulizarOPClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mniEstornarOPClick(Sender: TObject);

  private
    procedure Pesquisar();
    procedure CarregaItensOrdem();
    procedure TransfereDados();
    procedure CalculaItensOrdem();
    procedure CalculaPrecoItensOrdem();
    procedure AtualizaSituacao(const nr_ordem, situacao : string);
    procedure DataAtualizacao(const nr_ordem : string ; data_atualizacao : TDate);
    procedure DataEstorno(const nr_ordem : string ; data_estorno : TDate);
    procedure CarregaCamposRelatorio(const prod_cod : string);
    procedure CarregaModoPreparoRelatorio(const prod_cod : string);
    //procedure Atualiza_Kardex_Hist_Est();
    procedure SaveKardex(const sProdCodigo, sTipo : string; dQuantidade : Real);
    procedure SaveHistoricoProduto( const sProdCodigo, sTipo : string; const iNrLancamento : Integer; dQuantidade : Real );
    procedure SaveEstMovimento ( const sProdCodigo, sTipo : string; dQuantidade, dVlrTotal : Real );
    procedure SaveEstMes ( const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal : Real );
    procedure Estorna_Kardex_Hist_Est;
    procedure ExcluiEstMovimento(const sProdCodigo, sNrDocumento, sSerie, sCliente: string; dDataMvto : TDate);
    procedure SaveGeralNota (const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao : TDate; dVlrNota : Real);
    procedure SaveGeralNotaItem (const sNatureza, sSeq, sProdCodigo, sUN, sNrDocumento, sSerie, sCliente: string; dDataEmissao : TDate; dQtde, dVlrItem : Real);
    procedure AtualizaSituacaoNota(const sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao : TDate);
    procedure Cadastra_Campos(Sender: TObject);
    procedure ValidaPermissoesCampos;

  public

  end;

var
    frmConsultaOrdemProducao: TfrmConsultaOrdemProducao;
    sAcao, sWhere,sSQLWhere, sSQLOrder, sPesquisa,sFiltro, sregistros, sSituacao  : String;
    CadastraCompProdutoFinal : TfrmCadastroComposicaoProdutoFinal;
    bmPontoDeVoltaProd : TBookMark;
    bmPontoDeVoltaMat : TBookMark;

const

    sSQLSelect = 'select op.*,p.empre_codigo, p.prod_ref_forn, p.prod_codigo, p.prod_descricao, p.prod_unid_venda, p.prod_unid_compra, p.prod_grupo, p.prod_subgrp, p.prod_qtd_compra, p.prod_peso_liquido, p.prod_nr_mes_v '+
                 ' from geral_produtos p , geral_ordem_producao op '+
                 ' where p.prod_codigo = op.prod_codigo ';



implementation

{$R *.dfm}

uses uFuncoes, uDtmSisGestao, UCadastroOrdemProducao, UAtualizaOrdemProducao;

procedure TfrmConsultaOrdemProducao.AtualizaSituacao(const nr_ordem, situacao: string);
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
            Informacao('Erro ao atualizar o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure TfrmConsultaOrdemProducao.mniAtulizarOPClick(Sender: TObject);
begin
    if cdsOrdemProducaoSITUACAO.AsString = 'A' then
    begin
        frmAtualizaOrdemProducao := TfrmAtualizaOrdemProducao.Create(Self);
        try
            frmAtualizaOrdemProducao.NR_ORDEM       := cdsOrdemProducaoNR_ORDEM.AsString;
            frmAtualizaOrdemProducao.PROD_CODIGO    := cdsOrdemProducaoPROD_CODIGO.AsString;
            frmAtualizaOrdemProducao.PROD_NOME      := cdsOrdemProducaoprod_descricao.AsString;
            frmAtualizaOrdemProducao.VLR_TOTAL      := cdsOrdemProducaoVALOR_TOTAL.AsFloat;
            frmAtualizaOrdemProducao.QTD_SC         := cdsOrdemProducaoQTDE_SC.AsFloat;
            frmAtualizaOrdemProducao.QTD_KG         := cdsOrdemProducaoQTDE_KG.AsFloat;

            frmAtualizaOrdemProducao.ShowModal;
        finally
            if frmAtualizaOrdemProducao.ModalResult = mrOk then
            begin
                rdgSituacao.ItemIndex := 1;
                btnPesquisa.OnClick(Self);
                cdsOrdemProducao.Locate('NR_ORDEM',frmAtualizaOrdemProducao.NR_ORDEM, []);

            end;
            FreeAndNil(frmAtualizaOrdemProducao);
        end;


    end;

end;

procedure TfrmConsultaOrdemProducao.mniEstornarOPClick(Sender: TObject);
var
    CODIGO : Integer;
begin
    if cdsOrdemProducaoSITUACAO.AsString = 'F' then
    begin
        if PerguntaSim('Deseja realizar o estorno da ordem de produção selecionada?', 'Atenção...') then
        begin
            {executa processo de estorno}
            Estorna_Kardex_Hist_Est();

            AtualizaSituacao(cdsOrdemProducaoNR_ORDEM.AsString, 'E');
            DataEstorno(cdsOrdemProducaoNR_ORDEM.AsString, Date);
            Informacao('Estorno efetuado com sucesso! '+ #10+#13 + 'Nr.Ordem: '+ cdsOrdemProducaoNR_ORDEM.AsString, 'Aviso...');

            CODIGO := cdsOrdemProducaoNR_ORDEM.AsInteger;
            rdgSituacao.ItemIndex := 2;
            btnPesquisa.OnClick(Self);
            cdsOrdemProducao.Locate('NR_ORDEM', CODIGO, [] );
        end;

    end
end;

procedure TfrmConsultaOrdemProducao.btnExcluiClick(Sender: TObject);
begin
    if cdsOrdemProducaoSITUACAO.AsString = 'A' then
    begin
        if not cdsOrdemProducao.IsEmpty then
        begin
            if Pergunta('Deseja excluir a Ordem de Produção ?' +#13+#10+ #13+#10+ 'Nr. Ordem: '+ cdsOrdemProducaoNR_ORDEM.AsString +#13+#10+
                         'Produto: '+ cdsOrdemProducaoPROD_CODIGO.AsString + ' - ' + cdsOrdemProducaoprod_descricao.AsString, 'Confirmação...' ) then
            begin
               uRetornaSQL.ExcluiOrdemProducao(cdsOrdemProducaoNR_ORDEM.AsString);
            end;

        end
        else
        begin
            Informacao('Não há dados para exclusão....','Aviso...');
            btnAltera.SetFocus;
            Exit;
        end;

        cbxResultados.ItemIndex := 1;
        btnPesquisa.OnClick(Sender);
    end;


end;

procedure TfrmConsultaOrdemProducao.btnAlteraClick(Sender: TObject);
begin
    if cdsOrdemProducao.RecordCount > 0 then
    begin

        bmPontoDeVoltaProd := cdsOrdemProducao.GetBookmark;

        frmCadastroOrdemProducao := TfrmCadastroOrdemProducao.Create(Self);
        try
            frmCadastroOrdemProducao.sAcao            := 'ALTERAR';

            //Carrega dados do CientDataSet para o Record
            TransfereDados();

            frmCadastroOrdemProducao.ShowModal;
        finally
            FreeAndNil(frmCadastroOrdemProducao);
        end;

        cbxResultados.ItemIndex := 1;

        btnPesquisaClick(Sender);

        try
            cdsOrdemProducao.GotoBookmark(bmPontoDeVoltaProd);
        except
        end ;

    end
    else
    begin
        Informacao('Não ha dados para alterar....','Aviso...');
        btnAltera.SetFocus; Exit;
    end;

end;

procedure TfrmConsultaOrdemProducao.btnAnteriorClick(Sender: TObject);
begin
    cdsOrdemProducao.Prior;
end;

procedure TfrmConsultaOrdemProducao.btnLimparClick(Sender: TObject);
begin
    edtProcurar.Clear;
    edtProcurar.SetFocus;
end;

procedure TfrmConsultaOrdemProducao.btnNovoClick(Sender: TObject);
begin
    frmCadastroOrdemProducao := TfrmCadastroOrdemProducao.Create(Self);
    try
        frmCadastroOrdemProducao.sAcao   := 'INSERIR';
        frmCadastroOrdemProducao.ShowModal;

    finally
        if frmCadastroOrdemProducao.LOCATE_CODIGO <> 0 then
        begin
            rdgSituacao.ItemIndex   := 0;
            cbxResultados.ItemIndex := 1;
            btnPesquisaClick(Sender);
            cdsOrdemProducao.Locate('NR_ORDEM', frmCadastroOrdemProducao.LOCATE_CODIGO, [] );
        end;
        FreeAndNil(frmCadastroOrdemProducao);
    end;
    //rdgSituacao.ItemIndex := 0;
    //cbxResultados.ItemIndex := 1;

    //btnPesquisaClick(Sender);
end;

procedure TfrmConsultaOrdemProducao.btnPesquisaClick(Sender: TObject);
var
    sProcurar : String;
    bretorno : boolean;
begin
   sregistros:= '';
   case cbxResultados.ItemIndex of
      0:sregistros := ' limit 10';
      1:sregistros := ' limit 50';
      2:sregistros := ' limit 100';
   end;


   case cbxProcurar.ItemIndex of
      0 :   begin
                bretorno :=  VerificaCampoConsulta(edtProcurar.Text);
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ' '
                else
                    sPesquisa := '  and (op.nr_ordem = :nr_ordem)';

                sSQLOrder := ' op.nr_ordem '; // Por codigo...
            end;
      1 :   begin
                if (dtpDataEmissao.Date = Null) or (dtpDataEmissaoFim.Date = Null) then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (op.data_emissao >= :data_emissao_ini) and (op.data_emissao <= :data_emissao_fim)';
                sSQLOrder := ' op.data_emissao '; // Por descricão...
            end;

      2 :   begin
                bretorno :=  VerificaCampoConsulta(edtProcurar.Text);
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (op.prod_codigo = :prod_codigo) ';
              sSQLOrder := ' op.prod_codigo ';
            end;
     end;

     Pesquisar;
end;

procedure TfrmConsultaOrdemProducao.btnPrimeiroClick(Sender: TObject);
begin
    cdsOrdemProducao.First;
end;

procedure TfrmConsultaOrdemProducao.btnProximoClick(Sender: TObject);
begin
    cdsOrdemProducao.Next;
end;

procedure TfrmConsultaOrdemProducao.btnRelatorioClick(Sender: TObject);
begin
    {Monta Relatorio O.P.}
    CarregaCamposRelatorio(cdsOrdemProducaoPROD_CODIGO.AsString);
    CarregaModoPreparoRelatorio(cdsOrdemProducaoPROD_CODIGO.AsString);
    ppProd_cod.Text      := FormatFloat('000000', cdsOrdemProducaoPROD_CODIGO.AsInteger);
    pplblTotalOrdem.Text := formatfloat('0.00', cdsOrdemProducaoVALOR_TOTAL.AsFloat);
    ppDescricao.Text     := cdsOrdemProducaoprod_descricao.AsString;
    ppDtValidade.Text    := cdsOrdemProducaoDATA_VALIDADE.AsString;
    ppLote.Text          := cdsOrdemProducaoNR_LOTE.AsString;
    ppFator.Text         := formatfloat('0.000',cdsOrdemProducaoQTDE_KG.AsFloat);
    ppQtde.Text          := formatfloat('0.00',cdsOrdemProducaoQTDE_SC.AsFloat);
    ppQtdePC.Text        := formatfloat('0.00',cdsOrdemProducaoQTDE_PC.AsFloat);
    ppDtEmissao.Text     := cdsOrdemProducaoDATA_EMISSAO.AsString;
    ppNrOrdem.Text       := cdsOrdemProducaoNR_ORDEM.AsString;
    lblFuncionario.Text  := URetornaRecord.RetornaFuncionario.FUNC_CODIGO +' - '+ URetornaRecord.RetornaFuncionario.FUNC_NOME;

    pprRelatorioOrdemProducao.Print;
end;

procedure TfrmConsultaOrdemProducao.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultaOrdemProducao.btnUltimoClick(Sender: TObject);
begin
    cdsOrdemProducao.Last;
end;

procedure TfrmConsultaOrdemProducao.CalculaItensOrdem;
var
    QtdTotalItem : Double;
begin
    if not cdsItensOrdem.IsEmpty then
    begin
        if cdsItensOrdemCOMP_CONVERSAO.AsString = 'N' then
        begin
            QtdTotalItem          := (StrToFloat(trim(edtQtdKG.Text)) * cdsItensOrdemCOMP_QUANTIDADE.AsFloat ) / 100;
            edtQtdeTotalItem.Text := FormatFloat('0.000', QtdTotalItem);
        end
        else
        begin
            QtdTotalItem          := (StrToFloat(trim(edtQtdSC.Text)) * cdsItensOrdemCOMP_QUANTIDADE.AsFloat );
            edtQtdeTotalItem.Text := FormatFloat('0.000', QtdTotalItem);
        end;

    end;
end;

procedure TfrmConsultaOrdemProducao.CalculaPrecoItensOrdem;
var
    sPrecos : string;
    dPrecoTotalItem : Double;
begin
    sPrecos := 'select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                ' and prod_codigo = :prod_codigo ';
    if cdsItensOrdemPROD_MAT_PRIMA.AsInteger <> 0 then
    begin
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sPrecos);
            Params.ParamByName('prod_codigo').AsString    := cdsItensOrdemPROD_MAT_PRIMA.AsString;
            Active := True;

            edtVlrUnitItem.Text  := FormatFloat('0.000', FieldByName('preco_preco').AsFloat);
            dPrecoTotalItem      := (StrToFloat(trim(edtQtdeTotalItem.Text)) * FieldByName('preco_preco').AsFloat );
            edtVlrTotalItem.Text := FormatFloat('0.00', dPrecoTotalItem);

        end;
    end
    else
        edtVlrTotalItem.Text := '0';


end;

procedure TfrmConsultaOrdemProducao.CarregaCamposRelatorio(
  const prod_cod: string);
var
    dQtdGeral, dPreco, dCustoTotal : Double;
begin

    try
        cdsRelItensOrdemProd.EmptyDataSet;

        dtmSisGestao.FdQryGeralDados.Active      := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, pc.comp_conversao, '+
                                                  ' p.prod_descricao, c.cli_nome '+
                                                  ' from geral_produtos_composicao pc, geral_produtos p, geral_cliente c ' +
                                                  ' where pc.prod_codigo = '+ prod_cod+
                                                  ' and pc.prod_mat_prima = p.prod_codigo '+
                                                  ' and p.cli_codigo = c.cli_codigo '+
                                                  ' and pc.comp_seq <> 0 '+
                                                  ' order by pc.comp_seq ');
        dtmSisGestao.FdQryGeralDados.Active      := True;
        dtmSisGestao.FdQryGeralDados.First;
        while not dtmSisGestao.FdQryGeralDados.Eof do
        begin
            cdsRelItensOrdemProd.Append();

            if dtmSisGestao.FdQryGeralDados.FieldByName('comp_conversao').AsString = 'N' then
            begin
                dQtdGeral := StrToFloat(AllTrim(edtQtdKG.Text));
                dQtdGeral := ( (dQtdGeral * dtmSisGestao.FdQryGeralDados.FieldByName('comp_quantidade').AsFloat ) / 100 );

            end
            else if dtmSisGestao.FdQryGeralDados.FieldByName('comp_conversao').AsString = 'S' then
            begin
                dQtdGeral := StrToFloat(AllTrim(edtQtdSC.Text));
                dQtdGeral := ( dQtdGeral * dtmSisGestao.FdQryGeralDados.FieldByName('comp_quantidade').AsFloat );
            end;

            {Dados Relatorio}
            cdsRelItensOrdemProdSequencia.AsInteger       := dtmSisGestao.FdQryGeralDados.FieldByName('comp_seq').AsInteger;
            cdsRelItensOrdemProdCod_Item.AsInteger        := dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsInteger;
            cdsRelItensOrdemProdDescricao.AsString        := dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString;
            cdsRelItensOrdemProdQtde.AsString             := FormatFloat('0.000', dQtdGeral);
            cdsRelItensOrdemProdnome_fornecedor.AsString  := dtmSisGestao.FdQryGeralDados.FieldByName('cli_nome').AsString;

            //busca preco dos itens
            cdsAuxPrecoItens.Active      := False;
            cdsAuxPrecoItens.CommandText := '';
            cdsAuxPrecoItens.CommandText := 'select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                            ' and prod_codigo = '+ dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsString;
            cdsAuxPrecoItens.Active      := True;

            if not cdsAuxPrecoItens.IsEmpty then
            begin
                dPreco := cdsAuxPrecoItens.FieldByName('preco_preco').AsFloat;
                cdsRelItensOrdemProdCusto.AsString      := FormatFloat('0.000', dPreco); {Dados Relatorio}

                dCustoTotal := (dPreco * dQtdGeral);
                cdsRelItensOrdemProdTotal_item.AsString := FormatFloat('0.000', dCustoTotal);  {Dados Relatorio}

            end
            else
            begin
                cdsRelItensOrdemProdCusto.AsString      := FormatFloat('0.000', 0);
                cdsRelItensOrdemProdTotal_item.AsString := FormatFloat('0.000', 0);
            end;

            cdsRelItensOrdemProd.Post(); {Dados Relatorio}

            dtmSisGestao.FdQryGeralDados.Next;
        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active := False;
        cdsAuxPrecoItens.Active           := False;
    end;

end;

procedure TfrmConsultaOrdemProducao.CarregaItensOrdem;
var
    sItens :string;
begin

     cdsItensOrdem.DisableControls;
     try
     sItens := ' select pc.*, p.prod_unid_compra, p.prod_descricao from geral_produtos p, geral_produtos_composicao pc '+
              '  where (pc.prod_codigo  = :cod_produto) '+
              ' and p.prod_codigo = pc.prod_mat_prima '+
              ' and pc.comp_seq <> 0 '+
              '  order by pc.prod_codigo, pc.comp_seq ';

    cdsItensOrdem.Active := False;
    cdsItensOrdem.CommandText:='';
    cdsItensOrdem.CommandText:= sItens ;
    cdsItensOrdem.Params.ParamByName('cod_produto').AsString := Trim(cdsOrdemProducaoPROD_CODIGO.AsString);

    cdsItensOrdem.Active := True;

    if cdsItensOrdem.RecordCount = 0 then
        cdsItensOrdem.Active := False;

    finally
        cdsItensOrdem.EnableControls;
    end;
end;

procedure TfrmConsultaOrdemProducao.CarregaModoPreparoRelatorio(
  const prod_cod: string);
begin
    with dtmSisGestao.FdQryGeralDados do
    begin
        try
            Active      := False;
            SQL.Clear;
            SQL.Add('select comp_formulacao from geral_produtos_composicao '+
                           ' where prod_codigo = '+ prod_cod +
                           ' and comp_seq = 0 ');

            Active      := True;
            ppModoPreparo.Text := FieldByName('comp_formulacao').AsString;
        finally
            Active := False;
        end;
    end;
end;

procedure TfrmConsultaOrdemProducao.cbxProcurarChange(Sender: TObject);
begin
    lblProcurar.Caption := UpperCase(Trim(cbxProcurar.Text))+':';
    edtProcurar.EditMask := '';
    edtProcurar.MaxLength := 0;
    edtProcurar.Clear;

    if cbxProcurar.ItemIndex =  1 then
    begin
        dtpDataEmissao.Visible    := true;
        dtpDataEmissaoFim.Visible := true;
        dtpDataEmissao.Date       := Date - 30;
        dtpDataEmissaoFim.Date    := Date;
        edtProcurar.Visible       := false;
        btnLimpar.Visible         := false;
    end
    else
    begin
        dtpDataEmissao.Visible    := false;
        dtpDataEmissaoFim.Visible := false;
        edtProcurar.Visible       := true;
        btnLimpar.Visible         := true;
    end;



end;

procedure TfrmConsultaOrdemProducao.cdsItensOrdemAfterScroll(DataSet: TDataSet);
begin
    CalculaItensOrdem();
    CalculaPrecoItensOrdem();
end;

procedure TfrmConsultaOrdemProducao.cdsItensOrdemATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmConsultaOrdemProducao.cdsItensOrdemCOMP_CONVERSAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmConsultaOrdemProducao.cdsOrdemProducaoAfterScroll(
  DataSet: TDataSet);
begin
    btnAltera.Enabled := (cdsOrdemProducaoSITUACAO.AsString = 'A');
    btnExclui.Enabled := not( cdsOrdemProducaoSITUACAO.AsString = 'E');
end;

procedure TfrmConsultaOrdemProducao.cdsOrdemProducaoSITUACAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'A' then
        Text := 'ABERTO';
    if Sender.AsString = 'F' then
        Text := 'FINALIZADO';
    if Sender.AsString = 'E' then
        Text := 'ESTORNADO';

end;

procedure TfrmConsultaOrdemProducao.DataAtualizacao (const nr_ordem : string ; data_atualizacao : TDate);
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

procedure TfrmConsultaOrdemProducao.DataEstorno(const nr_ordem: string; data_estorno: TDate);
var
    sqlUpdate : string;
begin
    sqlUpdate := 'update geral_ordem_producao set data_estorno = :data_estorno '+
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
            Params.ParamByName('data_estorno').AsString   := FormatDateTime('yyyy/mm/dd', data_estorno) ;
            Params.ParamByName('nr_ordem').AsString       := nr_ordem ;
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

procedure TfrmConsultaOrdemProducao.grdItensCellClick(Column: TColumn);
begin
    CalculaItensOrdem();
    CalculaPrecoItensOrdem();
end;

procedure TfrmConsultaOrdemProducao.grdItensEnter(Sender: TObject);
begin
    //KeyPreview := false;
end;

procedure TfrmConsultaOrdemProducao.grdItensExit(Sender: TObject);
begin
    //KeyPreview := true;
end;

procedure TfrmConsultaOrdemProducao.grdItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    {case key of
          VK_RETURN : PERFORM (WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmConsultaOrdemProducao.FormActivate(Sender: TObject);
begin
    FormResize ( Self ) ;
end;

procedure TfrmConsultaOrdemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //RetornaSQL.Destroy();
end;

procedure TfrmConsultaOrdemProducao.FormCreate(Sender: TObject);
begin
    //RetornaSQL := TRetornaSQL.Create();
end;

procedure TfrmConsultaOrdemProducao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F5              : btnPesquisa.OnClick(Self);
        VK_F2              : begin
                                if (btnNovo.Enabled) and (btnNovo.Visible) then
                                    btnNovo.OnClick(Self);
                             end;
        VK_F3              : begin
                                if (btnAltera.Enabled) and (btnAltera.Visible) then
                                    btnAltera.OnClick(Self);
                             end;
        VK_F6              : begin
                                if (btnExclui.Enabled) and (btnExclui.Visible) then
                                    btnExclui.OnClick(Self);
                             end;
        VK_F9              : begin
                                if (btnRelatorio.Enabled) and (btnRelatorio.Visible) then
                                    btnRelatorio.OnClick(Self);
                             end;
        VK_F10             : begin
                                if (mniAtulizarOP.Enabled) and (mniAtulizarOP.Visible) then
                                    mniAtulizarOP.OnClick(Self);
                             end;
        VK_F11             : begin
                                if (mniEstornarOP.Enabled) and (mniEstornarOP.Visible) then
                                    mniEstornarOP.OnClick(Self);
                             end;

    end;
end;

procedure TfrmConsultaOrdemProducao.FormResize(Sender: TObject);
begin
    grdOrdemProducao.Columns[4].Width := grdOrdemProducao.Width - 45 - (grdOrdemProducao.Columns[0].Width  + grdOrdemProducao.Columns[1].Width  + grdOrdemProducao.Columns[2].Width + grdOrdemProducao.Columns[3].Width + grdOrdemProducao.Columns[5].Width + grdOrdemProducao.Columns[6].Width + grdOrdemProducao.Columns[7].Width + grdOrdemProducao.Columns[8].Width + grdOrdemProducao.Columns[9].Width + grdOrdemProducao.Columns[10].Width + grdOrdemProducao.Columns[11].Width) ;
    if grdOrdemProducao.Columns[4].Width <= 159 then
        grdOrdemProducao.Columns[4].Width := 159;
end;

procedure TfrmConsultaOrdemProducao.FormShow(Sender: TObject);
begin
    Cadastra_Campos(Sender);
    ValidaPermissoesCampos();
    rdgSituacao.ItemIndex   := 0;
    dtpDataEmissao.Visible  := False;
    pgcGeral.TabIndex       := 0;
    cbxProcurar.ItemIndex   := 0;
    cbxResultados.ItemIndex := 1;
    cbxProcurar.OnChange(Sender);
    btnPesquisa.OnClick(Sender);

    if grdOrdemProducao.CanFocus then
        grdOrdemProducao.SetFocus;

end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoCellClick(Column: TColumn);
begin
    btnAltera.Enabled := (cdsOrdemProducaoSITUACAO.AsString = 'A');
    btnExclui.Enabled := not( cdsOrdemProducaoSITUACAO.AsString = 'E');
end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoDblClick(Sender: TObject);
begin
    if cdsOrdemProducaoSITUACAO.AsString = 'A' then
        btnAltera.OnClick(Self);
end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if Column.Field = cdsOrdemProducaoSITUACAO then
    begin
        if cdsOrdemProducaoSITUACAO.AsString = 'A' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clRed;
            grdOrdemProducao.Canvas.Font.Color  := clWindow;
            grdOrdemProducao.Canvas.FillRect( rect );
            grdOrdemProducao.DefaultDrawColumnCell( Rect, DataCol, Column, state);
        end
        else if cdsOrdemProducaoSITUACAO.AsString = 'F' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clGreen;
            grdOrdemProducao.Canvas.Font.Color  := clWindow;
            grdOrdemProducao.Canvas.FillRect( rect );
            grdOrdemProducao.DefaultDrawColumnCell( Rect, DataCol, Column, state);
        end
        else if cdsOrdemProducaoSITUACAO.AsString = 'E' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clBlue;
            grdOrdemProducao.Canvas.Font.Color  := clWindow;
            grdOrdemProducao.Canvas.FillRect( rect );
            grdOrdemProducao.DefaultDrawColumnCell( Rect, DataCol, Column, state);
        end;
    end;

    ShowScrollBar(grdOrdemProducao.Handle,SB_VERT,True);
end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoEnter(Sender: TObject);
begin
    //KeyPreview := false;
end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoExit(Sender: TObject);
begin
    //KeyPreview := true;
end;

procedure TfrmConsultaOrdemProducao.grdOrdemProducaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    //case key of
    //      VK_RETURN : PERFORM (WM_NEXTDLGCTL,0,0);
    //end;
end;

procedure TfrmConsultaOrdemProducao.pgcGeralChange(Sender: TObject);
begin
    if pgcGeral.TabIndex = 1 then
    begin
        CarregaItensOrdem();
        grdItens.SetFocus;
    end;
end;

procedure TfrmConsultaOrdemProducao.rdgSituacaoClick(Sender: TObject);
begin
    btnPesquisa.OnClick(Sender);
    grdOrdemProducao.SetFocus;
end;

procedure TfrmConsultaOrdemProducao.SaveEstMes( const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal : Real );
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
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_ESTATISTICA_MENSAL '+
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

procedure TfrmConsultaOrdemProducao.SaveEstMovimento(const sProdCodigo, sTipo: string; dQuantidade, dVlrTotal: Real);
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
        ESTMVTO_DOCUMENTO     := cdsOrdemProducaoNR_ORDEM.AsInteger;
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

procedure TfrmConsultaOrdemProducao.SaveGeralNota(const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string;
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

procedure TfrmConsultaOrdemProducao.SaveGeralNotaItem(const sNatureza, sSeq, sProdCodigo,
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

procedure TfrmConsultaOrdemProducao.SaveHistoricoProduto( const sProdCodigo, sTipo : string; const iNrLancamento : Integer; dQuantidade : Real );
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
        EMPRE_CODIGO              := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;

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
                if  dtmsisgestao.FdQryconsulta.fieldbyname('histp_qtd_estoque_atual').asstring <> '' then
                     HISTP_QTD_ANTERIOR      :=  dtmsisgestao.FdQryconsulta.fieldbyname('histp_qtd_estoque_atual').AsString
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

procedure TfrmConsultaOrdemProducao.SaveKardex(const sProdCodigo, sTipo : string; dQuantidade : Real);
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
        KARD_DOCUMENTO   := cdsOrdemProducaoNR_ORDEM.AsInteger;
        KARD_TIPO        := sTipo;
        EMPRE_CODIGOF    := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        FUNC_CODIGO      := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_KARDEX '+
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

procedure TfrmConsultaOrdemProducao.Pesquisar;
begin
    if rdgSituacao.ItemIndex = 0 then
        sSituacao := ' and situacao = ' +'''A'''
    else if rdgSituacao.ItemIndex = 1 then
        sSituacao := ' and situacao = ' +'''F'''
    else if rdgSituacao.ItemIndex = 2 then
        sSituacao := ' and situacao = ' +'''E'''
    else
        sSituacao := '';


    cdsOrdemProducao.DisableControls;
    try
         cdsOrdemProducao.Active := False;
         cdsOrdemProducao.CommandText := '';

         cdsOrdemProducao.CommandText := sSQLSelect + sPesquisa + sSituacao + 'order by ' + sSQLOrder + sregistros ;


         case cbxProcurar.ItemIndex of
              0 :   begin
                        sFiltro := 'NR.ORDEM';
                        if (Trim(edtProcurar.Text) <> '') then
                            cdsOrdemProducao.Params.ParamByName('nr_ordem').AsInteger := StrToInt(Trim(edtProcurar.Text));
                    end;
              1 :   begin
                        sFiltro := 'DATA EMISSÃO';
                        if  (dtpDataEmissao.Date <> Null) then
                            cdsOrdemProducao.Params.ParamByName('data_emissao_ini').AsString := FormatDateTime('yyyy/mm/dd', dtpDataEmissao.Date);
                        if  (dtpDataEmissaoFim.Date <> Null) then
                            cdsOrdemProducao.Params.ParamByName('data_emissao_fim').AsString := FormatDateTime('yyyy/mm/dd', dtpDataEmissaoFim.Date);
                    end;
              2 :   begin
                        sFiltro := 'CÓD.PRODUTO';
                        if  (Trim(edtProcurar.Text) <> '') then
                            cdsOrdemProducao.Params.ParamByName('prod_codigo').AsInteger := StrToInt(Trim(edtProcurar.Text));
                    end;
         end;

         cdsOrdemProducao.Active := True;

         if cdsOrdemProducao.RecordCount = 0 then
         begin
            cdsOrdemProducao.Active := False;
            //Informacao('Não encontrou Registros para Consulta','Aviso');
            if edtProcurar.CanFocus then
                edtProcurar.SetFocus
            else if dtpDataEmissao.CanFocus then
                 dtpDataEmissao.SetFocus;

            Exit;
         end;

    finally
        cdsOrdemProducao.EnableControls;
    end;

    pgcGeral.TabIndex := 0;
    grdOrdemProducao.SetFocus;

end;

procedure TfrmConsultaOrdemProducao.TransfereDados;
begin
    with URetornaRecord.RetornaOrdemProducao do
    begin
        NR_ORDEM         := cdsOrdemProducaoNR_ORDEM.AsString;
        PROD_CODIGO      := cdsOrdemProducaoPROD_CODIGO.AsString;
        DATA_EMISSAO     := cdsOrdemProducaoDATA_EMISSAO.AsDateTime;
        QTDE_SC          := cdsOrdemProducaoQTDE_SC.AsString;
        QTDE_PC          := cdsOrdemProducaoQTDE_PC.AsString;
        QTDE_KG          := cdsOrdemProducaoQTDE_KG.AsString;
        SITUACAO         := cdsOrdemProducaoSITUACAO.AsString;
        VALOR_TOTAL      := cdsOrdemProducaoVALOR_TOTAL.AsString;
        NR_LOTE          := cdsOrdemProducaoNR_LOTE.AsString;
        DATA_VALIDADE    := cdsOrdemProducaoDATA_VALIDADE.AsDateTime;

    end;


end;

procedure TfrmConsultaOrdemProducao.AtualizaSituacaoNota(const sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate);
var
    sqlUpdate : string;
begin
    dtmSisGestao.FdQryGeral.Active := false;
    dtmSisGestao.FdQryGeral.SQL.Clear;
    dtmSisGestao.FdQryGeral.SQL.Add('select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = '+ sNatureza);
    dtmSisGestao.FdQryGeral.Active := true;

    sqlUpdate := 'update geral_notas_capa set nota_situacao = '+QuotedStr('C') + //2 = CANCELADA
                 ' where NOTA_NUMERO = :NOTA_NUMERO '+
                 ' and NOTA_SERIE = :NOTA_SERIE '+
                 ' and CLI_CODIGO = :CLI_CODIGO '+
                 ' and NOTA_DT_EMISSAO = :NOTA_DT_EMISSAO '+
                 ' and NOTA_CFOP = :NOTA_CFOP ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
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

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro. Tabela: geral_notas_capa' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

    dtmSisGestao.FdQryGeral.Active := false;

end;

{procedure TfrmConsultaOrdemProducao.Atualiza_Kardex_Hist_Est();
var
    dQtdGeral, dVlrTotal, dPreco, dPrecoMedio : Real;
begin
    dQtdGeral   := 0;
    dVlrTotal   := 0;
    dPreco      := 0;
    dPrecoMedio := 0;

    if cdsOrdemProducaoQTDE_SC.AsFloat <> 0 then
    begin
        dPrecoMedio := cdsOrdemProducaoVALOR_TOTAL.AsFloat / cdsOrdemProducaoQTDE_SC.AsFloat;

        SaveKardex(cdsOrdemProducaoPROD_CODIGO.AsString, '1', cdsOrdemProducaoQTDE_SC.AsFloat);
        SaveEstMovimento(cdsOrdemProducaoPROD_CODIGO.AsString, '1', cdsOrdemProducaoQTDE_SC.AsFloat, cdsOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveEstMes(cdsOrdemProducaoPROD_CODIGO.AsString, '1', '0', cdsOrdemProducaoQTDE_SC.AsFloat, cdsOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveGeralNota('1', '7', cdsOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', Date, cdsOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveGeralNotaItem('7', '1', cdsOrdemProducaoPROD_CODIGO.AsString, '', cdsOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', Date, cdsOrdemProducaoQTDE_SC.AsFloat, dPrecoMedio);

    end;


    SaveGeralNota('2', '8', cdsOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', Date, cdsOrdemProducaoVALOR_TOTAL.AsFloat);

    cdsAtualizacao.Active      := False;
    cdsAtualizacao.CommandText := '';
    cdsAtualizacao.CommandText := 'select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, '+
                                              ' pc.comp_conversao, p.prod_descricao '+
                                              ' from geral_produtos_composicao pc, geral_produtos p ' +
                                              ' where pc.prod_codigo = '+ cdsOrdemProducaoPROD_CODIGO.AsString +
                                              ' and pc.prod_mat_prima = p.prod_codigo '+
                                              ' and pc.comp_seq <> 0 '+
                                              ' order by pc.comp_seq ';
    cdsAtualizacao.Active      := True;
    cdsAtualizacao.First;
    while not cdsAtualizacao.Eof do
    begin
        if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'N' then
        begin
            dQtdGeral := cdsOrdemProducaoQTDE_KG.AsFloat;
            dQtdGeral := ( (dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat ) / 100 );

        end
        else if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'S' then
        begin
            dQtdGeral := cdsOrdemProducaoQTDE_SC.AsFloat;
            dQtdGeral := ( dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat );
        end;


        cdsAuxPrecoItens.Active      := False;
        cdsAuxPrecoItens.CommandText := '';
        cdsAuxPrecoItens.CommandText := 'select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                        ' and prod_codigo = '+ cdsAtualizacao.FieldByName('prod_mat_prima').AsString;
        cdsAuxPrecoItens.Active      := True;

        if not cdsAuxPrecoItens.IsEmpty then
        begin
            dPreco    := cdsAuxPrecoItens.FieldByName('preco_preco').AsFloat;
            dVlrTotal := (dPreco * dQtdGeral);

        end
        else
            dVlrTotal := 0;


        SaveKardex(cdsAtualizacao.FieldByName('prod_mat_prima').AsString, '2', dQtdGeral);
        SaveEstMovimento(cdsAtualizacao.FieldByName('prod_mat_prima').AsString, '2', dQtdGeral, dVlrTotal);
        SaveEstMes(cdsAtualizacao.FieldByName('prod_mat_prima').AsString, '1', '1', dQtdGeral, dVlrTotal);
        SaveGeralNotaItem('8', cdsAtualizacao.FieldByName('comp_seq').AsString, cdsAtualizacao.FieldByName('prod_mat_prima').AsString, '', cdsOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', Date, dQtdGeral, dPreco);

        cdsAtualizacao.Next;
    end;


end;}

procedure TfrmConsultaOrdemProducao.Estorna_Kardex_Hist_Est();
var
    dQtdGeral, dVlrTotal, dPreco : Real;
    sData   : string;
begin
    dVlrTotal := 0;
    //Produto Acabado
    if cdsOrdemProducaoQTDE_SC.AsFloat <> 0 then
    begin
        SaveKardex(cdsOrdemProducaoPROD_CODIGO.AsString, '2', cdsOrdemProducaoQTDE_SC.AsFloat);

        {Busca dados Nota}
        dtmSisGestao.FdQryGeral.Active := false;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add('select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = 7') ;
        dtmSisGestao.FdQryGeral.Active := true;

        dtmSisGestao.FdQryGeralDados.Active      := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select NOTA_VALOR_NF from geral_notas_capa where NOTA_NUMERO = '+cdsOrdemProducaoNR_ORDEM.AsString+
                                                  ' and NOTA_SERIE = '+ QuotedStr('IND')+
                                                  ' and CLI_CODIGO = 11676'+ //Belem
                                                  ' and NOTA_DT_EMISSAO = '+ QuotedStr(FormatDateTime('yyyy/mm/dd', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime)) +
                                                  ' and NOTA_CFOP = '+ QuotedStr(dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString) );
        dtmSisGestao.FdQryGeralDados.Active      := true;
        SaveEstMes(cdsOrdemProducaoPROD_CODIGO.AsString, '2', '0', cdsOrdemProducaoQTDE_SC.AsFloat, dtmSisGestao.FdQryGeralDados.FieldByName('NOTA_VALOR_NF').AsFloat);

        ExcluiEstMovimento(cdsOrdemProducaoPROD_CODIGO.AsString, cdsOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime);
        AtualizaSituacaoNota('7', cdsOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime);
    end;
    //Matéria Prima
    AtualizaSituacaoNota('8', cdsOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime);

    {cdsAtualizacao.Active      := False;
    cdsAtualizacao.CommandText := '';
    cdsAtualizacao.CommandText := 'select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, '+
                                              ' pc.comp_conversao, p.prod_descricao '+
                                              ' from geral_produtos_composicao pc, geral_produtos p ' +
                                              ' where pc.prod_codigo = '+ cdsOrdemProducaoPROD_CODIGO.AsString +
                                              ' and pc.prod_mat_prima = p.prod_codigo '+
                                              ' and pc.comp_seq <> 0 '+
                                              ' order by pc.comp_seq ';
    cdsAtualizacao.Active      := True;
    cdsAtualizacao.First;
    while not cdsAtualizacao.Eof do
    begin
        if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'N' then
        begin
            dQtdGeral := cdsOrdemProducaoQTDE_KG.AsFloat;
            dQtdGeral := ( (dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat ) / 100 );

        end
        else if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'S' then
        begin
            dQtdGeral := cdsOrdemProducaoQTDE_SC.AsFloat;
            dQtdGeral := ( dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat );
        end;

        //busca preco dos itens
        cdsAuxPrecoItens.Active      := False;
        cdsAuxPrecoItens.CommandText := '';
        cdsAuxPrecoItens.CommandText := 'select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                        ' and prod_codigo = '+ cdsAtualizacao.FieldByName('prod_mat_prima').AsString;
        cdsAuxPrecoItens.Active      := True;

        if not cdsAuxPrecoItens.IsEmpty then
        begin
            dPreco    := cdsAuxPrecoItens.FieldByName('preco_preco').AsFloat;
            dVlrTotal := (dPreco * dQtdGeral);

        end
        else
            dVlrTotal := 0; }

    {Busca dados Nota Item}
    dtmSisGestao.FdQryGeral.Active := false;
    dtmSisGestao.FdQryGeral.SQL.Clear;
    dtmSisGestao.FdQryGeral.SQL.Add('select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = 8') ;
    dtmSisGestao.FdQryGeral.Active := true;

    cdsAtualizacao.Active      := false;
    cdsAtualizacao.CommandText := '';
    cdsAtualizacao.CommandText := 'select PROD_CODIGO, ITENS_QUANTIDADE, ITENS_PRECO_BRUTO from geral_notas_itens where NOTA_NUMERO = '+cdsOrdemProducaoNR_ORDEM.AsString+
                                  ' and NOTA_SERIE = '+ QuotedStr('MAP')+
                                  ' and CLI_CODIGO = 11676'+ //Belem
                                  ' and NOTA_DT_EMISSAO = '+ QuotedStr(FormatDateTime('yyyy/mm/dd', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime)) +
                                  ' and NOTA_CFOP = '+ QuotedStr(dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString)+
                                  ' order by ITENS_SEQ' ;
    cdsAtualizacao.Active      := true;
    cdsAtualizacao.First;
    while not cdsAtualizacao.Eof do
    begin
        dVlrTotal :=  (cdsAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat * cdsAtualizacao.FieldByName('ITENS_PRECO_BRUTO').AsFloat);
        //Alimenta valores records
        SaveKardex(cdsAtualizacao.FieldByName('PROD_CODIGO').AsString, '1', cdsAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat);
        SaveEstMes(cdsAtualizacao.FieldByName('PROD_CODIGO').AsString, '2', '1', cdsAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat, dVlrTotal);

        ExcluiEstMovimento(cdsAtualizacao.FieldByName('PROD_CODIGO').AsString, cdsOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', cdsOrdemProducaoDATA_ATUALIZACAO.AsDateTime);

        cdsAtualizacao.Next;
    end;
end;

procedure TfrmConsultaOrdemProducao.ExcluiEstMovimento(const sProdCodigo, sNrDocumento, sSerie, sCliente: string; dDataMvto : TDate);
var
    sqlDelete : string;
begin
    sqlDelete := 'delete from geral_movimento where PROD_CODIGO = :PROD_CODIGO '+
                 ' and ESTMVTO_DOCUMENTO = :NR_DOCUMENTO '+
                 ' and ESTMVTO_DATA = :DATA_MVTO '+
                 ' and ESTMVTO_SERIE = :SERIE '+
                 ' and CLI_CODIGO = :CLIENTE ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add(sqlDelete);
            Params.ParamByName('PROD_CODIGO').AsString   := sProdCodigo ;
            Params.ParamByName('NR_DOCUMENTO').AsString  := sNrDocumento ;
            Params.ParamByName('SERIE').AsString         := sSerie;
            Params.ParamByName('DATA_MVTO').AsDate       := dDataMvto ;
            Params.ParamByName('CLIENTE').AsString       := sCliente ;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao deletar o registro. Tabela: geral_movimento' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure TfrmConsultaOrdemProducao.Cadastra_Campos(Sender: TObject);
var
   iIndice : Integer;
   sSQL, sSQLAcesso, sDescricao : String;
begin
     if dtmSisGestao.FdConnection.InTransaction then
          dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     sSQL := LowerCase('INSERT INTO GERAL_CAMPO '+
                       '(CAMPO_CODIGO,MENU_CODIGO,CAMPO_INTERFACE,CAMPO_DESCRICAO,CAMPO_OBS) '+
                       'VALUES (:CAMPOCODIGO,:MENUCODIGO,:CAMPOINTERFACE,:CAMPODESCRICAO,:CAMPOOBS) '+
                       'ON DUPLICATE KEY UPDATE CAMPO_CODIGO    = :CAMPOCODIGO, '+
                                               'MENU_CODIGO     = :MENUCODIGO, '+
                                               'CAMPO_INTERFACE = :CAMPOINTERFACE, '+
                                               'CAMPO_DESCRICAO = :CAMPODESCRICAO, '+
                                               'CAMPO_OBS       = :CAMPOOBS ');
     sSQLAcesso := LowerCase('INSERT INTO GERAL_CAMPO_ACESSO '+
                             '(FUNC_CODIGO,EMPRE_CODIGO,MENU_CODIGO,CAMPO_CODIGO) '+
                             'VALUES (:FUNCCODIGO,:EMPRECODIGO,:MENUCODIGO,:CAMPOCODIGO) '+
                             'ON DUPLICATE KEY UPDATE FUNC_CODIGO     = :FUNCCODIGO, '+
                                                     'EMPRE_CODIGO    = :EMPRECODIGO, '+
                                                     'MENU_CODIGO     = :MENUCODIGO, '+
                                                     'CAMPO_CODIGO    = :CAMPOCODIGO ');
     for iIndice := 0 to ComponentCount - 1 do
     begin
          if Components[iIndice].Tag = 1 then
          begin
               sDescricao := Components[iIndice].Name+' não encontrou TIPO.uConsultaOrdemProducao';
               if (Components[iIndice] is TEdit) then
                  sDescricao := TEdit(Components[iIndice]).Hint
               else
               if (Components[iIndice] is TMaskEdit) then
                sDescricao := TMaskEdit(Components[iIndice]).Hint
               else

               if (Components[iIndice] is TCheckBox) then
                  sDescricao := TCheckBox(Components[iIndice]).Hint
               else
               if (Components[iIndice] is TComboBox) then
                  sDescricao := TComboBox(Components[iIndice]).Hint
               else
               if (Components[iIndice] is TMemo) then
                  sDescricao := TMemo(Components[iIndice]).Hint
               else
               if (Components[iIndice] is TComboBox) then
                  sDescricao := TComboBox(Components[iIndice]).Hint ;
                                     
               dtmSisGestao.FdQryGeralDados.Active := False;
               dtmSisGestao.FdQryConsulta.SQL.Clear;
               dtmSisGestao.FdQryConsulta.SQL.Add(LowerCase(sSQL));
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString    := copy(UpperCase(Components[iIndice].Name),1,21);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString     := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL,1,21);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTAORDEMPRODUCAO',1,70);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPODESCRICAO').AsString := UpperCase(Copy(sDescricao,1,70));
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOBS').AsString       := '';
               dtmSisGestao.FdQryConsulta.Execute;
               // Cria Campos x Acessos
               dtmSisGestao.FdQryConsulta.Active := False;
               dtmSisGestao.FdQryConsulta.SQL.Clear;
               dtmSisGestao.FdQryConsulta.SQL.Add(LowerCase(sSQLAcesso));
               dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString     := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsString    := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString     := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL,1,21);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString    := copy(UpperCase(Components[iIndice].Name),1,21);
               //dtmSisGestao.cdsConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.cdsConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
               dtmSisGestao.FdQryConsulta.Execute;
          end;
     end;
     dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmConsultaOrdemProducao.ValidaPermissoesCampos();
var
    iIndice : Integer;
begin
    dtmSisGestao.FdQryConsulta.Active      := False;
    dtmSisGestao.FdQryConsulta.SQL.Clear;
    dtmSisGestao.FdQryConsulta.SQL.Add('select campo_codigo, campo_opcao from geral_campo_acesso where empre_codigo = :empresa '+
                                            ' and func_codigo = :cod_funcionario '+
                                            ' and menu_codigo = :cod_menu ');
    dtmSisGestao.FdQryConsulta.Params.ParamByName('empresa').AsInteger         := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
    dtmSisGestao.FdQryConsulta.Params.ParamByName('cod_funcionario').AsString  := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
    dtmSisGestao.FdQryConsulta.Params.ParamByName('cod_menu').AsString         := URetornaRecord.RetornaFuncionario.MENU_ATUAL;
    dtmSisGestao.FdQryConsulta.Active      := True;
    dtmSisGestao.FdQryConsulta.First;
    while not dtmSisGestao.FdQryConsulta.Eof do
    begin
        if dtmSisGestao.FdQryConsulta.FieldByName('campo_opcao').AsString = 'D' then
        begin
            for iIndice := 0 to ComponentCount - 1 do
            begin
                if Components[iIndice].Tag = 1 then
                begin
                    if UpperCase(Components[iIndice].Name)  = dtmSisGestao.FdQryConsulta.FieldByName('campo_codigo').AsString then
                    begin
                        if (Components[iIndice] is TBitBtn) then
                            TBitBtn(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TppLabel) then
                            TppLabel(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TppDBText) then
                            TppDBText(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TDBGrid) then
                            TDBGrid(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TEdit) then
                            TEdit(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TMaskEdit) then
                            TMaskEdit(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TCheckBox) then
                            TCheckBox(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TMemo) then
                            TMemo(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TRadioGroup) then
                            TRadioGroup(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TLabel) then
                            TLabel(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := False
                        else
                        if (Components[iIndice] is TMenuItem) then
                            TMenuItem(Components[iIndice]).Visible := False;

                        Break;

                    end;
                end;
            end;

        end
        else
        begin
            for iIndice := 0 to ComponentCount - 1 do
            begin
                if Components[iIndice].Tag = 1 then
                begin
                    if UpperCase(Components[iIndice].Name)  = dtmSisGestao.FdQryConsulta.FieldByName('campo_codigo').AsString then
                    begin
                        if (Components[iIndice] is TBitBtn) then
                            TBitBtn(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TppLabel) then
                            TppLabel(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TppDBText) then
                            TppDBText(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TDBGrid) then
                            TDBGrid(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TEdit) then
                            TEdit(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TMaskEdit) then
                            TMaskEdit(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TCheckBox) then
                            TCheckBox(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TMemo) then
                            TMemo(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TRadioGroup) then
                            TRadioGroup(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TLabel) then
                            TLabel(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := True
                        else
                        if (Components[iIndice] is TMenuItem) then
                            TMenuItem(Components[iIndice]).Visible := True;

                        Break;

                    end;
                end;
            end;
        end;

        dtmSisGestao.FdQryConsulta.Next;
    end;


end;

end.
