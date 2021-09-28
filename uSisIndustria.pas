{-------------------------------------------------------------------------------
 Programa..: uSisIndustria
 Empresa...: SULPASSO INFORMATICA
 Finalidade: Projeto Controle de Indústrias

 Autor          Data     Versão   Descrição
 Verlan        JUL/2020 v1.0     Criação
-------------------------------------------------------------------------------}

unit uSisIndustria;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    IniFiles, Dialogs, Menus, AppEvnts, ExtCtrls, ComCtrls, uDtmSisGestao,
    URetornaRecord, Vcl.Imaging.pngimage, Vcl.StdCtrls, System.Actions,
    Vcl.ActnList, Vcl.ImgList, Vcl.CategoryButtons, Vcl.Buttons, Vcl.Grids,
    Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, ppParameter, ppDesignLayer, ppStrtch,
    ppMemo, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
    ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, Data.DB, Datasnap.DBClient,
    URetornaSQL, System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider,UCadastroComposicaoProdutoFinal, Midas, MidasLib;

type
    TfrmSisIndustria = class(TForm)
        Pnldados: TPanel;
        tmrRelogio: TTimer;
        pnlMenu: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        Panel4: TPanel;
        Splitter1: TSplitter;
        Image1: TImage;
        Panel5: TPanel;
        imgLogo: TImage;
        Panel6: TPanel;
        Image4: TImage;
        Label1: TLabel;
        lblUsuario: TLabel;
        ctbMenu: TCategoryButtons;
        ImageList1: TImageList;
        ActionList1: TActionList;
        actInicio: TAction;
        actComposicao: TAction;
        pnlEmpresa: TPanel;
        pnlBotoes: TPanel;
        pnlAuxiliar: TPanel;
        pnlConsulta: TPanel;
        actOrdemProducao: TAction;
        actRelatorios: TAction;
        lblVersao: TLabel;
        pnlSubMenu: TPanel;
        Splitter2: TSplitter;
        ctbSubMenu: TCategoryButtons;
        actRelOrdemProducao: TAction;
        actEtiquetas: TAction;
        dtsOrdemProducao: TDataSource;
        dtsItensOrdem: TDataSource;
        popGridOP: TPopupMenu;
        mniAtulizarOP: TMenuItem;
        mniEstornarOP: TMenuItem;
        dtsRelItensOrdemProd: TDataSource;
        cdsRelItensOrdemProd: TClientDataSet;
        cdsRelItensOrdemProdCod_Item: TIntegerField;
        cdsRelItensOrdemProdDescricao: TStringField;
        cdsRelItensOrdemProdSequencia: TIntegerField;
        cdsRelItensOrdemProdCusto: TCurrencyField;
        cdsRelItensOrdemProdTotal_item: TCurrencyField;
        cdsRelItensOrdemProdnome_fornecedor: TStringField;
        cdsRelItensOrdemProdQtde: TFloatField;
        pplRelItensOrdemProd: TppDBPipeline;
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
    lblSGBD: TLabel;
        Panel10: TPanel;
        lblHora: TLabel;
        lblData: TLabel;
        pnlConsultaGeral: TPanel;
        pgcGeralConsulta: TPageControl;
        tsComposicao: TTabSheet;
        tsOrdemProducao: TTabSheet;
        pnlCabecalho: TPanel;
        pnlPesquisar: TPanel;
        btnPesquisa: TBitBtn;
        pnlFiltro: TPanel;
        Label3: TLabel;
        lblProcurarPor: TLabel;
        cbxProcurar: TComboBox;
        cbxResultados: TComboBox;
        pnlDigitacao: TPanel;
        lblProcurar: TLabel;
        edtProcurar: TMaskEdit;
        rdgSituacao: TRadioGroup;
        dtpDataEmissao: TDateTimePicker;
        dtpDataEmissaoFim: TDateTimePicker;
        pnlGridPrincipal: TPanel;
        Panel1: TPanel;
        Panel7: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        Label7: TLabel;
        Label8: TLabel;
        edtQtdKG: TDBEdit;
        edtQtdSC: TDBEdit;
        DBEdit5: TDBEdit;
        DBEdit6: TDBEdit;
        DBEdit1: TDBEdit;
        DBEdit3: TDBEdit;
        pgcGeral: TPageControl;
        TabSheet1: TTabSheet;
        grdOrdemProducao: TDBGrid;
        tsItens: TTabSheet;
        Panel8: TPanel;
        Label9: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        edtQtdeTotalItem: TEdit;
        DBEdit2: TDBEdit;
        edtVlrTotalItem: TEdit;
        edtVlrUnitItem: TEdit;
        grdItens: TDBGrid;
        pnlTituloConsulta: TPanel;
        lblTituloTela: TLabel;
        tsGeralOrdemProducao: TTabSheet;
        tsEtiquetas: TTabSheet;
        mnuSisIndustria: TMainMenu;
        IND020000000000000000: TMenuItem;
        IND020100000000000000: TMenuItem;
        IND020200000000000000: TMenuItem;
        IND020300000000000000: TMenuItem;
        IND020310000000000000: TMenuItem;
        IND020320000000000000: TMenuItem;
        pnlBotoesGeral: TPanel;
        btnNovo: TBitBtn;
        btnAltera: TBitBtn;
        btnExclui: TBitBtn;
        btnRelatorio: TBitBtn;
        Panel11: TPanel;
        Panel12: TPanel;
        btnPesquisaComp: TBitBtn;
        Panel13: TPanel;
        Label2: TLabel;
        Label13: TLabel;
        cbxProcurarComp: TComboBox;
        cbxResultadosComp: TComboBox;
        pnlDigitacaoComp: TPanel;
        lblProcurarComp: TLabel;
        edtProcurarComp: TMaskEdit;
        lblProdutos: TLabel;
        pnlGridPrincipalComposicao: TPanel;
        grdProdutoFinal: TDBGrid;
        pnlOperacoes: TPanel;
        pnlGridSecundarioComp: TPanel;
        pnlgrid: TPanel;
        pnlMemo: TPanel;
        Panel15: TPanel;
        Label15: TLabel;
        pnlMemo1: TPanel;
        Panel17: TPanel;
        Panel18: TPanel;
        DBMemo1: TDBMemo;
        dtsProdutoAcabado: TDataSource;
        dtsMateriaPrima: TDataSource;
        Panel14: TPanel;
        btnModoPreparo: TBitBtn;
        btnExcluiProd: TBitBtn;
        Panel19: TPanel;
        Panel20: TPanel;
        btnLimparComp: TBitBtn;
        Panel21: TPanel;
        btnLimpar: TBitBtn;
        Panel23: TPanel;
        Label14: TLabel;
        imgSair: TImage;
    Panel9: TPanel;
    edtPercTotal: TEdit;
    Label16: TLabel;
    grdMateriaPrima: TDBGrid;
    FdQryProdutoAcabado: TFDQuery;
    FdQryMateriaPrima: TFDQuery;
    FdQryOrdemProducao: TFDQuery;
    FdQryItensOrdem: TFDQuery;
    FdQryAtualizacao: TFDQuery;
    FdQryAuxPrecoItens: TFDQuery;
    FdQryProdutoAcabadoempre_codigo: TIntegerField;
    FdQryProdutoAcabadoprod_ref_forn: TStringField;
    FdQryProdutoAcabadoprod_codigo: TIntegerField;
    FdQryProdutoAcabadoprod_descricao: TStringField;
    FdQryProdutoAcabadoprod_unid_venda: TStringField;
    FdQryProdutoAcabadoprod_unid_compra: TStringField;
    FdQryMateriaPrimaPROD_CODIGO: TIntegerField;
    FdQryMateriaPrimaPROD_MAT_PRIMA: TIntegerField;
    FdQryMateriaPrimaCOMP_SEQ: TIntegerField;
    FdQryMateriaPrimaCOMP_QUANTIDADE: TSingleField;
    FdQryMateriaPrimaCOMP_CONVERSAO: TStringField;
    FdQryMateriaPrimaATIVO: TStringField;
    FdQryMateriaPrimacomp_formulacao: TBlobField;
    FdQryMateriaPrimaprod_descricao: TStringField;
    FdQryOrdemProducaoNR_ORDEM: TIntegerField;
    FdQryOrdemProducaoDATA_EMISSAO: TDateField;
    FdQryOrdemProducaoPROD_CODIGO: TIntegerField;
    FdQryOrdemProducaoQTDE_SC: TBCDField;
    FdQryOrdemProducaoQTDE_KG: TBCDField;
    FdQryOrdemProducaoSITUACAO: TStringField;
    FdQryOrdemProducaoDATA_ATUALIZACAO: TDateField;
    FdQryOrdemProducaoVALOR_TOTAL: TBCDField;
    FdQryOrdemProducaoNR_LOTE: TStringField;
    FdQryOrdemProducaoDATA_VALIDADE: TDateField;
    FdQryOrdemProducaoDATA_ESTORNO: TDateField;
    FdQryOrdemProducaoQTDE_PC: TBCDField;
    FdQryOrdemProducaoempre_codigo: TIntegerField;
    FdQryOrdemProducaoprod_ref_forn: TStringField;
    FdQryOrdemProducaoprod_codigo_1: TIntegerField;
    FdQryOrdemProducaoprod_descricao: TStringField;
    FdQryOrdemProducaoprod_unid_venda: TStringField;
    FdQryOrdemProducaoprod_unid_compra: TStringField;
    FdQryOrdemProducaoprod_grupo: TIntegerField;
    FdQryOrdemProducaoprod_subgrp: TIntegerField;
    FdQryOrdemProducaoprod_qtd_compra: TBCDField;
    FdQryOrdemProducaoprod_peso_liquido: TBCDField;
    FdQryOrdemProducaoprod_nr_mes_v: TIntegerField;
    FdQryItensOrdemPROD_CODIGO: TIntegerField;
    FdQryItensOrdemPROD_MAT_PRIMA: TIntegerField;
    FdQryItensOrdemCOMP_SEQ: TIntegerField;
    FdQryItensOrdemCOMP_QUANTIDADE: TSingleField;
    FdQryItensOrdemCOMP_CONVERSAO: TStringField;
    FdQryItensOrdemATIVO: TStringField;
    FdQryItensOrdemcomp_formulacao: TBlobField;
    FdQryItensOrdemprod_unid_compra: TStringField;
    FdQryItensOrdemprod_descricao: TStringField;
    //procedure IND010100000000000000Click(Sender: TObject);
    //procedure trwMenuKeyDown(Sender: TObject; var Key: Word;
    //  Shift: TShiftState);
    //procedure trwMenuClick(Sender: TObject);

    //procedure OBR010100000000000000Click(Sender: TObject);

    //procedure Login;
    //procedure IND020100000000000000Click(Sender: TObject);
    //procedure IND020200000000000000Click(Sender: TObject);
    //procedure IND020310000000000000Click(Sender: TObject);
    //procedure IND080000000000000000Click(Sender: TObject);
    //procedure trwMenuDblClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure tmrRelogioTimer(Sender: TObject);
        procedure imgLogoClick(Sender: TObject);
        procedure imgSairClick(Sender: TObject);
        procedure actRelatoriosExecute(Sender: TObject);
        procedure actOrdemProducaoExecute(Sender: TObject);
        procedure actComposicaoExecute(Sender: TObject);
        procedure actInicioExecute(Sender: TObject);
        procedure actRelOrdemProducaoExecute(Sender: TObject);
        procedure actEtiquetasExecute(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure mniAtulizarOPClick(Sender: TObject);
        procedure btnPesquisaClick(Sender: TObject);
        procedure grdItensCellClick(Column: TColumn);
        procedure grdOrdemProducaoCellClick(Column: TColumn);
        procedure grdOrdemProducaoDblClick(Sender: TObject);
        procedure grdOrdemProducaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure mniEstornarOPClick(Sender: TObject);
        procedure pgcGeralChange(Sender: TObject);
        procedure rdgSituacaoClick(Sender: TObject);
        procedure cbxProcurarChange(Sender: TObject);
        procedure btnNovoClick(Sender: TObject);
        procedure btnAlteraClick(Sender: TObject);
        procedure btnExcluiClick(Sender: TObject);
        procedure btnRelatorioClick(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure btnPesquisaCompClick(Sender: TObject);
        procedure btnModoPreparoClick(Sender: TObject);
        procedure cbxProcurarCompChange(Sender: TObject);
        procedure cdsMateriaPrimaATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
        procedure cdsMateriaPrimaCOMP_CONVERSAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
        procedure cdsProdutoAcabadoAfterScroll(DataSet: TDataSet);
        procedure grdMateriaPrimaDblClick(Sender: TObject);
        procedure grdProdutoFinalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure grdMateriaPrimaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure btnExcluiProdClick(Sender: TObject);
        procedure cbxResultadosChange(Sender: TObject);
        procedure cbxResultadosCompChange(Sender: TObject);
        procedure btnLimparClick(Sender: TObject);
        procedure btnLimparCompClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdProdutoFinalCellClick(Column: TColumn);
    procedure FdQryProdutoAcabadoAfterScroll(DataSet: TDataSet);
    procedure FdQryMateriaPrimaCOMP_CONVERSAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FdQryMateriaPrimaATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FdQryOrdemProducaoSITUACAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FdQryOrdemProducaoAfterScroll(DataSet: TDataSet);
    procedure FdQryItensOrdemCOMP_CONVERSAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FdQryItensOrdemATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FdQryItensOrdemAfterScroll(DataSet: TDataSet);
    private
        procedure Pega_Usuario(pFuncCodigo, pSenhaSenha, pEmpresa: string; var pRetorno: string);
        procedure Pesquisar();
        procedure CarregaItensOrdem();
        procedure TransfereDados();
        procedure CalculaItensOrdem();
        procedure CalculaPrecoItensOrdem();
        procedure AtualizaSituacao(const nr_ordem, situacao: string);
        procedure DataAtualizacao(const nr_ordem: string; data_atualizacao: TDate);
        procedure DataEstorno(const nr_ordem: string; data_estorno: TDate);
        procedure CarregaCamposRelatorio(const prod_cod: string);
        procedure CarregaModoPreparoRelatorio(const prod_cod: string);
    //procedure Atualiza_Kardex_Hist_Est();
        procedure SaveKardex(const sProdCodigo, sTipo: string; dQuantidade: Real);
        procedure SaveHistoricoProduto(const sProdCodigo, sTipo: string; const iNrLancamento: Integer; dQuantidade: Real);
        procedure SaveEstMovimento(const sProdCodigo, sTipo: string; dQuantidade, dVlrTotal: Real);
        procedure SaveEstMes(const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal: Real);
        procedure Estorna_Kardex_Hist_Est;
        procedure ExcluiEstMovimento(const sProdCodigo, sNrDocumento, sSerie, sCliente: string; dDataMvto: TDate);
        procedure SaveGeralNota(const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dVlrNota: Real);
        procedure SaveGeralNotaItem(const sNatureza, sSeq, sProdCodigo, sUN, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dQtde, dVlrItem: Real);
        procedure AtualizaSituacaoNota(const sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate);
        procedure Cadastra_Campos(Sender: TObject);
        procedure ValidaPermissoesCampos;
        procedure Menus(var pRetorno: string);
        procedure CarregaMateriaPrima;
        procedure TransfereDadosComp;
        procedure PesquisarComp;
        procedure Cadastra_Campos_Comp(Sender: TObject);
        procedure CalculaPercTotalComposicao();
    //procedure Menus(var pRetorno: String);
    { Private declarations }
    public
    { Public declarations }
    ///RetornaSQL : TRetornaSQL;
    //RetornaFuncionario : RFUNCIONARIO;
    end;

var
    frmSisIndustria: TfrmSisIndustria;
    iApresentaUmVez, iContaParametros: Integer;
    sAcao, sWhere, sSQLWhere, sSQLOrder, sPesquisa, sFiltro, sregistros, sSituacao: string;
    CadastraCompProdutoFinal : TfrmCadastroComposicaoProdutoFinal;
    bmPontoDeVoltaProd: TBookMark;
    bmPontoDeVoltaMat: TBookMark;

const
    sSQLSelecionaMenus = 'select * from geral_acesso,geral_menu ' + 'where (geral_acesso.menu_codigo = geral_menu.menu_codigo)and' + ' (func_codigo = :funccodigo) and ' + ' (empre_codigo = :emprecodigo)';
    sSQLSelect = 'select op.*,p.empre_codigo, p.prod_ref_forn, p.prod_codigo, p.prod_descricao, p.prod_unid_venda, p.prod_unid_compra, p.prod_grupo, p.prod_subgrp, p.prod_qtd_compra, p.prod_peso_liquido, p.prod_nr_mes_v ' + ' from geral_produtos p , geral_ordem_producao op ' + ' where p.prod_codigo = op.prod_codigo ';
    sSQLSelectComp = 'select DISTINCT p.empre_codigo, p.prod_ref_forn, p.prod_codigo, p.prod_descricao, p.prod_unid_venda, p.prod_unid_compra ' + ' from geral_produtos p , geral_produtos_composicao pc ' + ' where p.prod_codigo = pc.prod_codigo ';

implementation

uses
    uFuncoes, URelGeralOrdemProducao, URelEtiquetas,
    UCadastroOrdemProducao, UAtualizaOrdemProducao;

{$R *.dfm}

procedure TfrmSisIndustria.actComposicaoExecute(Sender: TObject);
var
    I: Integer;
begin
    //ctbMenu.Categories[0].CategoryButtons.SelectedButtonColor := $00FE8E67;
    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO, 'IND020100000000000000', URetornaRecord.RetornaFuncionario.EMPRE_CODIGO, URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020100000000000000';
        Cadastra_Campos_Comp(Sender);
        ValidaPermissoesCampos();

        pnlBotoes.Visible := true;
        pgcGeralConsulta.Visible := true;
        pgcGeralConsulta.ActivePageIndex := 0;
        pnlTituloConsulta.Visible := true;
        lblTituloTela.Caption := 'COMPOSIÇÃO PRODUTO FINAL';

        if pnlSubMenu.Visible then
        begin
            pnlSubMenu.Visible := false;
            ctbSubMenu.Categories[0].Items[0].CategoryButtons.Visible := false;
            ctbSubMenu.Categories[0].Items[1].CategoryButtons.Visible := false;
        end;

        cbxProcurarComp.ItemIndex := 0;
        cbxResultadosComp.ItemIndex := 1;
        cbxProcurarComp.OnChange(Sender);
        btnPesquisaComp.OnClick(Sender);

        if grdProdutoFinal.CanFocus then
            grdProdutoFinal.SetFocus;

        for I := 0 to pnlBotoesGeral.ControlCount - 1 do
        begin
            pnlBotoesGeral.Controls[I].Enabled := True;
        end;

        FormResize(Self);
    end;
end;

procedure TfrmSisIndustria.actEtiquetasExecute(Sender: TObject);
var
    Formulario: TfrmRelEtiquetas;
begin
    pgcGeralConsulta.Visible := false;
    //pgcGeralConsulta.ActivePageIndex := 3;
    //pnlTituloConsulta.Visible := true;
    //lblTituloTela.Caption := 'RELATÓRIOS  >  ETIQUETAS';

    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO, 'IND020320000000000000', URetornaRecord.RetornaFuncionario.EMPRE_CODIGO, URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020320000000000000';
        Formulario := TfrmRelEtiquetas.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;
    end;
end;

procedure TfrmSisIndustria.actInicioExecute(Sender: TObject);
begin
    //ctbMenu.Categories[0].CategoryButtons.SelectedButtonColor := $00FE8E67;
    pgcGeralConsulta.Visible := false;
    pnlBotoes.Visible := false;
    pnlTituloConsulta.Visible := false;
    if pnlSubMenu.Visible then
    begin
        pnlSubMenu.Visible := false;
        ctbSubMenu.Categories[0].Items[0].CategoryButtons.Visible := false;
        ctbSubMenu.Categories[0].Items[1].CategoryButtons.Visible := false;
    end;
end;

procedure TfrmSisIndustria.actOrdemProducaoExecute(Sender: TObject);
begin
    //ctbMenu.Categories[0].CategoryButtons.SelectedButtonColor := $00FE8E67;
    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO, 'IND020200000000000000', URetornaRecord.RetornaFuncionario.EMPRE_CODIGO, URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020200000000000000';
        Cadastra_Campos(Sender);
        ValidaPermissoesCampos();

        pnlBotoes.Visible := true;
        pgcGeralConsulta.Visible := true;
        pgcGeralConsulta.ActivePageIndex := 1;
        lblTituloTela.Caption := 'ORDEM DE PRODUÇÃO';
        pnlTituloConsulta.Visible := true;

        if pnlSubMenu.Visible then
        begin
            pnlSubMenu.Visible := false;
            ctbSubMenu.Categories[0].Items[0].CategoryButtons.Visible := false;
            ctbSubMenu.Categories[0].Items[1].CategoryButtons.Visible := false;

        end;
        rdgSituacao.ItemIndex := 0;
        dtpDataEmissao.Visible := False;
        pgcGeral.TabIndex := 0;
        cbxProcurar.ItemIndex := 0;
        cbxResultados.ItemIndex := 1;
        cbxProcurar.OnChange(Sender);

        btnPesquisa.OnClick(Sender);

        if grdOrdemProducao.CanFocus then
            grdOrdemProducao.SetFocus;

        FormResize(Self);
    end;

end;

procedure TfrmSisIndustria.actRelatoriosExecute(Sender: TObject);
begin
    //ctbMenu.Categories[0].CategoryButtons.SelectedButtonColor := $00FE8E67;
    pnlBotoes.Visible := false;
    pnlTituloConsulta.Visible := false;
    pgcGeralConsulta.Visible := False;

    if pnlSubMenu.Visible then
    begin
        pnlSubMenu.Visible := false;
        ctbSubMenu.Categories[0].Items[0].CategoryButtons.Visible := false;
        ctbSubMenu.Categories[0].Items[1].CategoryButtons.Visible := false;
    end
    else
    begin
        pnlSubMenu.Visible := true;
        ctbSubMenu.Categories[0].Items[0].CategoryButtons.Visible := true;
        ctbSubMenu.Categories[0].Items[1].CategoryButtons.Visible := true;
    end;
end;

procedure TfrmSisIndustria.actRelOrdemProducaoExecute(Sender: TObject);
var
    Formulario: TfrmRelGeralOrdemProducao;
begin
    pgcGeralConsulta.Visible := false;
    //pgcGeralConsulta.ActivePageIndex := 2;
    //pnlTituloConsulta.Visible := true;
    //lblTituloTela.Caption := 'RELATÓRIOS  >  GERAL ORDEM DE PRODUÇÃO';

    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO, 'IND020310000000000000', URetornaRecord.RetornaFuncionario.EMPRE_CODIGO, URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020310000000000000';
        Formulario := TfrmRelGeralOrdemProducao.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;
    end;
end;

procedure TfrmSisIndustria.FdQryItensOrdemAfterScroll(DataSet: TDataSet);
begin
    CalculaItensOrdem();
    CalculaPrecoItensOrdem();
end;

procedure TfrmSisIndustria.FdQryItensOrdemATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmSisIndustria.FdQryItensOrdemCOMP_CONVERSAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmSisIndustria.FdQryMateriaPrimaATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmSisIndustria.FdQryMateriaPrimaCOMP_CONVERSAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmSisIndustria.FdQryOrdemProducaoAfterScroll(DataSet: TDataSet);
begin
    btnAltera.Enabled := (FdQryOrdemProducaoSITUACAO.AsString = 'A');
    btnExclui.Enabled := (not (FdQryOrdemProducaoSITUACAO.AsString = 'E')) and (not (FdQryOrdemProducaoSITUACAO.AsString = 'F'));
end;

procedure TfrmSisIndustria.FdQryOrdemProducaoSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'A' then
        Text := 'ABERTO';
    if Sender.AsString = 'F' then
        Text := 'FINALIZADO';
    if Sender.AsString = 'E' then
        Text := 'ESTORNADO';
end;

procedure TfrmSisIndustria.FdQryProdutoAcabadoAfterScroll(DataSet: TDataSet);
begin
    CarregaMateriaPrima;
    CalculaPercTotalComposicao();
end;

procedure TfrmSisIndustria.FormActivate(Sender: TObject);
begin
    FormResize(Self);
end;

procedure TfrmSisIndustria.FormClose(Sender: TObject; var Action: TCloseAction);
var
    i : Integer;
begin
    if PerguntaSim('Deseja sair do sistema?', 'Atenção!') then
    begin
        Action := caFree;
        ExitProcess(0);//força a finalização do processo
    end
    else
        Action := caNone;
end;

procedure TfrmSisIndustria.FormCreate(Sender: TObject);
var
    iNivel01, iNivel02, iNivel03, iNivel04, iNivel05: Integer;
    sFuncCodigo, sSenhaSenha: string;
    FileName: pChar;
    HMutex: THandle;
begin
    lblSGBD.Caption := 'SGBD: '+ARQUIVOINI.CAMINHOBASE;
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    FormatSettings.ShortTimeFormat := 'hh:mm';
    FormatSettings.TimeAMString := '';
    FormatSettings.TimePMString := '';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('insert into geral_menu(menu_codigo,menu_descricao,menu_modulo) ' + 'values (:menucodigo,:menudescricao,:menumodulo) ' + 'on duplicate key update menu_codigo = :menucodigo, ' + '                        menu_descricao = :menudescricao, ' + '                        menu_modulo = :menumodulo');
     //dtmSisGestao.cdsGeralDados.Params.ParamByName('MENUTIPO').AsString := '';

    for iNivel01 := 0 to mnuSisIndustria.Items.Count - 1 do
    begin
        Application.ProcessMessages;
        // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
        if mnuSisIndustria.Items.Items[iNivel01].Caption = '-' then
            Continue;
        dtmSisGestao.FdQryGeralDados.Active := False;
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := UpperCase(mnuSisIndustria.Items.Items[iNivel01].Name);
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUDESCRICAO').AsString := Trim(mnuSisIndustria.Items.Items[iNivel01].Hint);
        //dtmSisGestao.cdsGeralDados.Params.ParamByName('MENUACESSO').AsString := 'X';
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUMODULO').AsString := PadLeft(IntToStr(mnuSisIndustria.Items.Items[iNivel01].ImageIndex), 2, '0');
          //try
        dtmSisGestao.FdQryGeralDados.Execute;
        Application.ProcessMessages;

        for iNivel02 := 0 to mnuSisIndustria.Items[iNivel01].Count - 1 do
        begin
            Application.ProcessMessages;
            // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
            if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Caption = '-' then
                Continue;
            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Name);
            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUDESCRICAO').AsString := Trim(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Hint);
            //dtmSisGestao.cdsGeralDados.Params.ParamByName('MENUACESSO').AsString := 'X';
            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUMODULO').AsString := PadLeft(IntToStr(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].ImageIndex), 2, '0');

            Application.ProcessMessages;
            dtmSisGestao.FdQryGeralDados.Execute;

            if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count > 0 then
            begin
                for iNivel03 := 0 to mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count - 1 do
                begin
                    Application.ProcessMessages;
                    // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                    if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Caption = '-' then
                        Continue;
                    dtmSisGestao.FdQryGeralDados.Active := False;
                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Name);
                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUDESCRICAO').AsString := Trim(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Hint);
                    //dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUACESSO').AsString := 'X';
                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUMODULO').AsString := PadLeft(IntToStr(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].ImageIndex), 2, '0');
                    Application.ProcessMessages;
                    dtmSisGestao.FdQryGeralDados.Execute;

                    if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count > 0 then
                    begin
                        for iNivel04 := 0 to mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count - 1 do
                        begin
                            Application.ProcessMessages;
                            // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                            if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Caption = '-' then
                                Continue;
                            Application.ProcessMessages;
                            dtmSisGestao.FdQryGeralDados.Active := False;
                            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Name);
                            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUDESCRICAO').AsString := Trim(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Hint);
                            //dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUACESSO').AsString := 'X';
                            dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUMODULO').AsString := PadLeft(IntToStr(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].ImageIndex), 2, '0');

                            Application.ProcessMessages;
                            dtmSisGestao.FdQryGeralDados.Execute;

                            if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count > 0 then
                            begin
                                for iNivel05 := 0 to mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count - 1 do
                                begin
                                    Application.ProcessMessages;
                                    // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                                    if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Caption = '-' then
                                        Continue;
                                    dtmSisGestao.FdQryGeralDados.Active := False;
                                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Name);
                                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUDESCRICAO').AsString := Trim(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Hint);
                                    //dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUACESSO').AsString := 'X';
                                    dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUMODULO').AsString := PadLeft(IntToStr(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].ImageIndex), 2, '0');

                                    dtmSisGestao.FdQryGeralDados.Execute;

                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdConnection.Commit;

    dtmSisGestao.Grava_Dados_Iniciais;

     // Verificação dos parâmetros...
    iApresentaUmVez := 0;
    if (iApresentaUmVez = 0) then
    begin
        Application.ProcessMessages;
        iApresentaUmVez := 1;
        iContaParametros := 0;
        // Verifica os parametros externos...
        iContaParametros := 3; //ParamCount;
        Application.ProcessMessages;

          //TA VINDO 4  PARAMETROS
        if (iContaParametros <> 0) and (iContaParametros > 3) or (iContaParametros = 3) then
        begin
            sEmpresa := '1'; //ParamStr(1);
            sFuncCodigo := '2'; //ParamStr(2); // Codigo do funcionário...
            sSenhaSenha := '123'; //ParamStr(3); // Senha do funcionário...
            Pega_Usuario(sFuncCodigo, sSenhaSenha, sEmpresa, sRet);
            if (sRet = 'FALHA') then
            begin
                //Informacao('Usuário não encontrado... PARAMETROS...','Aviso...');
                //Application.Terminate; Exit;
            end;

            lblUsuario.Caption := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO) + ' - ' + Copy(Trim(URetornaRecord.RetornaFuncionario.FUNC_NOME), 1, 10);
            pnlEmpresa.Caption := 'Empresa: ' + IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO) + ' - ' + Trim(URetornaRecord.RetornaFuncionario.EMPRE_RAZAOSOCIAL);
            lblVersao.Caption := 'Versão: 1.00'; //sVersaoCadastros;
            Menus(sRet);
            //dtmSisGestao.Carrega_Config_Geral;
            Application.ProcessMessages;
            if (sRet = 'FALHA') then
            begin
                    // Informacao('Menus com falha... PARAMETROS...','Aviso...');
                    // Application.Terminate; Exit;
            end;
        end;
    end;
     // Habilita / Desabilita Avalista conforme RamoCliente
     //CAD020101000000000000.Enabled := (GERAL_CONFIGURADOR.GER_RAMOCLIENTE = 'CRED');*)
