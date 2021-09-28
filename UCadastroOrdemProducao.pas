{-------------------------------------------------------------------------------
 Programa..: UCadastroOrdemProducao
 Empresa...: Sulapsso Informatica
 Finalidade: Cadastro de Ordem de Produção
 Autor          Data      Operação  Descrição
 Verlan Fernandes  JUL/2020 Criação
-------------------------------------------------------------------------------}

unit UCadastroOrdemProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, uFuncoes, Vcl.ComCtrls,
  Data.DB, Datasnap.DBClient, ppCtrls, ppDB, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppReport, ppStrtch, ppMemo, ppSubRpt, ppVar, URetornaRecord, URetornaSQL,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TfrmCadastroOrdemProducao = class(TForm)
    pnlCabecalho: TPanel;
    pnlOrdem: TPanel;
    pnlRodape: TPanel;
    Label4: TLabel;
    edtQtdKG: TMaskEdit;
    btnAltera: TBitBtn;
    btnCancela: TBitBtn;
    btnSair: TBitBtn;
    btnGrava: TBitBtn;
    btnExclui: TBitBtn;
    btnNovo: TBitBtn;
    Label1: TLabel;
    edtNrOrdem: TMaskEdit;
    Label2: TLabel;
    edtDtValidade: TMaskEdit;
    Label5: TLabel;
    edtQtdSC: TMaskEdit;
    Label7: TLabel;
    edtVlrTotal: TMaskEdit;
    Label8: TLabel;
    cbxSituacao: TComboBox;
    pnlProduto: TPanel;
    lbProduto: TLabel;
    edtCodigoProduto: TMaskEdit;
    cbxProduto: TComboBox;
    Label3: TLabel;
    Label6: TLabel;
    edtLote: TMaskEdit;
    edtDataEmissao: TDateTimePicker;
    edtDtAux: TMaskEdit;
    pplRelItensOrdemProd: TppDBPipeline;
    cdsRelItensOrdemProd: TClientDataSet;
    dtsRelItensOrdemProd: TDataSource;
    cdsRelItensOrdemProdCod_Item: TIntegerField;
    cdsRelItensOrdemProdDescricao: TStringField;
    cdsRelItensOrdemProdSequencia: TIntegerField;
    cdsRelItensOrdemProdCusto: TCurrencyField;
    cdsRelItensOrdemProdTotal_item: TCurrencyField;
    cdsRelItensOrdemProdnome_fornecedor: TStringField;
    cdsRelItensOrdemProdQtde: TFloatField;
    Label9: TLabel;
    edtQtdPC: TMaskEdit;
    pprRelatorioOrdemProducao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape4: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    lblCusto: TppLabel;
    lblTotal: TppLabel;
    lblFornecedor: TppLabel;
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
    ppLogoEmp: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel21: TppLabel;
    ppQtdePC: TppLabel;
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
    ppFooterBand1: TppFooterBand;
    lblFuncionario: TppLabel;
    ppLine6: TppLine;
    ppLabel3: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLabel17: TppLabel;
    ppLabel16: TppLabel;
    ppModoPreparo: TppMemo;
    ppShape2: TppShape;
    ppLabel19: TppLabel;
    pplblTotalOrdem: TppLabel;
    ppLine3: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    FdQryAuxPrecoItens: TFDQuery;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxProdutoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluiClick(Sender: TObject);
    procedure edtQtdKGClick(Sender: TObject);
    procedure edtQtdKGExit(Sender: TObject);
    procedure edtQtdSCClick(Sender: TObject);
    procedure edtQtdSCExit(Sender: TObject);
    procedure edtDtValidadeClick(Sender: TObject);
    procedure edtVlrTotalClick(Sender: TObject);
    procedure edtVlrTotalExit(Sender: TObject);
    procedure edtQtdPCExit(Sender: TObject);
    procedure edtQtdPCClick(Sender: TObject);
    procedure cbxProdutoChange(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure cbxProdutoEnter(Sender: TObject);
    procedure cbxProdutoExit(Sender: TObject);
    procedure edtCodigoProdutoEnter(Sender: TObject);
    procedure edtDtValidadeEnter(Sender: TObject);
    procedure edtQtdSCEnter(Sender: TObject);
    procedure edtQtdPCEnter(Sender: TObject);
    procedure edtQtdKGEnter(Sender: TObject);
    procedure edtVlrTotalEnter(Sender: TObject);
    procedure cbxSituacaoEnter(Sender: TObject);
    procedure edtDtValidadeExit(Sender: TObject);
    procedure cbxSituacaoExit(Sender: TObject);
    procedure edtCodigoProdutoClick(Sender: TObject);
  private
    procedure MostraDados();
    procedure ResetDados();
    procedure CarregaComboProdutos();
    procedure ControlaBotoes(Estado: String);
    procedure HabilitaDesabilitaCampos(Estado: String);
    procedure SelectMaxSequencia();
    procedure LimpaCampos(Sender: TObject);
    procedure SaveRecord();
    procedure CorCampos(Estado: string);
    procedure CalculaLoteValidade();
    procedure AtualizaSeqLote();
    procedure CalculaValorTotal();
    procedure ValidaCamposQtd();
    procedure CarregaCamposRelatorio(const prod_cod : string);
    procedure CarregaModoPreparoRelatorio(const prod_cod : string);
    procedure CalculaCamposSC_PC_KG();
    function RetornaQuantidadeCompra(const prod_cod : string ) : Real;
    procedure Cadastra_Campos(Sender: TObject);
    procedure ValidaPermissoesCampos;

    { Private declarations }

  public

    {Variaveis de uso geral}
    sAcao : string;
    sNrOrdem : Integer;
    bGravouDados : Boolean;

    LOCATE_CODIGO : Integer;
  end;

var
  frmCadastroOrdemProducao: TfrmCadastroOrdemProducao;

implementation

{$R *.dfm}

uses uDtmSisGestao, uSisIndustria;

procedure TfrmCadastroOrdemProducao.AtualizaSeqLote;
var
    sqlUpdate : string;
begin
    if (sAcao = 'INSERIR') then
    begin
        //update tabela geral_produtos
        sqlUpdate := 'update geral_produtos set lote_sequencia = :seq_lote '+
                     ' where prod_codigo = '+AllTrim(edtCodigoProduto.Text) ;

        if dtmSisGestao.FdConnection.InTransaction then
            dtmSisGestao.FdConnection.Rollback;
        dtmSisGestao.FdConnection.StartTransaction;

        try
            with dtmSisGestao.FdQryGeralDados do
            begin
                Active      := False;
                SQL.Clear;
                SQL.Add(sqlUpdate);
                Params.ParamByName('seq_lote').AsString   := AllTrim(edtLote.Text);

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

end;

procedure TfrmCadastroOrdemProducao.btnAlteraClick(Sender: TObject);
begin
    if (Trim(edtNrOrdem.Text) = '') then
    begin
        Informacao('Não há dados para alteração.','Aviso!');
        btnAltera.SetFocus;
        Exit;
    end;

    sAcao := 'ALTERAR';
    ControlaBotoes(sAcao);
    HabilitaDesabilitaCampos(sAcao);

    CorCampos(sAcao);

end;

procedure TfrmCadastroOrdemProducao.btnCancelaClick(Sender: TObject);
begin
    if bGravouDados then
        ResetDados()
    else
        MostraDados();

    sAcao := 'INATIVO';
    ControlaBotoes(sAcao);
    HabilitaDesabilitaCampos(sAcao);
    btnSair.SetFocus;
    bGravouDados := False;
    CorCampos(sAcao);

    edtQtdSC.Text := Formata_Valor(AllTrim(edtQtdSC.Text),6,2);
    edtQtdPC.Text := Formata_Valor(AllTrim(edtQtdPC.Text),6,2);
    edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);

