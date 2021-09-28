program pSisIndustria;

uses
  dialogs,
  Vcl.Forms,
  uSisIndustria in 'uSisIndustria.pas' {frmSisIndustria},
  uDtmSisGestao in 'uDtmSisGestao.pas' {dtmSisGestao: TDataModule},
  uFuncoes in 'fontes\uFuncoes.pas',
  Vcl.Themes,
  Vcl.Styles,
  URetornaRecord in 'fontes\URetornaRecord.pas' {/URetornaSQLIndustria in 'fontes\URetornaSQLIndustria.pas';},
  URetornaSQL in 'fontes\URetornaSQL.pas',
  UCadastroOrdemProducao in 'fontes\UCadastroOrdemProducao.pas' {frmCadastroOrdemProducao},
  UCadastroComposicaoProdutoFinal in 'fontes\UCadastroComposicaoProdutoFinal.pas' {frmCadastroComposicaoProdutoFinal},
  UAtualizaOrdemProducao in 'fontes\UAtualizaOrdemProducao.pas' {frmAtualizaOrdemProducao},
  URelGeralOrdemProducao in 'fontes\URelGeralOrdemProducao.pas' {frmRelGeralOrdemProducao},
  URelEtiquetas in 'fontes\URelEtiquetas.pas' {frmRelEtiquetas};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmSisGestao, dtmSisGestao);
  Application.CreateForm(TfrmSisIndustria, frmSisIndustria);
  Application.Run;

end.
