{-------------------------------------------------------------------------------
 Programa..: UConsultaComposicaoProdutoFinal
 Empresa...: Sulapsso Informatica
 Finalidade: Consulta de Composição Produto Final
 Autor          Data      Operação  Descrição
 Verlan Fernandes  JUL/2020 Criação
-------------------------------------------------------------------------------}


unit UConsultaComposicaoProdutoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, UCadastroComposicaoProdutoFinal,
  Vcl.DBCtrls, uSisIndustria, uDtmSisGestao, URetornaSQL, URetornaRecord;

type
  TfrmConsultaComposicaoProdutoFinal = class(TForm)
    pnlCabecalho: TPanel;
    lblRegistros: TStaticText;
    lblProdutos: TLabel;
    pnlGridPrincipal: TPanel;
    lblMateriaPrima: TLabel;
    pnlGridSecundario: TPanel;
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
    grdProdutoFinal: TDBGrid;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnExclui: TBitBtn;
    btnAltera: TBitBtn;
    btnNovo: TBitBtn;
    btnUltimo: TBitBtn;
    btnSair: TBitBtn;
    cdsMateriaPrima: TClientDataSet;
    dtsMateriaPrima: TDataSource;
    dtsProdutoAcabado: TDataSource;
    cdsProdutoAcabado: TClientDataSet;
    cdsProdutoAcabadoempre_codigo: TIntegerField;
    cdsProdutoAcabadoprod_ref_forn: TStringField;
    cdsProdutoAcabadoprod_codigo: TIntegerField;
    cdsProdutoAcabadoprod_descricao: TStringField;
    cdsProdutoAcabadoprod_unid_venda: TStringField;
    cdsProdutoAcabadoprod_unid_compra: TStringField;
    cdsMateriaPrimaPROD_CODIGO: TIntegerField;
    cdsMateriaPrimaPROD_MAT_PRIMA: TIntegerField;
    cdsMateriaPrimaCOMP_SEQ: TIntegerField;
    cdsMateriaPrimaCOMP_CONVERSAO: TStringField;
    cdsMateriaPrimaATIVO: TStringField;
    cdsMateriaPrimaprod_descricao: TStringField;
    cdsMateriaPrimacomp_formulacao: TBlobField;
    Panel1: TPanel;
    btnExcluiProd: TBitBtn;
    pnlgrid: TPanel;
    grdMateriaPrima: TDBGrid;
    pnlMemo: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    pnlMemo1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBMemo1: TDBMemo;
    btnModoPreparo: TBitBtn;
    Panel5: TPanel;
    btnLimpar: TBitBtn;
    cdsMateriaPrimaCOMP_QUANTIDADE: TFloatField;
    procedure btnSairClick(Sender: TObject);
    procedure cbxProcurarChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure grdProdutoFinalCellClick(Column: TColumn);
    procedure cdsMateriaPrimaATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grdProdutoFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdProdutoFinalExit(Sender: TObject);
    procedure grdProdutoFinalEnter(Sender: TObject);
    procedure grdMateriaPrimaDblClick(Sender: TObject);
    procedure grdMateriaPrimaEnter(Sender: TObject);
    procedure grdMateriaPrimaExit(Sender: TObject);
    procedure grdMateriaPrimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsProdutoAcabadoAfterScroll(DataSet: TDataSet);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluiProdClick(Sender: TObject);
    procedure cbxProcurarEnter(Sender: TObject);
    procedure cbxProcurarExit(Sender: TObject);
    procedure cbxProcurarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxResultadosEnter(Sender: TObject);
    procedure cbxResultadosExit(Sender: TObject);
    procedure cbxResultadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnModoPreparoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure cdsMateriaPrimaCOMP_CONVERSAOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grdProdutoFinalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdMateriaPrimaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);


  private
    procedure Pesquisar;
    procedure CarregaMateriaPrima;
    procedure TransfereDados;
    procedure Cadastra_Campos(Sender: TObject);
    procedure ValidaPermissoesCampos;

  public

  end;

var
    frmConsultaComposicaoProdutoFinal: TfrmConsultaComposicaoProdutoFinal;
    sAcao, sWhere,sSQLWhere, sSQLOrder, sPesquisa,sFiltro, sregistros  : String;
    CadastraCompProdutoFinal : TfrmCadastroComposicaoProdutoFinal;
    bmPontoDeVoltaProd : TBookMark;
    bmPontoDeVoltaMat : TBookMark;