end;

procedure TfrmCadastroOrdemProducao.btnExcluiClick(Sender: TObject);
begin
    bGravouDados := False;
    if (AllTrim(edtNrOrdem.Text) <> '') then
    begin
        if Confirma_Exclusao() then
        begin
            URetornaSQL.ExcluiOrdemProducao(AllTrim(edtNrOrdem.Text));

            sAcao := 'INATIVO' ;
            ControlaBotoes(sAcao);
            LimpaCampos(Sender);

            btnNovo.SetFocus;
            Exit;
        end;

    end
    else
    begin
        Informacao('Não há dados para exclusão....','Aviso...');
        sAcao := 'INATIVO' ;
        ControlaBotoes(sAcao);
        LimpaCampos(Sender);
        
        btnNovo.SetFocus;
        Exit;
    end;

end;

procedure TfrmCadastroOrdemProducao.btnGravaClick(Sender: TObject);
begin
    if (edtCodigoProduto.Text = '') or (cbxProduto.Text = '') then
    begin
        Informacao('Campo Código do Produto inválido','Verifique!!');
        edtCodigoProduto.SetFocus;
        Exit;
    end;

    if AllTrim(edtDtValidade.Text) = '//' then
    begin
        Informacao('Campo Data de Validade é obrigatório','Verifique!!');
        edtDtValidade.SetFocus;
        Exit;
    end;

    if (AllTrim(edtQtdKG.Text) = ',') or (AllTrim(edtQtdKG.Text) = '0,000') then
    begin
        Informacao('Campo Qtd. KG é obrigatório','Verifique!!');
        edtQtdKG.SetFocus;
        Exit;
    end;

    if ((AllTrim(edtQtdSC.Text) = ',') or (AllTrim(edtQtdSC.Text) = '0,00')) and
        ((AllTrim(edtQtdPC.Text) = ',') or (AllTrim(edtQtdPC.Text) = '0,00')) then
    begin
        Informacao('Campo Qtd. SC/CX ou PC é obrigatório','Verifique!!');
        edtQtdSC.SetFocus;
        Exit;
    end;

    if (AllTrim(edtVlrTotal.Text) = ',') or (AllTrim(edtVlrTotal.Text) = '0,00') then
    begin
        Informacao('Campo Vlr. Total é obrigatório','Verifique!!');
        edtVlrTotal.SetFocus;
        Exit;
    end;


    {Carrega dados para o Record}
    SaveRecord();
    {procedimento para execução da gravação}
    URetornaSQL.GravaOrdemProducao();

    {Atualiza sequencia do lote na tabela de produtos}
    AtualizaSeqLote();

    {Monta Relatorio O.P.}
    if frmSisIndustria.btnRelatorio.Visible then
    begin
        CarregaCamposRelatorio(AllTrim(edtCodigoProduto.Text));
        CarregaModoPreparoRelatorio(AllTrim(edtCodigoProduto.Text));
        ppProd_cod.Text      := FormatFloat('000000',(strtoint(edtCodigoProduto.Text)));
        pplblTotalOrdem.Text := edtVlrTotal.Text;
        ppDescricao.Text     := Copy(cbxProduto.Text,1,40);
        ppDtValidade.Text    := edtDtValidade.Text;
        ppLote.Text          := edtLote.Text;
        ppFator.Text         := AllTrim(edtQtdKG.Text);
        ppQtdePC.Text        := AllTrim(edtQtdPC.Text);
        ppQtde.Text          := AllTrim(edtQtdSC.Text);
        ppDtEmissao.Text     := FormatDateTime('dd/mm/yyyy',edtDataEmissao.Date);
        ppNrOrdem.Text       := edtNrOrdem.Text;
        lblFuncionario.Text  := URetornaRecord.RetornaFuncionario.FUNC_CODIGO +' - '+ URetornaRecord.RetornaFuncionario.FUNC_NOME;
        if URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO <> '' then
            ppLogoEmp.Picture.LoadFromFile(URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO);
        pprRelatorioOrdemProducao.Print;
    end;


    sAcao := 'INATIVO';
    HabilitaDesabilitaCampos(sAcao);
    ControlaBotoes(sAcao);
    btnNovo.SetFocus;

    LOCATE_CODIGO := StrToInt(edtNrOrdem.Text);

