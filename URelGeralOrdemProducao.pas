unit URelGeralOrdemProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, ppParameter, ppDesignLayer,
  ppStrtch, ppMemo, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, URetornaRecord;

type
  TfrmRelGeralOrdemProducao = class(TForm)
    pnlRodape: TPanel;
    pnlFiltro: TPanel;
    btnSair: TBitBtn;
    btnRelatorio: TBitBtn;
    Label1: TLabel;
    edtDataIni: TDateTimePicker;
    Label2: TLabel;
    edtDataFim: TDateTimePicker;
    Label3: TLabel;
    edtNrOrdemIni: TEdit;
    edtNrOrdemFim: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtGrupoIni: TEdit;
    Label6: TLabel;
    edtGrupoFim: TEdit;
    Label7: TLabel;
    edtGrupoMais1: TEdit;
    Label8: TLabel;
    edtGrupoMais2: TEdit;
    Label9: TLabel;
    edtGrupoMais3: TEdit;
    Label10: TLabel;
    edtGrupoMais4: TEdit;
    rdgTipoImpressao: TRadioGroup;
    rdgSituacao: TRadioGroup;
    Label11: TLabel;
    edtGrupoMais5: TEdit;
    pplRelOrdemProd: TppDBPipeline;
    pprRelatorioOrdemProducao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel3: TppLabel;
    lblQtdeKG: TppLabel;
    lblQtdeSC: TppLabel;
    ppShape3: TppShape;
    ppSystemVariable1: TppSystemVariable;
    ppLogoEmp: TppImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    dtsRelOrdemProd: TDataSource;
    cdsRelOrdemProd: TClientDataSet;
    cdsRelOrdemProdNr_ordem: TIntegerField;
    cdsRelOrdemProdlote: TIntegerField;
    cdsRelOrdemProddt_validade: TDateField;
    cdsRelOrdemProdprod_codigo: TIntegerField;
    cdsRelOrdemProdqtd_KG: TFloatField;
    cdsRelOrdemProdqtd_SC: TFloatField;
    cdsRelOrdemProdvlr_total: TFloatField;
    cdsRelOrdemProdvlr_unitario: TFloatField;
    cdsRelOrdemProdnome_prod: TStringField;
    lblVlrUnit: TppLabel;
    lblVlrTotal: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    dbQtdSC: TppDBText;
    dbQtdKG: TppDBText;
    dbVlrUnit: TppDBText;
    dbVlrTotal: TppDBText;
    pnlQtdSC: TppShape;
    pnlQtdPC: TppShape;
    ppFooterBand1: TppFooterBand;
    ppLabel6: TppLabel;
    lblSituacao: TppLabel;
    ppLine2: TppLine;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtGrupoMais6: TEdit;
    edtGrupoMais7: TEdit;
    edtGrupoMais8: TEdit;
    edtGrupoMais9: TEdit;
    edtGrupoMais10: TEdit;
    ppLabel7: TppLabel;
    lblFuncionario: TppLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure edtNrOrdemIniExit(Sender: TObject);
    procedure edtNrOrdemFimExit(Sender: TObject);
    procedure edtGrupoIniExit(Sender: TObject);
    procedure edtGrupoFimExit(Sender: TObject);
    procedure edtGrupoMais1Exit(Sender: TObject);
    procedure edtGrupoMais2Exit(Sender: TObject);
    procedure edtGrupoMais3Exit(Sender: TObject);
    procedure edtGrupoMais4Exit(Sender: TObject);
    procedure edtGrupoMais5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtGrupoMais6Exit(Sender: TObject);
    procedure edtGrupoMais7Exit(Sender: TObject);
    procedure edtGrupoMais8Exit(Sender: TObject);
    procedure edtGrupoMais9Exit(Sender: TObject);
    procedure edtGrupoMais10Exit(Sender: TObject);
  private
    { Private declarations }
    procedure RelatorioGeral();
    procedure RelatorioAberto();
    procedure RelatorioFechado();
  public
    { Public declarations }
  end;

var
  frmRelGeralOrdemProducao: TfrmRelGeralOrdemProducao;
  bResult : Boolean;

implementation

{$R *.dfm}

uses uDtmSisGestao, uFuncoes;