const

    sSQLSelect = 'select DISTINCT p.empre_codigo, p.prod_ref_forn, p.prod_codigo, p.prod_descricao, p.prod_unid_venda, p.prod_unid_compra '+
                 ' from geral_produtos p , geral_produtos_composicao pc '+
                 ' where p.prod_codigo = pc.prod_codigo ';



implementation

{$R *.dfm}

uses uFuncoes;

procedure TfrmConsultaComposicaoProdutoFinal.btnAlteraClick(Sender: TObject);
begin
    if cdsMateriaPrima.RecordCount > 0 then
    begin

        bmPontoDeVoltaProd := cdsProdutoAcabado.GetBookmark;
        bmPontoDeVoltaMat := cdsMateriaPrima.GetBookmark;
        frmCadastroComposicaoProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
        try
            frmCadastroComposicaoProdutoFinal.sAcao            := 'ALTERAR';
            if cdsMateriaPrimaCOMP_SEQ.AsString = '0' then
            begin
                frmCadastroComposicaoProdutoFinal.sLayoutCadastro       := 'FORMULACAO';
                frmCadastroComposicaoProdutoFinal.Caption               := 'Cadastro Modo de Preparo - v.1.0'
            end
            else
            begin
                frmCadastroComposicaoProdutoFinal.sLayoutCadastro       := 'COMPOSICAO';
                frmCadastroComposicaoProdutoFinal.Caption               := 'Cadastro Composicao Produto Final - v.1.0'
            end;
            //Carrega dados do CientDataSet para o Record
            TransfereDados();

            frmCadastroComposicaoProdutoFinal.ShowModal;
        finally
            FreeAndNil(frmCadastroComposicaoProdutoFinal);
        end;

        cbxResultados.ItemIndex := 0;

        btnPesquisaClick(Sender);

        try
            cdsProdutoAcabado.GotoBookmark(bmPontoDeVoltaProd);
        except
        end ;


    end
    else
    begin
        Informacao('Não ha dados para alterar....','Aviso...');
        btnAltera.SetFocus;
        Exit;
    end;


    CarregaMateriaPrima;

    try
        cdsMateriaPrima.GotoBookmark(bmPontoDeVoltaMat);
    except
    end ;

end;

procedure TfrmConsultaComposicaoProdutoFinal.btnAnteriorClick(Sender: TObject);
begin
    cdsProdutoAcabado.Prior;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnExcluiClick(Sender: TObject);
begin
    if not cdsMateriaPrima.IsEmpty then
    begin
        if Pergunta('Deseja excluir a matéria prima ?' +#13+#10+ #13+#10+ 'Seq. Item: '+ cdsMateriaPrimaCOMP_SEQ.AsString +#13+#10+
                     'Descrição: '+ cdsMateriaPrimaPROD_MAT_PRIMA.AsString + ' - ' + cdsMateriaPrimaprod_descricao.AsString, 'Confirmação...' ) then
        begin
            URetornaSQL.ExcluiMateriaPrima(cdsMateriaPrimaPROD_CODIGO.AsString, cdsMateriaPrimaPROD_MAT_PRIMA.AsString, cdsMateriaPrimaCOMP_SEQ.AsString);

            CarregaMateriaPrima();
        end;

    end
    else
    begin
        Informacao('Não há dados para exclusão....','Aviso...');
        btnAltera.SetFocus;
        Exit;
    end;

    cbxResultados.ItemIndex := 0;
    btnPesquisa.OnClick(Sender);
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnExcluiProdClick(
  Sender: TObject);