end;

procedure TfrmCadastroOrdemProducao.btnNovoClick(
  Sender: TObject);
begin
    URetornaRecord.LimpaRecordOrdemProducao();
    LOCATE_CODIGO := 0;
    bGravouDados := False;
    sAcao := 'INSERIR';
    LimpaCampos(Sender);

    HabilitaDesabilitaCampos(sAcao);
    ControlaBotoes(sAcao);

    CorCampos(sAcao);
    SelectMaxSequencia();

    edtDtAux.Visible       := False;
    edtDataEmissao.Visible := True;
    edtDataEmissao.Date   := Date;
    cbxSituacao.ItemIndex := 0;

end;

procedure TfrmCadastroOrdemProducao.btnSairClick(Sender: TObject);
begin
    if (sAcao <> 'INATIVO') then
    begin
        Informacao('Trabalho pendente! Salve-o ou cancele-o.','Aviso...');
        btnCancela.SetFocus;
        Exit;
    end
    else
        Close;
end;

procedure TfrmCadastroOrdemProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    {Encerramento das classes}
    //RetornaRecord.Destroy();
    //RetornaSQL.Destroy();
end;

procedure TfrmCadastroOrdemProducao.FormCreate(Sender: TObject);
begin
    {Criação das classes}
    //RetornaRecord := TRetornaRecord.Create();
    //RetornaSQL := TRetornaSQL.Create();
end;

procedure TfrmCadastroOrdemProducao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F2              : begin
                                if btnNovo.Enabled then
                                    btnNovo.OnClick(Self);
                             end;
        VK_F3              : begin
                                if btnAltera.Enabled then
                                    btnAltera.OnClick(Self);
                             end;
        VK_F4              : begin
                                if btnGrava.Enabled then
                                    btnGrava.OnClick(Self);
                             end;
        VK_F6              : begin
                                if btnExclui.Enabled then
                                    btnExclui.OnClick(Self);
                             end;
        VK_F7              : begin
                                if btnCancela.Enabled then
                                    btnCancela.OnClick(Self);
                             end;

    end;
