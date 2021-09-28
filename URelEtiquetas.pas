unit URelEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, ppParameter, ppDesignLayer,
  ppStrtch, ppMemo, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, URetornaRecord;

type
  TfrmRelEtiquetas = class(TForm)
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
    rdgSituacao: TRadioGroup;
    Label11: TLabel;
    edtGrupoMais5: TEdit;
    pplRelOrdemProd: TppDBPipeline;
    pprRelatorioOrdemProducao: TppReport;
    ppDetailBand1: TppDetailBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    dtsRelOrdemProd: TDataSource;
    cdsRelOrdemProd: TClientDataSet;
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
    edtNrEtiquetas: TEdit;
    Label17: TLabel;
    cdsRelOrdemProdcoluna1: TStringField;
    cdsRelOrdemProdcoluna2: TStringField;
    cdsRelOrdemProdcoluna3: TStringField;
    cdsRelOrdemProdcoluna4: TStringField;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppShape1: TppShape;
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
    procedure edtNrEtiquetasExit(Sender: TObject);
  private
    { Private declarations }
    procedure RelatorioGeral();
    procedure RelatorioAberto();
    procedure RelatorioFechado();
  public
    { Public declarations }
  end;

var
  frmRelEtiquetas: TfrmRelEtiquetas;
  bResult : Boolean;

implementation

{$R *.dfm}

uses uDtmSisGestao, uFuncoes;

procedure TfrmRelEtiquetas.btnRelatorioClick(Sender: TObject);
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

        pprRelatorioOrdemProducao.Print;
    end
    else
    begin
        Informacao('Não há dados a serem apresentados com o filtro informado!', 'Atenção...');
        edtDataIni.SetFocus;
    end;

end;

procedure TfrmRelEtiquetas.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelEtiquetas.edtGrupoFimExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoFim.Text));
    if bResult = False then
        edtGrupoFim.SetFocus;
end;

procedure TfrmRelEtiquetas.edtGrupoIniExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoIni.Text));
    if bResult = False then
        edtGrupoIni.SetFocus;
end;

procedure TfrmRelEtiquetas.edtGrupoMais10Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais10.Text));
    if bResult = False then
        edtGrupoMais10.SetFocus;

    if AllTrim(edtGrupoMais10.Text) = '' then
        edtGrupoMais10.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais1Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais1.Text));
    if bResult = False then
        edtGrupoMais1.SetFocus;

    if AllTrim(edtGrupoMais1.Text) = '' then
        edtGrupoMais1.Text := '0';


end;

procedure TfrmRelEtiquetas.edtGrupoMais2Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais2.Text));
    if bResult = False then
        edtGrupoMais2.SetFocus;

    if AllTrim(edtGrupoMais2.Text) = '' then
        edtGrupoMais2.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais3Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais3.Text));
    if bResult = False then
        edtGrupoMais3.SetFocus;

    if AllTrim(edtGrupoMais3.Text) = '' then
        edtGrupoMais3.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais4Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais4.Text));
    if bResult = False then
        edtGrupoMais4.SetFocus;

    if AllTrim(edtGrupoMais4.Text) = '' then
        edtGrupoMais4.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais5Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais5.Text));
    if bResult = False then
        edtGrupoMais5.SetFocus;

    if AllTrim(edtGrupoMais5.Text) = '' then
        edtGrupoMais5.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais6Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais6.Text));
    if bResult = False then
        edtGrupoMais6.SetFocus;

    if AllTrim(edtGrupoMais6.Text) = '' then
        edtGrupoMais6.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais7Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais7.Text));
    if bResult = False then
        edtGrupoMais7.SetFocus;

    if AllTrim(edtGrupoMais7.Text) = '' then
        edtGrupoMais7.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais8Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais8.Text));
    if bResult = False then
        edtGrupoMais8.SetFocus;

    if AllTrim(edtGrupoMais8.Text) = '' then
        edtGrupoMais8.Text := '0';
end;

procedure TfrmRelEtiquetas.edtGrupoMais9Exit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtGrupoMais9.Text));
    if bResult = False then
        edtGrupoMais9.SetFocus;

    if AllTrim(edtGrupoMais9.Text) = '' then
        edtGrupoMais9.Text := '0';
end;

procedure TfrmRelEtiquetas.edtNrEtiquetasExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtNrEtiquetas.Text));
    if bResult = False then
        edtNrEtiquetas.SetFocus;

    if AllTrim(edtNrEtiquetas.Text) = '' then
        edtNrEtiquetas.Text := '1';
end;

procedure TfrmRelEtiquetas.edtNrOrdemFimExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtNrOrdemFim.Text));
    if bResult = False then
        edtNrOrdemFim.SetFocus;
end;