procedure TfrmRelGeralOrdemProducao.btnRelatorioClick(Sender: TObject);
begin
    if (AllTrim(edtNrOrdemIni.Text) = '') then
    begin
        Informacao('O campo Nr. Ordem é obrigatório!', 'Atenção!');
        edtNrOrdemIni.SetFocus;
        Exit;
    end;
    if (AllTrim(edtNrOrdemFim.Text) = '') then
    begin
        Informacao('O campo Nr. Ordem é obrigatório!', 'Atenção!');
        edtNrOrdemFim.SetFocus;
        Exit;
    end;

    if (AllTrim(edtGrupoIni.Text) = '') then
    begin
        Informacao('O campo Grupo é obrigatório!', 'Atenção!');
        edtGrupoIni.SetFocus;
        Exit;
    end;
    if (AllTrim(edtGrupoFim.Text) = '') then
    begin
        Informacao('O campo Grupo é obrigatório!', 'Atenção!');
        edtGrupoFim.SetFocus;
        Exit;
    end;

    case rdgSituacao.ItemIndex of
        0 : RelatorioGeral;
        1 : RelatorioAberto;
        2 : RelatorioFechado;
    end;

    if not cdsRelOrdemProd.IsEmpty then
    begin
        if rdgTipoImpressao.ItemIndex = 0 then
        begin
            lblQtdeKG.Caption   := 'Qtd KG';
            lblVlrUnit.Visible  := True;
            lblVlrTotal.Visible := True;
            dbQtdKG.Visible     := True;
            dbQtdSC.Visible     := True;
            dbVlrUnit.Visible   := True;
            dbVlrTotal.Visible  := True;
            pnlQtdSC.Visible    := False;
            pnlQtdPC.Visible    := False;


        end
        else if rdgTipoImpressao.ItemIndex = 1 then
        begin
            lblQtdeKG.Caption   := 'Qtd PC';
            lblVlrUnit.Visible  := False;
            lblVlrTotal.Visible := False;
            dbQtdKG.Visible     := False;
            dbQtdSC.Visible     := False;
            dbVlrUnit.Visible   := False;
            dbVlrTotal.Visible  := False;
            pnlQtdSC.Visible    := True;
            pnlQtdPC.Visible    := True;

        end;

        case rdgSituacao.ItemIndex of
            0 :  lblSituacao.Caption := 'GERAL' ;
            1 :  lblSituacao.Caption := 'ABERTO' ;
            2 :  lblSituacao.Caption := 'FECHADO' ;
        end;

        lblFuncionario.Text := URetornaRecord.RetornaFuncionario.FUNC_CODIGO + ' - ' + URetornaRecord.RetornaFuncionario.FUNC_NOME;
        if URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO <> '' then
            ppLogoEmp.Picture.LoadFromFile(URetornaRecord.RetornaFuncionario.EMPRE_LOGOTIPO);
        pprRelatorioOrdemProducao.Print;
    end
    else
    begin
        Informacao('Não há dados a serem apresentados com o filtro informado!', 'Atenção...');
        edtDataIni.SetFocus;
    end;

end;

procedure TfrmRelGeralOrdemProducao.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoFimExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoFim.Text));
    if bResult = False then
        edtGrupoFim.SetFocus;
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoIniExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoIni.Text));
    if bResult = False then
        edtGrupoIni.SetFocus;
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais10Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais10.Text));
    if bResult = False then
        edtGrupoMais10.SetFocus;

    if AllTrim(edtGrupoMais10.Text) = '' then
        edtGrupoMais10.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais1Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais1.Text));
    if bResult = False then
        edtGrupoMais1.SetFocus;

    if AllTrim(edtGrupoMais1.Text) = '' then
        edtGrupoMais1.Text := '0';


end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais2Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais2.Text));
    if bResult = False then
        edtGrupoMais2.SetFocus;

    if AllTrim(edtGrupoMais2.Text) = '' then
        edtGrupoMais2.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais3Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais3.Text));
    if bResult = False then
        edtGrupoMais3.SetFocus;

    if AllTrim(edtGrupoMais3.Text) = '' then
        edtGrupoMais3.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais4Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais4.Text));
    if bResult = False then
        edtGrupoMais4.SetFocus;

    if AllTrim(edtGrupoMais4.Text) = '' then
        edtGrupoMais4.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais5Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais5.Text));
    if bResult = False then
        edtGrupoMais5.SetFocus;

    if AllTrim(edtGrupoMais5.Text) = '' then
        edtGrupoMais5.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais6Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais6.Text));
    if bResult = False then
        edtGrupoMais6.SetFocus;

    if AllTrim(edtGrupoMais6.Text) = '' then
        edtGrupoMais6.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais7Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais7.Text));
    if bResult = False then
        edtGrupoMais7.SetFocus;

    if AllTrim(edtGrupoMais7.Text) = '' then
        edtGrupoMais7.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais8Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais8.Text));
    if bResult = False then
        edtGrupoMais8.SetFocus;

    if AllTrim(edtGrupoMais8.Text) = '' then
        edtGrupoMais8.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtGrupoMais9Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais9.Text));
    if bResult = False then
        edtGrupoMais9.SetFocus;

    if AllTrim(edtGrupoMais9.Text) = '' then
        edtGrupoMais9.Text := '0';