end;

procedure TfrmCadastroOrdemProducao.FormShow(Sender: TObject);
begin
    Cadastra_Campos(Sender);
    ValidaPermissoesCampos();
    bGravouDados := False;
    {Carrega dados para os Combos}
    CarregaComboProdutos();

    if (sAcao = 'INATIVO') then
     begin
        HabilitaDesabilitaCampos(sAcao);
        ControlaBotoes(sAcao);
        MostraDados;
     end;

    if sAcao = 'INSERIR' then
    begin
        btnNovo.OnClick(Self);
    end;

    if (sAcao = 'ALTERAR') then
     begin
        MostraDados();
        edtQtdSC.Text := Formata_Valor(AllTrim(edtQtdSC.Text),6,2);
        edtQtdPC.Text := Formata_Valor(AllTrim(edtQtdPC.Text),6,2);
        edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);

        btnAlteraClick(Sender);

     end;

end;

procedure TfrmCadastroOrdemProducao.HabilitaDesabilitaCampos(Estado: String);
begin
    if sAcao = 'ALTERAR' then
    begin
        pnlProduto.Enabled  := false;
        pnlOrdem.Enabled    := true;
    end;

    if sAcao = 'INSERIR' then
    begin
        pnlProduto.Enabled  := true;
        pnlOrdem.Enabled    := true;
    end;

    if sAcao = 'INATIVO' then
    begin
        pnlOrdem.Enabled      := False;
        pnlProduto.Enabled    := False;
    end;


end;

procedure TfrmCadastroOrdemProducao.LimpaCampos(Sender: TObject);
var
    iIndice : Integer;
begin
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if Components[iIndice] is TEdit then
            TEdit(Components[iIndice]).Clear;
        if Components[iIndice] is TMaskEdit then
            TMaskEdit(Components[iIndice]).Clear;
        if Components[iIndice] is TMemo then
            TMemo(Components[iIndice]).Clear;
    end;
    cbxProduto.ItemIndex  := -1;
    cbxSituacao.ItemIndex := -1;

end;

procedure TfrmCadastroOrdemProducao.MostraDados;
var
    i : integer;
begin
    if URetornaRecord.RetornaOrdemProducao.PROD_CODIGO <> '' then
        edtCodigoProduto.Text  := PadLeft(URetornaRecord.RetornaOrdemProducao.PROD_CODIGO,8,'0')
    else
    begin
        edtCodigoProduto.Text := '' ;
        cbxProduto.ItemIndex := -1;
    end;


    for i := 0 to (cbxProduto.items.count -1) do
    begin
        application.processmessages;
        if edtCodigoProduto.Text = (trim(copy(cbxProduto.items[i],44,8)))  then
        begin
            application.processmessages;
            cbxProduto.itemindex := i;
            cbxProduto.text := cbxProduto.items[i];
            break;
        end;
    end;

    if URetornaRecord.RetornaOrdemProducao.NR_ORDEM <> '' then
        edtNrOrdem.Text  := FormatFloat('000000', StrToFloat(URetornaRecord.RetornaOrdemProducao.NR_ORDEM))
    else
        edtNrOrdem.Text  := '';

    if FormatDateTime('dd/mm/yyyy', URetornaRecord.RetornaOrdemProducao.DATA_EMISSAO) = '30/12/1899' then
    begin
        edtDtAux.Visible := True;
        edtDataEmissao.Visible := False;
    end
    else
    begin
        edtDtAux.Visible := false;
        edtDataEmissao.Visible := true;
        edtDataEmissao.Date := URetornaRecord.RetornaOrdemProducao.DATA_EMISSAO;
    end;
    edtLote.Text        := URetornaRecord.RetornaOrdemProducao.NR_LOTE;
    if FormatDateTime('dd/mm/yyyy', URetornaRecord.RetornaOrdemProducao.DATA_VALIDADE) = '30/12/1899' then
        edtDtValidade.Clear
    else
        edtDtValidade.Text  := FormatDateTime('dd/mm/yyyy', URetornaRecord.RetornaOrdemProducao.DATA_VALIDADE);
    edtQtdKG.Text       := URetornaRecord.RetornaOrdemProducao.QTDE_KG;
    edtQtdSC.Text       := URetornaRecord.RetornaOrdemProducao.QTDE_SC;
    edtQtdPC.Text       := URetornaRecord.RetornaOrdemProducao.QTDE_PC;
    edtVlrTotal.Text    := URetornaRecord.RetornaOrdemProducao.VALOR_TOTAL;


    if URetornaRecord.RetornaOrdemProducao.SITUACAO = 'A' then
        cbxSituacao.ItemIndex := 0
    else if URetornaRecord.RetornaOrdemProducao.SITUACAO = 'F' then
        cbxSituacao.ItemIndex := 1
    else
        cbxSituacao.ItemIndex := -1;