end;

procedure TfrmSisIndustria.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN:
            Perform(WM_NEXTDLGCTL, 0, 0);
        VK_ESCAPE:
            imgSair.OnClick(Self);
        VK_F5:
            begin
                case pgcGeralConsulta.ActivePageIndex of
                    0:
                        btnPesquisaComp.OnClick(Self);
                    1:
                        btnPesquisa.OnClick(Self);

                end;
            end;
        VK_F2:
            begin
                if (btnNovo.Enabled) and (btnNovo.Visible) then
                    btnNovo.OnClick(Self);
            end;
        VK_F3:
            begin
                if (btnAltera.Enabled) and (btnAltera.Visible) then
                    btnAltera.OnClick(Self);
            end;
        VK_F6:
            begin
                if (btnExclui.Enabled) and (btnExclui.Visible) then
                    btnExclui.OnClick(Self);
            end;
        VK_F9:
            begin
                if (btnRelatorio.Enabled) and (btnRelatorio.Visible) then
                    btnRelatorio.OnClick(Self);
            end;
        VK_F10:
            begin
                if pgcGeralConsulta.ActivePageIndex = 1 then
                begin
                    if (mniAtulizarOP.Enabled) and (mniAtulizarOP.Visible) then
                        mniAtulizarOP.OnClick(Self);
                end;
            end;
        VK_F11:
            begin
                if pgcGeralConsulta.ActivePageIndex = 1 then
                begin
                    if (mniEstornarOP.Enabled) and (mniEstornarOP.Visible) then
                        mniEstornarOP.OnClick(Self);
                end;
            end;
    end;
end;