end;

procedure TfrmRelGeralOrdemProducao.edtNrOrdemFimExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtNrOrdemFim.Text));
    if bResult = False then
        edtNrOrdemFim.SetFocus;
end;

procedure TfrmRelGeralOrdemProducao.edtNrOrdemIniExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtNrOrdemIni.Text));
    if bResult = False then
        edtNrOrdemIni.SetFocus;
end;

procedure TfrmRelGeralOrdemProducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F9              : btnRelatorio.OnClick(Self);
    end;
end;

procedure TfrmRelGeralOrdemProducao.FormShow(Sender: TObject);
begin
    edtDataIni.Date := Date;
    edtDataFim.Date := Date;
end;

procedure TfrmRelGeralOrdemProducao.RelatorioAberto;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
begin
    dVlrUnit := 0;
    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                  edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add( 'select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_VALIDADE, '+
                                              ' op.NR_LOTE, op.QTDE_SC, op.QTDE_KG, p.PROD_DESCRICAO '+
                                              ' from geral_ordem_producao op, geral_produtos p '+
                                              ' where op.PROD_CODIGO = p.PROD_CODIGO '+
                                              ' and (op.DATA_EMISSAO >= :DATA_EMISSAO_INI and op.DATA_EMISSAO <= :DATA_EMISSAO_FIM)'+
                                              ' and (op.NR_ORDEM >= :NR_ORDEM_INI and  op.NR_ORDEM <= :NR_ORDEM_FIM)'+
                                              ' and ((p.PROD_GRUPO >= :GRUPO_INI and  p.PROD_GRUPO <= :GRUPO_FIM) ' +
                                                    ' or p.PROD_GRUPO in ('+ sMaisGrupos +'))'+
                                              ' and op.SITUACAO = '+QuotedStr('A')+
                                              ' order by op.NR_ORDEM' );

    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_INI').AsDate := edtDataIni.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_FIM').AsDate := edtDataFim.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_INI').AsString   := AllTrim(edtNrOrdemIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_FIM').AsString   := AllTrim(edtNrOrdemFim.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_INI').AsString      := AllTrim(edtGrupoIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_FIM').AsString      := AllTrim(edtGrupoFim.Text);
    dtmSisGestao.FdQryGeralDados.Active := True;
    dtmSisGestao.FdQryGeralDados.First;

    dtmSisGestao.FdQryGeralDados.RecordCount;

    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        cdsRelOrdemProd.Append;
        cdsRelOrdemProdNr_ordem.AsInteger     := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsInteger;
        cdsRelOrdemProdlote.AsInteger         := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsInteger;
        cdsRelOrdemProddt_validade.AsDateTime := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_VALIDADE').AsDateTime;
        cdsRelOrdemProdprod_codigo.AsInteger  := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_CODIGO').AsInteger;
        cdsRelOrdemProdnome_prod.AsString     := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
        cdsRelOrdemProdqtd_KG.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_KG').AsFloat;
        cdsRelOrdemProdqtd_SC.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat;
        cdsRelOrdemProdvlr_total.AsFloat      := dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat;
        dVlrUnit := (dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat / dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat);
        cdsRelOrdemProdvlr_unitario.AsFloat   := dVlrUnit;

        cdsRelOrdemProd.post;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