end;

procedure TfrmCadastroOrdemProducao.ResetDados;
var
    i : Integer;
begin

    edtDtValidade.Text      := FormatDateTime('dd/mm/yyyy', URetornaRecord.RetornaOrdemProducao.DATA_VALIDADE);
    edtQtdKG.Text           := URetornaRecord.RetornaOrdemProducao.QTDE_KG;
    edtQtdSC.Text           := URetornaRecord.RetornaOrdemProducao.QTDE_SC;
    edtQtdPC.Text           := URetornaRecord.RetornaOrdemProducao.QTDE_PC;
    edtVlrTotal.Text        := URetornaRecord.RetornaOrdemProducao.VALOR_TOTAL;

    if URetornaRecord.RetornaOrdemProducao.SITUACAO = 'A' then
        cbxSituacao.ItemIndex := 0
    else if URetornaRecord.RetornaOrdemProducao.SITUACAO = 'F' then
        cbxSituacao.ItemIndex := 1;

end;

function TfrmCadastroOrdemProducao.RetornaQuantidadeCompra(const prod_cod: string): Real;
begin
    Result := 0;
    try
        dtmSisGestao.FdQryGeralDados.Active      := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select prod_qtd_compra from geral_produtos ' +
                                                    ' where prod_codigo = '+ prod_cod);
        dtmSisGestao.FdQryGeralDados.Active      := True;
        if not dtmSisGestao.FdQryGeralDados.IsEmpty then
            Result := dtmSisGestao.FdQryGeralDados.FieldByName('prod_qtd_compra').AsFloat;

    finally
        dtmSisGestao.FdQryGeralDados.Active      := False;
    end;

end;

procedure TfrmCadastroOrdemProducao.SaveRecord;
begin
    bGravouDados := True;
    with URetornaRecord.RetornaOrdemProducao do
    begin
        NR_ORDEM            := trim(edtNrOrdem.Text);
        PROD_CODIGO         := trim(edtCodigoProduto.Text);
        DATA_EMISSAO        := edtDataEmissao.Date;
        QTDE_SC             := trim(edtQtdSC.Text);
        QTDE_PC             := trim(edtQtdPC.Text);
        QTDE_KG             := trim(edtQtdKG.Text);
        if cbxSituacao.ItemIndex = 0 then
            SITUACAO        := 'A'
        else if cbxSituacao.ItemIndex = 1 then
            SITUACAO        := 'F';

        VALOR_TOTAL         := trim(edtVlrTotal.Text);
        NR_LOTE             := trim(edtLote.Text);
        DATA_VALIDADE       := StrToDate(edtDtValidade.Text);

    end;


end;

procedure TfrmCadastroOrdemProducao.SelectMaxSequencia;
var
    sqlUpdate : string;