procedure TfrmSisIndustria.FormResize(Sender: TObject);
begin
    grdOrdemProducao.Columns[4].Width := grdOrdemProducao.Width - 43 - (grdOrdemProducao.Columns[0].Width + grdOrdemProducao.Columns[1].Width + grdOrdemProducao.Columns[2].Width + grdOrdemProducao.Columns[3].Width + grdOrdemProducao.Columns[5].Width + grdOrdemProducao.Columns[6].Width + grdOrdemProducao.Columns[7].Width + grdOrdemProducao.Columns[8].Width + grdOrdemProducao.Columns[9].Width + grdOrdemProducao.Columns[10].Width + grdOrdemProducao.Columns[11].Width);
    if grdOrdemProducao.Columns[4].Width <= 180 then
        grdOrdemProducao.Columns[4].Width := 180;

    grdProdutoFinal.Columns[3].Width := grdProdutoFinal.Width - 20 - (grdProdutoFinal.Columns[0].Width + grdProdutoFinal.Columns[1].Width + grdProdutoFinal.Columns[2].Width + grdProdutoFinal.Columns[4].Width + grdProdutoFinal.Columns[5].Width);
    if grdProdutoFinal.Columns[3].Width <= 159 then
        grdProdutoFinal.Columns[3].Width := 159;

    grdMateriaPrima.Columns[2].Width := grdMateriaPrima.Width - 20 - (grdMateriaPrima.Columns[0].Width + grdMateriaPrima.Columns[1].Width + grdMateriaPrima.Columns[3].Width + grdMateriaPrima.Columns[4].Width + grdMateriaPrima.Columns[4].Width);
    if grdMateriaPrima.Columns[2].Width <= 159 then
        grdMateriaPrima.Columns[2].Width := 159;
end;

(*procedure TfrmSisIndustria.OBR010100000000000000Click(Sender: TObject);
begin
   //Login;
end;

procedure TfrmSisIndustria.IND010100000000000000Click(Sender: TObject);
begin
   Close;
end;*)

(*procedure TfrmSisIndustria.IND020100000000000000Click(Sender: TObject);
var
   Formulario : TfrmConsultaComposicaoProdutoFinal;
begin
    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO,'IND020100000000000000',
                             URetornaRecord.RetornaFuncionario.EMPRE_CODIGO,
                             URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020100000000000000';

        Formulario := TfrmConsultaComposicaoProdutoFinal.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;
    end;

end;

procedure TfrmSisIndustria.IND020200000000000000Click(Sender: TObject);
var
   Formulario : TfrmSisIndustria;
begin
    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO,'IND020200000000000000',
                             URetornaRecord.RetornaFuncionario.EMPRE_CODIGO,
                             URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020200000000000000';

        Formulario := TfrmSisIndustria.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;
    end;

end;

procedure TfrmSisIndustria.IND020310000000000000Click(Sender: TObject);
var
   Formulario : TfrmRelGeralOrdemProducao;
begin
    if VerificaCadastroMenu(URetornaRecord.RetornaFuncionario.FUNC_CODIGO,'IND020310000000000000',
                             URetornaRecord.RetornaFuncionario.EMPRE_CODIGO,
                             URetornaRecord.RetornaFuncionario.SENHA_SENHA) then
    begin
        URetornaRecord.RetornaFuncionario.MENU_ATUAL := 'IND020310000000000000';
        Formulario := TfrmRelGeralOrdemProducao.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;
    end;
end;

procedure TfrmSisIndustria.IND080000000000000000Click(Sender: TObject);
var
   Formulario : TfrmMenuPrincipal;
begin

        Formulario := TfrmMenuPrincipal.Create(self);
        try
            Formulario.ShowModal;
        finally
            FreeAndNil(Formulario);
        end;

end;

{procedure TfrmSisIndustria.OBR020104000000000000Click(Sender: TObject);
var
   Formulario : TfrmConsultaProdutos;
begin
   Formulario := TfrmConsultaProdutos.Create(self);
   Formulario.ShowModal;
   Formulario.Free;
end;}

{procedure TfrmSisIndustria.Login;
var
   Formulario     : TfrmLogin;
   sCaminhoSessao : String;
   tfArquivoLogin : TIniFile;
begin
   if (USUARIO.USU_RETORNOSENHA = '') then
   begin
        Formulario := TfrmLogin.Create(Self);
        Formulario.ShowModal;
        Formulario.Free;
   end;
   if USUARIO.USU_RETORNOSENHA = 'OK' then
   begin
//        USUARIO.SENHA(USUARIO.USU_CODIGO,
//                    Trim(Decripta(USUARIO.SENHA_SENHA))
//                     sRet);

        sFuncCodigo := USUARIO.USU_CODIGO;
        sSenhaSenha := USUARIO.SENHA_SENHA;
   end
   else
   begin
        if (USUARIO.USU_RETORNOSENHA = 'CANCELA') then
        begin
             // Desativa o Skin....
             skdSkin.Active := False;
             USUARIO.SENHA_SKIN := '';
             USUARIO.USU_RETORNOSENHA := '';
        end
        else
            Application.Terminate;
   end;
end; }



procedure TfrmSisIndustria.trwMenuClick(Sender: TObject);
begin
  case trwMenu.Selected.SelectedIndex of
   101 : IND010100000000000000Click(Sender); // Sair
   //201 : OBR020100000000000000Click(Sender); // Composição Produto Final
   //202 : OBR020200000000000000Click(Sender); // Ordem Produção
   //204 : OBR020400000000000000Click(Sender); //Rel. Geral Ordem Producao
   //800 : OBR080000000000000000Click(Sender);
  end;
end;

procedure TfrmSisIndustria.trwMenuDblClick(Sender: TObject);
begin
    case trwMenu.Selected.SelectedIndex of
        //103 : OBR010300000000000000Click(Sender); // Sair
        201  : IND020100000000000000Click(Sender); // Composição Produto Final
        202  : IND020200000000000000Click(Sender); // Ordem Produção
        2031 : IND020310000000000000Click(Sender); //Rel. Geral Ordem Producao
        800  : IND080000000000000000Click(Sender);
    end;
end;*)

(*procedure TfrmSisIndustria.trwMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     case Key of
          VK_RETURN, VK_DOWN : Perform(WM_NEXTDLGCTL,0,0);
          VK_UP, VK_F12      : Perform(WM_NEXTDLGCTL,0,1);
          VK_ESCAPE          : Close;
     end;
end;*)

procedure TfrmSisIndustria.Pega_Usuario(pFuncCodigo, pSenhaSenha, pEmpresa: string; var pRetorno: string);
var
    bAuxConfigura: Boolean;
    //Formulario : TfrmCadastroConfigGeral;
begin
    pRetorno := 'OK';
    // Pega dados do usuario...
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(sSQLSelecionaUsuario);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := pFuncCodigo;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := StrToInt(pEmpresa);
    // Seleciona dados do funcionario...
    dtmSisGestao.FdQryGeralDados.Active := True;
    if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').IsNull then
        pRetorno := 'FALHA';
    // Verifica a senha...
    if (pSenhaSenha <> '123'{Trim(Decripta_Email(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString))}) then
    begin
        pRetorno := 'FALHA';
        dtmSisGestao.FdConnection.Rollback;
    end;
    // Verifica se o usuário tem acesso ao sistema....
    if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').IsNull) or (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsInteger = 1) then
    begin
        Informacao('Usuário sem acesso ao SISTEMA...', 'Aviso...');
        Application.Terminate;
        Exit;
    end;
    // Passagem de dados para a estrutura de usuarios...
    with URetornaRecord.RetornaFuncionario do
    begin
        EMPRE_CODIGO := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').AsInteger;
        FUNC_CODIGO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').AsString;
        FUNC_NOME := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOME').AsString;
        FUNC_ENDERECO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ENDERECO').AsString;
        FUNC_NUMERO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NUMERO').AsString;
        FUNC_COMPLEMENTO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_COMPLEMENTO').AsString;
        FUNC_BAIRRO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BAIRRO').AsString;
        FUNC_CEP := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CEP').AsString;
        CIDADE_CODDNE := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_CODDNE').AsInteger;
        FUNC_TELFIXO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELFIXO').AsString;
        FUNC_TELCELULAR := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELCELULAR').AsString;
        FUNC_SEXO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SEXO').AsString;
        FUNC_EMAIL := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_EMAIL').AsString;
        FUNC_CTPSNUMERO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CTPSNUMERO').AsString;
        FUNC_CPF := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CPF').AsString;
        FUNC_TITELEITORALNUMERO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALNUMERO').AsString;
        FUNC_TITELEITORALZONA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALZONA').AsString;
        FUNC_TITELEITORALNUMERO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALSECAO').AsString;
        FUNC_IDENTIDADE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_IDENTIDADE').AsString;
        FUNC_ORGAOEMISSOR := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ORGAOEMISSOR').AsString;
        FUNC_DATAADMISSAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATAADMISSAO').AsDateTime;
        FUNC_DATADEMISSAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATADEMISSAO').AsDateTime;
        CARGO_CODIGO := dtmSisGestao.FdQryGeralDados.FieldByName('CARGO_CODIGO').AsInteger;
        FUNC_NASCIMENTO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
        FUNC_NACIONALIDADE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NACIONALIDADE').AsString;
        FUNC_GRAUINSTRUCAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_GRAUINSTRUCAO').AsString;
        FUNC_ESTADOCIVIL := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ESTADOCIVIL').AsString;
        FUNC_NOMECONJUGE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOMECONJUGE').AsString;
        FUNC_HABILITACAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_HABILITACAO').AsString;
        FUNC_CATEGORIA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CATEGORIA').AsString;
        FUNC_VALIDADE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_VALIDADE').AsDateTime;
        FUNC_PRIMHABILITACAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PRIMHABILITACAO').AsDateTime;
        FUNC_SISTEMA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsString;
        FUNC_CERTMILITAR_SERIE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_SERIE').AsString;
        FUNC_CERTMILITAR_CATEGORIA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_CATEGORIA').AsString;
        FUNC_FILIACAO_MAE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_MAE').AsString;
        FUNC_FILIACAO_PAI := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_PAI').AsString;
        FUNC_FGTS_OPTANTE := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_OPTANTE').AsString;
        FUNC_FGTS_DATAOPCAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATAOPCAO').AsDateTime;
        FUNC_FGTS_DATARETRATACAO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATARETRATACAO').AsDateTime;
        FUNC_FGTS_BANCODEPOSITARIO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_BANCODEPOSITARIO').AsInteger;
        FUNC_PIS_DATACADASTRO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
        FUNC_PIS_NUMERO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PIS_NUMERO').AsString;
        BANCO_CODIGO := dtmSisGestao.FdQryGeralDados.FieldByName('BANCO_CODIGO').AsInteger;
        FUNC_BANCOAGENCIA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOAGENCIA').AsInteger;
        FUNC_BANCOCONTA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOCONTA').AsString;
        SENHA_SENHA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString;
        SENHA_NIVEL := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').AsString;
        FUNC_BOTOES := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BOTOES').AsString;
        if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').IsNull then
            SENHA_CORCAMPOS := clSkyBlue
        else
            SENHA_CORCAMPOS := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').AsInteger;
        SENHA_SKIN := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').AsString;
        if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').IsNull then
            SENHA_SKIN := 'macos.skn';
     // Seleciona os dados da empresa ...
     // Seleciona o usuario escolhido....
        dtmSisGestao.FdQryGeralDados.Active := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add(LowerCase('SELECT * FROM GERAL_FUNCIONARIO,GERAL_EMPRESA,GERAL_CIDADE ' + 'WHERE ((GERAL_FUNCIONARIO.EMPRE_CODIGO = GERAL_EMPRESA.EMPRE_CODIGO) AND ' + '      (geral_EMPRESA.cidade_coddne = geral_cidade.cidade_coddne) and ' + '       (GERAL_FUNCIONARIO.FUNC_CODIGO = :FUNCCODIGO) AND ' + '       (GERAL_FUNCIONARIO.EMPRE_CODIGO = :EMPRECODIGO))'));
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := FUNC_CODIGO;
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeralDados.Active := True;
        if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOME').IsNull) then
            pRetorno := 'FALHA';
        // Passagem de dados para a estrutura de usuarios...
        EMPRE_RAZAOSOCIAL := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_RAZAOSOCIAL').AsString;
        EMPRE_CNPJ := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CNPJ').AsString;
        EMPRE_INSCESTADUAL := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_INSCESTADUAL').AsString;
        EMPRE_UF := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_UF').AsString;
        EMPRE_LOGOTIPO := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_LOGOTIPO').AsString;
        dtmSisGestao.FdQryGeralDados.Active := False;

        // ler configurador geral
        bAuxConfigura := dtmSisGestao.Carrega_Config_Geral;
        // Se não configurou, vai abrir o configurador para preencher
        {if not bAuxConfigura then
        begin
            Informacao('Para o sistema executar, é necessário ter um registro no Configurador Geral','Atenção!');
            if VerificaCadastroMenu(FUNC_CODIGO,'IND020100000000000000',
                                    EMPRE_CODIGO,
                                    SENHA_SENHA) then
            begin
                MENU_ATUAL := 'IND020100000000000000';
                //Formulario := TfrmCadastroConfigGeral.Create(self);
                //Formulario.sAcao := 'INSERIR';
                //Formulario.ShowModal;
                //Formulario.Free;
                //FechaPrograma('pCadastros.exe');
            end;
        end;}
    end;
end;

procedure TfrmSisIndustria.Menus(var pRetorno: string);
var
    iNivel01, iNivel02, iNIVEL03, iNIVEL04, iNIVEL05, i, j: Integer;