procedure TfrmRelGeralOrdemProducao.RelatorioFechado;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
begin
    dVlrUnit := 0;
    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                   edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_VALIDADE, '+
                                              ' op.NR_LOTE, op.QTDE_SC, op.QTDE_KG, p.PROD_DESCRICAO '+
                                              ' from geral_ordem_producao op, geral_produtos p '+
                                              ' where op.PROD_CODIGO = p.PROD_CODIGO '+
                                              ' and (op.DATA_ATUALIZACAO >= :DATA_ATUALIZACAO_INI and op.DATA_ATUALIZACAO <= :DATA_ATUALIZACAO_FIM)'+
                                              ' and (op.NR_ORDEM >= :NR_ORDEM_INI and  op.NR_ORDEM <= :NR_ORDEM_FIM)'+
                                              ' and ((p.PROD_GRUPO >= :GRUPO_INI and  p.PROD_GRUPO <= :GRUPO_FIM) ' +
                                                    ' or p.PROD_GRUPO in ('+ sMaisGrupos +'))'+
                                              ' and op.SITUACAO = '+QuotedStr('F')+
                                              ' order by op.NR_ORDEM' );

    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_ATUALIZACAO_INI').AsDate := edtDataIni.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_ATUALIZACAO_FIM').AsDate := edtDataFim.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_INI').AsString       := AllTrim(edtNrOrdemIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_FIM').AsString       := AllTrim(edtNrOrdemFim.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_INI').AsString          := AllTrim(edtGrupoIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_FIM').AsString          := AllTrim(edtGrupoFim.Text);
    dtmSisGestao.FdQryGeralDados.Active := True;
    dtmSisGestao.FdQryGeralDados.First;

    dtmSisGestao.FdQryGeralDados.RecordCount;

    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        cdsRelOrdemProd.Append;
        cdsRelOrdemProdNr_ordem.AsInteger     := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsInteger;
        cdsRelOrdemProdlote.AsInteger         := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsInteger;
        cdsRelOrdemProddt_validade.AsDateTime := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_VALIDADE').AsDateTime;
        cdsRelOrdemProdprod_codigo.AsInteger  := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_CODIGO').AsInteger;
        cdsRelOrdemProdnome_prod.AsString     := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
        cdsRelOrdemProdqtd_KG.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_KG').AsFloat;
        cdsRelOrdemProdqtd_SC.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat;
        cdsRelOrdemProdvlr_total.AsFloat      := dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat;
        dVlrUnit := (dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat / dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat);
        cdsRelOrdemProdvlr_unitario.AsFloat   := dVlrUnit;

        cdsRelOrdemProd.post;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

procedure TfrmRelGeralOrdemProducao.RelatorioGeral;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
begin
    dVlrUnit := 0;
    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                   edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_VALIDADE, '+
                                              ' op.NR_LOTE, op.QTDE_SC, op.QTDE_KG, p.PROD_DESCRICAO '+
                                              ' from geral_ordem_producao op, geral_produtos p '+
                                              ' where op.PROD_CODIGO = p.PROD_CODIGO '+
                                              ' and (op.DATA_EMISSAO >= :DATA_EMISSAO_INI and op.DATA_EMISSAO <= :DATA_EMISSAO_FIM)'+
                                              ' and (op.NR_ORDEM >= :NR_ORDEM_INI and  op.NR_ORDEM <= :NR_ORDEM_FIM)'+
                                              ' and ((p.PROD_GRUPO >= :GRUPO_INI and  p.PROD_GRUPO <= :GRUPO_FIM) ' +
                                                    ' or p.PROD_GRUPO in ('+ sMaisGrupos +'))'+
                                              ' and op.SITUACAO <> '+QuotedStr('E')+
                                              ' order by op.NR_ORDEM') ;

    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_INI').AsDate := edtDataIni.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_FIM').AsDate := edtDataFim.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_INI').AsString   := AllTrim(edtNrOrdemIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_FIM').AsString   := AllTrim(edtNrOrdemFim.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_INI').AsString      := AllTrim(edtGrupoIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_FIM').AsString      := AllTrim(edtGrupoFim.Text);
    dtmSisGestao.FdQryGeralDados.Active := True;
    dtmSisGestao.FdQryGeralDados.First;

    dtmSisGestao.FdQryGeralDados.RecordCount;

    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        cdsRelOrdemProd.Append;
        cdsRelOrdemProdNr_ordem.AsInteger     := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsInteger;
        cdsRelOrdemProdlote.AsInteger         := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsInteger;
        cdsRelOrdemProddt_validade.AsDateTime := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_VALIDADE').AsDateTime;
        cdsRelOrdemProdprod_codigo.AsInteger  := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_CODIGO').AsInteger;
        cdsRelOrdemProdnome_prod.AsString     := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
        cdsRelOrdemProdqtd_KG.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_KG').AsFloat;
        cdsRelOrdemProdqtd_SC.AsFloat         := dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat;
        cdsRelOrdemProdvlr_total.AsFloat      := dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat;
        dVlrUnit := (dtmSisGestao.FdQryGeralDados.FieldByName('VALOR_TOTAL').AsFloat / dtmSisGestao.FdQryGeralDados.FieldByName('QTDE_SC').AsFloat);
        cdsRelOrdemProdvlr_unitario.AsFloat   := dVlrUnit;

        cdsRelOrdemProd.post;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

end.