begin
    if not cdsProdutoAcabado.IsEmpty then
    begin
        if Pergunta('Deseja excluir o produto acabado ?' +#13+#10+ #13+#10+ cdsProdutoAcabadoprod_codigo.AsString + ' - ' + cdsProdutoAcabadoprod_descricao.AsString, 'Confirmação...' ) then
        begin
            URetornaSQL.ExcluiProdutoAcabado(cdsProdutoAcabadoprod_codigo.AsString);

            CarregaMateriaPrima();
        end;

    end
    else
    begin
        Informacao('Não há dados para exclusão....','Aviso...');
        btnAltera.SetFocus;
        Exit;
    end;

    cbxResultados.ItemIndex := 0;
    btnPesquisa.OnClick(Sender);
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnLimparClick(Sender: TObject);
begin
    edtProcurar.Clear;
    edtProcurar.SetFocus;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnModoPreparoClick(
  Sender: TObject);
begin
    CadastraCompProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
    try
        CadastraCompProdutoFinal.sAcao           := 'INSERIR';
        CadastraCompProdutoFinal.sLayoutCadastro := 'FORMULACAO';
        //if not cdsProdutoAcabado.IsEmpty then
        //    CadastraCompProdutoFinal.SCodProduto     := cdsProdutoAcabadoprod_codigo.AsString;
        CadastraCompProdutoFinal.Caption         := 'Cadastro Modo de Preparo - v.1.0';
        CadastraCompProdutoFinal.ShowModal;
    finally
        FreeAndNil(CadastraCompProdutoFinal);
    end;

    cbxResultados.ItemIndex := 0;
    btnPesquisaClick(Sender);


end;

procedure TfrmConsultaComposicaoProdutoFinal.btnNovoClick(Sender: TObject);
begin
    CadastraCompProdutoFinal := TfrmCadastroComposicaoProdutoFinal.Create(Self);
    try
        CadastraCompProdutoFinal.sAcao           := 'INSERIR';
        CadastraCompProdutoFinal.sLayoutCadastro := 'COMPOSICAO';
        CadastraCompProdutoFinal.Caption         := 'Cadastro Composicao Produto Final - v.1.0';
        CadastraCompProdutoFinal.ShowModal;
    finally
        FreeAndNil(CadastraCompProdutoFinal);
    end;

    cbxResultados.ItemIndex := 0;
    btnPesquisaClick(Sender);

    //cdsProdutoAcabado.Locate('prod_codigo',LocateCodigo,[]);


end;

procedure TfrmConsultaComposicaoProdutoFinal.btnPesquisaClick(Sender: TObject);
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
                    sPesquisa := '  and (p.prod_codigo = :codigo)';

                sSQLOrder := ' p.prod_codigo '; // Por codigo...
            end;
      1 :   begin //DESCRICAO
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and(p.prod_descricao like :descricao) ';
                sSQLOrder := ' p.prod_descricao '; // Por descricão...
            end;

      2 :   begin //REFERENCIA
                if Trim(edtProcurar.Text) = '' then
                    sPesquisa := ''
                else
                    sPesquisa := ' and (p.prod_ref_forn like :referencia) ';
              sSQLOrder := ' p.prod_ref_forn '; // Por descricão...
            end;
     end;
     Pesquisar;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnPrimeiroClick(Sender: TObject);
begin
    cdsProdutoAcabado.First;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnProximoClick(Sender: TObject);
begin
    cdsProdutoAcabado.Next;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmConsultaComposicaoProdutoFinal.btnUltimoClick(Sender: TObject);
begin
    cdsProdutoAcabado.Last;
end;

procedure TfrmConsultaComposicaoProdutoFinal.CarregaMateriaPrima;
var
    sMateriaPrima :string;
begin

     cdsMateriaPrima.DisableControls;
     try
     sMateriaPrima := ' select pc.*, p.prod_descricao from geral_produtos p, geral_produtos_composicao pc '+
              '  where (pc.prod_codigo  = :cod_produto) '+
              ' and p.prod_codigo = pc.prod_mat_prima '+
              '  order by pc.prod_codigo, pc.comp_seq ';

    cdsMateriaPrima.Active := False;
    cdsMateriaPrima.CommandText:='';
    cdsMateriaPrima.CommandText:= sMateriaPrima ;
    cdsMateriaPrima.Params.ParamByName('cod_produto').AsString := Trim(cdsProdutoAcabadoprod_codigo.AsString);

    cdsMateriaPrima.Active := True;

    if cdsMateriaPrima.RecordCount = 0 then
        cdsMateriaPrima.Active := False;

    finally
        cdsMateriaPrima.EnableControls;
    end;

end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxProcurarChange(Sender: TObject);
begin
    lblProcurar.Caption := UpperCase(Trim(cbxProcurar.Text))+':';
    edtProcurar.EditMask := '';
    edtProcurar.MaxLength := 0;
    edtProcurar.Clear;

end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxProcurarEnter(Sender: TObject);
begin
    //KeyPreview := False;
end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxProcurarExit(Sender: TObject);
begin
    //KeyPreview := True;
end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxProcurarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{    case Key of
          VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxResultadosEnter(
  Sender: TObject);
begin
    //KeyPreview := False;
end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxResultadosExit(Sender: TObject);
begin
    //KeyPreview := True;
end;

procedure TfrmConsultaComposicaoProdutoFinal.cbxResultadosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    {case Key of
          VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmConsultaComposicaoProdutoFinal.cdsMateriaPrimaATIVOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmConsultaComposicaoProdutoFinal.cdsMateriaPrimaCOMP_CONVERSAOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
    if Sender.AsString = 'S' then
        Text := 'Sim';
    if Sender.AsString = 'N' then
        Text := 'Não'
end;

procedure TfrmConsultaComposicaoProdutoFinal.cdsProdutoAcabadoAfterScroll(
  DataSet: TDataSet);
begin
    CarregaMateriaPrima;
end;

procedure TfrmConsultaComposicaoProdutoFinal.FormActivate(Sender: TObject);
begin
    FormResize ( Self ) ;
end;

procedure TfrmConsultaComposicaoProdutoFinal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //RetornaSQL.Destroy();
end;

procedure TfrmConsultaComposicaoProdutoFinal.FormCreate(Sender: TObject);
begin
    //RetornaSQL := TRetornaSQL.Create();
end;

procedure TfrmConsultaComposicaoProdutoFinal.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F5              : btnPesquisa.OnClick(Self);

        VK_F2              : begin
                                if btnNovo.Visible then
                                    btnNovo.OnClick(Self);
                             end;
        VK_F3              : begin
                                if btnAltera.Visible then
                                    btnAltera.OnClick(Self);
                             end;
        VK_F6              : begin
                                if btnExclui.Visible then
                                    btnExclui.OnClick(Self);
                             end;
    end;
end;

procedure TfrmConsultaComposicaoProdutoFinal.FormResize(Sender: TObject);
begin
    grdProdutoFinal.Columns[3].Width := grdProdutoFinal.Width - 40 - (grdProdutoFinal.Columns[0].Width  + grdProdutoFinal.Columns[1].Width  + grdProdutoFinal.Columns[2].Width + grdProdutoFinal.Columns[4].Width + grdProdutoFinal.Columns[5].Width ) ;
    if grdProdutoFinal.Columns[3].Width <= 159 then
        grdProdutoFinal.Columns[3].Width := 159;

    grdMateriaPrima.Columns[2].Width := grdMateriaPrima.Width - 30 - (grdMateriaPrima.Columns[0].Width  + grdMateriaPrima.Columns[1].Width  + grdMateriaPrima.Columns[3].Width + grdMateriaPrima.Columns[4].Width + grdMateriaPrima.Columns[4].Width ) ;
    if grdMateriaPrima.Columns[2].Width <= 159 then
        grdMateriaPrima.Columns[2].Width := 159;

end;

procedure TfrmConsultaComposicaoProdutoFinal.FormShow(Sender: TObject);
begin
    Cadastra_Campos(Sender);
    ValidaPermissoesCampos();
    lblRegistros.Caption    :='';
    cbxProcurar.ItemIndex   := 0;
    cbxResultados.ItemIndex := 1;
    cbxProcurar.OnChange(Sender);
    btnPesquisa.OnClick(Sender);
    edtProcurar.SetFocus;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdMateriaPrimaDblClick(
  Sender: TObject);
begin
    btnAltera.OnClick(Sender);
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdMateriaPrimaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    ShowScrollBar(grdMateriaPrima.Handle,SB_VERT,True); //forçar a mostragem barra Vertical
    //ShowScrollBar(grdMateriaPrima.Handle,SB_HORZ,False); //não deixar a mostra a barra horizontal
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdMateriaPrimaEnter(
  Sender: TObject);
begin
//    KeyPreview := false;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdMateriaPrimaExit(
  Sender: TObject);
begin
//    KeyPreview := true;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdMateriaPrimaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    {case key of
          VK_RETURN : PERFORM (WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdProdutoFinalCellClick(
  Column: TColumn);
begin
    CarregaMateriaPrima ;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdProdutoFinalDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    ShowScrollBar(grdProdutoFinal.Handle,SB_VERT,True); //forçar a mostragem barra Vertical
    //ShowScrollBar(grdProdutoFinal.Handle,SB_HORZ,False); //não deixar a mostra a barra horizontal
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdProdutoFinalEnter(
  Sender: TObject);
begin
//    KeyPreview := false;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdProdutoFinalExit(
  Sender: TObject);
begin
//    KeyPreview := true;
end;

procedure TfrmConsultaComposicaoProdutoFinal.grdProdutoFinalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    {case key of
          VK_RETURN : PERFORM (WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmConsultaComposicaoProdutoFinal.Pesquisar;
begin
    cdsProdutoAcabado.DisableControls;
    try
     cdsProdutoAcabado.Active := False;
     cdsProdutoAcabado.CommandText := '';

     cdsProdutoAcabado.CommandText := sSQLSelect + sPesquisa + 'order by ' + sSQLOrder + sregistros ;


     case cbxProcurar.ItemIndex of
          0 :   begin // Por codigo...
                    sFiltro := 'CODIGO';
                    if not (Trim(edtProcurar.Text) = '') then
                        cdsProdutoAcabado.Params.ParamByName('codigo').AsInteger := StrToInt(Trim(edtProcurar.Text));
                end;
          1 :   begin // Por descrição
                    sFiltro := 'DESCRICAO';
                    if  (Trim(edtProcurar.Text) <> '') then
                        cdsProdutoAcabado.Params.ParamByName('descricao').AsString := '%'+Trim(edtProcurar.Text)+'%';
                end;
          2 :   begin // Por referencia
                    sFiltro := 'REFERENCIA';
                    if  (Trim(edtProcurar.Text) <> '') then
                        cdsProdutoAcabado.Params.ParamByName('referencia').AsString := '%'+Trim(edtProcurar.Text)+'%';
                end;
     end;

     cdsProdutoAcabado.Active := True;
     lblRegistros.Caption := 'Quantidade de Registros(s) listados é '+ FloatToStrF(cdsProdutoAcabado.RecordCount,ffNumber,6,0)+'  ';
     if cdsProdutoAcabado.RecordCount = 0 then
     begin
        cdsProdutoAcabado.Active := False;
        //Informacao('Não encontrou Registros para Consulta','Aviso');
        edtProcurar.SetFocus;
        Exit;
     end;
     CarregaMateriaPrima;

     grdProdutoFinal.SetFocus;

    finally
        cdsProdutoAcabado.EnableControls;
    end;


end;

procedure TfrmConsultaComposicaoProdutoFinal.TransfereDados;
begin
    with URetornaRecord.RetornaComposicaoProdFinal do
    begin
        PROD_CODIGO       := cdsMateriaPrimaPROD_CODIGO.AsString;
        PROD_MAT_PRIMA    := cdsMateriaPrimaPROD_MAT_PRIMA.AsString;
        COMP_SEQ          := cdsMateriaPrimaCOMP_SEQ.AsString;
        COMP_QUANTIDADE   := cdsMateriaPrimaCOMP_QUANTIDADE.AsString;
        COMP_CONVERSAO    := cdsMateriaPrimaCOMP_CONVERSAO.AsString;
        ATIVO             := cdsMateriaPrimaATIVO.AsString;
        COMP_FORMULACAO   := cdsMateriaPrimacomp_formulacao.AsString;

    end;

end;

procedure TfrmConsultaComposicaoProdutoFinal.Cadastra_Campos(Sender: TObject);
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
               sDescricao := Components[iIndice].Name+' não encontrou TIPO.uConsultaComposicaoProdutoFinal';
               if (Components[iIndice] is TEdit) then
                  sDescricao := TEdit(Components[iIndice]).Hint
               else
                   if (Components[iIndice] is TMaskEdit) then
                      sDescricao := TMaskEdit(Components[iIndice]).Hint
                   else
                       //if (Components[iIndice] is TCheckListBox) then
                       //   sDescricao := TCheckListBox(Components[iIndice]).Hint
                       //else
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
                                       //else
                                       //    if (Components[iIndice] is TevCheckBox) then
                                       //       sDescricao := TevCheckBox(Components[iIndice]).Hint;
               dtmSisGestao.FdQryGeralDados.Active := False;
               dtmSisGestao.FdQryConsulta.SQL.Clear;
               dtmSisGestao.FdQryConsulta.SQL.Add(LowerCase(sSQL));
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString    := copy(UpperCase(Components[iIndice].Name),1,21);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString     := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL,1,21);
               dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOINTERFACE').AsString := copy('FRMCONSULTACOMPOSICAOPRODUTOFINAL',1,70);
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
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               //dtmSisGestao.FdQryConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
               dtmSisGestao.FdQryConsulta.Execute;
          end;
     end;
     dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmConsultaComposicaoProdutoFinal.ValidaPermissoesCampos();
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