begin
    pRetorno := 'OK';
    // Se for o caso, cadastra os menus no acesso para o usuario selecionado...
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    // Seleciona os menus que não estão cadastrados para o usuário logado...
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select geral_menu.menu_codigo from geral_menu ' + '         left outer join geral_acesso ' + '              on (geral_menu.menu_codigo = geral_acesso.menu_codigo and ' + '                  geral_acesso.empre_codigo = :emprecodigo and ' + '                  geral_acesso.func_codigo = :funccodigo) ' + 'order by geral_menu.menu_codigo');
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('funccodigo').AsString := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('emprecodigo').AsInteger := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
    dtmSisGestao.FdQryGeralDados.Active := True;
    // SQL para inserir os menus que o funcionario não tenha...
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        dtmSisGestao.FdQryConsulta.Active := False;
        dtmSisGestao.FdQryConsulta.SQL.Clear;
        dtmSisGestao.FdQryConsulta.SQL.Add('insert into geral_acesso(func_codigo,empre_codigo,menu_codigo,acesso_nivel) ' +
                                                'values(:func_codigo,:empre_codigo,:menu_codigo,:acesso_nivel) ' +
                                                'on duplicate key update func_codigo  = :func_codigo,' +
                                                '                        empre_codigo = :empre_codigo,' +
                                                '                        menu_codigo  = :menu_codigo,' +
                                                '                        acesso_nivel = :acesso_nivel');
        dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNC_CODIGO').AsString := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
        dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRE_CODIGO').AsInteger := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        dtmSisGestao.FdQryConsulta.Params.ParamByName('MENU_CODIGO').AsString := '';
        dtmSisGestao.FdQryConsulta.Params.ParamByName('ACESSO_NIVEL').AsString := 'S';
        dtmSisGestao.FdQryConsulta.Params.ParamByName('ACESSO_NIVEL').AsString := (URetornaRecord.RetornaFuncionario.SENHA_NIVEL);
        dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNC_CODIGO').AsString := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
        dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRE_CODIGO').AsInteger := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        try
            dtmSisGestao.FdQryConsulta.Execute;
        except
        end;
        dtmSisGestao.FdQryGeralDados.Next;
    end;
    dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(sSQLSelecionaMenus);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsFloat := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
    dtmSisGestao.FdQryGeralDados.Active := True;
    if dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').IsNull then
    begin
        pRetorno := 'FALHA';
       //   Informacao('Menus não cadastrados...','Aviso...'); Exit;
    end;
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        for iNivel01 := 0 to mnuSisIndustria.Items.Count - 1 do
        begin
            // Mostra / oculta menu de acordo com o acesso do funcionario...
            if UpperCase(mnuSisIndustria.Items.Items[iNivel01].Name) = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
            begin
                if (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S') then
                    //mnuSisIndustria.Items.Items[iNivel01].Visible := (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                    Continue;
            end;
            for iNivel02 := 0 to mnuSisIndustria.Items[iNivel01].Count - 1 do
            begin
                // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Caption = '-' then
                    Continue;
                // Mostra / oculta menu de acordo com o aceso do funcionario...
                if UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Name) = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                begin
                    if (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S') then
                        mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Visible := (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                    if (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'N') then
                    begin
                        for i := 0 to ctbMenu.Categories[0].Items.Count - 1 do
                        begin
                            try
                                if (ctbMenu.Categories[0].Items[i].Hint = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_DESCRICAO').AsString) then
                                begin
                                    ActionList1[i].Enabled := false;
                                    ctbMenu.Categories[0].Items[i].Caption := '';
                                end;
                            except
                                Break;
                            end;
                        end;
                    end;
                    Break;
                end;

                if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count > 0 then
                begin
                    for iNIVEL03 := 0 to mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count - 1 do
                    begin
                        // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                        if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNIVEL03].Caption = '-' then
                            Continue;
                        // Mostra / oculta menu de acordo com o aceso do funcionario...
                        if UpperCase(mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNIVEL03].Name) = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                        begin
                            if (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S') then
                                mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Items[iNIVEL03].Visible := (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                            if (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'N') then
                            begin
                                for i := 0 to ctbSubMenu.Categories[0].Items.Count - 1 do
                                begin
                                    try
                                        if (ctbSubMenu.Categories[0].Items[i].Hint = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_DESCRICAO').AsString) then
                                        begin
                                            for j := 0 to 20 do
                                            begin
                                                if ActionList1[j].Hint = dtmSisGestao.FdQryGeralDados.FieldByName('MENU_DESCRICAO').AsString then
                                                begin
                                                    ActionList1[j].Enabled := false;
                                                    break;
                                                end;
                                            end;
                                            ctbSubMenu.Categories[0].Items[i].Caption := '';
                                        end;
                                    except
                                        Break;
                                    end;

                                end;
                            end;
                            Break;
                        end;
                    end; //for iNivel03 := 0 to mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count-1 do
                end; //if mnuSisIndustria.Items.Items[iNivel01].Items[iNivel02].Count > 0 then
            end; //for iNivel02 := 0 to mnuSisIndustria.Items[iNivel01].Count-1 do
        end; //for iNivel01 := 0 to mnuSisIndustria.Items.Count -1 do

        dtmSisGestao.FdQryGeralDados.Next;
    end; //while not dtmSisGestao.FdQryGeralDados.Eof do
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmSisIndustria.FormShow(Sender: TObject);
begin
    pgcGeralConsulta.Visible := false;
    pnlTituloConsulta.Visible := false;
    pnlBotoes.Visible := false;
    pnlSubMenu.Visible := false;
    lblData.Caption := FormatDateTime('dd/mm/yyyy', Now);
    lblHora.Caption := FormatDateTime('hh:mm:ss', Now);

end;

procedure TfrmSisIndustria.imgSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmSisIndustria.imgLogoClick(Sender: TObject);
begin
    if pnlMenu.Visible then
    begin
        pnlMenu.Visible := False;
        pnlSubMenu.Visible := False;
    end
    else
    begin
        pnlMenu.Visible := True;
        //ctbMenu.Categories[0].CategoryButtons.SelectedButtonColor := clNone;
        //pnlSubMenu.Visible := True;
    end;
    FormResize(Self);
end;

procedure TfrmSisIndustria.tmrRelogioTimer(Sender: TObject);
begin
    lblHora.Caption := FormatDateTime('hh:mm:ss', Now);
end;

procedure TfrmSisIndustria.AtualizaSituacao(const nr_ordem, situacao: string);
var
    sqlUpdate: string;
begin
    sqlUpdate := 'update geral_ordem_producao set situacao = ' + QuotedStr(situacao) + ' where nr_ordem = ' + nr_ordem;

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Execute();
        end;

    except
        on e: Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro.' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure TfrmSisIndustria.mniAtulizarOPClick(Sender: TObject);
begin
    if FdQryOrdemProducaoSITUACAO.AsString = 'A' then
    begin
        frmAtualizaOrdemProducao := TfrmAtualizaOrdemProducao.Create(Self);
        try
            frmAtualizaOrdemProducao.NR_ORDEM := FdQryOrdemProducaoNR_ORDEM.AsString;
            frmAtualizaOrdemProducao.PROD_CODIGO := FdQryOrdemProducaoPROD_CODIGO.AsString;
            frmAtualizaOrdemProducao.PROD_NOME := FdQryOrdemProducaoprod_descricao.AsString;
            frmAtualizaOrdemProducao.VLR_TOTAL := FdQryOrdemProducaoVALOR_TOTAL.AsFloat;
            frmAtualizaOrdemProducao.QTD_SC := FdQryOrdemProducaoQTDE_SC.AsFloat;
            frmAtualizaOrdemProducao.QTD_KG := FdQryOrdemProducaoQTDE_KG.AsFloat;

            frmAtualizaOrdemProducao.ShowModal;
        finally
            if frmAtualizaOrdemProducao.ModalResult = mrOk then
            begin
                rdgSituacao.ItemIndex := 1;
                btnPesquisa.OnClick(Self);
                FdQryOrdemProducao.Locate('NR_ORDEM', frmAtualizaOrdemProducao.NR_ORDEM, []);

            end;
            FreeAndNil(frmAtualizaOrdemProducao);
        end;

    end;
end;

procedure TfrmSisIndustria.mniEstornarOPClick(Sender: TObject);
var
    CODIGO: Integer;
begin
    if FdQryOrdemProducaoSITUACAO.AsString = 'F' then
    begin
        if PerguntaSim('Deseja realizar o estorno da ordem de produção selecionada?', 'Atenção...') then
        begin
            {executa processo de estorno}
            if dtmSisGestao.FdConnection.InTransaction then
                dtmSisGestao.FdConnection.Rollback;
            dtmSisGestao.FdConnection.StartTransaction;
            try
                Estorna_Kardex_Hist_Est();
            except
                on e: Exception do
                begin
                    dtmSisGestao.FdConnection.Rollback;
                    Informacao('Erro ao gravar atualizações ' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
                    Exit;
                end;
            end;
            dtmSisGestao.FdConnection.Commit;

            AtualizaSituacao(FdQryOrdemProducaoNR_ORDEM.AsString, 'E');
            DataEstorno(FdQryOrdemProducaoNR_ORDEM.AsString, Date);
            Informacao('Estorno efetuado com sucesso! ' + #10 + #13 + 'Nr.Ordem: ' + FdQryOrdemProducaoNR_ORDEM.AsString, 'Aviso...');

            CODIGO := FdQryOrdemProducaoNR_ORDEM.AsInteger;
            rdgSituacao.ItemIndex := 2;
            btnPesquisa.OnClick(Self);
            FdQryOrdemProducao.Locate('NR_ORDEM', CODIGO, []);
        end;

    end
end;

procedure TfrmSisIndustria.CalculaItensOrdem;
var
    QtdTotalItem: Double;
begin
    if not FdQryItensOrdem.IsEmpty then
    begin
        if FdQryItensOrdemCOMP_CONVERSAO.AsString = 'N' then
        begin
            QtdTotalItem := (StrToFloat(trim(edtQtdKG.Text)) * FdQryItensOrdemCOMP_QUANTIDADE.AsFloat) / 100;
            edtQtdeTotalItem.Text := FormatFloat('0.000', QtdTotalItem);
        end
        else
        begin
            QtdTotalItem := (StrToFloat(trim(edtQtdSC.Text)) * FdQryItensOrdemCOMP_QUANTIDADE.AsFloat);
            edtQtdeTotalItem.Text := FormatFloat('0.000', QtdTotalItem);
        end;

    end;
end;

procedure TfrmSisIndustria.CalculaPercTotalComposicao;
var
    dQtde : Real;
begin
    if (FdQryProdutoAcabado.Active) and (FdQryProdutoAcabado.RecordCount > 0) then
    begin
        dQtde := 0;
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(LowerCase('select COMP_QUANTIDADE from geral_produtos_composicao where PROD_CODIGO = ' + FdQryProdutoAcabadoprod_codigo.AsString +
                                    ' and COMP_CONVERSAO = '+ QuotedStr('N')));
            Active := True;
            First;
            while not Eof do
            begin
                dQtde := dQtde + FieldByName('COMP_QUANTIDADE').AsFloat;

                Next;
            end;

        end;
        edtPercTotal.Text := FormatFloat('0.000', dQtde);
    end
    else
        edtPercTotal.Text := '0';

end;

procedure TfrmSisIndustria.CalculaPrecoItensOrdem;
var
    sPrecos: string;
    dPrecoTotalItem: Double;
begin
    sPrecos := 'select preco_preco from geral_produtos_preco where preco_tabela = 5 ' + ' and prod_codigo = :prod_codigo ';
    if FdQryItensOrdemPROD_MAT_PRIMA.AsInteger <> 0 then
    begin
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sPrecos);
            Params.ParamByName('prod_codigo').AsString := FdQryItensOrdemPROD_MAT_PRIMA.AsString;
            Active := True;

            edtVlrUnitItem.Text := FormatFloat('0.000', FieldByName('preco_preco').AsFloat);
            dPrecoTotalItem := (StrToFloat(trim(edtQtdeTotalItem.Text)) * FieldByName('preco_preco').AsFloat);
            edtVlrTotalItem.Text := FormatFloat('0.00', dPrecoTotalItem);

        end;
    end
    else
        edtVlrTotalItem.Text := '0';

end;

procedure TfrmSisIndustria.CarregaCamposRelatorio(const prod_cod: string);
var
    dQtdGeral, dPreco, dCustoTotal: Double;
begin

    try
        cdsRelItensOrdemProd.EmptyDataSet;

        dtmSisGestao.FdQryGeralDados.Active := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, pc.comp_conversao, ' + ' p.prod_descricao, c.cli_nome ' + ' from geral_produtos_composicao pc, geral_produtos p, geral_cliente c ' + ' where pc.prod_codigo = ' + prod_cod + ' and pc.prod_mat_prima = p.prod_codigo ' + ' and p.cli_codigo = c.cli_codigo ' + ' and pc.comp_seq <> 0 ' + ' order by pc.comp_seq ');
        dtmSisGestao.FdQryGeralDados.Active := True;
        dtmSisGestao.FdQryGeralDados.First;
        while not dtmSisGestao.FdQryGeralDados.Eof do
        begin
            cdsRelItensOrdemProd.Append();

            if dtmSisGestao.FdQryGeralDados.FieldByName('comp_conversao').AsString = 'N' then
            begin
                dQtdGeral := StrToFloat(AllTrim(edtQtdKG.Text));
                dQtdGeral := ((dQtdGeral * dtmSisGestao.FdQryGeralDados.FieldByName('comp_quantidade').AsFloat) / 100);

            end
            else if dtmSisGestao.FdQryGeralDados.FieldByName('comp_conversao').AsString = 'S' then
            begin
                dQtdGeral := StrToFloat(AllTrim(edtQtdSC.Text));
                dQtdGeral := (dQtdGeral * dtmSisGestao.FdQryGeralDados.FieldByName('comp_quantidade').AsFloat);
            end;

            {Dados Relatorio}
            cdsRelItensOrdemProdSequencia.AsInteger := dtmSisGestao.FdQryGeralDados.FieldByName('comp_seq').AsInteger;
            cdsRelItensOrdemProdCod_Item.AsInteger := dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsInteger;
            cdsRelItensOrdemProdDescricao.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString;
            cdsRelItensOrdemProdQtde.AsString := FormatFloat('0.000', dQtdGeral);
            cdsRelItensOrdemProdnome_fornecedor.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('cli_nome').AsString;

            //busca preco dos itens
            FdQryAuxPrecoItens.Active := False;
            FdQryAuxPrecoItens.SQL.Clear;
            FdQryAuxPrecoItens.SQL.Add('select preco_preco from geral_produtos_preco where preco_tabela = 5 ' + ' and prod_codigo = ' + dtmSisGestao.FdQryGeralDados.FieldByName('prod_mat_prima').AsString);
            FdQryAuxPrecoItens.Active := True;

            if not FdQryAuxPrecoItens.IsEmpty then
            begin
                dPreco := FdQryAuxPrecoItens.FieldByName('preco_preco').AsFloat;
                cdsRelItensOrdemProdCusto.AsString := FormatFloat('0.000', dPreco); {Dados Relatorio}

                dCustoTotal := (dPreco * dQtdGeral);
                cdsRelItensOrdemProdTotal_item.AsString := FormatFloat('0.000', dCustoTotal);  {Dados Relatorio}

            end
            else
            begin
                cdsRelItensOrdemProdCusto.AsString := FormatFloat('0.000', 0);
                cdsRelItensOrdemProdTotal_item.AsString := FormatFloat('0.000', 0);
            end;

            cdsRelItensOrdemProd.Post(); {Dados Relatorio}

            dtmSisGestao.FdQryGeralDados.Next;
        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active := False;
        FdQryAuxPrecoItens.Active := False;
    end;

end;

procedure TfrmSisIndustria.CarregaItensOrdem;
var
    sItens: string;
begin

    FdQryItensOrdem.DisableControls;
    try
        sItens := ' select pc.*, p.prod_unid_compra, p.prod_descricao from geral_produtos p, geral_produtos_composicao pc ' + '  where (pc.prod_codigo  = :cod_produto) ' + ' and p.prod_codigo = pc.prod_mat_prima ' + ' and pc.comp_seq <> 0 ' + '  order by pc.prod_codigo, pc.comp_seq ';

        FdQryItensOrdem.Active := False;
        FdQryItensOrdem.SQL.Clear;
        FdQryItensOrdem.SQL.Add(sItens);
        FdQryItensOrdem.Params.ParamByName('cod_produto').AsString := Trim(FdQryOrdemProducaoPROD_CODIGO.AsString);

        FdQryItensOrdem.Active := True;

        if FdQryItensOrdem.RecordCount = 0 then
            FdQryItensOrdem.Active := False;

    finally
        FdQryItensOrdem.EnableControls;
    end;
end;

procedure TfrmSisIndustria.CarregaModoPreparoRelatorio(const prod_cod: string);
begin
    with dtmSisGestao.FdQryGeralDados do
    begin
        try
            Active := False;
            SQL.Clear;
            SQL.Add('select comp_formulacao from geral_produtos_composicao ' + ' where prod_codigo = ' + prod_cod + ' and comp_seq = 0 ');

            Active := True;
            ppModoPreparo.Text := FieldByName('comp_formulacao').AsString;
        finally
            Active := False;
        end;
    end;
end;

procedure TfrmSisIndustria.cbxProcurarChange(Sender: TObject);
begin
    lblProcurar.Caption := UpperCase(Trim(cbxProcurar.Text)) + ':';
    edtProcurar.EditMask := '';
    edtProcurar.MaxLength := 0;
    edtProcurar.Clear;

    if cbxProcurar.ItemIndex = 1 then
    begin
        dtpDataEmissao.Visible := true;
        dtpDataEmissaoFim.Visible := true;
        dtpDataEmissao.Date := Date - 30;
        dtpDataEmissaoFim.Date := Date;
        edtProcurar.Visible := false;
        btnLimpar.Visible := false;
    end
    else
    begin
        dtpDataEmissao.Visible := false;
        dtpDataEmissaoFim.Visible := false;
        edtProcurar.Visible := true;
        btnLimpar.Visible := true;
    end;
end;

procedure TfrmSisIndustria.cbxProcurarCompChange(Sender: TObject);
begin
    lblProcurarComp.Caption := UpperCase(Trim(cbxProcurarComp.Text)) + ':';
    edtProcurarComp.EditMask := '';
    edtProcurarComp.MaxLength := 0;
    edtProcurarComp.Clear;
end;

procedure TfrmSisIndustria.cbxResultadosChange(Sender: TObject);
begin
    btnPesquisa.OnClick(Sender);
    grdOrdemProducao.SetFocus;
end;

procedure TfrmSisIndustria.cbxResultadosCompChange(Sender: TObject);
begin
    btnPesquisaComp.OnClick(Sender);
    grdProdutoFinal.SetFocus;
end;


procedure TfrmSisIndustria.cdsMateriaPrimaATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmSisIndustria.cdsMateriaPrimaCOMP_CONVERSAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;


procedure TfrmSisIndustria.cdsProdutoAcabadoAfterScroll(DataSet: TDataSet);
var
    dQtde : Real;
begin
    CarregaMateriaPrima;

    //Calcula % total quantidade
    CalculaPercTotalComposicao();
end;

procedure TfrmSisIndustria.DataAtualizacao(const nr_ordem: string; data_atualizacao: TDate);
var
    sqlUpdate: string;
begin
    sqlUpdate := 'update geral_ordem_producao set data_atualizacao = :data_atualizacao ' + ' where nr_ordem = :nr_ordem ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Params.ParamByName('data_atualizacao').AsString := FormatDateTime('yyyy/mm/dd', data_atualizacao);
            Params.ParamByName('nr_ordem').AsString := nr_ordem;
            Execute();
        end;

    except
        on e: Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro.' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmSisIndustria.DataEstorno(const nr_ordem: string; data_estorno: TDate);
var
    sqlUpdate: string;
begin
    sqlUpdate := 'update geral_ordem_producao set data_estorno = :data_estorno ' + ' where nr_ordem = :nr_ordem ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlUpdate);
            Params.ParamByName('data_estorno').AsString := FormatDateTime('yyyy/mm/dd', data_estorno);
            Params.ParamByName('nr_ordem').AsString := nr_ordem;
            Execute();
        end;

    except
        on e: Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao atualizar o registro.' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmSisIndustria.grdItensCellClick(Column: TColumn);
begin
    CalculaItensOrdem();
    CalculaPrecoItensOrdem();
end;

procedure TfrmSisIndustria.grdMateriaPrimaDblClick(Sender: TObject);
begin
    btnAltera.OnClick(Sender);
end;

procedure TfrmSisIndustria.grdMateriaPrimaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    ShowScrollBar(grdMateriaPrima.Handle, SB_VERT, True);
    ShowScrollBar(grdMateriaPrima.Handle, SB_HORZ, True);
end;

procedure TfrmSisIndustria.grdOrdemProducaoCellClick(Column: TColumn);
begin
    btnAltera.Enabled := (FdQryOrdemProducaoSITUACAO.AsString = 'A');
    btnExclui.Enabled := (not (FdQryOrdemProducaoSITUACAO.AsString = 'E')) and (not (FdQryOrdemProducaoSITUACAO.AsString = 'F'));
end;

procedure TfrmSisIndustria.grdOrdemProducaoDblClick(Sender: TObject);
begin
    if FdQryOrdemProducaoSITUACAO.AsString = 'A' then
        btnAltera.OnClick(Self);
end;

procedure TfrmSisIndustria.grdOrdemProducaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if Column.Field = FdQryOrdemProducaoSITUACAO then
    begin
        if FdQryOrdemProducaoSITUACAO.AsString = 'A' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clRed;
            grdOrdemProducao.Canvas.Font.Color := clWindow;
            grdOrdemProducao.Canvas.FillRect(Rect);
            grdOrdemProducao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
        else if FdQryOrdemProducaoSITUACAO.AsString = 'F' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clGreen;
            grdOrdemProducao.Canvas.Font.Color := clWindow;
            grdOrdemProducao.Canvas.FillRect(Rect);
            grdOrdemProducao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end
        else if FdQryOrdemProducaoSITUACAO.AsString = 'E' then
        begin
            grdOrdemProducao.Canvas.Brush.Color := clBlue;
            grdOrdemProducao.Canvas.Font.Color := clWindow;
            grdOrdemProducao.Canvas.FillRect(Rect);
            grdOrdemProducao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
        end;
    end;

    ShowScrollBar(grdOrdemProducao.Handle, SB_VERT, True);
    ShowScrollBar(grdOrdemProducao.Handle, SB_HORZ, True);
end;

procedure TfrmSisIndustria.grdProdutoFinalCellClick(Column: TColumn);
begin
    CalculaPercTotalComposicao();

end;

procedure TfrmSisIndustria.grdProdutoFinalDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    ShowScrollBar(grdProdutoFinal.Handle, SB_VERT, True);
    ShowScrollBar(grdProdutoFinal.Handle, SB_HORZ, True);
end;

procedure TfrmSisIndustria.pgcGeralChange(Sender: TObject);
begin
    if pgcGeral.TabIndex = 1 then
    begin
        CarregaItensOrdem();
        grdItens.SetFocus;
    end;
end;

procedure TfrmSisIndustria.rdgSituacaoClick(Sender: TObject);
begin
    btnPesquisa.OnClick(Sender);
    grdOrdemProducao.SetFocus;
end;

procedure TfrmSisIndustria.SaveEstMes(const sProdCodigo, sTipo, sTipoProd: string; dQuantidade, dVlrTotal: Real);
var
    dQtdeEnt, dValorEnt, dQtdeSai, dValorSai: Real;
    sData: string;
begin
    with URetornaRecord.RetornaGeralEstMes do
    begin
        EMPRE_CODIGO := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO := StrToInt(sProdCodigo);
        sData := DateToStr(Date);
        sData := Copy(Trim(sData), 7, 4) + Copy(Trim(sData), 4, 2); // AAAAMM

        ESTMES_DATA := StrToInt(sData);
        ESTMES_ENT_QTD := '0.0000';
        ESTMES_SAI_QTD := '0.0000';
        ESTMES_ENT_VLR := '0.0000';
        ESTMES_SAI_VLR := '0.0000';
        ESTMES_CUSTO_FINAL := '0.0000';

        dQtdeEnt := 0;
        dQtdeSai := 0;
        dValorSai := 0;
        dValorEnt := 0;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_ESTATISTICA_MENSAL ' + ' WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) AND (ESTMES_DATA = :ESTMESDATA) '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMESDATA').AsInteger := ESTMES_DATA;
        dtmSisGestao.FdQryGeral.Active := True;
        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
        begin
            dQtdeEnt := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_ENT_QTD').AsFloat;
            dQtdeSai := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_SAI_QTD').AsFloat;
            dValorEnt := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_ENT_VLR').AsFloat;
            dValorSai := dtmSisGestao.FdQryGeral.FieldByName('ESTMES_SAI_VLR').AsFloat;

            //sTipo 1 = (+), sTipo 2 = (-) ----- sTipoProd 0 = ACABADO, sTipoProd 1 = MAT.PRIMA
            if (sTipo = '1') and (sTipoProd = '0') then  //(+) - PROD.ACABADO
            begin
                dQtdeEnt := dQtdeEnt + dQuantidade;
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');

                dValorEnt := dValorEnt + dVlrTotal;
                ESTMES_ENT_VLR := Elimina_Caracteres(FloatToStr(dValorEnt), ',', '.');
                ESTMES_SAI_VLR := Elimina_Caracteres(FloatToStr(dValorSai), ',', '.');

            end;

            if (sTipo = '2') and (sTipoProd = '0') then  //(-) - PROD ACABADO
            begin
                dQtdeEnt := dQtdeEnt - dQuantidade;
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');

                dValorEnt := dValorEnt - dVlrTotal;
                ESTMES_ENT_VLR := Elimina_Caracteres(FloatToStr(dValorEnt), ',', '.');
                ESTMES_SAI_VLR := Elimina_Caracteres(FloatToStr(dValorSai), ',', '.');
            end;

            if (sTipo = '1') and (sTipoProd = '1') then  //(+) - MAT. PRIMA
            begin
                dQtdeSai := dQtdeSai + dQuantidade;
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
            if (sTipo = '2') and (sTipoProd = '1') then  //(-) - MAT. PRIMA
            begin
                dQtdeSai := dQtdeSai - dQuantidade;
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
        end
        else
        begin
            if (sTipo = '1') and (sTipoProd = '0') then  //(+) - PROD.ACABADO
            begin
                dQtdeEnt := dQtdeEnt + dQuantidade;
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');

                dValorEnt := dValorEnt + dVlrTotal;
                ESTMES_ENT_VLR := Elimina_Caracteres(FloatToStr(dValorEnt), ',', '.');
                ESTMES_SAI_VLR := Elimina_Caracteres(FloatToStr(dValorSai), ',', '.');

            end;

            if (sTipo = '2') and (sTipoProd = '0') then  //(-) - PROD ACABADO
            begin
                dQtdeEnt := dQtdeEnt - dQuantidade;
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');

                dValorEnt := dValorEnt - dVlrTotal;
                ESTMES_ENT_VLR := Elimina_Caracteres(FloatToStr(dValorEnt), ',', '.');
                ESTMES_SAI_VLR := Elimina_Caracteres(FloatToStr(dValorSai), ',', '.');
            end;

            if (sTipo = '1') and (sTipoProd = '1') then  //(+) - MAT. PRIMA
            begin
                dQtdeSai := dQtdeSai + dQuantidade;
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;
            if (sTipo = '2') and (sTipoProd = '1') then  //(-) - MAT. PRIMA
            begin
                dQtdeSai := dQtdeSai - dQuantidade;
                ESTMES_SAI_QTD := Elimina_Caracteres(FloatToStr(dQtdeSai), ',', '.');
                ESTMES_ENT_QTD := Elimina_Caracteres(FloatToStr(dQtdeEnt), ',', '.');

                {dValorSai       := dValorSai + dVlrTotal;
                ESTMES_SAI_VLR  := Elimina_Caracteres(FloatToStr(dValorSai),',','.');
                ESTMES_ENT_VLR  := Elimina_Caracteres(FloatToStr(dValorEnt),',','.');}

            end;

        end;
    end;

    URetornaSQL.GravaEstMes();

end;

procedure TfrmSisIndustria.SaveEstMovimento(const sProdCodigo, sTipo: string; dQuantidade, dVlrTotal: Real);
var
    dQtdeTotal, dValorTotal, dPrecoMedio: Real;
begin
    dQtdeTotal := 0;
    dValorTotal := 0;
    dPrecoMedio := 0;

    with URetornaRecord.RetornaGeralEstMov do
    begin
        EMPRE_CODIGO := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO := StrToInt(sProdCodigo);
        ESTMVTO_DATA := DateToStr(Date);
        ESTMVTO_DOCUMENTO := FdQryOrdemProducaoNR_ORDEM.AsInteger;
        REPRE_CODIGO := '0';
        ESTMVTO_CUSTO := '0';

        if sTipo = '1' then  //ENTRADA
        begin
            ESTMVTO_SERIE := 'IND';
            NATU_CODIGO := 7;
        end
        else if sTipo = '2' then  //SAIDA
        begin
            ESTMVTO_SERIE := 'MAP';
            NATU_CODIGO := 8;
        end;

        CLI_CODIGO := 11676;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_MOVIMENTO WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) AND ' + '(ESTMVTO_DATA = :ESTMVTODATA) AND (ESTMVTO_DOCUMENTO = :ESTMVTODOCUMENTO) AND (ESTMVTO_SERIE = :ESTMVTOSERIE)'));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTODATA').AsDate := StrToDate(ESTMVTO_DATA);
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTODOCUMENTO').AsInteger := ESTMVTO_DOCUMENTO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('ESTMVTOSERIE').AsString := ESTMVTO_SERIE;
        dtmSisGestao.FdQryGeral.Active := True;

        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
        begin
            dQtdeTotal := dtmSisGestao.FdQryGeral.FieldByName('ESTMVTO_QUANTIDADE').AsFloat;
            dValorTotal := dtmSisGestao.FdQryGeral.FieldByName('ESTMVTO_VALOR').AsFloat;

            dQtdeTotal := dQtdeTotal + dQuantidade;
            ESTMVTO_QUANTIDADE := Elimina_Caracteres(FloatToStr(dQtdeTotal), ',', '.');

            dValorTotal := dValorTotal + dVlrTotal;
            ESTMVTO_VALOR := Elimina_Caracteres(FloatToStr(dValorTotal), ',', '.');

            if dQtdeTotal <> 0 then
            begin
                dPrecoMedio := dValorTotal / dQtdeTotal;
                ESTMVTO_CUSTO := Elimina_Caracteres(FloatToStr(dPrecoMedio), ',', '.');
            end;

        end
        else
        begin
            dQtdeTotal := dQtdeTotal + dQuantidade;
            ESTMVTO_QUANTIDADE := Elimina_Caracteres(FloatToStr(dQtdeTotal), ',', '.');

            dValorTotal := dValorTotal + dVlrTotal;
            ESTMVTO_VALOR := Elimina_Caracteres(FloatToStr(dValorTotal), ',', '.');

            if dQtdeTotal <> 0 then
            begin
                dPrecoMedio := dValorTotal / dQtdeTotal;
                ESTMVTO_CUSTO := Elimina_Caracteres(FloatToStr(dPrecoMedio), ',', '.');
            end;
        end;

    end;

    URetornaSQL.GravaEstMovimento();

end;

procedure TfrmSisIndustria.SaveGeralNota(const sNotaTipo, sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dVlrNota: Real);
begin
    try
        dtmSisGestao.FdQryGeralDados.Active := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select NATU_CODFISCALDENTRO, NATU_NOME from geral_natureza where NATU_CODIGO = ' + sNatureza);
        dtmSisGestao.FdQryGeralDados.Active := true;

        dtmSisGestao.FdQryGeral.Active := false;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add('select cli_nome, cli_tipopessoa, cli_cnpjcpf, cli_ie from geral_cliente where cli_codigo = ' + sCliente);
        dtmSisGestao.FdQryGeral.Active := true;

        with URetornaRecord.RetornaGeralNota do
        begin
            EMPRE_CODIGO := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
            NOTA_NUMERO := StrToInt(sNrDocumento);
            NOTA_SERIE := sSerie;
            NOTA_MODELO := '1B';
            CLI_CODIGO := StrToInt(sCliente);
            CLI_NOME := dtmSisGestao.FdQryGeral.FieldByName('cli_nome').AsString;
            CLI_CNPJCPF := dtmSisGestao.FdQryGeral.FieldByName('cli_cnpjcpf').AsString;
            CLI_IE := dtmSisGestao.FdQryGeral.FieldByName('cli_ie').AsString;
            CLI_TIPOPESSOA := dtmSisGestao.FdQryGeral.FieldByName('cli_tipopessoa').AsString;
            NOTA_DT_EMISSAO := DateToStr(dDataEmissao);
            NOTA_CFOP := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_CODFISCALDENTRO').AsString;
            NATU_CODIGO := sNatureza;
            NOTA_TIPO := sNotaTipo;
            NATU_NOME := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_NOME').AsString;
            NOTA_SITUACAO := '';
            SITUACAO_CODIGO := '1';
            SITUACAO_TIPO := '0';
            NOTA_VALOR_NF := Elimina_Caracteres(FloatToStr(dVlrNota), ',', '.');

        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active := false;
        dtmSisGestao.FdQryGeral.Active := false;
    end;

    URetornaSQL.GravaGeralNotaInd();

end;

procedure TfrmSisIndustria.SaveGeralNotaItem(const sNatureza, sSeq, sProdCodigo, sUN, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate; dQtde, dVlrItem: Real);
begin
    try
        dtmSisGestao.FdQryGeralDados.Active := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select NATU_CODFISCALDENTRO, NATU_NOME from geral_natureza where NATU_CODIGO = ' + sNatureza);
        dtmSisGestao.FdQryGeralDados.Active := true;
        with URetornaRecord.RetornaGeralNotaItem do
        begin
            EMPRE_CODIGO := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            NOTA_NUMERO := sNrDocumento;
            NOTA_SERIE := sSerie;
            CLI_CODIGO := sCliente;
            NOTA_DT_EMISSAO := DateToStr(dDataEmissao);
            NOTA_CFOP := dtmSisGestao.FdQryGeralDados.FieldByName('NATU_CODFISCALDENTRO').AsString;
            ITENS_SEQ := sSeq;
            PROD_CODIGO := sProdCodigo;
            ITENS_UNIDADE := sUN;
            ITENS_QUANTIDADE := Elimina_Caracteres(FloatToStr(dQtde), ',', '.');
            ITENS_PRECO_BRUTO := Elimina_Caracteres(FloatToStr(dVlrItem), ',', '.');

        end;

    finally
        dtmSisGestao.FdQryGeralDados.Active := false;
    end;

    URetornaSQL.GravaGeralNotaItemInd();

end;

procedure TfrmSisIndustria.SaveHistoricoProduto(const sProdCodigo, sTipo: string; const iNrLancamento: Integer; dQuantidade: Real);
var
    dEstoqueAtualProduto, dHistpQtdEstoqueAtual: Real;
begin
    dEstoqueAtualProduto := 0;

    with URetornaRecord.RetornaGeralHistorico do
    begin
        HISTP_QTD_ESTOQUE_ATUAL := '0';
        HISTP_QTD_ANTERIOR := '0';
        HISTP_DATA_ULTIMA_SAIDA := '';
        HISTP_DATA_ULTIMA_ENTRADA := '';
        HISTP_QTD_ULTIMA_SAIDA := '0';
        HISTP_QTD_ULTIMA_ENTRADA := '0';
        HISTP_NR_LANCAMENTO := iNrLancamento;
        PROD_CODIGO := StrToInt(sProdCodigo);
        EMPRE_CODIGO := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;

        dtmSisGestao.FdQryConsulta.Active := false;
        dtmSisGestao.FdQryConsulta.SQL.Clear;
        dtmSisGestao.FdQryConsulta.SQL.Add('Select empre_codigo, ' + '       prod_codigo, ' + '       histp_qtd_estoque_atual, ' + '       histp_qtd_anterior,      ' + '       histp_data_ultima_saida, ' + '       histp_preco_compra, ' + '       histp_nr_lancamento    ' + ' from  geral_historico_produto ' + ' where (empre_codigo =:empresa)and (prod_codigo =:produto) ');

        dtmSisGestao.FdQryConsulta.Params.ParamByName('empresa').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryConsulta.Params.ParamByName('produto').AsInteger := PROD_CODIGO;
        dtmSisGestao.FdQryConsulta.Active := True;

        if not dtmSisGestao.FdQryConsulta.FieldByName('prod_codigo').IsNull then
        begin
            if dtmsisgestao.FdQryConsulta.fieldbyname('histp_qtd_estoque_atual').asstring <> '' then
                HISTP_QTD_ANTERIOR := dtmsisgestao.FdQryConsulta.fieldbyname('histp_qtd_estoque_atual').AsString
            else
                HISTP_QTD_ANTERIOR := '0';

        end;
        dtmSisGestao.FdQryConsulta.Active := false;

        if sTipo = '1' then  //SOMA ESTOQUE
        begin
            HISTP_DATA_ULTIMA_ENTRADA := DateToStr(Date);
            HISTP_QTD_ULTIMA_ENTRADA := Elimina_Caracteres(FloatToStr(dQuantidade), ',', '.');
            dHistpQtdEstoqueAtual := StrToFloat(HISTP_QTD_ANTERIOR) + dQuantidade;
        end;

        if sTipo = '2' then  //DIMINUI ESTOQUE
        begin
            HISTP_DATA_ULTIMA_SAIDA := DateToStr(Date);
            HISTP_QTD_ULTIMA_SAIDA := Elimina_Caracteres(FloatToStr(dQuantidade), ',', '.');
            dHistpQtdEstoqueAtual := StrToFloat(HISTP_QTD_ANTERIOR) - dQuantidade;
        end;

        HISTP_QTD_ESTOQUE_ATUAL := FloatToStr(dHistpQtdEstoqueAtual);

    end;

    URetornaSQL.GravaHistoricoProduto();

end;

procedure TfrmSisIndustria.SaveKardex(const sProdCodigo, sTipo: string; dQuantidade: Real);
var
    rEstoque, rQuantidade: Real;
    sAuxValor: string;
begin
    with URetornaRecord.RetornaGeralKardex do
    begin
        EMPRE_CODIGO := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        PROD_CODIGO := StrToInt(sProdCodigo);
        CLI_CODIGO := 11676; //cliente Belem
        KARD_QUANTIDADE := FormatFloat('0.000', dQuantidade);
        KARD_DATA := DateToStr(Date);
        KARD_DOCUMENTO := FdQryOrdemProducaoNR_ORDEM.AsInteger;
        KARD_TIPO := sTipo;
        EMPRE_CODIGOF := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
        FUNC_CODIGO := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;

        // Pegar informações do estoque para próxima atualização
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add(LowerCase('SELECT * FROM GERAL_KARDEX ' + ' WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) ' + ' order by kard_lancamento desc '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Active := True;

        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
            KARD_ESTOQUE := dtmSisGestao.FdQryGeral.FieldByName('KARD_ESTOQUE').AsString
        else
            KARD_ESTOQUE := '0.0000';

        // gera número sequencial no item
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add( LowerCase('SELECT MAX(KARD_LANCAMENTO)+1 KARD_LANCAMENTO FROM GERAL_KARDEX ' + 'WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (PROD_CODIGO = :PRODCODIGO) '));
        dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsInteger := EMPRE_CODIGO;
        dtmSisGestao.FdQryGeral.Params.ParamByName('PRODCODIGO').AsInteger := PROD_CODIGO;
        dtmSisGestao.FdQryGeral.Active := True;

        if dtmSisGestao.FdQryGeral.FieldByName('KARD_LANCAMENTO').IsNull then
            KARD_LANCAMENTO := 1
        else
            KARD_LANCAMENTO := dtmSisGestao.FdQryGeral.FieldByName('KARD_LANCAMENTO').AsInteger;

        sAuxValor := Trim(KARD_QUANTIDADE); // estoque Atual, sem a quantidade
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor, ',', '.'), '.', ',');
        rQuantidade := StrToFloat(sAuxValor); // se GERALNATUREZA.NATU_ESTOQUE = '0' = Não Atualiza, mantém o estoque atual


        sAuxValor := Trim(KARD_ESTOQUE); // estoque Atual, sem a quantidade
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor, ',', '.'), '.', ',');
        rEstoque := StrToFloat(sAuxValor); // se GERALNATUREZA.NATU_ESTOQUE = '0' = Não Atualiza, mantém o estoque atual

        if KARD_TIPO = '1' then  //ENTRADA
            rEstoque := rEstoque + rQuantidade  // soma quantidade no estoque
        else
            rEstoque := rEstoque - rQuantidade;  // diminui quantidade no estoque

        sAuxValor := FloatToStr(rEstoque);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor, '.', ','), ',', '.');
        KARD_ESTOQUE := sAuxValor;

        sAuxValor := Trim(KARD_QUANTIDADE);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor, '.', ','), ',', '.');
        KARD_QUANTIDADE := sAuxValor;

        sAuxValor := Trim(KARD_ESTOQUE);
        sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor, '.', ','), ',', '.');
        KARD_ESTOQUE := sAuxValor;

    end;

    URetornaSQL.GravaKardex();

    //Dados Atualização Hist. Produto
    SaveHistoricoProduto(sProdCodigo, sTipo, URetornaRecord.RetornaGeralKardex.KARD_LANCAMENTO, dQuantidade);

