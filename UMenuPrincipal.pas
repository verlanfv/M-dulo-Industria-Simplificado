unit UMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Menus, Vcl.ComCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Image3: TImage;
    Panel25: TPanel;
    Panel26: TPanel;
    Image2: TImage;
    Image5: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel11: TPanel;
    Panel16: TPanel;
    Panel21: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Image1: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    mnuPrincipal: TMainMenu;
    Sistema1: TMenuItem;
    Gerenciador1: TMenuItem;
    Ajuda1: TMenuItem;
    LogOut1: TMenuItem;
    Sair1: TMenuItem;
    LoginNFe1: TMenuItem;
    ShowMyPC1: TMenuItem;
    N1: TMenuItem;
    Verses1: TMenuItem;
    Sobre1: TMenuItem;
    N2: TMenuItem;
    Cadastro1: TMenuItem;
    Estoque1: TMenuItem;
    Financeiro1: TMenuItem;
    Compras1: TMenuItem;
    Cupom1: TMenuItem;
    Administrativo1: TMenuItem;
    ECDSped1: TMenuItem;
    Etiquetas1: TMenuItem;
    Faturamento1: TMenuItem;
    Fiscal1: TMenuItem;
    Importao1: TMenuItem;
    Logstica1: TMenuItem;
    Palm1: TMenuItem;
    Configuradores1: TMenuItem;
    Vendas1: TMenuItem;
    Image18: TImage;
    Image19: TImage;
    stbMenu: TStatusBar;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
    stbMenu.Panels[0].Text := 'Usuário:  2 - ANDREZA' ;
    stbMenu.Panels[1].Text := 'Empresa:  1 - BELEM IND. E COM. DE PROD. ALIM. LTDA' ;
    stbMenu.Panels[2].Text := FormatDateTime('dd/mm/yyyy',Now);
    stbMenu.Panels[3].Text := FormatDateTime('hh:mm:ss',Now);

end;

procedure TfrmMenuPrincipal.Timer1Timer(Sender: TObject);
begin
    stbMenu.Panels[2].Text := FormatDateTime('dd/mm/yyyy',Now);
    stbMenu.Panels[3].Text := FormatDateTime('hh:mm:ss',Now);
end;

end.