begin
    if (sAcao = 'INSERIR') then
    begin
        dtmSisGestao.FdQryGeralDados.Active      := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select nr_ordem from geral_numeros ');
        dtmSisGestao.FdQryGeralDados.Active      := True;
        if dtmSisGestao.FdQryGeralDados.FieldByName('nr_ordem').IsNull then
            sNrOrdem := 1
        else
            sNrOrdem := dtmSisGestao.FdQryGeralDados.FieldByName('nr_ordem').AsInteger + 1;

        edtNrOrdem.Text := FormatFloat('000000', sNrOrdem);

        dtmSisGestao.FdQryGeralDados.Active := False;


        //update tabela geral_numeros
        sqlUpdate := 'update geral_numeros set nr_ordem = :nr_ordem ';

        if dtmSisGestao.FdConnection.InTransaction then
            dtmSisGestao.FdConnection.Rollback;
        dtmSisGestao.FdConnection.StartTransaction;

        try
            with dtmSisGestao.FdQryGeralDados do
            begin
                Active      := False;
                SQL.Clear;
                SQL.Add(sqlUpdate);
                Params.ParamByName('nr_ordem').AsInteger   := sNrOrdem;

                Execute();
            end;

        except
            on e : Exception do
            begin
                dtmSisGestao.FdConnection.Rollback;
                Informacao('Erro ao atualizar o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
                edtNrOrdem.Text := '';
                Exit;
            end;
        end;

        dtmSisGestao.FdConnection.Commit;
    end;
end;

procedure TfrmCadastroOrdemProducao.ValidaCamposQtd;
var
    sqlBusca : string;
begin

    sqlBusca := 'select p.prod_grupo as grupo, ' +
                ' g.grupo_industria as grupo_ind, ' +
                ' p.prod_subgrp as subgrupo, ' +
                ' sb.subgrupo_industria as subgrupo_ind, ' +
                ' p.prod_divisao as divisao,  '  +
                ' d.divisao_industria as divisao_ind  '+
                ' from geral_produtos p ' +
                ' left outer join geral_grupo g on (p.prod_grupo = g.grupo_codigo)  ' +
                ' left outer join geral_subgrupo sb on (p.prod_subgrp = sb.subgrupo_codigo  '+
                '                                      and p.prod_grupo = sb.grupo_codigo) ' +
                ' left outer join geral_divisao d on (p.prod_divisao = d.divisao_codigo ' +
                '                                    and p.prod_subgrp = d.subgrupo_codigo ' +
                '                                    and p.prod_grupo = d.grupo_codigo) ' +
                ' where p.prod_codigo = :PROD_CODIGO ';

    with dtmSisGestao.FdQryGeralDados do
    begin
        Active      := False;
        SQL.Clear;
        SQL.Add(sqlBusca);
        Params.ParamByName('PROD_CODIGO').AsString := AllTrim(edtCodigoProduto.Text);
        Active      := True;

        if (FieldByName('grupo_ind').AsString = 'S') or
            (FieldByName('subgrupo_ind').AsString = 'S') or
            (FieldByName('divisao_ind').AsString = 'S') then
        begin

        end;


    end;


end;

procedure TfrmCadastroOrdemProducao.CalculaCamposSC_PC_KG;
var
    dGeral, dKG : Double;
begin
    if AllTrim(edtCodigoProduto.Text) <> '' then
    begin
        try
            dtmSisGestao.FdQryGeralDados.Active      := False;
            dtmSisGestao.FdQryGeralDados.SQL.Clear;
            dtmSisGestao.FdQryGeralDados.SQL.Add('select prod_qtd_compra, prod_peso_liquido from geral_produtos ' +
                                                        ' where prod_codigo = '+ AllTrim(edtCodigoProduto.Text));
            dtmSisGestao.FdQryGeralDados.Active      := True;
            if not dtmSisGestao.FdQryGeralDados.IsEmpty then
            begin
                dGeral := StrToFloat(edtQtdSC.Text) * dtmSisGestao.FdQryGeralDados.FieldByName('prod_qtd_compra').AsFloat;
                dGeral := dGeral + StrToFloat(edtQtdPC.Text);
                dKG    := dGeral * dtmSisGestao.FdQryGeralDados.FieldByName('prod_peso_liquido').AsFloat;
                edtQtdKG.Text := FloatToStr(dKG);
                edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);
            end;
        finally
            dtmSisGestao.FdQryGeralDados.Active      := False;
        end;

    end;

end;

procedure TfrmCadastroOrdemProducao.CalculaLoteValidade;
var
    iSeqLote, iDias : integer;
    dDataValidade : TDate;
begin
    if AllTrim(edtCodigoProduto.Text) <> '' then
    begin
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active      := False;
            SQL.Clear;
            SQL.Add('select lote_sequencia, prod_nr_mes_v from geral_produtos where prod_codigo = '+ edtCodigoProduto.Text);
            Active      := True;

            iSeqLote     := FieldByName('lote_sequencia').AsInteger + 1;
            edtLote.Text := IntToStr(iSeqLote);

            iDias              := FieldByName('prod_nr_mes_v').AsInteger * 30;
            dDataValidade      := edtDataEmissao.Date + iDias;
            edtDtValidade.Text := FormatDateTime('dd/mm/yyyy', dDataValidade);

            Active      := False;
        end;
    end;
end;

procedure TfrmCadastroOrdemProducao.CalculaValorTotal;
var
    dQtdGeral, dPreco, dTotalizadorGeral : Double;