procedure TfrmRelEtiquetas.edtNrOrdemIniExit(Sender: TObject);
begin
    bResult := VerificaCampoConsulta(AllTrim(edtNrOrdemIni.Text));
    if bResult = False then
        edtNrOrdemIni.SetFocus;
end;

procedure TfrmRelEtiquetas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F9              : btnRelatorio.OnClick(Self);
    end;
end;

procedure TfrmRelEtiquetas.FormShow(Sender: TObject);
begin
    edtDataIni.Date := Date;
    edtDataFim.Date := Date;
end;

procedure TfrmRelEtiquetas.RelatorioAberto;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
    I: Integer;
begin
    dVlrUnit := 0;
    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                  edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_EMISSAO, '+
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
        for I := 0 to StrToInt(edtNrEtiquetas.Text) -1 do
        begin
            cdsRelOrdemProd.Append;
            cdsRelOrdemProdcoluna1.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
            cdsRelOrdemProdcoluna2.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsString;
            cdsRelOrdemProdcoluna3.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsString;
            cdsRelOrdemProdcoluna4.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_EMISSAO').AsString;

            cdsRelOrdemProd.Post;
        end;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

procedure TfrmRelEtiquetas.RelatorioFechado;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
    I: Integer;
begin
    dVlrUnit := 0;
    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                   edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_EMISSAO, '+
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

    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        for I := 0 to StrToInt(edtNrEtiquetas.Text) -1 do
        begin
            cdsRelOrdemProd.Append;
            cdsRelOrdemProdcoluna1.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
            cdsRelOrdemProdcoluna2.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsString;
            cdsRelOrdemProdcoluna3.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsString;
            cdsRelOrdemProdcoluna4.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_EMISSAO').AsString;

            cdsRelOrdemProd.Post;
        end;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

procedure TfrmRelEtiquetas.RelatorioGeral;
var
    sMaisGrupos : string;
    dVlrUnit : Real;
    I: Integer;
begin
    dVlrUnit := 0;

    cdsRelOrdemProd.EmptyDataSet;

    sMaisGrupos := edtGrupoMais1.Text +','+edtGrupoMais2.Text +','+edtGrupoMais3.Text +','+edtGrupoMais4.Text +','+edtGrupoMais5.Text +
                   edtGrupoMais6.Text +','+edtGrupoMais7.Text +','+edtGrupoMais8.Text +','+edtGrupoMais9.Text +','+edtGrupoMais10.Text;
    sMaisGrupos := AllTrim(sMaisGrupos);

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select op.NR_ORDEM, op.VALOR_TOTAL, op.PROD_CODIGO, op.DATA_EMISSAO, '+
                                              ' op.NR_LOTE, op.QTDE_SC, op.QTDE_KG, p.PROD_DESCRICAO '+
                                              ' from geral_ordem_producao op, geral_produtos p '+
                                              ' where op.PROD_CODIGO = p.PROD_CODIGO '+
                                              ' and (op.DATA_EMISSAO >= :DATA_EMISSAO_INI and op.DATA_EMISSAO <= :DATA_EMISSAO_FIM)'+
                                              ' and (op.NR_ORDEM >= :NR_ORDEM_INI and  op.NR_ORDEM <= :NR_ORDEM_FIM)'+
                                              ' and ((p.PROD_GRUPO >= :GRUPO_INI and  p.PROD_GRUPO <= :GRUPO_FIM) ' +
                                                    ' or p.PROD_GRUPO in ('+ sMaisGrupos +'))'+
                                              ' and op.SITUACAO <> '+QuotedStr('E')+
                                              ' order by op.NR_ORDEM' );

    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_INI').AsDate := edtDataIni.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('DATA_EMISSAO_FIM').AsDate := edtDataFim.Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_INI').AsString   := AllTrim(edtNrOrdemIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('NR_ORDEM_FIM').AsString   := AllTrim(edtNrOrdemFim.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_INI').AsString      := AllTrim(edtGrupoIni.Text);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('GRUPO_FIM').AsString      := AllTrim(edtGrupoFim.Text);
    dtmSisGestao.FdQryGeralDados.Active := True;
    dtmSisGestao.FdQryGeralDados.First;

    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        for I := 0 to StrToInt(edtNrEtiquetas.Text) -1 do
        begin
            cdsRelOrdemProd.Append;
            cdsRelOrdemProdcoluna1.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('PROD_DESCRICAO').AsString;
            cdsRelOrdemProdcoluna2.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_LOTE').AsString;
            cdsRelOrdemProdcoluna3.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('NR_ORDEM').AsString;
            cdsRelOrdemProdcoluna4.AsString := dtmSisGestao.FdQryGeralDados.FieldByName('DATA_EMISSAO').AsString;

            cdsRelOrdemProd.Post;
        end;

        dtmSisGestao.FdQryGeralDados.Next;

    end;

end;

end.