end;

procedure TfrmSisIndustria.Pesquisar;
begin
    if rdgSituacao.ItemIndex = 0 then
        sSituacao := ' and situacao = ' + '''A'''
    else if rdgSituacao.ItemIndex = 1 then
        sSituacao := ' and situacao = ' + '''F'''
    else if rdgSituacao.ItemIndex = 2 then
        sSituacao := ' and situacao = ' + '''E'''
    else
        sSituacao := '';

    FdQryOrdemProducao.DisableControls;
    try
        FdQryOrdemProducao.Active := False;
        FdQryOrdemProducao.SQL.Clear;

        FdQryOrdemProducao.SQL.Add(sSQLSelect + sPesquisa + sSituacao + 'order by ' + sSQLOrder + sregistros);

        case cbxProcurar.ItemIndex of
            0:
                begin
                    sFiltro := 'NR.ORDEM';
                    if (Trim(edtProcurar.Text) <> '') then
                        FdQryOrdemProducao.Params.ParamByName('nr_ordem').AsInteger := StrToInt(Trim(edtProcurar.Text));
                end;
            1:
                begin
                    sFiltro := 'DATA EMISSÃO';
                    if (dtpDataEmissao.Date <> Null) then
                        FdQryOrdemProducao.Params.ParamByName('data_emissao_ini').AsString := FormatDateTime('yyyy/mm/dd', dtpDataEmissao.Date);
                    if (dtpDataEmissaoFim.Date <> Null) then
                        FdQryOrdemProducao.Params.ParamByName('data_emissao_fim').AsString := FormatDateTime('yyyy/mm/dd', dtpDataEmissaoFim.Date);
                end;
            2:
                begin
                    sFiltro := 'CÓD.PRODUTO';
                    if (Trim(edtProcurar.Text) <> '') then
                        FdQryOrdemProducao.Params.ParamByName('prod_codigo').AsInteger := StrToInt(Trim(edtProcurar.Text));
                end;
        end;

        FdQryOrdemProducao.Active := True;

        if FdQryOrdemProducao.RecordCount = 0 then
        begin
            FdQryOrdemProducao.Active := False;
            //Informacao('Não encontrou Registros para Consulta','Aviso');
            if edtProcurar.CanFocus then
                edtProcurar.SetFocus
            else if dtpDataEmissao.CanFocus then
                dtpDataEmissao.SetFocus;

            Exit;
        end;

    finally
        FdQryOrdemProducao.EnableControls;
    end;

    pgcGeral.TabIndex := 0;
    grdOrdemProducao.SetFocus;