begin
    if (AllTrim(edtQtdKG.Text) <> '0,000') and
       ((AllTrim(edtQtdSC.Text) <> '0,00') or (AllTrim(edtQtdPC.Text) <> '0,00')) then
    begin
        dTotalizadorGeral := 0;

        try
            //Totalizador de quantidade dos itens
            dtmSisGestao.FdQryGeralDados.Active      := False;
            dtmSisGestao.FdQryGeralDados.SQL.Clear;
            dtmSisGestao.FdQryGeralDados.SQL.Add('select prod_mat_prima, comp_quantidade, comp_conversao from geral_produtos_composicao ' +
                                                            ' where prod_codigo = '+ edtCodigoProduto.Text+
                                                            ' and comp_seq <> 0');
            dtmSisGestao.FdQryGeralDados.Active      := True;
            dtmSisGestao.FdQryGeralDados.First;
            while not dtmSisGestao.FdQryGeralDados.Eof do
            begin
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

                //busca preco dos itens
                FdQryAuxPrecoItens.Active      := False;
                FdQryAuxPrecoItens.SQL.Clear;
                FdQryAuxPrecoItens.SQL.Add('select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                                ' and prod_codigo = '+ dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsString);
                FdQryAuxPrecoItens.Active      := True;

                if not FdQryAuxPrecoItens.IsEmpty then
                begin
                    dPreco := FdQryAuxPrecoItens.FieldByName('preco_preco').AsFloat;

                    dTotalizadorGeral := (dPreco * dQtdGeral) + dTotalizadorGeral;
                end;

                dtmSisGestao.FdQryGeralDados.Next;
            end;

            edtVlrTotal.Text := FormatFloat('0.00', dTotalizadorGeral);

        finally
            dtmSisGestao.FdQryGeralDados.Active := False;
            FdQryAuxPrecoItens.Active           := False;
        end;
    end
    else
        edtVlrTotal.Text := '0,00';
end;

procedure TfrmCadastroOrdemProducao.CarregaCamposRelatorio(const prod_cod : string);
var
    dQtdGeral, dPreco, dCustoTotal : Double;
begin
    dQtdGeral   := 0;
    dPreco      := 0;
    dCustoTotal := 0;
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
            FdQryAuxPrecoItens.Active      := False;
            FdQryAuxPrecoItens.SQL.Clear;
            FdQryAuxPrecoItens.SQL.Add('select preco_preco from geral_produtos_preco where preco_tabela = 5 '+
                                            ' and prod_codigo = '+ dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsString);
            FdQryAuxPrecoItens.Active      := True;

            if not FdQryAuxPrecoItens.IsEmpty then
            begin
                dPreco := FdQryAuxPrecoItens.FieldByName('preco_preco').AsFloat;
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
        FdQryAuxPrecoItens.Active           := False;
    end;

end;


procedure TfrmCadastroOrdemProducao.CarregaComboProdutos;
begin
    dtmSisGestao.FdQryGeralDados.Active      := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(' select prod_codigo, prod_descricao from geral_produtos where prod_atv = 4 '+
                                             ' order by prod_descricao');

    dtmSisGestao.FdQryGeralDados.Active := true;
    cbxProduto.Clear;
    cbxProduto.Items.Add(Copy(PadRight(' ',40,' '),1,40) + '   ' + PadLeft (' ',8,' '));
    dtmSisGestao.FdQryGeralDados.Next;
    dtmSisGestao.FdQryGeralDados.First;
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        Application.ProcessMessages;
        cbxProduto.Items.Add(Copy(PadRight(dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString,40,' '),1,40)
                                + ' - ' + PadLeft(dtmSisGestao.FdQryGeralDados.FieldByName('prod_codigo').AsString,8,'0'));
        dtmSisGestao.FdQryGeralDados.Next;
    end;


end;

procedure TfrmCadastroOrdemProducao.CarregaModoPreparoRelatorio(const prod_cod: string);
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

procedure TfrmCadastroOrdemProducao.cbxProdutoChange(Sender: TObject);
begin
    edtQtdKG.Clear;
    edtQtdSC.Clear;
    edtQtdPC.Clear;
    edtVlrTotal.Clear;
end;

procedure TfrmCadastroOrdemProducao.cbxProdutoClick(Sender: TObject);
begin
    edtCodigoProduto.Text:=Copy(PadLeft(cbxProduto.Text,0,'8'),44,8);
    CalculaLoteValidade();
end;

procedure TfrmCadastroOrdemProducao.cbxProdutoEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.cbxProdutoExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
end;

procedure TfrmCadastroOrdemProducao.cbxSituacaoEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.cbxSituacaoExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
end;

procedure TfrmCadastroOrdemProducao.ControlaBotoes(Estado: String);
begin
    btnNovo.Enabled        := (Estado = 'INATIVO');
    btnAltera.Enabled      := (Estado = 'INATIVO');
    btnExclui.Enabled      := (Estado = 'INATIVO');
    btnGrava.Enabled       := not (Estado = 'INATIVO');
    btnCancela.Enabled     := not (Estado = 'INATIVO');

end;

procedure TfrmCadastroOrdemProducao.CorCampos(Estado: string);
var
    iIndice : Integer;
begin
    if Estado = 'INATIVO' then
    begin
        for iIndice := 0 to ComponentCount - 1 do
        begin
            if Components[iIndice] is TEdit then
                TEdit(Components[iIndice]).Color := clBtnFace;
            if Components[iIndice] is TMaskEdit then
                TMaskEdit(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TMemo then
                TMemo(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TComboBox then
                TComboBox(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TCheckBox then
                TCheckBox(Components[iIndice]).Color:= clBtnFace;
        end;
    end
    else
    begin
        for iIndice := 0 to ComponentCount - 1 do
        begin
            if Components[iIndice] is TEdit then
                TEdit(Components[iIndice]).Color := clWindow;
            if Components[iIndice] is TMaskEdit then
                TMaskEdit(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TMemo then
                TMemo(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TComboBox then
                TComboBox(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TCheckBox then
                TCheckBox(Components[iIndice]).Color:= clWindow;
        end;

    end;
end;

procedure TfrmCadastroOrdemProducao.edtCodigoProdutoChange(Sender: TObject);
begin
    edtQtdKG.Clear;
    edtQtdSC.Clear;
    edtQtdPC.Clear;
    edtVlrTotal.Clear;
end;

procedure TfrmCadastroOrdemProducao.edtCodigoProdutoClick(Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = '' then
    begin
        ( Sender as TMaskEdit ).Clear;
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroOrdemProducao.edtCodigoProdutoEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtCodigoProdutoExit(Sender: TObject);
var
   iInd : Integer;
   sCodigo : String;
   bAchou : Boolean;
begin
    Cor_Campo(Sender, clWindow);
    sCodigo := PadLeft(Trim(edtCodigoProduto.Text),8,'0');

    bAchou := False;
    for iInd := 0 to (cbxProduto.Items.Count -1) do
    begin
      if sCodigo = Copy(cbxProduto.Items[iInd],44,8) then
      begin
           bAchou := True;
           CalculaLoteValidade();

           Break;
      end;
    end;
    if not(bAchou ) then
    begin
        cbxProduto.ItemIndex := -1;
        edtDtValidade.Clear;
        Exit;
    end;
    cbxProduto.ItemIndex := iInd;
    cbxProduto.Text := cbxProduto.Items[cbxProduto.ItemIndex];

end;



procedure TfrmCadastroOrdemProducao.edtDtValidadeClick(Sender: TObject);
begin
if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroOrdemProducao.edtDtValidadeEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtDtValidadeExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
end;

procedure TfrmCadastroOrdemProducao.edtQtdKGClick(
  Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;

end;

procedure TfrmCadastroOrdemProducao.edtQtdKGEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtQtdKGExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    edtQtdSC.Text := Formata_Valor(AllTrim(edtQtdSC.Text),6,2);
    edtQtdPC.Text := Formata_Valor(AllTrim(edtQtdPC.Text),6,2);
    edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);
    Application.ProcessMessages;
    CalculaValorTotal();
    Application.ProcessMessages;

    edtVlrTotal.OnExit(self);
    
end;

procedure TfrmCadastroOrdemProducao.edtQtdPCClick(Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroOrdemProducao.edtQtdPCEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtQtdPCExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    edtQtdSC.Text := Formata_Valor(AllTrim(edtQtdSC.Text),6,2);
    edtQtdPC.Text := Formata_Valor(AllTrim(edtQtdPC.Text),6,2);
    edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);
    Application.ProcessMessages;
    CalculaCamposSC_PC_KG();
    CalculaValorTotal();
    Application.ProcessMessages;

    edtVlrTotal.OnExit(self);
end;

procedure TfrmCadastroOrdemProducao.edtQtdSCClick(Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroOrdemProducao.edtQtdSCEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtQtdSCExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    //if AllTrim(edtQtdSC.Text) <> ',' then
    edtQtdSC.Text := Formata_Valor(AllTrim(edtQtdSC.Text),6,2);
    edtQtdPC.Text := Formata_Valor(AllTrim(edtQtdPC.Text),6,2);
    edtQtdKG.Text := Formata_Valor(AllTrim(edtQtdKG.Text),6,3);

    Application.ProcessMessages;
    CalculaCamposSC_PC_KG();
    CalculaValorTotal();
    Application.ProcessMessages;

    edtVlrTotal.OnExit(self);

end;

procedure TfrmCadastroOrdemProducao.edtVlrTotalClick(Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroOrdemProducao.edtVlrTotalEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroOrdemProducao.edtVlrTotalExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    //if AllTrim(edtVlrTotal.Text) <> ',' then
        edtVlrTotal.Text := Formata_Valor(AllTrim(edtVlrTotal.Text),6,2);
end;

procedure TfrmCadastroOrdemProducao.Cadastra_Campos(Sender: TObject);
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

procedure TfrmCadastroOrdemProducao.ValidaPermissoesCampos();
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
                            TPanel(Components[iIndice]).Visible := False;

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
                            TPanel(Components[iIndice]).Visible := True;

                        Break;

                    end;
                end;
            end;
        end;

        dtmSisGestao.FdQryConsulta.Next;
    end;


end;


end.