end;

procedure TfrmSisIndustria.TransfereDados;
begin
    with URetornaRecord.RetornaOrdemProducao do
    begin
        nr_ordem := FdQryOrdemProducaoNR_ORDEM.AsString;
        PROD_CODIGO := FdQryOrdemProducaoPROD_CODIGO.AsString;
        DATA_EMISSAO := FdQryOrdemProducaoDATA_EMISSAO.AsDateTime;
        QTDE_SC := FdQryOrdemProducaoQTDE_SC.AsString;
        QTDE_PC := FdQryOrdemProducaoQTDE_PC.AsString;
        QTDE_KG := FdQryOrdemProducaoQTDE_KG.AsString;
        situacao := FdQryOrdemProducaoSITUACAO.AsString;
        VALOR_TOTAL := FdQryOrdemProducaoVALOR_TOTAL.AsString;
        NR_LOTE := FdQryOrdemProducaoNR_LOTE.AsString;
        DATA_VALIDADE := FdQryOrdemProducaoDATA_VALIDADE.AsDateTime;

    end;

end;

procedure TfrmSisIndustria.AtualizaSituacaoNota(const sNatureza, sNrDocumento, sSerie, sCliente: string; dDataEmissao: TDate);
var
    sqlUpdate: string;
begin
    dtmSisGestao.FdQryGeral.Active := false;
    dtmSisGestao.FdQryGeral.SQL.Clear;
    dtmSisGestao.FdQryGeral.SQL.Add( 'select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = ' + sNatureza);
    dtmSisGestao.FdQryGeral.Active := true;

    sqlUpdate := 'update geral_notas_capa set nota_situacao = ' + QuotedStr('C') + //2 = CANCELADA
        ' where NOTA_NUMERO = :NOTA_NUMERO ' + ' and NOTA_SERIE = :NOTA_SERIE ' + ' and CLI_CODIGO = :CLI_CODIGO ' + ' and NOTA_DT_EMISSAO = :NOTA_DT_EMISSAO ' + ' and NOTA_CFOP = :NOTA_CFOP ';

    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction(tdSisGestao);

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add( sqlUpdate);
            Params.ParamByName('NOTA_NUMERO').AsString := sNrDocumento;
            Params.ParamByName('NOTA_SERIE').AsString := sSerie;
            Params.ParamByName('CLI_CODIGO').AsString := sCliente;
            Params.ParamByName('NOTA_DT_EMISSAO').AsDate := dDataEmissao;
            Params.ParamByName('NOTA_CFOP').AsString := dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString;

            Execute();
        end;

    {except
        on e: Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao atualizar o registro. Tabela: geral_notas_capa' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit(tdSisGestao);}

    dtmSisGestao.FdQryGeral.Active := false;

end;

procedure TfrmSisIndustria.btnAlteraClick(Sender: TObject);
begin
    case pgcGeralConsulta.ActivePageIndex of
        0:
            begin
                if (FdQryMateriaPrima.Active) and (FdQryMateriaPrima.RecordCount > 0) then
                begin

                    bmPontoDeVoltaProd := FdQryProdutoAcabado.GetBookmark;
                    bmPontoDeVoltaMat := FdQryMateriaPrima.GetBookmark;
                    frmCadastroComposicaoProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
                    try
                        frmCadastroComposicaoProdutoFinal.sAcao := 'ALTERAR';
                        if FdQryMateriaPrimaCOMP_SEQ.AsString = '0' then
                        begin
                            frmCadastroComposicaoProdutoFinal.sLayoutCadastro := 'FORMULACAO';
                            frmCadastroComposicaoProdutoFinal.Caption := 'Cadastro Modo de Preparo - v.1.0'
                        end
                        else
                        begin
                            frmCadastroComposicaoProdutoFinal.sLayoutCadastro := 'COMPOSICAO';
                            frmCadastroComposicaoProdutoFinal.Caption := 'Cadastro Composicao Produto Final - v.1.0'
                        end;
                        //Carrega dados do CientDataSet para o Record
                        TransfereDadosComp();

                        frmCadastroComposicaoProdutoFinal.ShowModal;
                    finally
                        FreeAndNil(frmCadastroComposicaoProdutoFinal);
                    end;

                    cbxResultadosComp.ItemIndex := 0;

                    btnPesquisaCompClick(Sender);

                    try
                        FdQryProdutoAcabado.GotoBookmark(bmPontoDeVoltaProd);
                    except
                    end;

                end
                else
                begin
                    Informacao('Não ha dados para alterar....', 'Aviso...');
                    btnAltera.SetFocus;
                    Exit;
                end;

                CarregaMateriaPrima;

                try
                    FdQryMateriaPrima.GotoBookmark(bmPontoDeVoltaMat);
                except
                end;

            end;

        1:
            begin
                if (FdQryOrdemProducao.Active) and (FdQryOrdemProducao.RecordCount > 0) then
                begin

                    bmPontoDeVoltaProd := FdQryOrdemProducao.GetBookmark;

                    frmCadastroOrdemProducao := TfrmCadastroOrdemProducao.Create(Self);
                    try
                        frmCadastroOrdemProducao.sAcao := 'ALTERAR';

                        //Carrega dados do CientDataSet para o Record
                        TransfereDados();

                        frmCadastroOrdemProducao.ShowModal;
                    finally
                        FreeAndNil(frmCadastroOrdemProducao);
                    end;

                    cbxResultados.ItemIndex := 1;

                    btnPesquisaClick(Sender);

                    try
                        FdQryOrdemProducao.GotoBookmark(bmPontoDeVoltaProd);
                    except
                    end;

                end
                else
                begin
                    Informacao('Não ha dados para alterar....', 'Aviso...');
                    btnAltera.SetFocus;
                    Exit;
                end;
            end;
    end;
end;

procedure TfrmSisIndustria.btnExcluiClick(Sender: TObject);
begin
    case pgcGeralConsulta.ActivePageIndex of
        0:
            begin
                if (FdQryMateriaPrima.Active) and (FdQryMateriaPrima.RecordCount > 0) then
                begin
                    if Pergunta('Deseja excluir a matéria prima ?' + #13 + #10 + #13 + #10 + 'Seq. Item: ' + FdQryMateriaPrimaCOMP_SEQ.AsString + #13 + #10 + 'Descrição: ' + FdQryMateriaPrimaPROD_MAT_PRIMA.AsString + ' - ' + FdQryMateriaPrimaprod_descricao.AsString, 'Confirmação...') then
                    begin
                        URetornaSQL.ExcluiMateriaPrima(FdQryMateriaPrimaPROD_CODIGO.AsString, FdQryMateriaPrimaPROD_MAT_PRIMA.AsString, FdQryMateriaPrimaCOMP_SEQ.AsString);

                        CarregaMateriaPrima();
                        grdProdutoFinalCellClick(grdProdutoFinal.Columns[0]);
                    end;

                end
                else
                begin
                    Informacao('Não há dados para exclusão....', 'Aviso...');
                    if btnAltera.CanFocus then
                        btnAltera.SetFocus;
                    Exit;
                end;
            end;

        1:
            begin
                if FdQryOrdemProducaoSITUACAO.AsString = 'A' then
                begin
                    if not FdQryOrdemProducao.IsEmpty then
                    begin
                        if Pergunta('Deseja excluir a Ordem de Produção ?' + #13 + #10 + #13 + #10 + 'Nr. Ordem: ' + FdQryOrdemProducaoNR_ORDEM.AsString + #13 + #10 + 'Produto: ' + FdQryOrdemProducaoPROD_CODIGO.AsString + ' - ' + FdQryOrdemProducaoprod_descricao.AsString, 'Confirmação...') then
                        begin
                            uRetornaSQL.ExcluiOrdemProducao(FdQryOrdemProducaoNR_ORDEM.AsString);
                        end;

                    end
                    else
                    begin
                        Informacao('Não há dados para exclusão....', 'Aviso...');
                        if btnAltera.CanFocus then
                            btnAltera.SetFocus;
                        Exit;
                    end;

                    cbxResultados.ItemIndex := 1;
                    btnPesquisa.OnClick(Sender);

                end;
            end;
    end;
end;

procedure TfrmSisIndustria.btnExcluiProdClick(Sender: TObject);
begin
    if not FdQryProdutoAcabado.IsEmpty then
    begin
        if Pergunta('Deseja excluir o produto acabado ?' + #13 + #10 + #13 + #10 + FdQryProdutoAcabadoprod_codigo.AsString + ' - ' + FdQryProdutoAcabadoprod_descricao.AsString, 'Confirmação...') then
        begin
            URetornaSQL.ExcluiProdutoAcabado(FdQryProdutoAcabadoprod_codigo.AsString);

            CarregaMateriaPrima();
        end;

    end
    else
    begin
        Informacao('Não há dados para exclusão....', 'Aviso...');
        if btnAltera.CanFocus then
            btnAltera.SetFocus;
        Exit;
    end;

    cbxResultadosComp.ItemIndex := 0;
    btnPesquisaComp.OnClick(Sender);
end;

procedure TfrmSisIndustria.btnLimparClick(Sender: TObject);
begin
    edtProcurar.Clear;
    btnPesquisa.OnClick(Self);
    edtProcurar.SetFocus;
end;

procedure TfrmSisIndustria.btnLimparCompClick(Sender: TObject);
begin
    edtProcurarComp.Clear;
    btnPesquisaComp.OnClick(Self);
    edtProcurarComp.SetFocus;
end;

procedure TfrmSisIndustria.btnModoPreparoClick(Sender: TObject);
begin
    URetornaRecord.LimpaRecordComposicaoProdFinal();
    URetornaRecord.LimpaRecordFormulacaoProdFinal();
    CadastraCompProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
    try
        CadastraCompProdutoFinal.sAcao := 'INSERIR';
        CadastraCompProdutoFinal.sLayoutCadastro := 'FORMULACAO';
        //if not cdsProdutoAcabado.IsEmpty then
        //    CadastraCompProdutoFinal.SCodProduto     := cdsProdutoAcabadoprod_codigo.AsString;
        CadastraCompProdutoFinal.Caption := 'Cadastro Modo de Preparo - v.1.0';
        CadastraCompProdutoFinal.ShowModal;
    finally
        FreeAndNil(CadastraCompProdutoFinal);
    end;

    cbxResultadosComp.ItemIndex := 0;
    btnPesquisaCompClick(Sender);
end;

procedure TfrmSisIndustria.btnNovoClick(Sender: TObject);
begin
    case pgcGeralConsulta.ActivePageIndex of
        0:
            begin
                CadastraCompProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
                try
                    CadastraCompProdutoFinal.sAcao := 'INSERIR';
                    CadastraCompProdutoFinal.sLayoutCadastro := 'COMPOSICAO';
                    CadastraCompProdutoFinal.Caption := 'Cadastro Composicao Produto Final - v.1.0';
                    CadastraCompProdutoFinal.ShowModal;
                finally
                    FreeAndNil(CadastraCompProdutoFinal);
                end;

                cbxResultadosComp.ItemIndex := 0;
                btnPesquisaCompClick(Sender);
            end;

        1:
            begin
                frmCadastroOrdemProducao := TfrmCadastroOrdemProducao.Create(Self);
                try
                    frmCadastroOrdemProducao.sAcao := 'INSERIR';
                    frmCadastroOrdemProducao.ShowModal;

                finally
                    if frmCadastroOrdemProducao.LOCATE_CODIGO <> 0 then
                    begin
                        rdgSituacao.ItemIndex := 0;
                        cbxResultados.ItemIndex := 1;
                        btnPesquisaClick(Sender);
                        FdQryOrdemProducao.Locate('NR_ORDEM', frmCadastroOrdemProducao.LOCATE_CODIGO, []);
                    end;
                    FreeAndNil(frmCadastroOrdemProducao);
                end;
            end;
    end;

end;

procedure TfrmSisIndustria.btnPesquisaClick(Sender: TObject);
var
    sProcurar: string;
    bretorno: boolean;
begin
    sregistros := '';
    case cbxResultados.ItemIndex of
        0:
            sregistros := ' limit 10';
        1:
            sregistros := ' limit 50';
        2:
            sregistros := ' limit 100';
    end;

    case cbxProcurar.ItemIndex of
        0:
            begin
                bretorno := VerificaCampoConsulta(edtProcurar.Text);
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ' '
                else
                    sPesquisa := '  and (op.nr_ordem = :nr_ordem)';

                sSQLOrder := ' op.nr_ordem '; // Por codigo...
            end;
        1:
            begin
                if (dtpDataEmissao.Date = Null) or (dtpDataEmissaoFim.Date = Null) then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (op.data_emissao >= :data_emissao_ini) and (op.data_emissao <= :data_emissao_fim)';
                sSQLOrder := ' op.data_emissao '; // Por descricão...
            end;

        2:
            begin
                bretorno := VerificaCampoConsulta(edtProcurar.Text);
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (op.prod_codigo = :prod_codigo) ';
                sSQLOrder := ' op.prod_codigo ';
            end;
    end;

    Pesquisar;
end;

procedure TfrmSisIndustria.btnPesquisaCompClick(Sender: TObject);
var
    sProcurar: string;
    bretorno: boolean;
begin
    sregistros := '';
    case cbxResultadosComp.ItemIndex of
        0:
            sregistros := ' limit 10';
        1:
            sregistros := ' limit 50';
        2:
            sregistros := ' limit 100';
    end;

    case cbxProcurarComp.ItemIndex of
        0:
            begin
                bretorno := VerificaCampoConsulta(edtProcurarComp.Text);
                if Trim(edtProcurarComp.Text) = '' then
                    sPesquisa := ' '
                else
                    sPesquisa := '  and (p.prod_codigo = :codigo)';

                sSQLOrder := ' p.prod_codigo '; // Por codigo...
            end;
        1:
            begin //DESCRICAO
                if Trim(edtProcurarComp.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and(p.prod_descricao like :descricao) ';
                sSQLOrder := ' p.prod_descricao '; // Por descricão...
            end;

        2:
            begin //REFERENCIA
                if Trim(edtProcurarComp.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (p.prod_ref_forn like :referencia) ';
                sSQLOrder := ' p.prod_ref_forn '; // Por descricão...
            end;
    end;
    PesquisarComp;
end;

procedure TfrmSisIndustria.btnRelatorioClick(Sender: TObject);
begin
    case pgcGeralConsulta.ActivePageIndex of
        0:
            begin
            {sem relatório para esta tela}
            end;

        1:
            begin
                if (FdQryOrdemProducao.Active) and (FdQryOrdemProducao.RecordCount > 0) then
                begin
                    {Monta Relatorio O.P.}
                    CarregaCamposRelatorio(FdQryOrdemProducaoPROD_CODIGO.AsString);
                    CarregaModoPreparoRelatorio(FdQryOrdemProducaoPROD_CODIGO.AsString);
                    ppProd_cod.Text := FormatFloat('000000', FdQryOrdemProducaoPROD_CODIGO.AsInteger);
                    pplblTotalOrdem.Text := formatfloat('0.00', FdQryOrdemProducaoVALOR_TOTAL.AsFloat);
                    ppDescricao.Text := FdQryOrdemProducaoprod_descricao.AsString;
                    ppDtValidade.Text := FdQryOrdemProducaoDATA_VALIDADE.AsString;
                    ppLote.Text := FdQryOrdemProducaoNR_LOTE.AsString;
                    ppFator.Text := formatfloat('0.000', FdQryOrdemProducaoQTDE_KG.AsFloat);
                    ppQtde.Text := formatfloat('0.00', FdQryOrdemProducaoQTDE_SC.AsFloat);
                    ppQtdePC.Text := formatfloat('0.00', FdQryOrdemProducaoQTDE_PC.AsFloat);
                    ppDtEmissao.Text := FdQryOrdemProducaoDATA_EMISSAO.AsString;
                    ppNrOrdem.Text := FdQryOrdemProducaoNR_ORDEM.AsString;
                    lblFuncionario.Text := URetornaRecord.RetornaFuncionario.FUNC_CODIGO + ' - ' + URetornaRecord.RetornaFuncionario.FUNC_NOME;
                    if URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO <> '' then
                        ppLogoEmp.Picture.LoadFromFile(URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO);
                    pprRelatorioOrdemProducao.Print;
                end;
            end;
    end;

end;

{procedure TfrmSisIndustria.Atualiza_Kardex_Hist_Est();
var
    dQtdGeral, dVlrTotal, dPreco, dPrecoMedio : Real;
begin
    dQtdGeral   := 0;
    dVlrTotal   := 0;
    dPreco      := 0;
    dPrecoMedio := 0;

    if FdQryOrdemProducaoQTDE_SC.AsFloat <> 0 then
    begin
        dPrecoMedio := FdQryOrdemProducaoVALOR_TOTAL.AsFloat / FdQryOrdemProducaoQTDE_SC.AsFloat;

        SaveKardex(FdQryOrdemProducaoPROD_CODIGO.AsString, '1', FdQryOrdemProducaoQTDE_SC.AsFloat);
        SaveEstMovimento(FdQryOrdemProducaoPROD_CODIGO.AsString, '1', FdQryOrdemProducaoQTDE_SC.AsFloat, FdQryOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveEstMes(FdQryOrdemProducaoPROD_CODIGO.AsString, '1', '0', FdQryOrdemProducaoQTDE_SC.AsFloat, FdQryOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveGeralNota('1', '7', FdQryOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', Date, FdQryOrdemProducaoVALOR_TOTAL.AsFloat);
        SaveGeralNotaItem('7', '1', FdQryOrdemProducaoPROD_CODIGO.AsString, '', FdQryOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', Date, FdQryOrdemProducaoQTDE_SC.AsFloat, dPrecoMedio);

    end;


    SaveGeralNota('2', '8', FdQryOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', Date, FdQryOrdemProducaoVALOR_TOTAL.AsFloat);

    cdsAtualizacao.Active      := False;
    cdsAtualizacao.SQL.Clear;
    cdsAtualizacao.CommandText := 'select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, '+
                                              ' pc.comp_conversao, p.prod_descricao '+
                                              ' from geral_produtos_composicao pc, geral_produtos p ' +
                                              ' where pc.prod_codigo = '+ FdQryOrdemProducaoPROD_CODIGO.AsString +
                                              ' and pc.prod_mat_prima = p.prod_codigo '+
                                              ' and pc.comp_seq <> 0 '+
                                              ' order by pc.comp_seq ';
    cdsAtualizacao.Active      := True;
    cdsAtualizacao.First;
    while not cdsAtualizacao.Eof do
    begin
        if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'N' then
        begin
            dQtdGeral := FdQryOrdemProducaoQTDE_KG.AsFloat;
            dQtdGeral := ( (dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat ) / 100 );

        end
        else if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'S' then
        begin
            dQtdGeral := FdQryOrdemProducaoQTDE_SC.AsFloat;
            dQtdGeral := ( dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat );
        end;


        cdsAuxPrecoItens.Active      := False;
        cdsAuxPrecoItens.SQL.Clear;
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
        SaveGeralNotaItem('8', cdsAtualizacao.FieldByName('comp_seq').AsString, cdsAtualizacao.FieldByName('prod_mat_prima').AsString, '', FdQryOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', Date, dQtdGeral, dPreco);

        cdsAtualizacao.Next;
    end;


end;}

procedure TfrmSisIndustria.Estorna_Kardex_Hist_Est();
var
    dQtdGeral, dVlrTotal, dPreco: Real;
    sData: string;
begin
    dVlrTotal := 0;
    //Produto Acabado
    if FdQryOrdemProducaoQTDE_SC.AsFloat <> 0 then
    begin
        SaveKardex(FdQryOrdemProducaoPROD_CODIGO.AsString, '2', FdQryOrdemProducaoQTDE_SC.AsFloat);

        {Busca dados Nota}
        dtmSisGestao.FdQryGeral.Active := false;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add( 'select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = 7');
        dtmSisGestao.FdQryGeral.Active := true;

        dtmSisGestao.FdQryGeralDados.Active := false;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add( 'select NOTA_VALOR_NF from geral_notas_capa where NOTA_NUMERO = ' +FdQryOrdemProducaoNR_ORDEM.AsString +
                                                  ' and NOTA_SERIE = ' + QuotedStr('IND') +
                                                  ' and CLI_CODIGO = 11676' + //Belem
                                                  ' and NOTA_DT_EMISSAO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime)) +
                                                  ' and NOTA_CFOP = ' + QuotedStr(dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString));
        dtmSisGestao.FdQryGeralDados.Active := true;
        SaveEstMes(FdQryOrdemProducaoPROD_CODIGO.AsString, '2', '0', FdQryOrdemProducaoQTDE_SC.AsFloat, dtmSisGestao.FdQryGeralDados.FieldByName('NOTA_VALOR_NF').AsFloat);

        ExcluiEstMovimento(FdQryOrdemProducaoPROD_CODIGO.AsString, FdQryOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime);
        AtualizaSituacaoNota('7', FdQryOrdemProducaoNR_ORDEM.AsString, 'IND', '11676', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime);
    end;
    //Matéria Prima
    AtualizaSituacaoNota('8', FdQryOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime);

    {cdsAtualizacao.Active      := False;
    cdsAtualizacao.SQL.Clear;
    cdsAtualizacao.CommandText := 'select pc.comp_seq, pc.prod_mat_prima, pc.comp_quantidade, '+
                                              ' pc.comp_conversao, p.prod_descricao '+
                                              ' from geral_produtos_composicao pc, geral_produtos p ' +
                                              ' where pc.prod_codigo = '+ FdQryOrdemProducaoPROD_CODIGO.AsString +
                                              ' and pc.prod_mat_prima = p.prod_codigo '+
                                              ' and pc.comp_seq <> 0 '+
                                              ' order by pc.comp_seq ';
    cdsAtualizacao.Active      := True;
    cdsAtualizacao.First;
    while not cdsAtualizacao.Eof do
    begin
        if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'N' then
        begin
            dQtdGeral := FdQryOrdemProducaoQTDE_KG.AsFloat;
            dQtdGeral := ( (dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat ) / 100 );

        end
        else if cdsAtualizacao.FieldByName('comp_conversao').AsString = 'S' then
        begin
            dQtdGeral := FdQryOrdemProducaoQTDE_SC.AsFloat;
            dQtdGeral := ( dQtdGeral * cdsAtualizacao.FieldByName('comp_quantidade').AsFloat );
        end;

        //busca preco dos itens
        cdsAuxPrecoItens.Active      := False;
        cdsAuxPrecoItens.SQL.Clear;
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
    dtmSisGestao.FdQryGeral.SQL.Add( 'select NATU_CODFISCALDENTRO from geral_natureza where NATU_CODIGO = 8');
    dtmSisGestao.FdQryGeral.Active := true;

    FdQryAtualizacao.Active := false;
    FdQryAtualizacao.SQL.Clear;
    FdQryAtualizacao.SQL.Add('select PROD_CODIGO, ITENS_QUANTIDADE, ITENS_PRECO_BRUTO from geral_notas_itens where NOTA_NUMERO = ' + FdQryOrdemProducaoNR_ORDEM.AsString + ' and NOTA_SERIE = ' + QuotedStr('MAP') + ' and CLI_CODIGO = 11676' + //Belem
        ' and NOTA_DT_EMISSAO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime)) + ' and NOTA_CFOP = ' + QuotedStr(dtmSisGestao.FdQryGeral.FieldByName('NATU_CODFISCALDENTRO').AsString) + ' order by ITENS_SEQ');
    FdQryAtualizacao.Active := true;
    FdQryAtualizacao.First;
    while not FdQryAtualizacao.Eof do
    begin
        dVlrTotal := (FdQryAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat * FdQryAtualizacao.FieldByName('ITENS_PRECO_BRUTO').AsFloat);
        //Alimenta valores records
        SaveKardex(FdQryAtualizacao.FieldByName('PROD_CODIGO').AsString, '1', FdQryAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat);
        SaveEstMes(FdQryAtualizacao.FieldByName('PROD_CODIGO').AsString, '2', '1', FdQryAtualizacao.FieldByName('ITENS_QUANTIDADE').AsFloat, dVlrTotal);

        ExcluiEstMovimento(FdQryAtualizacao.FieldByName('PROD_CODIGO').AsString, FdQryOrdemProducaoNR_ORDEM.AsString, 'MAP', '11676', FdQryOrdemProducaoDATA_ATUALIZACAO.AsDateTime);

        FdQryAtualizacao.Next;
    end;
end;

procedure TfrmSisIndustria.ExcluiEstMovimento(const sProdCodigo, sNrDocumento, sSerie, sCliente: string; dDataMvto: TDate);
var
    sqlDelete: string;
begin
    sqlDelete := 'delete from geral_movimento where PROD_CODIGO = :PROD_CODIGO ' + ' and ESTMVTO_DOCUMENTO = :NR_DOCUMENTO ' + ' and ESTMVTO_DATA = :DATA_MVTO ' + ' and ESTMVTO_SERIE = :SERIE ' + ' and CLI_CODIGO = :CLIENTE ';

    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction(tdSisGestao);

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add( sqlDelete);
            Params.ParamByName('PROD_CODIGO').AsString := sProdCodigo;
            Params.ParamByName('NR_DOCUMENTO').AsString := sNrDocumento;
            Params.ParamByName('SERIE').AsString := sSerie;
            Params.ParamByName('DATA_MVTO').AsDate := dDataMvto;
            Params.ParamByName('CLIENTE').AsString := sCliente;

            Execute();
        end;

    {except
        on e: Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao deletar o registro. Tabela: geral_movimento' + #10 + #13 + 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit(tdSisGestao);}

end;

procedure TfrmSisIndustria.Cadastra_Campos_Comp(Sender: TObject);
var
    iIndice: Integer;
    sSQL, sSQLAcesso, sDescricao: string;
begin
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    sSQL := LowerCase('INSERT INTO GERAL_CAMPO ' + '(CAMPO_CODIGO,MENU_CODIGO,CAMPO_INTERFACE,CAMPO_DESCRICAO,CAMPO_OBS) ' + 'VALUES (:CAMPOCODIGO,:MENUCODIGO,:CAMPOINTERFACE,:CAMPODESCRICAO,:CAMPOOBS) ' + 'ON DUPLICATE KEY UPDATE CAMPO_CODIGO    = :CAMPOCODIGO, ' + 'MENU_CODIGO     = :MENUCODIGO, ' + 'CAMPO_INTERFACE = :CAMPOINTERFACE, ' + 'CAMPO_DESCRICAO = :CAMPODESCRICAO, ' + 'CAMPO_OBS       = :CAMPOOBS ');
    sSQLAcesso := LowerCase('INSERT INTO GERAL_CAMPO_ACESSO ' + '(FUNC_CODIGO,EMPRE_CODIGO,MENU_CODIGO,CAMPO_CODIGO) ' + 'VALUES (:FUNCCODIGO,:EMPRECODIGO,:MENUCODIGO,:CAMPOCODIGO) ' + 'ON DUPLICATE KEY UPDATE FUNC_CODIGO     = :FUNCCODIGO, ' + 'EMPRE_CODIGO    = :EMPRECODIGO, ' + 'MENU_CODIGO     = :MENUCODIGO, ' + 'CAMPO_CODIGO    = :CAMPOCODIGO ');

     //campos específicos do painel de composição produto final
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if (Components[iIndice].Tag = 2) then
        begin
            sDescricao := Components[iIndice].Name + ' não encontrou TIPO.uConsultaComposicaoProdutoFinal';
            if (Components[iIndice] is TEdit) then
                sDescricao := TEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TMaskEdit) then
                sDescricao := TMaskEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TCheckBox) then
                sDescricao := TCheckBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TMemo) then
                sDescricao := TMemo(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint;

            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQL));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTACOMPOSICAOPRODUTOFINAL', 1, 70);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPODESCRICAO').AsString := UpperCase(Copy(sDescricao, 1, 70));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOBS').AsString := '';
            dtmSisGestao.FdQryConsulta.Execute;
               // Cria Campos x Acessos
            dtmSisGestao.FdQryConsulta.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQLAcesso));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
            dtmSisGestao.FdQryConsulta.Execute;
        end;
    end;

     //campos específicos do painel de botões
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if (Components[iIndice].Tag = 1) then
        begin
            sDescricao := Components[iIndice].Name + ' não encontrou TIPO.uConsultaComposicaoProdutoFinal';
            if (Components[iIndice] is TEdit) then
                sDescricao := TEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TMaskEdit) then
                sDescricao := TMaskEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TCheckBox) then
                sDescricao := TCheckBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TMemo) then
                sDescricao := TMemo(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint;

            dtmSisGestao.FdQryConsulta.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQL));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTACOMPOSICAOPRODUTOFINAL', 1, 70);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPODESCRICAO').AsString := UpperCase(Copy(sDescricao, 1, 70));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOBS').AsString := '';
            dtmSisGestao.FdQryConsulta.Execute;
               // Cria Campos x Acessos
            dtmSisGestao.FdQryConsulta.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQLAcesso));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
            dtmSisGestao.FdQryConsulta.Execute;
        end;
    end;
    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmSisIndustria.Cadastra_Campos(Sender: TObject);
var
    iIndice: Integer;
    sSQL, sSQLAcesso, sDescricao: string;
begin
    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    sSQL := LowerCase('INSERT INTO GERAL_CAMPO ' + '(CAMPO_CODIGO,MENU_CODIGO,CAMPO_INTERFACE,CAMPO_DESCRICAO,CAMPO_OBS) ' + 'VALUES (:CAMPOCODIGO,:MENUCODIGO,:CAMPOINTERFACE,:CAMPODESCRICAO,:CAMPOOBS) ' + 'ON DUPLICATE KEY UPDATE CAMPO_CODIGO    = :CAMPOCODIGO, ' + 'MENU_CODIGO     = :MENUCODIGO, ' + 'CAMPO_INTERFACE = :CAMPOINTERFACE, ' + 'CAMPO_DESCRICAO = :CAMPODESCRICAO, ' + 'CAMPO_OBS       = :CAMPOOBS ');
    sSQLAcesso := LowerCase('INSERT INTO GERAL_CAMPO_ACESSO ' + '(FUNC_CODIGO,EMPRE_CODIGO,MENU_CODIGO,CAMPO_CODIGO) ' + 'VALUES (:FUNCCODIGO,:EMPRECODIGO,:MENUCODIGO,:CAMPOCODIGO) ' + 'ON DUPLICATE KEY UPDATE FUNC_CODIGO     = :FUNCCODIGO, ' + 'EMPRE_CODIGO    = :EMPRECODIGO, ' + 'MENU_CODIGO     = :MENUCODIGO, ' + 'CAMPO_CODIGO    = :CAMPOCODIGO ');

     //campos específicos do painel de ordem de prdoução
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if (Components[iIndice].Tag = 3) then
        begin
            sDescricao := Components[iIndice].Name + ' não encontrou TIPO.uConsultaOrdemProducao';
            if (Components[iIndice] is TEdit) then
                sDescricao := TEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TMaskEdit) then
                sDescricao := TMaskEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TCheckBox) then
                sDescricao := TCheckBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TMemo) then
                sDescricao := TMemo(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint;

            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQL));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTAORDEMPRODUCAO', 1, 70);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPODESCRICAO').AsString := UpperCase(Copy(sDescricao, 1, 70));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOBS').AsString := '';
            dtmSisGestao.FdQryConsulta.Execute;
               // Cria Campos x Acessos
            dtmSisGestao.FdQryConsulta.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQLAcesso));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
            dtmSisGestao.FdQryConsulta.Execute;
        end;
    end;

     //campos específicos do painel de botões
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if (Components[iIndice].Tag = 1) then
        begin
            sDescricao := Components[iIndice].Name + ' não encontrou TIPO.uConsultaOrdemProducao';
            if (Components[iIndice] is TEdit) then
                sDescricao := TEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TMaskEdit) then
                sDescricao := TMaskEdit(Components[iIndice]).Hint
            else if (Components[iIndice] is TCheckBox) then
                sDescricao := TCheckBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint
            else if (Components[iIndice] is TMemo) then
                sDescricao := TMemo(Components[iIndice]).Hint
            else if (Components[iIndice] is TComboBox) then
                sDescricao := TComboBox(Components[iIndice]).Hint;

            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQL));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTAORDEMPRODUCAO', 1, 70);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPODESCRICAO').AsString := UpperCase(Copy(sDescricao, 1, 70));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOBS').AsString := '';
            dtmSisGestao.FdQryConsulta.Execute;
               // Cria Campos x Acessos
            dtmSisGestao.FdQryConsulta.Active := False;
            dtmSisGestao.FdQryConsulta.SQL.Clear;
            dtmSisGestao.FdQryConsulta.SQL.Add( LowerCase(sSQLAcesso));
            dtmSisGestao.FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL, 1, 21);
            dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString := copy(UpperCase(Components[iIndice].Name), 1, 21);
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
            dtmSisGestao.FdQryConsulta.Execute;
        end;
    end;
    dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmSisIndustria.ValidaPermissoesCampos();
var
    iIndice: Integer;
begin
    dtmSisGestao.FdQryConsulta.Active := False;
    dtmSisGestao.FdQryConsulta.SQL.Clear;
    dtmSisGestao.FdQryConsulta.SQL.Add( 'select campo_codigo, campo_opcao from geral_campo_acesso where empre_codigo = :empresa ' + ' and func_codigo = :cod_funcionario ' + ' and menu_codigo = :cod_menu ');
    dtmSisGestao.FdQryConsulta.Params.ParamByName('empresa').AsInteger := URetornaRecord.RetornaFuncionario.EMPRE_CODIGO;
    dtmSisGestao.FdQryConsulta.Params.ParamByName('cod_funcionario').AsString := URetornaRecord.RetornaFuncionario.FUNC_CODIGO;
    dtmSisGestao.FdQryConsulta.Params.ParamByName('cod_menu').AsString := URetornaRecord.RetornaFuncionario.MENU_ATUAL;
    dtmSisGestao.FdQryConsulta.Active := True;
    dtmSisGestao.FdQryConsulta.First;
    while not dtmSisGestao.FdQryConsulta.Eof do
    begin
        if dtmSisGestao.FdQryConsulta.FieldByName('campo_opcao').AsString = 'D' then
        begin
            for iIndice := 0 to ComponentCount - 1 do
            begin
                if (Components[iIndice].Tag = 1) or (Components[iIndice].Tag = 2) or (Components[iIndice].Tag = 3) then
                begin
                    if UpperCase(Components[iIndice].Name) = dtmSisGestao.FdQryConsulta.FieldByName('campo_codigo').AsString then
                    begin
                        if (Components[iIndice] is TBitBtn) then
                            TBitBtn(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TppLabel) then
                            TppLabel(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TppDBText) then
                            TppDBText(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TDBGrid) then
                            TDBGrid(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TEdit) then
                            TEdit(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TMaskEdit) then
                            TMaskEdit(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TCheckBox) then
                            TCheckBox(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TMemo) then
                            TMemo(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TRadioGroup) then
                            TRadioGroup(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TLabel) then
                            TLabel(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := False
                        else if (Components[iIndice] is TMenuItem) then
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
                if (Components[iIndice].Tag = 1) then
                begin
                    if UpperCase(Components[iIndice].Name) = dtmSisGestao.FdQryConsulta.FieldByName('campo_codigo').AsString then
                    begin
                        if (Components[iIndice] is TBitBtn) then
                            TBitBtn(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TppLabel) then
                            TppLabel(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TppDBText) then
                            TppDBText(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TDBGrid) then
                            TDBGrid(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TEdit) then
                            TEdit(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TMaskEdit) then
                            TMaskEdit(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TCheckBox) then
                            TCheckBox(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TMemo) then
                            TMemo(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TComboBox) then
                            TComboBox(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TRadioGroup) then
                            TRadioGroup(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TLabel) then
                            TLabel(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TPanel) then
                            TPanel(Components[iIndice]).Visible := True
                        else if (Components[iIndice] is TMenuItem) then
                            TMenuItem(Components[iIndice]).Visible := True;

                        Break;

                    end;
                end;
            end;
        end;

        dtmSisGestao.FdQryConsulta.Next;
    end;
end;

procedure TfrmSisIndustria.CarregaMateriaPrima;
var
    sMateriaPrima: string;
begin

    FdQryMateriaPrima.DisableControls;
    try
        sMateriaPrima := ' select pc.*, p.prod_descricao from geral_produtos p, geral_produtos_composicao pc ' + '  where (pc.prod_codigo  = :cod_produto) ' + ' and p.prod_codigo = pc.prod_mat_prima ' + '  order by pc.prod_codigo, pc.comp_seq ';
        FdQryMateriaPrima.Active := False;
        FdQryMateriaPrima.SQL.Clear;
        FdQryMateriaPrima.SQL.Add(sMateriaPrima);
        FdQryMateriaPrima.Params.ParamByName('cod_produto').AsString := Trim(FdQryProdutoAcabadoprod_codigo.AsString);

        FdQryMateriaPrima.Active := True;

        if FdQryMateriaPrima.RecordCount = 0 then
            FdQryMateriaPrima.Active := False;

    finally
        FdQryMateriaPrima.EnableControls;
    end;

end;

procedure TfrmSisIndustria.TransfereDadosComp;
begin
    with URetornaRecord.RetornaComposicaoProdFinal do
    begin
        PROD_CODIGO := FdQryMateriaPrimaPROD_CODIGO.AsString;
        PROD_MAT_PRIMA := FdQryMateriaPrimaPROD_MAT_PRIMA.AsString;
        COMP_SEQ := FdQryMateriaPrimaCOMP_SEQ.AsString;
        COMP_QUANTIDADE := FormatFloat('0.000',FdQryMateriaPrimaCOMP_QUANTIDADE.AsFloat);
        COMP_CONVERSAO := FdQryMateriaPrimaCOMP_CONVERSAO.AsString;
        ATIVO := FdQryMateriaPrimaATIVO.AsString;
        COMP_FORMULACAO := FdQryMateriaPrimacomp_formulacao.AsString;

    end;

end;

procedure TfrmSisIndustria.PesquisarComp;
begin
    FdQryProdutoAcabado.DisableControls;
    try
        FdQryProdutoAcabado.Active := False;
        FdQryProdutoAcabado.SQL.Clear;

        FdQryProdutoAcabado.SQL.Add( sSQLSelectComp + sPesquisa + 'order by ' + sSQLOrder + sregistros);

        case cbxProcurarComp.ItemIndex of
            0:
                begin // Por codigo...
                    sFiltro := 'CODIGO';
                    if not (Trim(edtProcurarComp.Text) = '') then
                        FdQryProdutoAcabado.Params.ParamByName('codigo').AsInteger := StrToInt(Trim(edtProcurarComp.Text));
                end;
            1:
                begin // Por descrição
                    sFiltro := 'DESCRICAO';
                    if (Trim(edtProcurarComp.Text) <> '') then
                        FdQryProdutoAcabado.Params.ParamByName('descricao').AsString := '%' + Trim(edtProcurarComp.Text) + '%';
                end;
            2:
                begin // Por referencia
                    sFiltro := 'REFERENCIA';
                    if (Trim(edtProcurarComp.Text) <> '') then
                        FdQryProdutoAcabado.Params.ParamByName('referencia').AsString := '%' + Trim(edtProcurarComp.Text) + '%';
                end;
        end;

        FdQryProdutoAcabado.Active := True;

     //lblRegistros.Caption := 'Quantidade de Registros(s) listados é '+ FloatToStrF(cdsProdutoAcabado.RecordCount,ffNumber,6,0)+'  ';
        if FdQryProdutoAcabado.RecordCount = 0 then
        begin
            FdQryProdutoAcabado.Active := False;
            CarregaMateriaPrima;
        //Informacao('Não encontrou Registros para Consulta','Aviso');
            edtProcurarComp.SetFocus;
            Exit;
        end;
        CarregaMateriaPrima;

        grdProdutoFinal.SetFocus;

    finally
        FdQryProdutoAcabado.EnableControls;
    end;

end;

end.

