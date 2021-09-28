{-------------------------------------------------------------------------------
 Programa..: uFuncoes
 Empresa...: DigiBem
 Finalidade: FunÁıes utilizadas pelo sistema

 Autor          Data     OperaÁ„o   DescriÁ„o
 Antonio Gomes  DEZ/2004 CriaÁ„o
 Vanessa        MAI/2010 AlteraÁ„o  FunÁıes: NomeUsuario, GetIP, GetMACAdress
 Vanessa        JUL/2010 AlteraÁ„o  FunÁ„o:  Aguarda_Executar
 Vanessa        DEZ/2011 AlteraÁ„o  FunÁıes: Elimina_Comandos_MySQL, ValidaLetras, SPC Consultas
 Vanessa        JAN/2012 AlteraÁ„o  FunÁÙes: GridInsertRow; Inscricao; Mascara_Inscricao; Converte_Nro_AnoMesDia
 Vanessa        JUL/2013 Vers„o 2.50   AlteraÁ„o function ValidarEmail: validaÁ„o de e-mail (ex: almox@3bsup.eb.mil.br)
 Vanessa        OUT/2013 AlteraÁ„o  Func„o: Arrumar M·scara de Telefones devido ausÍncia de DDD
                                            Localiza_Ultima_Pasta
-------------------------------------------------------------------------------}
unit uFuncoes;

interface

Uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, Printers, DB, dbctrls, Stdctrls, Math, Variants, Mapi,
    ShellAPI, Registry, Windows, Mask, Spin, CheckLst,TlHelp32, Wininet,Commctrl,
    Winsock, Grids, NB30;

type
    // Retorno da funÁ„o: Converte_Nro_AnoMesDia(iTempo : Integer) : RDATA - CriaÁ„o: 18.01.2012 - Converter N˙mero em Anos, Meses e Dias
    RDATA = record
         RD_DIA          : Integer;
         RD_MES          : Integer;
         RD_ANO          : Integer;
    end;



{  Functions  }
Function CemExtenso(StrValor: string): string;
Function ValorExtenso(Valor: extended): string;
function AllTrim(OQue : String) : String;
function PadLeft(StrToPad: String; LenToPad: Integer; StrFill: String) : String;
function PadRight(StrToPad: String; LenToPad: Integer; StrFill: String) : String;
Function Space(Numero : Integer) : string;
function ValidaData(sData : String) : Boolean;
function DiadaSemana(Data : TDateTime) : String;
function DiaSemanaAbrev(Data : TDateTime) : String;
function LetraSemana(Data : TDateTime) : String;
function CompData(sDataIni, sDataFim, sMensagem1, sMensagem2 : String) : Boolean;
function MesExtenso(Data : TDateTime) : string;
function Mes(Data : TDateTime) : string;
function NomeEstado(Sigla : String) : String;
function VerificaEstado(Sigla : String) : Boolean;
function ValidaNum(sNum : String) : Boolean;
function Confirma_Exclusao : Boolean;
function Formata_CPFCGC(Valor, Tipo: String) : string;
function Formata_CEP(CEP : String) : string;
function Formata_CFOP(CFOP: String) : string;
function Formata_Codigo_Produto(PRODUTO: String) : string;
function Substitui_Caracteres(Letras : String) : String;
function Verifica_Caracteres(Letras, TipoPessoa : String) : Boolean;
function Ver_Caracteres(Letras, VerBranco : String) : Boolean;
function Verifica_Historico(Letras, VerBranco : String) : Boolean;
function Elimina_Caracteres(Letras, Elimina, Novo : String) : String;
function Troca_Caracteres(pTexto : String) : String;
function Troca_CaracteresXML(pTexto : String) : String;
function Conta_Domingos(Dia, Mes, Ano : Integer) : Integer;
function Ultimo_Dia(Mes, Ano : Word) : Word;
//=============================================================
function VerificaFloat(sValor:String) : Boolean;
function VerificaVariavel( Variavel : Variant ) : Boolean;
function BiosDate: String;
function CorrentPrinter :String;
function DateMais(Dat:TDateTime;Numdias:Integer): TDateTime;
function JanelaExiste(Classe,Janela:String) :Boolean;
function DelphiCarregado : Boolean;
function DetectaDrv(const drive : char): boolean;
function DiasNoMes(AYear, AMonth: Integer): Integer;
function DifDateUtil(dataini,datafin:string):integer;
function DifHora(Inicio,Fim : String):String;
function DiscoNoDrive(const drive : char): boolean;
function ExisteInt(Texto:String): Boolean;
function GetDefaultPrinterName : string;
function GetMemoryTotalPhys : DWord;
function IdadeAtual(Nasc : TDate): Integer;
function IdadeN(Nascimento:TDateTime) : String;
function isdigit(c:char):boolean;
function IsPrinter : Boolean;
function MemoryReturn(Categoria: integer): integer;
function NumeroSerie(Unidade:PChar):String;
function CPUSpeed: Double;
function NumeroDeCores : Integer;
function Percentdisk(unidade: byte): Integer;
function SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
function TestaCgc(xCGC: String):Boolean;
function TestaCPF(xCPF: string) : Boolean;
function validapis(Dado : String) : boolean;
function AnoBis(Data: TDateTime): Boolean;
function mod11( cod: string; flg:longint ):string;
function Gera_Digito11( cod: String ) : String;
function Gera_DigFuncionario( cod: String ) : String;
function Gera_Digito_Contrato( cod: String ) : String;
function Gera_Digito_CtaContabil( cod: String ) : String;
function Pergunta(Mensagem,Cabecalho : String) : Boolean;
function PerguntaSim(Mensagem,Cabecalho : String) : Boolean;
function GeraDatas(Data : TDateTime; FatorSoma : Integer ) : TDateTime;
function ValidaHora(sHora :String) : Boolean;
function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): Real;
function Divide(Dividendo, Divisor : Variant): Real;
function Trunca_Numero(Numero : Variant; Decimais : Integer): Real;
function Inteiro(Numero : Variant): String;
function Decimais(Numero : Variant; Decimais : Integer): String;
function Formata_Valor(pValor : Variant; pTamanho, pDecimais : Integer) : String;
function Encripta(const sValor : String) : String;
function Decripta(const sValor : String) : String;
function EnviaEMail(Porta: Integer; Destinatario, Email, Assunto, Body : String;  Anexo: PAnsiChar): WordBool; stdcall; export;
function ValidarEmail (Email: String): Boolean;
//function NomeComputador : String;
Function HexToInt(const HexStr: string): longint;
function Digito_Agencia(pBanco : Integer;pAgencia : String) : String;
function Digito_ContaCorrente(pBanco : Integer; pAgencia, pContaCorrente : String) : String;
function Gera_Digito_ChaveAcesso( pChave: String ) : String;
Function RemoveChar(Const Texto:String):String;
function remove_caracter(sString:String):String;
//function Substitui_Caracteres_Oracle(Letras : WideString) : WideString;
function NumLinhasArq(Arqtexto:String): integer;
function Compactar(sComando: string):Boolean;
// CriaÁ„o: 20/10/2009 - Vanessa    Utilidade: Controlar DV na digitaÁ„o do cÛdigo do IBGE
function Gera_Digito_IBGE( pCodigo: String ) : String;
// CriaÁ„o: 06/12/2011 - Vanessa    Utilidade: Bloquear para n„o manipular o banco atravÈs dos campos textos do programa
function Elimina_Comandos_MySQL(Texto : WideString) : WideString;
// CriaÁ„o: 07/12/2011 - Vanessa    Utilidade: aceita somente letras
function ValidaLetras(Texto : String) : String;
// CriaÁ„o: 07/12/2011 - Vanessa    Utilidade: Validar Caracteres para consultas SPC
function SPC_Valida_Caracteres(Texto : String) : String;
// CriaÁ„o: 17.01.2012 - Vanessa    Utilidade: insere uma linha num TStringGrid AP”S uma linha escolhida.
function GridInsertRow(StrGrid: TStringGrid; Linha:integer):integer;
// CriaÁ„o: 17.01.2012 - Validar InscriÁ„o Estadual
Function Inscricao(Inscricao, Estado : String) : Boolean;
Function Mascara_Inscricao(Inscricao, Estado : String) : String;
// CriaÁ„o: 18.01.2012 - Converter N˙mero em Anos, Meses e Dias
Function Converte_Nro_AnoMesDia(iTempo : Integer) : RDATA;
// CriaÁ„o: 22.04.2013 - Colocar ponto para separar milhar
Function Formata_Valor_Milhar(sValor : String) : String;
// CriaÁ„o: 28.05.2013 - Contar ocorrencia de palavras em um texto
Function Conta_Ocorrencias_Texto(wsTexto : WideString; sPalavra : String) : Integer;
// CriaÁ„o: 06.09.2013 - Localizar ˙ltima pasta de uma string - para auxiliar quando temos um  nome para inicio do nome do arquivo no mesmo string
Function Localiza_Ultima_Pasta(sTexto: String) : String;
// CriaÁ„o: 08.02.2014 - C·lculo de DiferenÁa entre Duas Datas (DD/MM/AAAA) e Horas (HH:MM), mostrando dias, horas e minutos - Result Formato (DDDDHHMM)
Function DifereDatas_DiaHoraMinuto(pDataCompara, pDataAtual, pHoraCompara, pHoraAtual: String) : String;
// CriaÁ„o: 11.06.2016 - Separa Cidade e UF
Function Separa_Municipio(sMunicipioUF: String) : String;
// CriaÁ„o: 11.06.2016 - Separa Cidade e UF
Function Separa_UF(sMunicipioUF: String) : String;
// CriaÁ„o C·lculo Modulo 11 para Boletos 23.02.2016
function NossoNro_Modulo11(Numero: String): String;
function CodBarras_DV_Modulo11(CodBarras: String): String;
function Modulo_10(Numero:String):String;

{ Procedures }
procedure Adverte(Mensagem,Cabecalho : String);
procedure Informacao(Mensagem,Cabecalho : String);
procedure Ampulheta;
procedure Seta;
procedure Delay(iMSecs: Integer);
procedure Verifica_Data(Campo : TField; sData : String);
procedure Transforma_Hora(var pHora : String; pValor : String; var pHoras : Real; var pMinutos : Real );
procedure Transf_Hora(var pHora : String; pValor : Real; var pHoras : Real; var pMinutos : Real);
procedure Cor_Campo(Sender: TObject;Cor : Double);
procedure ApagaProcessos(sPrograma: string);
procedure Treme_Tela(Formulario : TForm; Sender : TObject);
//procedure CreateToolTips(hWnd: Cardinal);
//procedure AdicionaBalao(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PAnsiChar);

function fNextString(Text: string): string;
function fFillStringLeft(sText: string; cChar: char; nLength: integer): string;
function fFillStringRight(sText: string; cChar: char; nLength: integer): string;
function fDateBraUsa(sDateBra :string): string ;
function fAllTrim(sString :string) : string;
function fAllTrimNumeric(sString :string) :string;
function Extenso(Mnum:currency):String;
function fCheckStringDate(sString :string) : Boolean;
function fCheckStringFloat(sString :string) : Boolean;
Function FRetornaMes(Num:String):String;
function fStrReplicate(sChar:String; nLength: integer): string ;
function fStrCol(nPos: integer; sStr: string): string ;
function fStrAlign(sStr: string; nLength:integer; sAlinhamento : string; sFillChar: string): string ;
function StrIsEmpty(sStr: string): boolean ;
function fDecimalToBits(iDecimal : integer): string;
function fStringCurrencyToFloat( sString: String ): Double;
function fStringNumberClear( sString: String ; WithVirgula:integer): String;
function fStringWOPontoOuVirg( sString, tipo: String ): String;
function fExecFile(const sProgram,sDir,sParams:string; nMode:integer):THandle;
function fFindVirgula( sString: String ): integer;
procedure pAjeitaValor(var sString: String ;separador:string );
function fAjeitaValor(sString: String ; separador:string): string;
function fTrocaPontoVirgula(sString: String): string;
function fAjeitaDecimais(Str:String;Dec:integer):String;
function fRetiraVirgula(Str:String):String;
function fArredonda(Valor:real;Separator:char):real;
function fTruncaSe3CasasDecimais(Valor : real):real;
function fTrunca2CasasDecimais(Valor : Currency):Currency;
function fArredonda2CasasDecimais(Valor : Currency):Currency;
function fHextoInt(hexa:char):integer;
function DesTroca_CaracteresXML(pTexto : String) : String;
function Tira_Quebra_Linha(Texto : String) : String;
function fRetiraPonto(Str:string):String;
function ProximaPrestacao (Dia : TDateTime) : TDateTime;
procedure Volta_Cor(Sender : TObject);
procedure Recebe_Cor(Sender : TObject);
function Verifica_internet(var pAcao : String) :  boolean;
function NomeArquivo(sCaminho, sSeparador : String): String;
function RetornaUfNFE(Sigla : String) :Integer;
function RetornaUFCodNFe(CodIBGE : Integer) :String;
function Elimina_Um_Caracter(Letras, Elimina, Novo : String) : String;
function TamanhoArquivoKb(Arquivo: string): Double;
function Tira_Quebra_Pag(Texto : String) : String;
function Format_String(sValor: String; iTamanho: integer): String;
// AlteraÁ„o: 18.09.2013 - Formatar Telefone de acordo com o n˙mero de dÌgitos
function Format_TelefoneDDD(sTelefone : String) : String;
function BuscaMesExtenso(Data : String) :Integer;
function fArredonda3CasasDecimais(Valor : Currency):Currency;
function Formata_CodEstrutural(Valor,Nivel:String) : string;
function FechaPrograma(ExeFileName: string): Integer;
function Decripta_Email(Valor: string): string;
function Encripta_Email(Valor: string): string;
function VerificaCampoConsulta(sProcurar : string) :boolean;
function Maiuscula( St : String) : String;
function Miniscula( St : String) : String;
function GetIP : String;
function GetMACAdress: String;
function NomeUsuario : String;
function Aguarda_Executar(sComando: string):Boolean;
Function Verifica_SoNumero(Texto : String) : String;
//function RetornaValorTag(pXML : WideString; pTagInicial, pTagFinal : String) : String;
function FormataNumero(num: double): string;
function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;
function ProximoDiaUtil (dData : TDateTime) : TDateTime;
function Feriados(dData: TDateTime) : Boolean; // True quando È FERIADO
function Busca_Dia_Util(dData: TDateTime) : TDateTime; // busca uma data v·lida (dia ˙til e n„o feriado)
function Valida_Placa_Veiculo(sPlaca:String): Boolean;
function DataValida(Dt:String):Boolean; stdcall;

// Retorna o n˙mero de linhas que um determinado arquivo possui.
function GetNumLinhasArquivoTexto(FileName: String): Integer;

// Separar Telefones na ImportaÁ„o do Gest„o (ex: 2 telefones em 1 campo)
function Importa_Telefones(Texto: String) : String;

// Localiza DescriÁ„o da Unidade de Medida conforme tabela Unidades
function Descreve_Unidade_Medida(Texto: String) : String;

{  FUN«’ES AUTOM¡TICAS DO DELPHI
--- FunÁ„o que arredonde um valor para o prÛximo inteiro
na uses MATH - funÁ„o ceil - ex: rArredonda := ceil(rValor);
}

var
   resultado : word;
   dDatavalida : TDateTime;
   dNumValido : Double;
   dHoravalida : TTime;

   DATA : RDATA;
   {hTooltip: Cardinal;
   ti: TToolInfo;
   buffer : array[0..255] of char;}

//const
//     TTS_BALLOON = $40;
//     TTM_SETTITLE = (WM_USER + 32);

implementation

//uses // uDtmSisGestao,  uFuncoesNFe;

function DataValida(Dt:String):Boolean; stdcall;
    var Dia,Mes:Byte;
        Ano:Integer;
    function AnoBissesto(Year :Integer): boolean ;
    begin
      AnoBissesto:=(ano mod 4=0) and ( ano mod 100 <> 0) or (ano Mod 400 =0);
    end;
    begin
      Result:=False;
      if length(Trim(Dt)) = 10 then
      begin
          Dia:=StrToIntDef(Copy(Dt,1,2),0);
          Mes:=StrToIntDef(Copy(Dt,4,2),0);
          Ano:=StrToInt(Copy(Dt,7,4));
          if ( (Mes in [1,3,5,7,8,10,12]) and (Dia in [1..31]) ) or
            ( (Mes in [4,6,9,11]) and (Dia in [1..30]) ) or
            ( (Mes = 2) and ( AnoBissesto(Ano)) and (Dia in [1..29]) ) or
            ( (Mes = 2) and (not AnoBissesto(Ano)) and (Dia in [1..28]) ) then
            Result:=True;
           try
            if StrToDate(Dt)< date  then
               Result:=False;
           except
               Result:=False;
           end;
      end;


    end;
    exports DataValida;
function Maiuscula( St : String) : String;
var
   a : Integer;
begin
     for a:=1 to Length(St) do
         if (St[a]in['a'..'z']) or (St[a]in['‡'..'˝']) then
            Dec(St[a],32);
     Result:=St;
end;

function Miniscula( St : String) : String;
var
   a : Integer;
begin
     for a:=1 to Length(St) do
         if (St[a]in['A'..'Z']) or (St[a]in['¿'..'›']) then
            Inc(St[a],32);
     Result:=St;
end;

function NomeUsuario : String;
var
   Buffer : array[0..255] of Char;
   Size : dword;
   UserName: String;
begin
     Size := 256;
     GetUserName(Buffer, Size);
     UserName := Buffer;
     Result := UserName;
end;

{function RetornaValorTag(pXML : WideString; pTagInicial, pTagFinal : String) : String;
var
   iPosicaoInicial, iPosicaoFinal, iTamanho : Integer;
begin
     pXML := UpperCase(pXML);
     pTagInicial := UpperCase(pTagInicial);
     pTagFinal := UpperCase(pTagFinal);
     iPosicaoInicial := Pos(pTagInicial,pXML);
     iPosicaoFinal   := Pos(pTagFinal,pXML);
     iTamanho        := Length(pTagInicial);
     iPosicaoInicial := iPosicaoInicial + iTamanho;
     iTamanho        := iPosicaoFinal - iPosicaoInicial;
     Result := Copy(pXML,iPosicaoInicial,iTamanho);
end; }

function VerificaCampoConsulta(sProcurar : string) :boolean;
begin
 if sProcurar <> '' then
 begin
   try
   Result:=true;
   StrToInt(sProcurar);
   except
     Result:=False;
     Informacao('Codigo Invalido!!!','Verifique');
     Exit;
   end;
 end;
end;

function FormataNumero(num: double): string;
var
   str : String;
   x : Integer;
begin
      str := FloatToStr(num);
      for x := 1 to length(str) do
          if str[x] = ',' then
             str[x] := '.';
      FormataNumero := str;
end;

function Encripta_Email(Valor: string): string;
var
  I, Tamanho: Integer;
  NewValue: string;
begin
  Tamanho := Length(Valor);
  NewValue := Valor;

  for I := 0 to Tamanho do
  begin
    NewValue[I] := Chr(Trunc(Ord(NewValue[I]) * 2));
  end;

  Result := NewValue;
end;

function Decripta_Email(Valor: string): string;
var
  I, Tamanho: Integer;
  NewValue: string;
begin
  Tamanho := Length(Valor);
  NewValue := Valor;

  for I := 1 to Tamanho do
  begin
    NewValue[I] := Chr(Trunc(Ord(NewValue[I]) / 2));
  end;

  Result := NewValue;
end;


function Formata_CodEstrutural(Valor,Nivel: String) : string;
var iTipo : Integer;
begin
    iTipo := StrToInt(Nivel);
    case iTipo of
      1: Result := Copy(Valor,1,1)+
                   '. . .  .  .  .   ';
      2: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   ' .  .  .  .   ';
      3: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   Copy(Valor,3,1)+'.'+
                   '  .  .  .   ';
      5: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   Copy(Valor,3,1)+'.'+Copy(Valor,4,2)+'.'+
                   '  .  .   ';
      7: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   Copy(Valor,3,1)+'.'+Copy(Valor,4,2)+'.'+
                   Copy(Valor,6,2)+'.'+
                   '  .   ';
      9: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   Copy(Valor,3,1)+'.'+Copy(Valor,4,2)+'.'+
                   Copy(Valor,6,2)+'.'+Copy(Valor,8,2)+'.'+
                   '   ';
     12: Result := Copy(Valor,1,1)+'.'+Copy(Valor,2,1)+'.'+
                   Copy(Valor,3,1)+'.'+Copy(Valor,4,2)+'.'+
                   Copy(Valor,6,2)+'.'+Copy(Valor,8,2)+'.'+
                   Copy(Valor,10,3);
    end;
end;

function FechaPrograma(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;





function fArredonda3CasasDecimais(Valor : Currency):Currency;
begin
  Valor := Valor*1000;
  Valor := ROUND(Valor);
  Valor := (Valor/1000);
  fArredonda3CasasDecimais := Valor;
end;

function FormataValor(v: Currency): String;
begin
Result := FormatFloat('#,##0.00', v);
end;

// Mostra Telefone com DDD // AlteraÁ„o: 18.09.2013 - Formatar Telefone de acordo com o n˙mero de dÌgitos
function Format_TelefoneDDD(sTelefone : String) : String;
var iMascara : Integer;
begin
{
  if (Trim(sTelefone) <> '') then
    Result := Trim(FormatFloat('(##)####-####',StrToFloat(sTelefone)))
  else
    Result := '';
}
  sTelefone := Verifica_SoNumero(sTelefone);
  iMascara := Length(Trim(sTelefone));
  Result   := '';
  case iMascara of
    8: Result := Trim(FormatFloat('####-####',StrToFloat(sTelefone)));
    9: Result := Trim(FormatFloat('#####-####',StrToFloat(sTelefone)));
   10: Result := Trim(FormatFloat('(##)####-####',StrToFloat(sTelefone)));
   11: Result := Trim(FormatFloat('(##)#####-####',StrToFloat(sTelefone)));
  end;
end;

function Elimina_Um_Caracter(Letras, Elimina, Novo : String) : String;
var
   sTrabalho : String;
   bTrocou : Boolean;
begin
     //sTrabalho := UpperCase(Trim(Letras));
     sTrabalho := Trim(Letras);
     sTrabalho := StringReplace(sTrabalho,Elimina,Novo,[]);
     Result    := sTrabalho;
end;

{-----------------------------------------------------------------------------}
{ FunÁ„o : Copiar o Arquivo em outra pasta                                    }
{-----------------------------------------------------------------------------}
function NomeArquivo(sCaminho, sSeparador : String): String;
var i, Loc : Integer;
begin
  Loc := 0;
  for i:=0 to Length(sCaminho)-1 do
    if Trim(sCaminho[i]) = Trim(sSeparador) then
       Loc := i+1;
  Result := Copy(sCaminho,Loc,Length(sCaminho));
end;

{testa se a internet esta ativa}
function Verifica_internet(var pAcao : String) :  boolean;
var
   flags: dword;
begin
     if not InternetGetConnectedState(@flags, 0) then
     begin
          ShowMessage( 'VocÍ n„o est· conectado a Internet Consulte seu Administrador de Rede!!!!');
          WinExec('C:\Arquivos de programas\Internet Explorer\Iexplore.exe http://www.google.com.br', sw_shownormal);
          pAcao:='CANCELAR';
          Exit;
     end;
end;

 // O retorno da funÁ„o È o tamanho em Kbytes do arquivo
function TamanhoArquivoKb(Arquivo: string): Double;
begin
     with TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
          try
             Result := Size/1024;
          finally
                 Free;
          end;
end;

procedure Volta_Cor(Sender : TObject);
begin
     TMaskEdit(Sender).Color := clWhite;
     TComboBox(Sender).Color := clWhite;
     TEdit(Sender).Color := clWhite;
     TSpinEdit(Sender).Color := clWhite;
end;
procedure Recebe_Cor(Sender : TObject);
begin
     TMaskEdit(Sender).Color := clInfoBk;
     TEdit(Sender).Color := clInfoBk;
     TComboBox(Sender).Color := clInfoBk;
     TSpinEdit(Sender).Color := clInfoBk;
end;

{ Calculo do digito de acesso da chave da Nota Fiscal Eletronica }
function Gera_Digito_ChaveAcesso( pChave: String ) : String;
var
   iIndice, iDigito : Integer;
   lSoma : LongInt;
   sDigito, sChave : String;
const
     aPesos: array[1..43] of integer = (4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2);
begin
     sChave := Trim(pChave);
     if Length(sChave) <> 43 then
     begin
          Informacao('Chave de acesso inv·lida!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;

     LSoma := 0;
     for iIndice := 1 to Length(sChave) do
         lSoma := lSoma + (StrToInt(Copy(sChave,iIndice,1)) * aPesos[iIndice]);

     iDigito := lSoma mod 11;
     iDigito := 11 - iDigito;
     if iDigito > 9 then
        iDigito := 0;

     str(iDigito:1,sDigito);
     Result := sDigito;
end;

{ Calcula o digito da agÍncia banc·ria.
  Deve ser passado para a funÁ„o o n˙mero da agÍncia com o digito.
  pBanco - N˙mero do banco a ser calculado o digito.
  pAgencia - N˙mero da agÍncia a ser calculado o digito }
function Digito_Agencia(pBanco : Integer;pAgencia : String) : String;
var
   sAgenciaDigito, sAgencia : String;
   wIndice, wPesos : Word;
   iSoma, iDigito, iResto : Integer;
begin
     // Verifica o cÛdigo do banco...
     case pBanco of
          27 : begin // Banco do Estado de Santa Catarina S/A - BESC
                    sAgenciaDigito := PadLeft(Trim(pAgencia),5,'0');
                    if (Length(sAgenciaDigito) <> 5) then
                    begin
                         Result := '-1';
                         Exit;
                    end;
                    // Pega numero da agencia somente....
                    sAgencia := Copy(sAgenciaDigito,1,4);
                    iSoma := 0;
                    for wIndice := 1 to Length(sAgencia) do
                    begin
                         wPesos := 6 - wIndice;
                         iDigito := StrToInt(Copy(sAgencia,wIndice,1));
                         iSoma := iSoma + (wPesos * iDigito);
                    end;
                    // Calcula o resto da divis„o por 11...
                    iResto := (iSoma mod 11);
                    iDigito := 11 - iResto;
                    if (iResto in [1,0]) then
                       iDigito := 0;
                    Result := IntToStr(iDigito);
               end;
          else
              Result := 'X';
     end;

end;

{ Calcula o digito da conta corrente.
  Deve ser passado para a funÁ„o o n˙mero da conta com o digito.
  pBanco - N˙mero do banco a ser calculado o digito.
  pAgencia - N˙mero da agÍncia com o digito verificador.
  pContaCorrente - N˙mero da conta corrente com o digito }
function Digito_ContaCorrente(pBanco : Integer; pAgencia, pContaCorrente : String) : String;
const
     wPesos : array[1..10] of word = (3,2,9,8,7,6,5,4,3,2);
var
   sAgenciaDigito, sAgencia, sContaDigito, sConta, sPesos : String;
   wIndice : Word;
   wConta : array[1..10] of word;
   iSoma, iDigito, iResto : Integer;
begin
     // Verifica o cÛdigo do banco...
     case pBanco of
          27 : begin // Banco do Estado de Santa Catarina S/A - BESC
                    sAgenciaDigito := PadLeft(Trim(pAgencia),5,'0');
                    if (Length(sAgenciaDigito) <> 5) then
                    begin
                         Result := '-1'; Exit;
                    end;
                    // Pega numero da agencia somente....
                    sAgencia := Copy(sAgenciaDigito,1,4);
                    sContaDigito := PadLeft(Trim(pContaCorrente),13,'0');
                    if (Length(sContaDigito) <> 13) then
                    begin
                         Result := '-1'; Exit;
                    end;
                    // Pega numero da conta somente....
                    sConta := Copy(sContaDigito,7,6);
                    sConta := sAgencia+sConta;
                    sPesos := '3298765432';
                    // Calcula o digito da conta corrente...
                    iSoma := 0;
                    for wIndice := 1 to Length(sConta) do
                        iSoma := iSoma + (StrToInt(Copy(sConta,wIndice,1)) * StrToInt(Copy(sPesos,wIndice,1)));
                    // Calcula o resto da divis„o por 11...
                    iResto := (iSoma mod 11);
                    iDigito := 11 - iResto;
                    if (iResto in [1,0]) then
                       iDigito := 0;
                    Result := IntToStr(iDigito);
               end;
          41 : begin // Banco do Estado do Rio Grande do Sul S/A - Banrisul
                    sContaDigito := PadLeft(Trim(pContaCorrente),10,'0');
                    if (Length(sContaDigito) <> 10) then
                    begin
                         Result := '-1'; Exit;
                    end;
                    // Pega numero da conta somente....
                    sConta := Copy(sContaDigito,1,9);
                    sPesos := '324765432';
                    iSoma := 0;
                    for wIndice := 1 to Length(sConta) do
                        iSoma := iSoma + (StrToInt(Copy(sConta,wIndice,1)) * StrToInt(Copy(sPesos,wIndice,1)));
                    // Calcula o resto da divis„o por 11...
                    iResto := (iSoma mod 11);
                    iDigito := 11 - iResto;
                    case iResto of
                         0 : iDigito := 0;
                         1 : iDigito := 6;
                    end;
                    Result := IntToStr(iDigito);
               end;
          else
              Result := 'X';
     end;
end;

procedure ApagaProcessos(sPrograma: string);
var
      SnapShot:THandle;
      pe:TProcessEntry32;
      codigo: string;
      processo: dword;
      C: integer;
begin
      SnapShot := CreateToolhelp32Snapshot((TH32CS_SNAPPROCESS or TH32CS_SNAPTHREAD),0);
      pe.dwSize := sizeof(TProcessEntry32);
      Process32First(SnapShot,pe);
      codigo := '';
      processo := 0;

      // procura todos sPrograma abertos
      repeat
      if (String(pe.szExeFile) = sPrograma) then
      begin
      codigo := format('%x',[pe.th32ProcessID]);
      // Converte a string em dword
      for C:=1 to length(codigo) do
      begin
      processo := processo shl 4;
      if ord(codigo[C]) >= ord('A') then
      processo:=processo + (ord(codigo[C])-ord('A')+10)
      else
      processo:=processo + (ord(codigo[C])-ord('0'));
      end;
      // fecha o processo
      try
      TerminateProcess(OpenProcess($0001,false,processo),0); // $0001 = Process_Terminate.
      codigo := '';
      processo := 0;
      except
      showmessage('Falha ao encerrar o processo !');
      end;
      end;
      until Process32Next(SnapShot,pe) = false;
end;

// Procedimento para Trocar de Cor do Objeto quando Focado.
procedure Cor_Campo(Sender: TObject;Cor : Double);
begin
     TEdit(Sender).Color         := StrToInt(FloatToStr(Cor));
     TMaskEdit(Sender).Color     := StrToInt(FloatToStr(Cor));
     TCheckListBox(Sender).Color := StrToInt(FloatToStr(Cor));
     TMemo(Sender).Color         := StrToInt(FloatToStr(Cor));
     TComboBox(Sender).Color     := StrToInt(FloatToStr(Cor));
     TSpinEdit(Sender).Color     := StrToInt(FloatToStr(Cor));
end;

{function NomeComputador : String;
var
    lpBuffer : PAnsiChar;
    nSize : DWord;
const
    Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
    nSize := Buff_Size;
    lpBuffer := StrAlloc(Buff_Size);
    GetComputerName(lpBuffer,nSize);
    Result := String(lpBuffer);
    StrDispose(lpBuffer);
end;}

Function HexToInt(const HexStr: string): longint;
var
    iNdx: integer;
    cTmp: Char;
begin
    Result := 0;
    for iNdx := 1 to Length(HexStr) do
    begin
        cTmp := HexStr[iNdx];
        case cTmp of
        '0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
        'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
        'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
        else
        raise
        EConvertError.Create('Illegal character in hex string');
        end;
    end;
end;

function EnviaEMail(Porta: Integer; Destinatario, Email, Assunto, Body : String;  Anexo: PAnsiChar): WordBool; stdcall; export;
var
    MapiMessage: TMapiMessage;
    MError: Cardinal;
    Sender: TMapiRecipDesc;
    PRecip, Recipients: PMapiRecipDesc;
    PFiles, Attachments: PMapiFileDesc;
begin
    Result := False;
    Application.Handle := Porta;
    MapiMessage.nRecipCount := 1;
    GetMem(Recipients, MapiMessage.nRecipCount * sizeof(TMapiRecipDesc));
    try
        with MapiMessage do
        begin
            ulReserved := 0;
            lpszSubject := PAnsiChar(Assunto);
            lpszNoteText := PAnsiChar(Body);
            lpszMessageType := nil;
            lpszDateReceived := nil;
            lpszConversationID := nil;
            flFlags := 0;
            Sender.ulReserved := 0;
            Sender.ulRecipClass := MAPI_ORIG;
            Sender.lpszName := PAnsiChar('');
            Sender.lpszAddress := PAnsiChar('');
            Sender.ulEIDSize := 0;
            Sender.lpEntryID := nil;
            lpOriginator := @Sender;

            PRecip := Recipients;
            PRecip^.ulReserved := 0;
            PRecip^.ulRecipClass := MAPI_TO;
            PRecip^.lpszName := StrNew(PAnsiChar(Destinatario));
            PRecip^.lpszAddress := StrNew(PAnsiChar('SMTP:' + Email));
            PRecip^.ulEIDSize := 0;
            PRecip^.lpEntryID := nil;
            Inc(PRecip);
            lpRecips := Recipients;

            nFileCount := 1;
            GetMem(Attachments, nFileCount * sizeof(TMapiFileDesc));
            PFiles := Attachments;
            Attachments^.lpszPathName := Anexo;
            Attachments^.lpszFileName := PAnsiChar(ExtractFileName(Anexo));
            Attachments^.ulReserved := 0;
            Attachments^.flFlags := 0;
            Attachments^.nPosition := Cardinal(-1);
            Attachments^.lpFileType := nil;
            Inc(Attachments);
            lpFiles := PFiles;
        end;

        MError := MapiSendMail(0, Porta, MapiMessage, MAPI_DIALOG or
        MAPI_LOGON_UI or MAPI_NEW_SESSION, 0);

        case MError of
            MAPI_E_USER_ABORT: MessageDlg('OperaÁ„o abortada pelo usu·rio',
            mtInformation, [mbOk], 0);
            SUCCESS_SUCCESS: Result := True;
        else
            MessageDlg('Ocorreu um erro inesperado!'#13 +
            'CÛdigo: ' + IntToStr(MError), mtError, [mbOk], 0);
        end;
    finally
        PRecip := Recipients;
        StrDispose(PRecip^.lpszAddress);
        Inc(PRecip);
        FreeMem(Recipients, MapiMessage.nRecipCount * sizeof(TMapiRecipDesc));
        if Assigned(PFiles) then FreeMem(PFiles, MapiMessage.nFileCount * sizeof
        (TMapiFileDesc));
        Application.Handle := 0;
    end;
end;

function ValidarEmail (Email: String): Boolean;
var
  j, tam_email,
  qtd_arroba, iPosicaoArroba,
  qtd_pontos, qtd_pontos_esq, qtd_pontos_dir,
  iPosicaoAposUltimoPonto, ponto, ponto2: Integer;
  vet_email, vet_valido: Array [0..49] of String;
  msg: String;
begin
  msg            := '';
  Result         := True;
  qtd_pontos     := 0;
  qtd_pontos_esq := 0;
  qtd_pontos_dir := 0;
  qtd_arroba     := 0;
  iPosicaoArroba := 0;
  ponto          := 0;
  ponto2         := 0;
  iPosicaoAposUltimoPonto := 0;
  // Tamanho do e-mail para validaÁ„o
  tam_email      := Length (Email);
  // Verificar se Existe "@" contar quantos e armazenar posiÁ„o
  for j := 0 to tam_email - 1 do
  begin
     vet_email[j] := Copy (Email, j + 1, 1);
     if vet_email[j] = '@' then
     begin
        inc (qtd_arroba);
        iPosicaoArroba := j;
     end;
  end;
  // Verificar primeira posiÁ„o do E-mail
  if ((vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-')) then
  begin
     Result := False;
     msg    := 'Erro na validaÁ„o do E-mail!  Primeiro caracter È "'+vet_email[0]+'"' + #10 +'E-mail: '+Email;
  end;

  // Se n„o existir arroba o e-mail n„o ser· v·lido
  if qtd_arroba < 1 then
  begin
     Result := False;
     msg    := 'Erro na validaÁ„o do E-mail! N„o existe "@" no endereÁo e-mail.' + #10 +'E-mail: '+Email;
  end
  else
     // Se n„o existir mais de um arroba o e-mail n„o ser· v·lido
     if qtd_arroba > 1 then
     begin
        Result := False;
        msg    := 'Erro na validaÁ„o do E-mail! '+IntToStr(qtd_arroba)+' Arroba(s) Encontrado(s)' + #10 +'E-mail: '+Email;
     end;
  // Verificando parte final do e-mail, se o ˙ltimo caracter È inv·lido
  for j := 0 to tam_email - 1 do
      if vet_email[j] = '-' then
         if ((vet_email[j - 1] = '.') or (vet_email[j - 1] = '-')) then
         begin
            Result := False;
            msg    := 'Erro na validaÁ„o do E-mail!  ⁄ltimo caracter È "'+vet_email[j - 1]+'"' + #10 +'E-mail: '+Email;
         end;
  // caracter posicionado = j
  for j := 0 to tam_email - 1 do
      if vet_email[j] = '.' then
      begin
         inc (qtd_pontos);
         iPosicaoAposUltimoPonto := j + 1;
         // prÛximo caracter apÛs o ponto = iPosicaoAposUltimoPonto
         if j > iPosicaoArroba then
            inc (qtd_pontos_dir)
         else
            inc (qtd_pontos_esq);
         // caracter anterior ao Ponto = iPosicaoAposUltimoPonto
         if ((vet_email[j - 1] = '.') or (vet_email[j - 1] = '-')) then
         begin
            Result := False;
            msg    := 'Erro na validaÁ„o do E-mail! Caracter Anterior ao Ponto È "'+vet_email[j - 1]+'"' + #10 +'E-mail: '+Email;
         end;
      end;
  // Se n„o localizou ponto no endereÁo de e-mail
  if qtd_pontos < 1 then
  begin
     Result := False;
     msg    := 'Erro na validaÁ„o do E-mail! Nenhum PONTO Encontrado.' + #10 +'E-mail: '+Email;
  end
  else
     // SEN√O - se o ˙ltimo caracter for um ponto
     if vet_email[tam_email - 1] = '.' then
     begin
        Result := False;
        msg    := 'Erro na validaÁ„o do E-mail! ⁄ltimo caracter È "'+vet_email[tam_email - 1]+'"' + #10 +'E-mail: '+Email;
     end
     else
        // SEN√O - se o pen˙ltimo caracter for um ponto
        if vet_email[tam_email - 2] = '.' then
        begin
           Result := False;
           msg    := 'Erro na validaÁ„o do E-mail! Pen˙ltimo caracter È "'+vet_email[tam_email - 2]+'" '+ #10 +'E-mail: '+Email;
        end
        else
           // SEN√O - se a quantidade de pontos for MAIOR que 3
           if qtd_pontos_dir > 3 then // qtd_pontos_dir > 2
           begin
              Result := False;
              msg    := 'Erro na validaÁ„o do E-mail! ' + IntToStr (qtd_pontos_dir) + ' "." Encontrados a direita do "@"' + #10 +
                        'E-mail: '+Email;
           end
           else
              // SEN√O -
              if (not(
              // nro de caracteres apÛs o ˙ltimo ponto for igual a 3 E a quantidade de pontos a direita for 1
              (((tam_email - iPosicaoAposUltimoPonto) = 3) and (qtd_pontos_dir = 1))
              or
              // nro de caracteres apÛs o ˙ltimo ponto for igual a 2 E a quantidade de pontos a direita for 3
              (((tam_email - iPosicaoAposUltimoPonto) = 2) and (qtd_pontos_dir = 3))
              or
              // nro de caracteres apÛs o ˙ltimo ponto for igual a 2 E a quantidade de pontos a direita for 2
              (((tam_email - iPosicaoAposUltimoPonto) = 2) and (qtd_pontos_dir = 2))
              or
              // nro de caracteres apÛs o ˙ltimo ponto for igual a 2 E a quantidade de pontos a direita for 1
              (((tam_email - iPosicaoAposUltimoPonto) = 2) and (qtd_pontos_dir = 1))
              )) then
              begin
                 Result := False;
                 msg    := 'Erro na validaÁ„o do E-mail! ' + #10 +
                           'Ponto(s) Encontrado(s) a esquerda do "@" : ' + IntToStr (qtd_pontos_esq) + #10 +
                           'Ponto(s) Encontrado(s) a direita do "@"  : ' + IntToStr (qtd_pontos_dir) + #10 +'E-mail: '+Email;;
              end;
  // Cliente: Anderson Britto
  if trim(email) = 'unisysnfesaopaulo@br.unisys.com' then
     Result   := True;

  //VerificaÁ„o final
  if not Result then
  begin
     Informacao (msg+#13+email, 'Formato de E-mail inv·lido');
     exit;
  end;
end;

function Encripta(const sValor : String) : String;
var
   I : Byte;
   StartKey, MultKey, AddKey : Integer;
   Palavra : String;
begin

     Palavra := sValor;
     while Length(Palavra) <= 10 do
           Palavra := Palavra + ' ';

     StartKey := 764;//981;
     MultKey  := 12674;
     AddKey   := 35891;
     Result   := '';
     for i := 1 to Length(Palavra) do
     begin
          Result := Result + Char(Byte(Palavra[i]) xor (StartKey shr 8));
          StartKey := (Byte(Result[i]) + StartKey) * MultKey + AddKey;
     end;
end;

function Decripta(const sValor : String) : String;
var
   I : Byte;
   StartKey, MultKey, AddKey : Integer;
   Palavra : String;
begin
     Palavra := sValor;
     while Length(Palavra) <= 10 do
           Palavra := Palavra + ' ';

     StartKey := 764;//981;
     MultKey  := 12674;
     AddKey   := 35891;
     Result   := '';
     for i := 1 to Length(sValor) do
     begin
          Result := Result + Char(Byte(sValor[i]) xor (StartKey shr 8));
          StartKey := (Byte(sValor[i]) + StartKey) * MultKey + AddKey;
     end;
end;

function CemExtenso(StrValor: string): string;
const cCent: array[0..8] of string = ('cento', 'duzentos', 'trezentos',
								'quatrocentos', 'quinhentos', 'seicentos',
								'setecentos', 'oitocentos', 'novecentos');
	   cDez: array[0..8] of string = ('dez','vinte','trinta',
							    'quarenta', 'cinquenta', 'sessenta',
							    'setenta', 'oitenta', 'noventa');
	   cVint: array[0..8] of string = ('onze', 'doze', 'treze',
								'quatorze','quinze','dezesseis',
								'dezessete','dezoito','dezenove');
	   cUnit: array[0..8] of string = ('um', 'dois', 'trÍs',
								'quatro', 'cinco', 'seis',
								'sete', 'oito', 'nove');
var iVal: array[0..2] of integer;
	 cExt: string;
	 iCode, iValor: integer;
begin
	cExt := '';
	Val(Copy(StrValor, 1, 1), iVal[0], iCode);
	Val(Copy(StrValor, 2, 1), iVal[1], iCode);
	Val(Copy(StrValor, 3, 1), iVal[2], iCode);
	Val(StrValor, iValor, iCode);
	if iValor > 0 then
	begin
		if iValor = 100 then
			cExt := 'cem'
		else
		begin
			if iVal[0] > 0 then
			begin
				cExt := cCent[iVal[0] - 1];
				if (iVal[1] + iVal[2]) > 0 then
					cExt := cExt + ' e '
				else
					cExt := cExt + ' ';
			end;
			if (iVal[1] = 1) and (iVal[2] > 0) then
				cExt := cExt + cVint[iVal[2] - 1]
			else
			begin
				if iVal[1] > 0 then
				begin
					cExt := cExt + cDez[iVal[1] - 1];
					if iVal[2] > 0 then
						cExt := cExt + ' e '
					else
						cExt := cExt + ' ';
				end;
				if iVal[2] > 0 then
					cExt := cExt + cUnit[iVal[2] - 1];
			end;
		end;
	end;
	CemExtenso := cExt + ' ';
end;

function ValorExtenso(Valor: extended): string;
const cCifra: array[0..5,0..1] of string = (('trilhao', 'trilhoes'),
                                            ('bilhao',  'bilhoes'),
                                            ('milhao',  'milhoes'),
                                            ('mil',     'mil'),
                                            ('',        ''),
                                            ('centavo', 'centavos'));
var iTrilhoes, iBilhoes, iMilhoes, iMilhares, iCentenas, iCentavos, iCode: integer;
	 cExtenso, cStr, cTrilhoes, cBilhoes, cMilhoes, cMilhares, cCentenas, cCentavos: string;
begin
	cExtenso := '';
	if Valor > 0.0 then
	begin
		cStr := FormatFloat ('000000000000000.00', Valor);
		cTrilhoes := Copy(cStr,  1, 3);
		cBilhoes  := Copy(cStr,  4, 3);
		cMilhoes  := Copy(cStr,  7, 3);
		cMilhares := Copy(cStr, 10, 3);
		cCentenas := Copy(cStr, 13, 3);
		cCentavos := Copy(cStr, 17, 2);
		Val(cTrilhoes, iTrilhoes, iCode);
		Val(cBilhoes,  iBilhoes, iCode);
		Val(cMilhoes,  iMilhoes, iCode);
		Val(cMilhares, iMilhares, iCode);
		Val(cCentenas, iCentenas, iCode);
		Val(cCentavos, iCentavos, iCode);
		if iTrilhoes > 0 then
		begin
			cExtenso := CemExtenso (cTrilhoes);
			if iTrilhoes = 1 then
				cExtenso := cExtenso + cCifra[0][0]
			else
				cExtenso := cExtenso + cCifra[0][1];
			if ((iBilhoes = 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentenas = 0)) then
				cExtenso := cExtenso + ' de '
			else
			begin
				if (((iBilhoes > 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentenas = 0) and (iCentavos = 0)) or
					((iMilhoes > 0) and (iBilhoes = 0) and (iMilhares = 0) and (iCentenas = 0) and (iCentavos = 0)) or
					((iMilhares > 0) and (iBilhoes = 0) and (iMilhoes = 0) and (iCentenas = 0) and (iCentavos = 0)) or
					((iCentenas > 0) and (iBilhoes = 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentavos = 0)) or
					((iCentavos > 0) and (iBilhoes = 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentenas = 0))) then
					cExtenso := cExtenso + ' e '
				else
					cExtenso := cExtenso + ', ';
			end;
		end;
		if iBilhoes > 0 then
		begin
			cExtenso := cExtenso + CemExtenso (cBilhoes);
			if iBilhoes = 1 then
				cExtenso := cExtenso + cCifra[1][0]
			else
				cExtenso := cExtenso + cCifra[1][1];
			if ((iMilhoes = 0) and (iMilhares = 0) and (iCentenas = 0)) then
				cExtenso := cExtenso + ' de '
			else
			begin
				if (((iMilhoes > 0) and (iMilhares = 0) and (iCentenas = 0) and (iCentavos = 0)) or
					((iMilhares > 0) and (iMilhoes = 0) and (iCentenas = 0) and (iCentavos = 0)) or
					((iCentenas > 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentavos = 0)) or
					((iCentavos > 0) and (iMilhoes = 0) and (iMilhares = 0) and (iCentenas = 0))) then
					cExtenso := cExtenso + ' e '
				else
					cExtenso := cExtenso + ', ';
			end;
		end;
		if iMilhoes > 0 then
		begin
			cExtenso := cExtenso + CemExtenso (cMilhoes);
			if iMilhoes = 1 then
				cExtenso := cExtenso + cCifra[2][0]
			else
				cExtenso := cExtenso + cCifra[2][1];
			if ((iMilhares = 0) and (iCentenas = 0)) then
				cExtenso := cExtenso + ' de '
			else
			begin
				if (((iMilhares > 0) and (iCentenas = 0) and (iCentavos = 0)) or
                                    ((iCentenas > 0) and (iMilhares = 0) and (iCentavos = 0)) or
                                    ((iCentavos > 0) and (iMilhares = 0) and (iCentenas = 0))) then
                                      cExtenso := cExtenso + ' e '
				else
					cExtenso := cExtenso + ', ';
			end;
		end;
		if iMilhares > 0 then
		begin
			cExtenso := cExtenso + CemExtenso (cMilhares);
			if iMilhares = 1 then
				cExtenso := cExtenso + cCifra[3][0]
			else
				cExtenso := cExtenso + cCifra[3][1];
			if (iCentenas = 0) then
				cExtenso := cExtenso + ' '
			else
			begin
				if (((iCentenas > 0) and (iCentavos = 0)) or
					((iCentavos > 0) and (iCentenas = 0))) then
					cExtenso := cExtenso + ' e '
				else
					cExtenso := cExtenso + ', ';
			end;
		end;
		if iCentenas > 0 then
		begin
			cExtenso := cExtenso + CemExtenso (cCentenas);
			if iMilhares = 1 then
				cExtenso := cExtenso + cCifra[4][0]
			else
				cExtenso := cExtenso + cCifra[4][1];
		end;
		if ((iTrilhoes > 0) or (iBilhoes > 0) or (iMilhoes > 0) or (iMilhares > 0) or (iCentenas > 0)) then
		begin
			if Valor >= 2.0 then
				cExtenso := cExtenso + 'reais'
			else
				cExtenso := cExtenso + 'real';
			if iCentavos > 0 then
				cExtenso := cExtenso + ' e '
			else
				cExtenso := cExtenso + '';
			if iCentavos > 0 then
			begin
				cCentavos := FormatFloat('000', iCentavos);
				cExtenso := cExtenso + CemExtenso(cCentavos);
				if iCentavos = 1 then
					cExtenso := cExtenso + cCifra[5][0]
				else
					cExtenso := cExtenso + cCifra[5][1];
				if Valor < 1.0 then
					cExtenso := cExtenso + ' de real'
				else
					cExtenso := cExtenso + '';
			end;
		end;
	end;
	ValorExtenso := AnsiUpperCase (cExtenso);
end;
{-----------------------------------------------------------------------------}
{ FunÁ„o : retira todos os em brancos da string                               }
{ Parametros : OQue - string que ser· retirado os brancos                     }
{ Retorno :  String                                                           }
{-----------------------------------------------------------------------------}
function AllTrim(OQue : String) : String;
Begin
     While Pos(' ',OQue) > 0 do
           Delete(OQue,Pos(' ',OQue),1);
     result := OQue;
end;

{-----------------------------------------------------------------------------}
{ FunÁ„o : Abrir janela de mensagem com o Ìcone de advertÍncia                }
{ Parametros : mensagem - string que conter· a mensagem                       }
{              cabecalho - cabecalho da caixa, vazio ser· assumido "AtenÁ„o"  }
{-----------------------------------------------------------------------------}
Procedure Adverte(Mensagem,Cabecalho : String);
Begin
     if cabecalho = '' then
        cabecalho := 'AtenÁ„o';

     MessageBeep(MB_ICONASTERISK);
     resultado := Application.MessageBox(PChar(Mensagem),PChar(Cabecalho),
                  MB_APPLMODAL+MB_OK+MB_ICONWARNING);
end;
{-----------------------------------------------------------------------------}
{ FunÁ„o : Abrir janela de mensagem com o Ìcone de informaÁ„o                 }
{ Parametros : mensagem - string que conter· a mensagem                       }
{              cabecalho - cabecalho da caixa, vazio ser· assumido "AtenÁ„o"  }
{-----------------------------------------------------------------------------}
Procedure Informacao(Mensagem,Cabecalho : String);
Begin
     if cabecalho = '' then
        cabecalho := 'InformaÁ„o';
     resultado := Application.MessageBox(PChar(Mensagem),PChar(Cabecalho),
                  MB_APPLMODAL+MB_OK+MB_ICONEXCLAMATION);
end;

{-----------------------------------------------------------------------------}
{ FunÁ„o : Abrir janela de mensagem com o Ìcone de pergunta                   }
{ Parametros : mensagem - string que conter· a mensagem                       }
{              cabecalho - cabecalho da caixa, vazio ser· assumido "Pergunta" }
{-----------------------------------------------------------------------------}
function Pergunta(Mensagem,Cabecalho : String) : Boolean;
begin
     if cabecalho = '' then
        cabecalho := 'Pergunta...';
     if Application.MessageBox(PChar(Mensagem),PChar(Cabecalho),
                               MB_APPLMODAL+MB_ICONQUESTION+MB_DEFBUTTON2+
                               MB_YESNO) = IDNO THEN
        Result := False
     else
        Result := True;
end;

function PerguntaSim(Mensagem,Cabecalho : String) : Boolean;
Begin
     if cabecalho = '' then
        cabecalho := 'Pergunta...';

     if Application.MessageBox(PChar(Mensagem),PChar(Cabecalho),
                               MB_APPLMODAL+MB_ICONQUESTION+MB_DEFBUTTON1+
                               MB_YESNO) = IDNO THEN
        Result := False
     else
         Result := True;
end;


{-----------------------------------------------------------------------------}
{ FunÁ„o : retira todos os caracteres da esquerda da string                   }
{ Parametros : StrToPad - String para retirar os caracteres,                  }
{ LenToPad - tamanho para ser retirado, StrFill - caracter para ser eliminado }
{ Retorno :  String                                                           }
{-----------------------------------------------------------------------------}
function PadLeft(StrToPad: String; LenToPad: Integer; StrFill: String) : String;
var
   cStr : String;
   iCont, iLimite: Integer;
begin
     cStr := '';
     iLimite := LenToPad - Length(StrToPad);
     if LenToPad > Length(StrToPad) then
        for iCont := 1 to iLimite do
            cStr := cStr + StrFill;
     PadLeft := cStr + StrToPad;
end;

{-----------------------------------------------------------------------------}
{ FunÁ„o : retira todos os caracteres da direita da string                    }
{ Parametros : StrToPad - String para retirar os caracteres,                  }
{ LenToPad - tamanho para ser retirado, StrFill - caracter para ser eliminado }
{ Retorno :  String                                                           }
{-----------------------------------------------------------------------------}
function PadRight(StrToPad: String; LenToPad: Integer; StrFill: String) : String;
var
   cStr : String;
   iCont, iLimite: Integer;
begin
     cStr := '';
     iLimite := LenToPad - Length(StrToPad);
     if LenToPad > Length(StrToPad) then
        for iCont := 1 to iLimite do
            cStr := cStr + StrFill;
     PadRight := StrToPad + cStr;
end;

{-----------------------------------------------------------------------------}
{ Validar Datas                                                               }
{ Parametros :  DATA - string que conter· a data que ser· avaliada            }
{ Retorno : Boolean - TRUE se Inv·lida                                        }
{-----------------------------------------------------------------------------}
function ValidaData(sData :String) : Boolean;
Begin
     Result := False;  // se a data for v·lida retorna FALSE
     if AllTrim(sData) <> '//' then
     begin
         Try
            dDatavalida := StrToDate(sData);
         Except on EConvertError do
            begin
                 //Adverte('Data Inv·lida !','');
                 Result := True; // se a data for inv·lida retorna TRUE
            end;
         end;
     end;
end;

{-----------------------------------------------------------------------------}
{ Retorna o dia da semana                                                     }
{ Parametros :  DATA - Data atual                                             }
{ Retorno : string com o dia da semana                                        }
{-----------------------------------------------------------------------------}
function DiadaSemana(Data : TDateTime) : String;
Var
   i : integer;
Const
     cSemana : Array[1..7] of string = ( 'Domingo','Segunda-Feira',
                                         'Terca-Feira','Quarta-Feira',
                                         'Quinta-Feira','Sexta-Feira',
                                         'Sabado' );
Begin
     i := DayOfWeek(Data);
     if i = 0 then
     begin
          Result := 'Dia inv·lido!!!';
          Exit;
     end;
     Result := cSemana[i];
end;

function LetraSemana(Data : TDateTime) : String;
Var
   i : integer;
Const
     cSemana : Array[1..7] of string = ( 'D','S','T','Q','U','E','A' );
Begin
     i := DayOfWeek(Data);
     if i = 0 then
     begin
          Result := 'Dia inv·lido!!!';
          Exit;
     end;
     Result := cSemana[i];
end;

{-----------------------------------------------------------------------------}
{ Retorna a abreviatura do dia da semana                                      }
{ Parametros :  DATA - Data atual                                             }
{ Retorno : string com a abreviatura do dia da semana                         }
{-----------------------------------------------------------------------------}
function DiaSemanaAbrev(Data : TDateTime) : String;
Var
   i : integer;
Const
     cSemana : Array[1..7] of string = ( 'Dom','Seg','Ter','Qua','Qui','Sex',
                                         'Sab' );
Begin
     i := DayOfWeek(Data);
     if i = 0 then
     begin
          Result := 'Dia inv·lido!!!';
          Exit;
     end;
     Result := cSemana[i];
end;

function Space(Numero : Integer) : String;
var
   sSpace : String;
   i : Integer;
begin
     sSpace := '';
     for i := 1 to Numero do
         sSpace := sSpace + ' ';
     Result := sSpace;
end;

{------------------------------------------------------------------------------}
{ Testar se a Data Final È menor que a Data Inicial                            }
{ Parametros :  sDataIni - string que contera a data inicial                   }
{               sDataFim - string que contera a data final                     }
{ Retorno : Boolean - TRUE se Data Final menor  que inicial                    }
{------------------------------------------------------------------------------}
function CompData(sDataIni, sDataFim, sMensagem1, sMensagem2 : String) : Boolean;
Begin
     Result := FALSE; // se a data inicial maior que a data final
     if (alltrim(sDataIni) <> '//') and (alltrim(sDataIni) <> '//') then
     begin
          if StrToDate(sDataIni) > StrToDate(sDataFim) then
          begin
              Adverte(sMensagem2+' '+'deve ser maior que '+' '+sMensagem1,'');
              Result := True; // se a data inicial menor que a data final
          end;
     end;
end;
function BuscaMesExtenso(Data : String) :Integer;
var
idata :integer;
begin
idata:=StrToInt(Data);
case iData of
 1:data :=  'Janeiro';
 2:data :='Fevereiro';
 3:data :='MarÁo';
 4:data :='Abril';
 5:data :='Maio';
 6:data :='Junho';
 7:data :='Julho';
 8:data :='Agosto';
 9:data :='Setembro';
 10:data :='Outubro';
 11:data :='Novembro';
 12:data :='Dezembro';

end;
end;



{------------------------------------------------------------------------------}
{ Retornar o mes por extenso                                                   }
{ Parametros :  Data - data atual                                              }
{ Retorno : string com o mes                                                   }
{------------------------------------------------------------------------------}
function MesExtenso(Data : TDateTime) : string;
var
   wDia, wMes, wAno : Word;
Const
     cMeses : Array[1..12] of String = ( 'Janeiro',
                                         'Fevereiro',
                                         'Marco',
                                         'Abril',
                                         'Maio',
                                         'Junho',
                                         'Julho',
                                         'Agosto',
                                         'Setembro',
                                         'Outubro',
                                         'Novembro',
                                         'Dezembro' );
begin
     DecodeDate(Data, wDia, wMes, wAno);
     Result := cMeses[wMes];
end;

{------------------------------------------------------------------------------}
{ Retornar a sigla do mes                                                      }
{ Parametros :  Data - Data atual                                              }
{ Retorno : string com a sigla do mes                                          }
{------------------------------------------------------------------------------}
function Mes(Data : TDateTime) : string;
var
   wDia, wMes, wAno : Word;
Const
     cMeses : Array[1..12] of String = ( 'JAN','FEV','MAR','ABR','MAI','JUN',
                                         'JUL','AGO','SET','OUT','NOV','DEZ' );
begin
     DecodeDate(Data, wDia, wMes, wAno);
     Result := cMeses[wMes];
end;

{--------------------------------------------------------------------------}
{ Retornar o nome do estado por extenso                                    }
{ Parametros :  Sigla - string que conter· a sigla do estado               }
{ Retorno : String com o nome do estado                                    }
{--------------------------------------------------------------------------}
function NomeEstado(Sigla : String) : String;
var
   iPosicao, iIndice : Integer;
Const
     cEstados : Array[1..29] of String = ( 'Acre','Alagoas','Amazonas','Amap·',
                                           'Bahia','Cear·','Distrito Federal',
                                           'EspÌrito Santo','Goi·s','Maranh„o',
                                           'Minas Gerais','Mato Grosso do Sul',
                                           'Mato Grosso','Para','ParaÌba',
                                           'Pernambuco','Piaui','Paran·',
                                           'Rio de Janeiro','RondÙnia',
                                           'Rio Grande do Norte','Roraima',
                                           'Rio Grande do Sul','Santa Catarina',
                                           'Sergipe','S„o Paulo','Tocantins',
                                           'Fernando de Noronha', 'Estrangeiro' );
     cSiglas : Array[1..29] of String =  ( 'AC','AL','AM','AP','BA','CE','DF',
                                           'ES','GO','MA','MG','MS','MT','PA',
                                           'PB','PE','PI','PR','RJ','RO','RN',
                                           'RR','RS','SC','SE','SP','TO','FN',
                                           'EX' );
begin
     iPosicao := 0;
     for iIndice := 1 to High(cSiglas) do
     begin
          if cSiglas[iIndice] = Sigla then
             iPosicao := iIndice;
     end;
     if iPosicao = 0 then
        Result := 'Sigla de estado inv·lida!'
     else
         Result := cEstados[iPosicao];
end;

{----------------------------------------------------------------------------}
{ Verifica se o estado È valido ou n„o                                       }
{ Parametros : Sigla - string que conter· a sigla do estado                  }
{ Retorno : Booleano - se TRUE estado OK, se FALSE estado invalido           }
{----------------------------------------------------------------------------}
function VerificaEstado(Sigla : String) : Boolean;
var
   iPosicao, iIndice : Integer;
Const
     cSiglas : Array[1..29] of String =  ( 'AC','AL','AM','AP','BA','CE','DF',
                                           'ES','GO','MA','MG','MS','MT','PA',
                                           'PB','PE','PI','PR','RJ','RO','RN',
                                           'RR','RS','SC','SE','SP','TO','FN',
                                           'EX' );
begin
     iPosicao := 0;
     for iIndice := 1 to High(cSiglas) do
     begin
          if cSiglas[iIndice] = Sigla then
             iPosicao := iIndice;
     end;
     if iPosicao = 0 then
        Result := False
     else
         Result := True;
end;

function RetornaUfNFE(Sigla : String) :Integer;
begin
      if(Sigla  ='AC')then
         Result:= 12;
      if(Sigla  ='AL')then
         Result:= 27;
      if(Sigla  ='AM')then
         Result:= 13;
      if(Sigla  ='AP')then
         Result:= 16;
      if(Sigla  ='BA')then
         Result:= 29;
      if(Sigla  ='CE')then
         Result:= 23	;
      if(Sigla  ='DF')then
         Result:= 53;
      if(Sigla  ='ES')then
         Result:= 32;
      if(Sigla  ='GO')then
         Result:= 52;
      if(Sigla  ='MA')then
         Result:= 21;
      if(Sigla  ='MG')then
         Result:= 31;
      if(Sigla  ='MS')then
         Result:= 50	;
      if(Sigla  ='MT')then
         Result:= 51;
      if(Sigla  ='PA')then
         Result:= 15;
      if(Sigla  ='PB')then
         Result:= 25;
      if(Sigla  ='PE')then
         Result:=26;
      if(Sigla  ='PI')then
         Result:= 22;
      if(Sigla  ='PR')then
         Result:= 41;
      if(Sigla  ='RJ')then
         Result:= 33;
      if(Sigla  ='RO')then
         Result:= 11;
      if(Sigla  ='RN')then
         Result:= 24;
      if(Sigla  ='RR')then
         Result:=14;
      if(Sigla  ='RS')then
         Result:= 43;
      if(Sigla  ='SC')then
         Result:= 42;
      if(Sigla  ='SE')then
         Result:= 28;
      if(Sigla  ='SP')then
         Result:= 35;
      if(Sigla  ='TO')then
         result:=17;
      if(Sigla  ='EX')then
         result:= 99;
end;

function RetornaUFCodNFe(CodIBGE : Integer) :String;
begin
   Result := '-1';
   case CodIBGE of
    12: Result := 'AC';
    27: Result := 'AL';
    13: Result := 'AM';
    16: Result := 'AP';
    29: Result := 'BA';
    23: Result := 'CE';
    53: Result := 'DF';
    32: Result := 'ES';
    52: Result := 'GO';
    21: Result := 'MA';
    31: Result := 'MG';
    50: Result := 'MS';
    51: Result := 'MT';
    15: Result := 'PA';
    25: Result := 'PB';
    26: Result := 'PE';
    22: Result := 'PI';
    41: Result := 'PR';
    33: Result := 'RJ';
    11: Result := 'RO';
    24: Result := 'RN';
    14: Result := 'RR';
    43: Result := 'RS';
    42: Result := 'SC';
    28: Result := 'SE';
    35: Result := 'SP';
    17: Result := 'TO';
    99: Result := 'EX';
   end;
end;

{--------------------------------------------------------------------------}
{ Validar Numeros                                                          }
{ Parametros :  NUM - string que conter· numero que ser· avaliado          }
{ Retorno : Boolean - TRUE se Inv·lido                                     }
{--------------------------------------------------------------------------}
function ValidaNum(sNum :String) : Boolean;
Begin
     Result := False;  // se numero for v·lido retorna FALSE
     if AllTrim(sNum) <> '' then
     begin
         Try
            dNumValido := StrToFloat(sNum);
         Except on EConvertError do
             Result := True; // se numero for inv·lido retorna TRUE
         end;
     end
     else
        Result := True; // se numero for inv·lido retorna TRUE
end;

Function Confirma_Exclusao : Boolean;
begin
     if Application.MessageBox('Confirma Exclus„o do Registro?','ConfirmaÁ„o',
                               MB_APPLMODAL+MB_ICONQUESTION+MB_DEFBUTTON2+
                               MB_OKCANCEL) = IDCANCEL THEN
        Result := False
     else
         Result := True;
end;

Procedure Ampulheta;
Begin
     Screen.Cursor:=crHourGlass;
end;

Procedure Seta;
Begin
     Screen.Cursor:=crDefault;
end;

// Tipo: F- Fisica - CPF
//       J- Juridica - CGC



function Formata_CPFCGC(Valor, Tipo: String) : string;
begin
     if Tipo = 'F' then
        Result := Copy(Valor,1,3)+'.'+Copy(Valor,4,3)+'.'+
                    Copy(Valor,7,3)+'-'+Copy(Valor,10,2)
     else
         Result := Copy(Valor,1,2)+'.'+Copy(Valor,3,3)+'.'+
                    Copy(Valor,6,3)+'/'+Copy(Valor,9,4)+'-'+
                    Copy(Valor,13,2);
end;





function Formata_CEP(CEP: String) : string;
begin
     Result := Copy(CEP,1,2)+'.'+Copy(CEP,3,3)+'-'+Copy(CEP,6,3);
end;

function Formata_CFOP(CFOP: String) : string;
begin
     Result := Copy(CFOP,1,1)+'.'+Copy(CFOP,2,3);
end;

function Formata_Codigo_Produto(PRODUTO: String) : string;
begin
     Result := Copy(PRODUTO,1,2)+'.'+Copy(PRODUTO,3,2)+'.'+
               Copy(PRODUTO,5,2)+'.'+Copy(PRODUTO,7,2)+'.'+Copy(PRODUTO,9,1);
end;

//=======================================================================
//=======================================================================
//=======================================================================
//=======================================================================
// Retorna a data da fabricaÁ„o do Chip da Bios do sistema
function BiosDate: String;
begin
     result := string(PAnsiChar(ptr($FFFF5)));
end;

// Retorna a impressora padr„o do windows
// Requer a unit printers declarada na clausula uses da unit
function CorrentPrinter :String;
var
   Device : array[0..255] of char;
   Driver : array[0..255] of char;
   Port   : array[0..255] of char;
   hDMode : THandle;
begin
     Printer.GetPrinter(Device, Driver, Port, hDMode);
     Result := Device+' na porta '+Port;
end;

{ Soma um determinado n˙mero de dias a uma data }
function DateMais(Dat:TDateTime;Numdias:Integer): TDateTime;
begin
     Dat := Dat + Numdias;
     Result := Dat;
end;

{ Estas funÁıes servem para verificar
 se o delphi est· carregado ou n„o}
Function JanelaExiste(Classe,Janela:String) :Boolean;
var
   PClasse,PJanela : array[0..79] of char;
begin
     if Classe = '' then
        PClasse[0] := #0
     else
         StrPCopy(PClasse,Classe);
     if Janela = '' then
        PJanela[0] := #0
     else
         StrPCopy(PJanela,Janela);
     if FindWindow(PClasse,PJAnela) <> 0 then
        result := true
     else
         Result := false;
end;

Function DelphiCarregado : Boolean;
begin
//     Result :=  False;
     if JanelaExiste('TPropertyInspector','Object Inspector') then
     begin
          result := True;
     end
     else
     begin
          result := False;
     end;
end;

(*{ No evento OnCreate do form coloque:}
if not DelphiCarregado then
   showmessage('Delphi est· ativo, bom menino!')
else
begin
     Showmessage('Vc n„o poder· utilizar esta aplicaÁ„o! Mau garoto!');
     application.terminate;
end;*)

{Detecta quantas unidade possui no computador}
function DetectaDrv(const drive : char): boolean;
var
   Letra: string;
begin
     Letra := drive + ':\';
     if GetDriveType(PChar(Letra)) < 2 then
     begin
          result := False;
     end
     else
     begin
          result := True;
     end;
end;

// Retorna quantos dias tem um referido mes do ano
function DiasNoMes(AYear, AMonth: Integer): Integer;
var
   dData : TDateTime;
   sData : String;
   iDias : Integer;
   DaysInMonth : array[1..12] of Integer;
begin
     DaysInMonth[01] := 31; DaysInMonth[02] := 28; DaysInMonth[03] := 31;
     DaysInMonth[04] := 30; DaysInMonth[05] := 31; DaysInMonth[06] := 30;
     DaysInMonth[07] := 31; DaysInMonth[08] := 31; DaysInMonth[09] := 30;
     DaysInMonth[10] := 31; DaysInMonth[11] := 30; DaysInMonth[12] := 31;
     {if Length(IntToStr(AYear)) <> 4 then
     begin
          Adverte( 'ERRO FATAL......'+#13+
                   'Parametro errado na funÁ„o DIASNOMES()!'+#13+
                   'Ano deve ter 4 digitos.','Aviso');
          Application.Terminate;
     end;}
     sData := '01/'+PadLeft(IntToStr(Amonth),2,'0')+'/'+IntToStr(AYear);
     dData := StrToDate(sData);
     if AMonth = 2 then
     begin
          if AnoBis(dData) then
          begin
               DaysInMonth[AMonth] := DaysInMonth[AMonth] + 1;
          end;
     end;
     iDias := DaysInMonth[AMonth];
     if AMonth = 2 then
        DaysInMonth[AMonth] := 28;
     Result := iDias;
end;

{Retorna a quantidade de dias uteis entre duas datas}
function DifDateUtil(dataini,datafin:string):integer;
var a,b,c:tdatetime;
    ct,s:integer;
begin
     if StrToDate(DataFin) < StrtoDate(DataIni) then
     begin
          Result := 0;
          exit;
     end;
     ct := 0;
     s := 1;
     a := strtodate(dataFin);
     b := strtodate(dataIni);
     if a > b then
     begin
          c := a;
          a := b;
          b := c;
          s := 1;
     end;
     a := a + 1;
     while (dayofweek(a)<>2) and (a <= b) do
     begin
          if dayofweek(a) in [2..6] then
          begin
               inc(ct);
          end;
          a := a + 1;
     end;
     ct := ct + round((5*int((b-a)/7)));
     a := a + (7*int((b-a)/7));
     while a <= b do
     begin
          if dayofweek(a) in [2..6] then
          begin
               inc(ct);
          end;
          a := a + 1;
     end;
     if ct < 0 then
     begin
          ct := 0;
     end;
     result := s*ct;
end;

{Retorna a diferenÁa entre duas horas}
function DifHora(Inicio,Fim : String):String;
var
   FIni,FFim : TDateTime;
begin
     Fini := StrTotime(Inicio);
     FFim := StrToTime(Fim);
     If (Inicio > Fim) then
     begin
          Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
     end
     else
     begin
          Result := TimeToStr(FFim-Fini);
     end;
end;

{Detecta se h· disco no Drive}
function DiscoNoDrive(const drive : char): boolean;
var
   DriveNumero : byte;
   EMode : word;
begin
     EMode := 0;
     result := false;
     DriveNumero := ord(Drive);
     if DriveNumero >= ord('a') then
     begin
          dec(DriveNumero,$20);
          EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
     end;
     try
        if DiskSize(DriveNumero-$40) = -1 then
        begin
             Result := False;
        end
        else
        begin
             Result := True;
        end;
     Except
           SetErrorMode(EMode);
     end;
end;

{Testa se em uma string existe um numero inteiro valido ou n„o}
function ExisteInt(Texto:String): Boolean;
var
   i, iIndice :integer;
   bResultado : Boolean;
begin
     for iIndice := 1 to Length(Trim(Texto)) do
     begin
          i := 0;
          //bResultado := (Copy(Texto,iIndice,1) in ['0','1','2','3','4','5','6','7','8','9']);

          try
             i := StrToInt(Copy(Texto,iIndice,1));
             bResultado := True;
          except
               begin
                    bResultado := False;
                    Break;
               end
          end;
          if i>0 then
             i := 1;
     end;
     Result := bResultado;
end;

// Retorna o nome da impressora padr„o do Windows
function GetDefaultPrinterName : string;
begin
     if(Printer.PrinterIndex > 0)then
     begin
          Result := Printer.Printers[Printer.PrinterIndex];
     end
     else
     begin
          Result := 'Nenhuma impressora Padr„o foi detectada';
     end;
end;

// Retorna o total de memoria do computador
function GetMemoryTotalPhys : DWord;
var
   ms : TMemoryStatus;
begin
     ms.dwLength := SizeOf( ms );
     GlobalMemoryStatus( ms );
     Result := ms.dwTotalPhys;
end;

// Retorna a idade Atual de uma pessoa a partir da data de nascimento
// Esta funÁ„o retorna a idade em formato integer
function IdadeAtual(Nasc : TDate): Integer;
Var AuxIdade, Meses : String;
    MesesFloat : Real;
    IdadeInc, IdadeReal : Integer;
begin
     AuxIdade := Format('%0.2f', [(Date - Nasc) / 365.6]);
     Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));
     if AuxIdade = '0' then
     begin
          Result := 0;
          Exit;
     end;
     if Meses[1] = '-' then
     begin
          Meses := FloatToStr(StrToFloat(Meses) * -1);
     end;
     Delete(Meses, 1, 2);
     if Length(Meses) = 1 then
     begin
          Meses := Meses + '0';
     end;
     if (Meses <> '0') And (Meses <> '') then
     begin
          MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30.47)
     end
     else
     begin
          MesesFloat := 0;
     end;
     if MesesFloat <> 12 then
     begin
          IdadeReal := Trunc(StrToFloat(AuxIdade)); // + MesesFloat;
     end
     else
     begin
          IdadeInc := Trunc(StrToFloat(AuxIdade));
          Inc(IdadeInc);
          IdadeReal := IdadeInc;
     end;
     Result := IdadeReal;
end;

// Retorna a idade de uma pessoa a partir da data de nascimento
function IdadeN(Nascimento:TDateTime) : String;
Type
    Data = Record
           Ano : Word;
           Mes : Word;
           Dia : Word;
    End;
Const
     Qdm:String = '312831303130313130313031'; // Qtde dia no mes
Var
   Dth : Data;                         // Data de hoje
   Dtn : Data;                         // Data de nascimento
   anos, meses, dias, nrd : Shortint;  // Usadas para calculo da idade
begin
     DecodeDate(Date,Dth.Ano,Dth.Mes,Dth.Dia);
     DecodeDate(Nascimento,Dtn.Ano,Dtn.Mes,Dtn.Dia);
     anos := Dth.Ano - Dtn.Ano;
     meses := Dth.Mes - Dtn.Mes;
     if meses < 0 then
     begin
          Dec(anos);
          meses := meses+12;
     end;
     dias := Dth.Dia - Dtn.Dia;
     if dias < 0 then
     begin
          nrd := StrToInt(Copy(Qdm,(Dth.Mes-1)*2-1,2));
          if ((Dth.Mes-1)=2) and ((Dth.Ano Div 4)=0) then
          begin
               Inc(nrd);
          end;
          dias := dias+nrd;
          meses := meses-1;
     end;
     Result := IntToStr(anos)+' Anos '+IntToStr(meses)+
               ' Meses '+IntToStr(dias)+' Dias';
end;

// Testa se o dado È um digito (numero) ou
// um caractere qualquer
function isdigit(c:char):boolean;
begin
     result := c in ['0'..'9']
end;

{Testa se a impressora est· ativa ou n„o, retornando .t.
 em caso positivo}
function IsPrinter : Boolean;
Const
    PrnStInt  : Byte = $17;
    StRq      : Byte = $02;
    PrnNum    : Word = 0;  { 0 para LPT1, 1 para LPT2, etc. }
Var
   nResult : byte;
Begin  (* IsPrinter*)
     Asm
        mov ah,StRq;
        mov dx,PrnNum;
        Int $17;
        mov nResult,ah;
     end;
     IsPrinter := (nResult and $80) = $80;
End;

// Retorna a memoria do sistema
// voce pode usar a tabela abaixo para fazer as devidas modificaÁıes
Function MemoryReturn(Categoria: integer): integer;
var
   MemoryStatus: TMemoryStatus;
   Retval : Integer;
begin
     RetVal := 0;
     MemoryStatus.dwLength:= sizeof(MemoryStatus);
     GlobalMemoryStatus(MemoryStatus);
     if categoria > 8 then
     begin
          Retval := 0;
     end;
     case categoria of
          1: Retval := MemoryStatus.dwTotalPhys;     // bytes de memÛria fÌsica
          2: Retval := MemoryStatus.dwLength;        // sizeof(MEMORYSTATUS)
          3: Retval := MemoryStatus.dwMemoryLoad;    // percentual de memÛria em uso
          4: Retval := MemoryStatus.dwAvailPhys;     // bytes livres de memÛria fÌsica
          5: Retval := MemoryStatus.dwTotalPageFile; // bytes de paginaÁ„o de arquivo
          6: Retval := MemoryStatus.dwAvailPageFile; // bytes livres de paginaÁ„o de arquivo
          7: Retval := MemoryStatus.dwTotalVirtual;  // bytes em uso de espaÁo de endereÁo
          8: Retval := MemoryStatus.dwAvailVirtual;  // bytes livres
     end;
     result := Retval;
end;

{Retorna o N˙mero serial da unidade especificada}
function NumeroSerie(Unidade:PChar):String;
var
   VolName,SysName : AnsiString;
   SerialNo,MaxCLength,FileFlags : DWord;
begin
     try
        SetLength(VolName,255);
        SetLength(SysName,255);
        GetVolumeInformation(Unidade,PChar(VolName),255,@SerialNo,
        MaxCLength,FileFlags,PChar(SysName),255);
        result := IntToHex(SerialNo,8);
     except
           result := ' ';
     end;
end;

{Retorna a porcentagem de espaÁo livre em uma unidade de disco}
function Percentdisk(unidade: byte): Integer;
var
   A,B, Percentual : longint;
begin
     if DiskFree(Unidade)<> -1 then
     begin
          A := DiskFree(Unidade) div 1024;
          B := DiskSize(Unidade) div 1024;
          Percentual:=(A*100) div B;
          result := Percentual;
     end
     else
     begin
          result := -1;
     end;
end;

{Permite que vocÍ altere a data e a hora do sistema}
function SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
var
   tSetDate: TDateTime;
   vDateBias: Variant;
   tSetTime: TDateTime;
   vTimeBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
     GetTimeZoneInformation(tTZI);
     vDateBias := tTZI.Bias / 1440;
     tSetDate := tDate + vDateBias;
     vTimeBias := tTZI.Bias / 1440;
     tSetTime := tTime + vTimeBias;
     with tST do
     begin
          wYear := StrToInt(FormatDateTime('yyyy', tSetDate));
          wMonth := StrToInt(FormatDateTime('mm', tSetDate));
          wDay := StrToInt(FormatDateTime('dd', tSetDate));
          wHour := StrToInt(FormatDateTime('hh', tSettime));
          wMinute := StrToInt(FormatDateTime('nn', tSettime));
          wSecond := StrToInt(FormatDateTime('ss', tSettime));
          wMilliseconds := 0;
     end;
     SystemDateTime := SetSystemTime(tST);
end;

{Testa se o CGC È v·lido ou n„o}
{
function TestaCgc(xCGC: String):Boolean;
Var
   d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
   Check : String;
   LocalResult : Boolean;
begin
     d1 := 0;
     d4 := 0;
     xx := 1;
     for nCount := 1 to Length( xCGC )-2 do
     begin
          if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
          begin
               if xx < 5 then
               begin
                    fator := 6 - xx;
               end
               else
               begin
                    fator := 14 - xx;
               end;
               d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
               if xx < 6 then
               begin
                    fator := 7 - xx;
               end
               else
               begin
                    fator := 15 - xx;
               end;
               d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
               xx := xx+1;
          end;
     end;
     resto := (d1 mod 11);
     if resto < 2 then
     begin
          digito1 := 0;
     end
     else
     begin
          digito1 := 11 - resto;
     end;
     d4 := d4 + 2 * digito1;
     resto := (d4 mod 11);
     if resto < 2 then
     begin
          digito2 := 0;
     end
     else
     begin
          digito2 := 11 - resto;
     end;
     Check := IntToStr(Digito1) + IntToStr(Digito2);
     if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
     begin
          LocalResult := False;
     end
     else
     begin
          LocalResult := True;
     end;

    if localResult then
       localResult := not ((Length(Trim(xCGC)) <> 14) or
                           (Trim(xCGC) = '11111111111111') or
                           (Trim(xCGC) = '22222222222222') or
                           (Trim(xCGC) = '33333333333333') or
                           (Trim(xCGC) = '44444444444444') or
                           (Trim(xCGC) = '55555555555555') or
                           (Trim(xCGC) = '66666666666666') or
                           (Trim(xCGC) = '77777777777777') or
                           (Trim(xCGC) = '88888888888888') or
                           (Trim(xCGC) = '99999999999999') or
                           (Trim(xCGC) = '00000000000000'));

     Result := LocalResult;
end;
}

{Testa se o n˙mero do pis È v·lido ou n„o}
function validapis(Dado : String) : boolean;
var
   i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
     if AllTrim(Dado) <> '' Then
     begin
          wdv := strtoint(copy(Dado, 11, 1));
          wsoma := 0;
          wm11 := 2;
          for i := 1 to 10 do
          begin
               wsoma := wsoma + (wm11 *strtoint(copy(Dado,11 - I, 1)));
               if wm11 < 9 then
               begin
                    wm11 := wm11+1
               end
               else
               begin
                    wm11 := 2;
               end;
          end;
          wdigito := 11 - (wsoma MOD 11);
          if wdigito > 9 then
          begin
               wdigito := 0;
          end;
          if wdv = wdigito then
          begin
               validapis := true;
          end
          else
          begin
               validapis := false;
          end;
     end;
end;

{Testa se um ano È bixesto, retornando True em caso positivo}
function AnoBis(Data: TDateTime): Boolean;
var
   Dia,Mes,Ano : Word;
begin
     DecodeDate(Data,Ano,Mes,Dia);
     if Ano mod 4 <> 0 then
     begin
          AnoBis := False;
     end
     else
         if Ano mod 100 <> 0 then
         begin
              AnoBis := True;
         end
         else
             if Ano mod 400 <> 0 then
             begin
                  AnoBis := False;
             end
             else
             begin
                  AnoBis := True;
             end;
end;

//
// Promove um estado de espera no aplicativo
//
procedure Delay(iMSecs: Integer);
var
   lnTickCount: LongInt;
begin
     lnTickCount := GetTickCount;
     repeat
           Application.ProcessMessages;
     until ((GetTickCount - lnTickCount) >= LongInt(iMSecs));
end;

function mod11( cod: string; flg:longint ):string;
var f ,C,CD, SCHK : integer;
    aa,cc:string;
begin
     schk := 0;
     CD   := 0;
     C := 1;
     COD:=TRIM(COD);

        {FLG=0 sÛ retorna DC n„o avisa se esta incorreto}
        {FLG=1 retorna DC e avisa se incorreto}
 	{FLG=3 recebeu so numero s/codigo}


     if FLG=3 then COD:=COD+'0' ;
     C:=0;
     if length(cod) < 14 then for c:=length(cod) to 14-1 do cod:='0'+cod;
     cc   := cod[14];
     {showmessage(inttostr(length(cod)));
     showmessage(cod);}
     for f:=13 downto 1 do
       BEGIN
         C := C+1;
         if C > 9 then C := 2 ;
         schk:=schk + strtoint(copy(COD,f,1)) * C;
       END;
       {showmessage(inttostr(schk) );}
     CD := schk mod 11 ;
     CD := 11 - CD ;
     if CD >= 10 then CD := 0;

     str(CD:1,aa);
     if flg = 1 then if aa <> cc then showmessage('DÌgito controle inv·lido !');

     mod11:=aa;
end;

function Gera_Digito11( cod: String ) : String;
var
     iIndice, iSoma, iDigito : Integer;
     sDigito : String;
const
     cPesos = '875432';
begin
     if Length(Cod) <> 6 then
     begin
          Informacao('CÛdigo inv·lido!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;

     iSoma := 0;
     for iIndice := 1 to Length(Cod) do
     begin
          iSoma := iSoma + (StrToInt(Copy(Cod,iIndice,1)) *
                            StrToInt(Copy(cPesos,iIndice,1)));
     end;

     iDigito := iSoma mod 11;
     iDigito := 11 - iDigito;
     if iDigito > 9 then
        iDigito := StrToInt(Copy(IntToStr(iDigito),2,1));

     //if iDigito > 10 then
     //   iDigito := 1;


     str(iDigito:1,sDigito);
     Result := sDigito;
end;

function Gera_Digito_Contrato( cod: String ) : String;
var
     iIndice, iSoma, iDigito : Integer;
     sDigito, sContrato : String;
const
     aPesos: array[1..10] of integer = (11,10,9,8,7,6,5,4,3,2);
begin
     sContrato := Trim(Cod);
     if Length(sContrato) <> 10 then
     begin
          Informacao('Contrato inv·lido!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;

     iSoma := 0;
     for iIndice := 1 to Length(sContrato) do
     begin
          iSoma := iSoma + (StrToInt(Copy(sContrato,iIndice,1)) *
                            aPesos[iIndice]);
     end;

     iDigito := iSoma mod 11;
     iDigito := 11 - iDigito;
     if iDigito >= 10 then
        iDigito := 0;

     str(iDigito:1,sDigito);
     Result := sDigito;
end;

function Gera_Digito_CtaContabil( cod: String ) : String;
var
     iIndice, iSoma, iDigito : Integer;
     sDigito, sConta : String;
const
     aPesos: array[1..9] of integer = (3,2,9,8,7,5,4,3,2);
begin
     sConta := Trim(Cod);
     if Length(sConta) <> 9 then
     begin
          Informacao('Conta contabil inv·lida!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;

     iSoma := 0;
     for iIndice := 1 to Length(sConta) do
     begin
          iSoma := iSoma + (StrToInt(Copy(sConta,iIndice,1)) *
                            aPesos[iIndice]);
     end;

     iDigito := iSoma mod 11;
     iDigito := 11 - iDigito;
     if iDigito > 9 then
        iDigito := iDigito - 10;

     str(iDigito:1,sDigito);
     Result := sDigito;
end;

function Gera_DigFuncionario( cod: String ) : String;
var
     iIndice, iSoma, iDigito, iDigFunc : Integer;
     sDigito : String;
const
     cPesos = '765432';
begin
     if Length(Cod) <> 6 then
     begin
          Informacao('CÛdigo inv·lido!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;

     iSoma := 0;
     for iIndice := 1 to Length(Cod) do
     begin
          iSoma := iSoma + (StrToInt(Copy(Cod,iIndice,1)) *
                            StrToInt(Copy(cPesos,iIndice,1)));
     end;

     iDigito := iSoma mod 11;
     iDigito := 11 - iDigito;
     if iDigito = 10 then
        iDigFunc := 0
     else
         if iDigito = 11 then
            iDigFunc := 1
         else
             iDigFunc := iDigito;

     str(iDigFunc:1,sDigito);
     Result := sDigito;
end;

function Elimina_Caracteres(Letras, Elimina, Novo : String) : String;
var
   sTrabalho : String;
   bTrocou : Boolean;
begin
     //sTrabalho := UpperCase(Trim(Letras));
     sTrabalho := Trim(Letras);
     bTrocou := False;
     repeat
           bTrocou := (Pos(Elimina, sTrabalho) <> 0);
           sTrabalho := StringReplace(sTrabalho,
                                      Elimina,
                                      Novo,
                                      [rfReplaceAll]);
     until not bTrocou;
     Result := sTrabalho;
end;

{function Substitui_Caracteres_Oracle(Letras : WideString) : WideString;
var
   sFinal, sTrabalho : WideString;
   iIndice, iPosicao : Integer;
const
     sCaracteres = '·‡„‚‰¡¿√¬ƒÈËÍÎ…» ÀÌÏÓÔÕÃŒœÛÚÙıˆ”“‘’÷˙˘˚¸⁄Ÿ€‹Ò—Á««˝ˇ›ü';
     sValidos    = 'aaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUUnNcCCyyYY';
begin
     //sTrabalho := UpperCase(Trim(Letras));
     sTrabalho := Trim(Letras);
     sFinal := Trim(sTrabalho);

     for iIndice := 1 to Length(Trim(sTrabalho)) do
     begin
          iPosicao := Pos(Copy(sTrabalho,iIndice,1),sCaracteres);
          if iPosicao <> 0 then
          begin
               sFinal := StringReplace(sFinal,
                                       Copy(sCaracteres,iPosicao,1),
                                       Copy(sValidos,iPosicao,1),
                                       [rfReplaceAll]);
          end;
     end;
     Result := sFinal;
end; }

function Substitui_Caracteres(Letras : String) : String;
var
   sFinal, sTrabalho : String;
   iIndice, iPosicao : Integer;
const
     sCaracteres = '·‡„‚‰¡¿√¬ƒÈËÍÎ…» ÀÌÏÓÔÕÃŒœÛÚÙıˆ”“‘’÷˙˘˚¸⁄Ÿ€‹Ò—Á«˝ˇ›ü∫™';
     sValidos    = 'aaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUUnNcCyyYYoa';
begin
     //sTrabalho := UpperCase(Trim(Letras));
     sTrabalho := Trim(Letras);
     sFinal := Trim(sTrabalho);

     for iIndice := 1 to Length(Trim(sTrabalho)) do
     begin
          iPosicao := Pos(Copy(sTrabalho,iIndice,1),sCaracteres);
          if iPosicao <> 0 then
          begin
               sFinal := StringReplace(sFinal,
                                       Copy(sCaracteres,iPosicao,1),
                                       Copy(sValidos,iPosicao,1),
                                       [rfReplaceAll]);
          end;
     end;
     Result := sFinal;
end;

function Verifica_Caracteres(Letras, TipoPessoa : String) : Boolean;
var
   sTrabalho, sCaracter : String;
   iIndice : Integer;
   bRetorno, bErro : Boolean;
begin
     bRetorno := True;
     bErro := False;
     sTrabalho := UpperCase(Trim(Letras));
     for iIndice := 1 to Length(sTrabalho) do
     begin
          sCaracter := Copy(sTrabalho,iIndice,1);
          if (sCaracter <> ' ') and (not (sCaracter[1] in ['A'..'Z'])) then
          begin
               bErro := True;
               if TipoPessoa = 'J' then
                  if (sCaracter[1] in ['0'..'9']) then
                     bErro := False;
               if bErro then
               begin
                    Informacao('Caracter inv·lido!!!'+#13+
                               'Caracter digitado: '+sCaracter,
                               'Aviso...');
                    bRetorno := False;
                    Break;
               end;
          end;
     end;
     Result := bRetorno;
end;

// Verifica caracteres para campos de Identidade, Orgao Emissor, Endereco,
//   Complemento, Bairro  e Cidade
// Deixa "passar" letras, numeros e os caracteres / (barra) e - (hifen)
function Ver_Caracteres(Letras, VerBranco : String) : Boolean;
var
   sTrabalho, sCaracter : String;
   iIndice : Integer;
   bRetorno : Boolean;
begin
     bRetorno := True;
     sTrabalho := UpperCase(Trim(Letras));
     for iIndice := 1 to Length(sTrabalho) do
     begin
          sCaracter := Copy(sTrabalho,iIndice,1);
          if (sCaracter = ' ') then
             if (VerBranco = 'VERBRANCO') then
             begin
                  Informacao('InformaÁ„o n„o aceita espaÁos em branco!!!',
                          'Aviso...');
                  bRetorno := False;
                  Break;
             end
             else
                 Continue;
          if (not (sCaracter[1] in ['A'..'Z'])) and
             (not (sCaracter[1] in ['0'..'9'])) and
             (Trim(sCaracter) <> '/') and
             (Trim(sCaracter) <> '-') then
          begin
               Informacao('Caracter inv·lido!!!'+#13+
                          'Caracter digitado: '+sCaracter,
                          'Aviso...');
               bRetorno := False;
               Break;
          end;
     end;
     Result := bRetorno;
end;

// Verifica caracteres para histÛrico
function Verifica_Historico(Letras, VerBranco : String) : Boolean;
var
   sTrabalho, sCaracter : String;
   iIndice : Integer;
   bRetorno : Boolean;
begin
     bRetorno := True;
     sTrabalho := UpperCase(Trim(Letras));
     for iIndice := 1 to Length(sTrabalho) do
     begin
          sCaracter := Copy(sTrabalho,iIndice,1);
          if (sCaracter = ' ') then
             if (VerBranco = 'VERBRANCO') then
             begin
                  Informacao('InformaÁ„o n„o aceita espaÁos em branco!!!',
                          'Aviso...');
                  bRetorno := False;
                  Break;
             end
             else
                 Continue;
          if (not (sCaracter[1] in ['A'..'Z'])) and
             (not (sCaracter[1] in ['0'..'9'])) and
             (Trim(sCaracter) <> '*') and
             (Trim(sCaracter) <> '/') and
             (Trim(sCaracter) <> '-') then
          begin
               Informacao('Caracter inv·lido!!!'+#13+
                          'Caracter digitado: '+sCaracter,
                          'Aviso...');
               bRetorno := False;
               Break;
          end;
     end;
     Result := bRetorno;
end;

//
// Verifica se a variavel passada com parametro e nulas ou n„o.
// Se for nula devolve TRUE; se estiver OK devolve FALSE
//
function VerificaVariavel( Variavel : Variant ) : Boolean;
var
   bRetorno : Boolean;
begin
     case VarType(Variavel) of
          varString : bRetorno := (VarIsNull(Variavel)) or (Trim(Variavel) = '');
          varDate : bRetorno := (VarIsNull(Variavel)) or
                                (AllTrim(DateToStr(Variavel)) = '//') or
                                (ValidaData(DateToStr(Variavel)));
          varCurrency : bRetorno := (VarIsNull(Variavel)) or (Variavel <= 0);
          varInteger : bRetorno := (VarIsNull(Variavel)) or (Variavel <= 0);
     end;
     Result := bRetorno;
end;

{
function TestaCPF(xCPF: string) : Boolean;
var
  localCPF       : string;
  localResult    : boolean;
  digit1, digit2 : integer;
  ii,soma        : integer;
begin
  localCPF := '';
  localResult := False;

  // analisa CPF no formato 999.999.999-00
  if Length(xCPF) = 14 then
    if (Copy(xCPF,4,1)+Copy(xCPF,8,1)+Copy(xCPF,12,1) = '..-') then
      begin
      localCPF := Copy(xCPF,1,3) + Copy(xCPF,5,3) + Copy(xCPF,9,3) +
                   Copy(xCPF,13,2);
      localResult := True;
      end;

  // analisa CPF no formato 99999999900
  if Length(xCPF) = 11 then
    begin
    localCPF := xCPF;
    localResult := True;
    end;

    // comeca a verificacao do digito
    if localResult then
    try
      // 1∞ digito
      soma := 0;
      for ii := 1 to 9 do Inc(soma, StrToInt(Copy(localCPF, 10-ii, 1))*(ii+1));
      digit1 := 11 - (soma mod 11);
      if digit1 > 9 then digit1 := 0;

      // 2∞ digito
      soma := 0;
      for ii := 1 to 10 do Inc(soma, StrToInt(Copy(localCPF, 11-ii, 1))*(ii+1));
      digit2 := 11 - (soma mod 11);
      if digit2 > 9 then digit2 := 0;

      // Checa os dois dÌgitos
      if (Digit1 = StrToInt(Copy(localCPF, 10, 1))) and
         (Digit2 = StrToInt(Copy(localCPF, 11, 1))) then
         localResult := True
      else
         localResult := False;
    except
      localResult := False;
    end;

    if localResult then
       localResult := not ((Length(Trim(xCPF)) <> 11) or
                           (Trim(xCPF) = '11111111111') or
                           (Trim(xCPF) = '22222222222') or
                           (Trim(xCPF) = '33333333333') or
                           (Trim(xCPF) = '44444444444') or
                           (Trim(xCPF) = '55555555555') or
                           (Trim(xCPF) = '66666666666') or
                           (Trim(xCPF) = '77777777777') or
                           (Trim(xCPF) = '88888888888') or
                           (Trim(xCPF) = '99999999999') or
                           (Trim(xCPF) = '00000000000'));

    Result := localResult;
end;
}

procedure Verifica_Data(Campo : TField; sData : String);
var
   dData : TDateTime;
begin
     try
        dData := StrToDate(sData);
     except
           Informacao('Data inv·lida!!!!','Aviso...');
           Abort;
           Exit;
     end;
     Campo.Value := dData;
end;

function VerificaFloat(sValor:String) : Boolean;
var
   bFloatValido : Boolean;
begin
     bFloatValido := True;
     if Trim(sValor) <> '' then
     begin
          try
             StrToFloat(sValor);
          except
                on EConvertError do
                begin
                     Informacao('Valor inv·lido....','Aviso...');
                     bFloatValido := False;
                end;
          end;
     end;
     Result := bFloatValido;
end;

// Gera as data para o crediario
function GeraDatas(Data : TDateTime; FatorSoma : Integer ) : TDateTime;
var
   wAno, wMes, wDia : Word;
   dtDataGerar : TDateTime;
const
     DiasNoMes: array[1..12] of Integer = ( 31, 28, 31, 30, 31, 30, 31, 31, 30,
                                            31, 30, 31);
begin
     DecodeDate(Data, wAno, wMes, wDia);

     Inc(wMes, FatorSoma);
     if wMes > 12 then // Mes maior que 12
     begin
          wMes := 1;
          Inc(wAno);
     end;

     if (wDia > 28) and (wMes = 2) then
        if not AnoBis(EncodeDate(wAno,wMes,1)) then
           wDia := DiasNoMes[wMes]
        else
        begin // … bissexto e dia maior que 29
             if wDia > 29 then
                wDia := 29
        end;

     if wMes <> 2 then
        if wDia > DiasNoMes[wMes] then
           wDia := DiasNoMes[wMes];

     Result := EncodeDate(wAno,wMes,wDia);
end;

{-----------------------------------------------------------------------------}
{ Validar Horas                                                               }
{ Parametros :  Hora - string que conter· a hora que ser· avaliada            }
{ Retorno : Boolean - TRUE se Inv·lida                                        }
{-----------------------------------------------------------------------------}
function ValidaHora(sHora :String) : Boolean;
Begin
     Result := False;  // se a hora for v·lida retorna FALSE
     if AllTrim(sHora) <> ':' then
     begin
         Try
            dHoravalida := StrToTime(sHora);
         Except on EConvertError do
            begin
                 Adverte('Hora Inv·lida !','');
                 Result := True; // se a hora for inv·lida retorna TRUE
            end;
         end;
     end;
end;

function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): Real;
{Retorna a diferenca de dias entre duas datas}
Var Data: TDateTime;
    dia, mes, ano: Word;
begin
     if DataAtual < DataVenc then
     begin
          Result := -99;
     end
     else
     begin
          Data := DataAtual - DataVenc;
          DecodeDate( Data, ano, mes, dia);
          Result := StrToFloat(FloatToStr(Data));
     end;
end;

function Divide(Dividendo, Divisor : Variant): Real;
var
   iResDiv : Integer;
   rMultiplica, rFinal : Real;
begin
     iResDiv := Trunc( fArredonda2CasasDecimais(Dividendo / Divisor) );
     rMultiplica :=iResDiv * Divisor;
     rFinal := fArredonda2CasasDecimais(rMultiplica) -
               fArredonda2CasasDecimais(Dividendo);
     Result := rFinal;
end;

function Trunca_Numero(Numero : Variant; Decimais : Integer): Real;
var
   sNumero : String;
   iPosicao : Integer;
   rNumero : Real;
begin
     sNumero := FloatToStr(Numero);
     iPosicao := Pos(',',sNumero);
     if iPosicao = 0 then
     begin
          sNumero := sNumero + ',' +PadLeft('0',Decimais,'0');
          iPosicao := Pos(',',sNumero);
     end;
     sNumero := Copy(sNumero,1,(iPosicao-1))+','+Copy(sNumero,(iPosicao+1),Decimais);
     rNumero := StrToFloat(sNumero);
     Result := rNumero;
end;

function Inteiro(Numero : Variant): String;
var
   sNumero : String;
   iPosicao : Integer;
begin
     sNumero := FloatToStr(Numero);
     iPosicao := Pos(',',sNumero);
     if iPosicao <> 0 then
     begin
          sNumero := Copy(sNumero,1,(iPosicao-1));
     end;
     Result := sNumero;
end;

function Decimais(Numero : Variant; Decimais : Integer): String;
var
   sNumero  : String;
   iPosicao : Integer;
begin
     sNumero  := FloatToStr(Numero);
     iPosicao := Pos(',',sNumero);
     if iPosicao <> 0 then
     begin
          sNumero := Copy(sNumero,(iPosicao+1),(Length(sNumero)-iPosicao));
          sNumero := Copy(sNumero,1,Decimais);
     end
     else
         sNumero := '0';

     Result := sNumero;
end;

//
// Retorna a frequencia do processador usado
//
function CPUSpeed: Double;
const
     DelayTime = 500; // measure time in ms
var
   TimerHi, TimerLo: DWORD;
   PriorityClass, Priority: Integer;
begin
     PriorityClass := GetPriorityClass(GetCurrentProcess);
     Priority := GetThreadPriority(GetCurrentThread);
     SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
     SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
     Sleep(10);
     asm
        dw 310Fh // rdtsc
        mov TimerLo, eax
        mov TimerHi, edx
     end;
     Sleep(DelayTime);
     asm
        dw 310Fh // rdtsc
        sub eax, TimerLo
        sbb edx, TimerHi
        mov TimerLo, eax
        mov TimerHi, edx
     end;
     SetThreadPriority(GetCurrentThread, Priority);
     SetPriorityClass(GetCurrentProcess, PriorityClass);
     Result := TimerLo / (1000.0 * DelayTime);
end;

{Retorna a quantidade atual de cores no Windows (16, 256, 65536 = 16 ou 24 bit}
function NumeroDeCores : Integer;
var
   DC:HDC;
   BitsPorPixel: Integer;
begin
     Dc := GetDc(0); // 0 = vÌdeo
     BitsPorPixel := GetDeviceCaps(Dc,BitsPixel);
     Result := 2 shl (BitsPorPixel - 1);
end;

// Retorno o numero de domingos de um determinado mes
// Parametros: Mes - Mes para retorno dos domingos
//             Ano - Ano para retorno dos domingos
function Conta_Domingos(Dia, Mes, Ano : Integer) : Integer;
var
   dDataInicial, dDataFinal  : TDateTime;
   iDiasFinal, iContaDomingos : Integer;
begin
     //iDiasFinal := DiasNoMes(Ano, Mes);
     //dDataFinal := EnCodeDate(Ano,Mes,iDiasFinal);
     dDataInicial := EnCodeDate(Ano,Mes,1);
     dDataFinal   := EnCodeDate(Ano,Mes,Dia);
     iContaDomingos := 0;
     dDataInicial := dDataInicial - 1;
     while (dDataInicial <= dDataFinal) do
     begin
          dDataInicial := dDataInicial + 1;
          // Verifica se È domingo
          if DayOfWeek(dDataInicial) = 1 then
             Inc(iContaDomingos);
     end;
     Result := iContaDomingos;
end;


{function ExitWindowsEx(uFlags : integer;  		 // shutdown operation
                   dwReserved : word) : boolean; // reserved
         external 'user32.dll' name 'ExitWindowsEx';

procedure Tchau;
const
     EWX_LOGOFF   = 0; // D· "logoff" no usu·rio atual
     EWX_SHUTDOWN = 1; // "Shutdown" padr„o do sistema
     EWX_REBOOT   = 2; // D· "reboot" no equipamento
     EWX_FORCE    = 4; // ForÁa o tÈrmino dos processos
     EWX_POWEROFF = 8; // Desliga o equipamento
begin
     ExitWindowsEx(EWX_FORCE, 0);
end;}

// Retorno a hora no formato hh:mm ou hhh:mm,
//         o valor da hora e o valor do minuto separadamente
// Parametros: Hora
{procedure Transforma_Hora(var pHora : String; pValor : Real; var pHoras : Real; var pMinutos : Real);
var
   iPosicao : Integer;
   sValor, sHoras, sMinutos : String;
begin
     sValor     := FloatToStr(pValor);
     iPosicao   := Pos(',',sValor);
     if iPosicao = 0 then
     begin
          sMinutos := '00';
          sHoras   := sValor;
     end
     else
     begin
          sHoras   := Copy(sValor,1,(iPosicao-1));
          sMinutos := PadRight(Copy(sValor,(iPosicao+1),(Length(sValor)-iPosicao)),2,'0');
     end;
     pHoras := StrToFloat(sHoras);
     pMinutos := StrToFloat(sMinutos);
     pHora := sHoras+':'+sMinutos;
end;}
procedure Transforma_Hora( var pHora : String; pValor : String;
                           var pHoras : Real; var pMinutos : Real );
var
   iPosicao, iMinutoInteiro, iMinutoResto : Integer;
   sHoras, sMinutos : String;
begin
     iPosicao := Pos(',',pValor);
     if iPosicao = 0 then
     begin
          sMinutos := '00';
          sHoras   := pValor;
     end
     else
     begin
          sHoras   := Copy(pValor,1,(iPosicao-1));
          sMinutos := PadLeft(Copy(pValor,(iPosicao+1),(Length(pValor)-iPosicao)),2,'0');
     end;
     pHoras := StrToFloat(sHoras);
     pMinutos := StrToFloat(sMinutos);
     if pMinutos >= 60 then
     begin
          iMinutoInteiro := Trunc(pMinutos / 60);
          iMinutoResto := Trunc(pMinutos - iMinutoInteiro * 60);
          pHoras := pHoras + iMinutoInteiro;
          pMinutos := iMinutoResto;
          sHoras := FloatToStr(pHoras);
          sMinutos := PadLeft(FloatToStr(pMinutos),2,'0');
     end;
     pHoras := StrToFloat(sHoras);
     pMinutos := StrToFloat(sMinutos);
     pHora := sHoras+':'+sMinutos;
end;

procedure Transf_Hora( var pHora : String; pValor : Real; var pHoras : Real;
                       var pMinutos : Real );
var
   iPosicao : Integer;
   sValor, sHoras, sMinutos : String;
begin
     sValor     := FloatToStr(pValor);
     iPosicao   := Pos(',',sValor);
     if iPosicao = 0 then
     begin
          sMinutos := '00';
          sHoras   := sValor;
     end
     else
     begin
          sHoras   := Copy(sValor,1,(iPosicao-1));
          sMinutos := PadRight(Copy(sValor,(iPosicao+1),(Length(sValor)-iPosicao)),2,'0');
     end;
     pHoras := StrToFloat(sHoras);
     pMinutos := StrToFloat(sMinutos);
     pHora := sHoras+':'+sMinutos;
end;

function Ultimo_Dia(Mes, Ano : Word) : Word;
var
   Data : TDateTime;
   Dia : Word;
Const
     aDias : array[1..12] of Word = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
     Dia := aDias[Mes];
     if Mes = 2 then // ver ano bisexto
     begin
          Data := EncodeDate(Ano,Mes,1);
          if AnoBis(Data) then
             Dia := 29;
     end;
     Result := Dia
end;

// FormataÁ„o de valores...
// pValor -> valor a ser formatado
// pTamanho -> tamanho total do valor
// pDecimais -> quantas decimais no valor final
// A funÁ„o recebe valores numericos e formata-os com decimais ou n„o
// Se pTamanho = 17 e pDecimais = 5 o valor final deve ter 12 casas inteiras
//  e 5 decimais => 999999999999.99999
// Ex.:
//*--------*-----------*----------*
//! pValor ! pDecimais ! SaÌda    !
//*--------*-----------*----------*
//!  0     !         5 !  0,00000 !
//!  0     !         3 !  0,000   !
//!  0,1   !         5 !  0,10000 !
//!  0,23  !         3 !  0,230   !
//!  0,234 !         2 !  0,23    !
//! 21,356 !         4 ! 21,3560  !
//*--------*-----------*----------*
function Formata_Valor(pValor : Variant; pTamanho, pDecimais : Integer) : String;
var
   sParteInteiraMascara, sParteDecimalMascara, sMascara : String;
begin
     if (Trim(pValor) = '') then
        pValor := 0;
     sParteInteiraMascara := '0';
     sParteInteiraMascara := PadLeft(sParteInteiraMascara,pTamanho-pDecimais,'#');
     sParteDecimalMascara := PadRight(sParteDecimalMascara,pDecimais,'0');
     sMascara := sParteInteiraMascara+'.'+sParteDecimalMascara;
     pValor := Trunca_Numero(pValor,pDecimais);
     Result := Trim(FormatFloat(sMascara,pValor));
end;

//.....retira o caracter '.' da string....
function fRetiraPonto(Str:string):String;
var i:integer;
    straux:string;
begin
    straux:='';
    for i:=1 to length(Str) do
    begin
      if Str[i]<>'.' then
        Straux:=Straux+Str[i];
    end;
    fRetiraPonto := StrAux;
end;

//.....se numero de casas depois da virgula >2 entao trunca...
function fTruncaSe3CasasDecimais(Valor : real):real;
var StrValor,StrAux : string;
    i,position,conta:integer;
begin
 StrValor := floattostrf(Valor,ffFixed,9,6);
 StrAux   := '';
 position :=0;
 conta :=0;
 for i:=1 to length(StrValor) do
 begin
   if conta <3 then StrAux := StrAux + StrValor[i];
   if StrValor[i]=',' then position :=i;
   if position > 0 then conta := conta+1;
 end;
 fTruncaSe3CasasDecimais := StrtoFloat(StrAux);
end;

//.....se numero de casas depois da virgula >2 entao arredonda...
function fArredonda(Valor:real;Separator:char):real;
//var str,straux:string;
//    nI:integer;
begin
// straux := '';
// str:=floattostr(Valor);
// for nI:=1 to length(str) do
// begin
//   if str[nI]
// end;
end;

//.......Retorna o valor decimal de 1 caraxter(hexa)...................
function fHextoInt(hexa:char):integer;
begin
     try
        fHextoInt:=strtoint(hexa);
     except
           on E:exception do
           begin
                if Upcase(hexa)='A' then
                   fHextoInt:=10
                else
                    if Upcase(hexa)='B' then
                       fHextoInt:=11
                    else
                        if Upcase(hexa)='C' then
                           fHextoInt:=12
                        else
                            if Upcase(hexa)='D' then
                               fHextoInt:=13
                            else
                                if Upcase(hexa)='E' then
                                   fHextoInt:=14
                                else
                                    if Upcase(hexa)='F' then
                                       fHextoInt:=15;
           end;
     end;
end;

//.......ajeita as casas decimais.....................
function fAjeitaDecimais(Str:String;Dec:integer):String;
begin
  Str := Trim(Str);
  if fFindVirgula(Str)=0 then
     Str := Str+',';
  if fFindVirgula(Str)=1 then Str:=fAjeitaValor(Str,',')
  else
  begin
       Str:=copy(Str,1,length(Str)-DEC) + ',' +copy(Str,length(Str)-(DEC-1),DEC);
  end;
  fAjeitaDecimais:=Str;
end;

//.................................................
function fRetiraVirgula(Str:String):String;
var i:integer;
    Str2:string;
begin
    for i:=1 to length(Str) do
    begin
      if Str[i]<>chr(44) then
        Str2:=Str2+Str[i];
    end;
 fRetiraVirgula:=Str2;
end;


//-------------------------------------------------------
function fNextString(Text: string): string;
var str1: string;
    cAux: char;
    LenEdit: integer;
begin
   LenEdit:=  length( Text );
   Str1:= Copy(Text, 1, LenEdit -1 );
   cAux:= Text[LenEdit];
   cAux:= chr(ord(cAux)+1);
   Str1:= Str1 + cAux;
   fNextString:= Str1;
end;

//-------------------------------------------------------
function fFillStringLeft(sText: string; cChar: char; nLength: integer): string;
var nN: integer;
    sFill: string;

begin
    nLength:= nLength - length(sText);
    sFill:= sText;

    for nN:=1 to nLength do
    begin
         sFill:= cChar + sFill;
    end;
    fFillStringLeft:= sFill;

end;

//-------------------------------------------------------
function fFillStringRight(sText: string; cChar: char; nLength: integer): string;
var nN: integer;
    sFill: string;

begin
    nLength:= nLength - length(sText);
    sFill:= sText;

    for nN:=1 to nLength do
    begin
         sFill:=sFill + cChar ;
    end;
    fFillStringRight:= sFill;
end;

//-------------------------------------------------------
function fDateBraUsa(sDateBra :string):string ;
var sDay, sMonth, sYear, sDate :string;
begin
     sDay        := copy(sDateBra, 1, 2);
     sMonth      := copy(sDateBra, 4, 2);
     sYear       := copy(sDateBra, 7, length(sDateBra) - 6);
     sDate       := sMonth+'/'+sDay+'/'+sYear;
     fDateBraUsa := sDate;
end;

//-------------------------------------------------------
function fAllTrim(sString :string) :string;
var nI :integer;
    sNewString :string;
begin
     sNewString:='';
     for nI:= 1 to length(sString) do
     begin
         if sString[nI] <> ' ' then
              sNewString:= sNewString + Copy(sString, nI, 1);
     end;
     fAlltrim := sNewString;
end;

//-------------------------------------------------------
//-------------------------------------------------------
function fAllTrimNumeric(sString :string) :string;
var nI :integer;
    sNewString :string;
begin
     sNewString:='';
     for nI:= 1 to length(sString) do
     begin
         if sString[nI] <> ' ' then
         begin
           if (sString[nI]='1')OR(sString[nI]='2')OR(sString[nI]='3')OR(sString[nI]='4')OR
           (sString[nI]='5')OR(sString[nI]='6')OR(sString[nI]='7')OR(sString[nI]='8')OR
           (sString[nI]='9')OR(sString[nI]='0')  then
              sNewString:= sNewString + Copy(sString, nI, 1);
         end;
     end;
     fAllTrimNumeric := sNewString;
end;

//-------------------------------------------------------


function fCheckStringDate(sString :string) : Boolean;
var lDataValida: Boolean;
begin
  lDataValida:= true;
  try
    strtodate(sString);
  except
    on E:Exception do
      begin
        MessageDlg('      Data Inv·lida      ', mtWarning, [mbOk], 0);
        lDataValida:= false;
      end;
  end;
  fCheckStringDate:= lDataValida;
end;

//-------------------------------------------------------
function fCheckStringFloat(sString :string) : Boolean;
var lFloatValido: Boolean;
begin
  lFloatValido:= true;
  if sString <> '' then
  begin
     try  StrToFloat(sString);
     except
       on E:Exception do
         begin
           MessageDlg('      Valor Invalido      ', mtWarning, [mbOk], 0);
           lFloatValido:= false;
         end;
     end;
  end;
  fCheckStringFloat:= lFloatValido;
end;

//-------------------------------------------------------
function fStrReplicate(sChar:String; nLength: integer): string;
var sStr: string;
    i: integer ;
begin
   sStr:='';
   for i:=1 to nLength do sStr:= sStr + sChar;
   fStrReplicate:= sStr ;
end;

//-------------------------------------------------------
function fStrCol( nPos: integer; sStr: string ): string ;
var nAdd : integer;
begin
   nAdd:= 1 ;
   if nPos < 1 then
   begin
      nAdd:= 0;
      nPos:= 0;
   end;
   fStrCol:=  fStrReplicate(' ', nPos - nAdd) + sStr ;
end;

//-------------------------------------------------------
function fStrAlign( sStr: string; nLength:integer; sAlinhamento : string; sFillChar: string ): string ;
var nFill, i, j,  nMod: integer;
begin
  if length(sStr) > nLength then sStr:= copy(sStr, 0, nLength);
  sAlinhamento:= fAllTrim(UpperCase( sAlinhamento ));
  //......................................
  if sAlinhamento = 'RIGHT' then
  begin
     nFill:= nLength - length( sStr ) ;
     for i:= 1 to nFill do  sStr:= sFillChar + sStr ;
  end;

  //......................................
  if sAlinhamento = 'LEFT' then
  begin
     nFill:= nLength - length( sStr ) ;
     for i:= 1 to nFill do  sStr:= sStr + sFillChar;
  end;

  //......................................
  if sAlinhamento = 'CENTER' then
  begin
     nFill:= nLength - length( sStr ) ;
     nMod:= nFill mod 2;
     j:= nFill div 2;
     if nMod = 0 then
     begin
       for i:= 1 to j do  sStr:=  sFillChar + sStr;
       for i:= 1 to j do  sStr:=   sStr + sFillChar;
     end
     else
     begin
       for i:= 1 to j do  sStr:=  sFillChar + sStr;
       for i:= 1 to j + 1 do  sStr:= sStr + sFillChar;
     end;
  end;
  fStrAlign:= sStr;
end;

//-------------------------------------------------------
function StrIsEmpty(sStr: string): boolean ;
begin
  StrIsEmpty:= (length(sStr) = 0 );
end;

//-------------------------------------------------------
function fDecimalToBits( iDecimal : integer ): string;
var iNumerador: integer;
    sBits: string;
begin
   sBits:= '';
   iNumerador:= iDecimal;
   while iNumerador > 1 do
   begin
      sBits:= inttostr( iNumerador mod 2 ) + sBits;
      iNumerador:= (iNumerador div 2);
   end;

   if iNumerador = 1 then sBits:=  '1' + sBits;
   if iNumerador = 0 then sBits:=  '0' + sBits;

   fDecimalToBits:= fStrAlign( sBits, 8,'RIGHT','0');

end;

//-------------------------------------------------------
function fStringCurrencyToFloat( sString: String ): Double;
var nI :integer;
    Aux , x :String;
begin
     for nI:= 1 to length(sString) do
     begin
          x:= copy(sString,nI,1);
          // a ... z  e ,
          if ( ( x >= chr(43) ) and ( x <= chr(57) ) ) and ( x<> chr(46) ) then Aux:= Aux + x;
     end;

     try fStringCurrencyToFloat := StrToFloat(Aux);
     except on EconvertError do fStringCurrencyToFloat :=0.00; end;
end;

//-------------------------------------------------------
function fStringNumberClear( sString: String ;WithVirgula :integer): String;
var  nI : integer;
     Aux , x :String;
begin
     for nI:= 1 to length(sString) do
     begin
          x:= copy(sString,nI,1);
          // a ... z  e ,      // 44 =,      46=.
          if WithVirgula = 1 then
             if ( ( x >= chr(48) ) and ( x <= chr(57) ) ) or ( x = chr(44) )  then Aux:= Aux + x;
          if WithVirgula = 0 then
             if ( x >= chr(48) ) and ( x <= chr(57) ) then Aux:= Aux + x;
     end;
     fStringNumberClear := Aux;
end;

//-------------------------------------------------------
function fFindVirgula( sString: String ): integer;
var  retorno, nI : integer;
     x :String;
begin
     retorno:=0;

     for nI:= 1 to length(sString) do
     begin
          x:= copy(sString,nI,1);

          if x = chr(44)  then
          begin
             retorno:= 1;
             break;
          end;
     end;
     fFindVirgula:= retorno;
end;

//-------------------------------------------------------
{ ... verifique funcao fAjeitaValor (MELHOR) ... }
procedure pAjeitaValor(var sString: String ; separador:string);
var  x, newString :String;
     nI, nPosVirgula, nNumeroDepois: integer;
     lVirgula, lNumeroAntes, lChanged : boolean;
begin

     lVirgula     := false;
     lNumeroAntes := false;
     nNumeroDepois:=-1;
     nPosVirgula  := 1;
     for nI:= 1 to length(sString) do
     begin
       x:= copy(sString,nI,1);

       if x = separador {chr(44)} then //.. virgula ou ponto
       begin
            lVirgula:= true;
            nPosVirgula:=nI;
       end;

       if not lVirgula then lNumeroAntes:= true;
       if lVirgula then nNumeroDepois:= nNumeroDepois +1;
     end;

     if nPosVirgula=1 then lNumeroAntes:= false;

     if lVirgula then
     begin
          if (nNumeroDepois < 2) and (nNumeroDepois <> -1) then
          begin
             newString:= sString + fStrReplicate('0', 2-nNumeroDepois);
             lChanged:= true;
          end;
          if not lNumeroAntes then
          begin
             newString:= '0' +separador+ sString;
             lChanged:= true;
          end;
     end
     else
     begin
        newString:= sString +separador+'00';
        lChanged:= true;
     end;

     if lChanged then sString:= newString;

end;

//-------------------------------------------------------
function fAjeitaValor(sString: String ; separador:string): string;
var  x, newString, milhar :String;
     nI, nPosVirgula, nNumeroDepois: integer;
     lVirgula, lNumeroAntes, lChanged : boolean;
begin

     lChanged:=false;
     lVirgula:= false;
     lNumeroAntes:= false;
     nNumeroDepois:=-1;
     if separador = ',' then milhar:='.' else milhar:=',';

     for nI:= 1 to length(sString) do
     begin
          x:= copy(sString,nI,1);

          if x = chr(44) then
          begin
               lVirgula:= true;
               nPosVirgula:=nI;
          end;
          if not lVirgula then lNumeroAntes:= true;
          if lVirgula then nNumeroDepois:= nNumeroDepois +1;
     end;

     if lVirgula then
     begin
          if (nNumeroDepois < 2) and (nNumeroDepois <> -1) then
          begin
             newString:= sString + fStrReplicate('0', 2-nNumeroDepois);
             lChanged:= true;
          end;
          if not lNumeroAntes then
          begin
             newString:= '0' + newString;  //..era sString
             lChanged:= true;
          end;
     end
     else
     begin
        if sString <> '' then  newString:= sString +separador+'00'
        else newString:= '0' +separador+'00';
        lChanged:= true;
     end;

     //if length(newString)>=7 then newString:= copy(newString,1,1) + milhar + copy(newString,2,length(newString));

     if lChanged then fAjeitaValor:= newString
     else fAjeitaValor:= sString;

end;

//-------------------------------------------------------
function fStringWOPontoOuVirg( sString, tipo: String ): String;
var  nI : integer;
     Aux , x :String;
begin

     for nI:= 1 to length(sString) do
     begin
          x:= copy(sString,nI,1);
          // ...
          if (tipo = ',') and (x <> '.') then Aux:= Aux + x;
          if (tipo = '.') and (x <> ',') then Aux:= Aux + x;

     end;
     fStringWOPontoOuVirg:= Aux;
end;

//-------------------------------------------------------
function fExecFile(const sProgram,sDir,sParams:string; nMode:integer):THandle;
var zFileName, zParams, zDir : array[0..79] of char;
begin
  Result:= ShellExecute(Application.MainForm.Handle, nil,
                        StrPCopy(zFileName,sProgram),
                        StrPCopy(zParams,sParams),
                        StrPCopy(zDir,sDir), nMode);
end;

//-------------------------------------------------------
function fTrocaPontoVirgula(sString: String): string;
var nI:integer ; newString:string;
begin
     newString:='';

     for nI:=1 to length(sString) do
     begin
        if copy(sString,nI,1) = ',' then newString:= newString + '.'
        else if copy(sString,nI,1) = '.' then newString:= newString + ','
        else newString:= newString + copy(sString,nI,1);
     end;
     fTrocaPontoVirgula:= newString;
end;
//------------------------------------------------------------------------------
function fTrunca2CasasDecimais(Valor : Currency):Currency;
begin
  Valor := Valor*100;
  Valor := TRUNC(Valor);
  Valor := (Valor/100);
  fTrunca2CasasDecimais := Valor;
end;
//------------------------------------------------------------------------------
function fArredonda2CasasDecimais(Valor : Currency):Currency;
begin
  Valor := Valor*100;
  Valor := ROUND(Valor);
  Valor := (Valor/100);
  fArredonda2CasasDecimais := Valor;
end;
//------------------------------------------------------------------------------
//------------ FunÁıes implementadas--------------------------------------
Function Extenso(Mnum:currency):String;

  Function NrBaixos(mNumB : Integer):String;
   Const mStrNumB: array[0..18] of PAnsiChar =
   ('UM','DOIS','TRES','QUATRO','CINCO','SEIS',
    'SETE','OITO', 'NOVE','DEZ','ONZE','DOZE',
    'TREZE','QUATORZE', 'QUINZE','DEZESSEIS',
    'DEZESSETE', 'DEZOITO','DEZENOVE');
   Begin
   result   := mStrNumb[mNumB -1]+' ';
   End;

   Function Nrmedios(mNumM : Integer): String;
   Var mStrNumM, mStrDig : String;
    Begin
     If mNumM < 20 Then Result := NrBaixos(mNumM)
     else Begin
     Result := '';
     mStrDig := '00'+IntToStr(mNumm);
     mStrDig:= Copy(mStrDig,Length(mStrDig)-1,2);
     mStrNumM:='VINTE    TRINTA    QUARENTA'+
     'CINQUENTASESSENTA SETENTA  '+
     'OITENTA  NOVENTA  ';
     Result := TrimRight(copy(mStrNumM,((StrToInt(mStrDig[1])-2)*9)+1,9))+' ';
     If StrToInt(mStrdig[2]) > 0 Then
     Result := Result + 'E '+ NrBaixos(StrToInt(mStrDig[2]));
     End;
    End;

 Function NrAltos(mNumA:Integer): String;
 Var mStrNumA,mStrDig : String;
 Begin
  If mNumA = 100 Then Result := 'CEM ' else
  Begin
  Result := '';
  mStrDig := '00'+IntToStr(mNumA);
  mStrDig := Copy(mStrDig,Length(mStrDig)-2,3);
  mStrNuma:= 'CENTO        DUZENTOS   '+
   'TREZENTOS   QUATROCENTOS'+
   'QUINHENTOS  SEISCENTOS  SETECENTOS  '+
   'OITOCENTOS   NOVECENTOS  ';
   If StrToint(mStrDig[1]) > 0 Then
   Result := TrimRight(copy(mStrNumA,((StrToInt(mStrdig[1])-1)*12)+1,12))+' ';
    If StrToInt(copy(mStrdig,2,2)) > 0 Then
    Begin
      If length(result) > 0 Then
      Result:= Result + 'E ';
      Result := Result +NrMedios(StrToInt(copy(mStrdig,2,2)));
    End;
   End;
  End;

   Var
   mStrNomes,StrPart,mNumString:String;
   i, numpart,mPos:integer; partDec : real;
   Begin
   Result:='';
   mNumString := FormatFloat('00000000000000',mNum*100);
   mStrnomes:='BILHAO  BILHOES MILHAO  MILHOES '+
     ' MIL    MIL     ';
   for i:=1 to 4 do
   Begin
   StrPart := Copy(mNumString,((i-1)*3)+1,3);
   numPart := StrToInt(strPart);
   if numPart = 1 Then mpos := 1 else mpos:= 8;
   If numPart > 0 Then
   Begin
   if Length(result) > 0 Then
   Result := Result + ', ';
   Result :=Result + NrAltos(numPart);
   Result := Result + TrimRight(copy(mStrNomes,((i-1)*16) + mpos,8));
   If not i = 4 Then Result := Result + ' ';
   End;
   End;;
   If Length(Result) > 0 Then
   Begin
   If Int(mNum) =1 Then Result:=Result + 'REAL' else result:=Result + ' REAIS ';
   end;
   If frac(mNum) > 0 Then
   Begin
   If Length(Result)>0 Then Result:=Result+' E ';
   PartDec:=(mNum - Int(mnum))*100;
   numpart := Trunc(partdec);
   If partdec = 1 then
   Result := Result + 'UM CENTAVO '
   else Result:=Result + Nrmedios(NumPart) + 'CENTAVOS ';
   end;
   Result:=Result+'* * * * * * * * ';
  Extenso := Result;
end;
//------------------------------------------------------------------------------
function FRetornaMes(Num:String) : String;
begin
 If (Num='01') or (Num='1') Then FRetornaMes:='JANEIRO'
  Else If (Num='02') or (Num='2') Then FRetornaMes:='FEVEREIRO'
  Else If (Num='03') or (Num='3') Then FRetornaMes:='MARCO'
  Else If (Num='04') or (Num='4') Then FRetornaMes:='ABRIL'
  Else If (Num='05') or (Num='5') Then FRetornaMes:='MAIO'
  Else If (Num='06') or (Num='6') Then FRetornaMes:='JUNHO'
  Else If (Num='07') or (Num='7') Then FRetornaMes:='JULHO'
  Else If (Num='08') or (Num='8') Then FRetornaMes:='AGOSTO'
  Else If (Num='09') or (Num='9') Then FRetornaMes:='SETEMBRO'
  Else If (Num='10') Then FRetornaMes:='OUTUBRO'
  Else If (Num='11') Then FRetornaMes:='NOVEMBRO'
  Else If (Num='12') Then FRetornaMes:='DEZEMBRO';
End;
//------------------------------------------------------------------------------
function ProximaPrestacao (Dia : TDateTime) : TDateTime;
var
   Year,Month,Day,DayAux : word;
begin
   // pega a data
   DecodeDate(Dia,Year,Month,Day);
   if (Month + 1) <=12 then
   begin
     Month := Month + 1;
     if Day < 29 then
       Result := EncodeDate(Year,Month,Day)
       else
       if (Day >= 29) AND (Day <= 31) then
       begin
         // vai diminuindo o dia atÈ dar
         DayAux := Day;
         while true do
         begin
           try
             Result := EncodeDate(Year,Month,DayAux);
             break;
           except
             DayAux := DayAux - 1;
           end;
         end;
       end;
   end else
   begin
     Month := 1;
     Year  := Year +1;
     Result := EncodeDate(Year,Month,Day);
   end;
end;

// funcao pra tirar quebra de p·gina em texto
function Tira_Quebra_Pag(Texto : String) : String;
var
   sFinal : String;
   i : Integer;
begin
     sFinal := '';
     for i := 1 to Length(Texto) do
     begin
          if (Copy(Texto,i,1) = #$D) or (Copy(Texto,i,1) = #$A) then
             sFinal := sFinal + ' '
          else
              sFinal := sFinal + Texto[i];
     end;
     Result := sFinal;
end;

//------------------------------------------------------------------------------
// Funcao para formatacao de um campo String com preenchimento de espacos
//  a direita
//------------------------------------------------------------------------------
function Format_String(sValor: String; iTamanho: integer): String;
var
   iCount : integer;
   sRetorno : String;
begin
     sRetorno:='';
     for iCount:=0 to iTamanho do
         sValor:=sValor + ' ';
     for iCount:=1 to iTamanho do
     begin
          if (sValor[iCount] = ' ') and (sValor[iCount+1] = ' ')then
             sRetorno := sRetorno + ' '
          else
              sRetorno := sRetorno + sValor[iCount];
     end;
     Result:= sRetorno;
end;

//
// Remove caracteres de uma string deixando apenas numeros
//
Function RemoveChar(Const Texto:String):String;
var
   i : Integer;
   s : String;
begin
     s := '';
     for i := 1 To Length(Texto) do
     begin
          if (Texto[i] in ['0'..'9']) then
          begin
               s := s + Copy(Texto, i, 1);
          end;
     end;
     Result := s;
end;

//
// Remove caracteres ESTRANHOS de uma string deixando apenas numeros e letras
//
function remove_caracter(sString:String):String;
var
   cSpecial: String;
   nPos, nConta: Integer;
begin
     cSpecial := '~¯`''''"ÄÅÉÑÖÜáàâäãåçéèê''""ïñóòôöõúùûü°¢£§•¶ß®™´¨Ø∞±≤≥¥µ∂∑∏π∫ªºΩæø∆–';
     Result := '';
     for nConta := 1 to Length(cSpecial) do
     begin
          while Pos(cSpecial[nConta],sString ) > 0 do
                System.Delete(sString, Pos(cSpecial[nConta],sString ) ,1);
     end;
     Result := sString;
end;
{--------------------------------------------------------------------------}
{  Calculo do digito de Controle para o CÛdigo do IBGE                     }
{ Parametros :  CÛdigo - string que conter· numero que ser· avaliado       }
{ Retorno : String - DV (DÌgito Verificador)                               }
{--------------------------------------------------------------------------}
{--------------------------------------------------------------------------}
{  Calculo do digito de Controle para o CÛdigo do IBGE                     }
{ Parametros :  CÛdigo - string que conter· numero que ser· avaliado       }
{ Retorno : String - DV (DÌgito Verificador)                               }
{--------------------------------------------------------------------------}
function Gera_Digito_IBGE( pCodigo: String ) : String;
var
   iIndice, iDigito, iSoma : Integer;
   lSoma            : LongInt;
   sDigito, sCodigo, sSoma : String;
const
     aPesos: array[1..6] of integer = (1,2,1,2,1,2);
begin
     sCodigo := Trim(pCodigo);
     if Length(sCodigo) <> 6 then
     begin
          Informacao('CÛdigo IBGE inv·lido!!!!','Aviso...');
          Result := ' ';
          Exit;
     end;
     LSoma := 0;
     for iIndice := 1 to Length(sCodigo) do
     begin
         isoma := (StrToInt(Copy(sCodigo,iIndice,1)) * aPesos[iIndice]);
         if iSoma > 9 then
         begin
            sSoma := IntToStr(iSoma);
            iSoma := (StrToInt(Copy(sSoma,1,1))) + (StrToInt(Copy(sSoma,2,1)));
         end;
         lSoma := lSoma + iSoma;
     end;
     iDigito := lSoma mod 10;
     iDigito := 10 - iDigito;
     if iDigito > 9 then
        iDigito := 0;
     str(iDigito:1,sDigito);
     Result := sDigito;
end;

//cria baloes tolltip
{procedure CreateToolTips(hWnd: Cardinal);
begin
  hToolTip := CreateWindowEx(0, 'Tooltips_Class32', nil, TTS_ALWAYSTIP or TTS_BALLOON,
  Integer(CW_USEDEFAULT), Integer(CW_USEDEFAULT),Integer(CW_USEDEFAULT),
  Integer(CW_USEDEFAULT), hWnd, 0, hInstance, nil);
  if hToolTip <> 0 then
  begin
    SetWindowPos(hToolTip, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or
    SWP_NOSIZE or SWP_NOACTIVATE);
    ti.cbSize := SizeOf(TToolInfo);
    ti.uFlags := TTF_SUBCLASS;
    ti.hInst := hInstance;
  end;

end;
procedure AdicionaBalao(hwnd: dword; lpti: PToolInfo; IconType: Integer; Text, Title: PAnsiChar);
var
  Item: THandle;
  Rect: TRect;
begin
  Item := hWnd;
  if (Item <> 0) and (GetClientRect(Item, Rect)) then
  begin
    lpti.hwnd := Item;
    lpti.Rect := Rect;
    lpti.lpszText := Text;
    SendMessage(hToolTip, TTM_ADDTOOL, 0, Integer(lpti));
    FillChar(buffer, sizeof(buffer), #0);
    lstrcpy(buffer, Title);
    if (IconType > 3) or (IconType < 0) then
      IconType := 0;
    SendMessage(hToolTip, TTM_SETTITLE, IconType, Integer(@buffer));
  end;
end;}

procedure Treme_Tela(formulario : TForm; Sender : TObject);
var T, L, i : integer;
begin
  T := Formulario.Top;
  L := Formulario.Left;
  I := 0;
  while i <> 100 do
  begin
   Formulario.Top  := T + random(10);
   Formulario.Left := L + random(10);
   inc(i);
  end;
  Formulario.Top  := T;
  Formulario.Left := L;
end;

function GetMACAdress: String;
var
   NCB: PNCB;
   Adapter: PAdapterStatus;

   URetCode: PAnsiChar;
   RetCode: AnsiChar;
   i : Integer;
   Lenum: PlanaEnum;
   _SystemID: String;
   TMPSTR: String;
begin
     Result    := '';
     _SystemID := '';
     Getmem(NCB, SizeOf(TNCB));
     Fillchar(NCB^, SizeOf(TNCB), 0);

     Getmem(Lenum, SizeOf(TLanaEnum));
     Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

     Getmem(Adapter, SizeOf(TAdapterStatus));
     Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

     Lenum.Length    := chr(0);
     NCB.ncb_command := chr(NCBENUM);
     NCB.ncb_buffer  := Pointer(Lenum);
     NCB.ncb_length  := SizeOf(Lenum);
     RetCode         := Netbios(NCB);

     i := 0;
     repeat
           Fillchar(NCB^, SizeOf(TNCB), 0);
           Ncb.ncb_command  := chr(NCBRESET);
           Ncb.ncb_lana_num := lenum.lana[I];
           RetCode          := Netbios(Ncb);

           Fillchar(NCB^, SizeOf(TNCB), 0);
           Ncb.ncb_command  := chr(NCBASTAT);
           Ncb.ncb_lana_num := lenum.lana[I];
           // Must be 16
           Ncb.ncb_callname := '*               ';

           Ncb.ncb_buffer := Pointer(Adapter);

           Ncb.ncb_length := SizeOf(TAdapterStatus);
           RetCode        := Netbios(Ncb);
           //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
           if (RetCode = chr(0)) or (RetCode = chr(6)) then
           begin
                _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
                             IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
                             IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
                             IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
                             IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
                             IntToHex(Ord(Adapter.adapter_address[5]), 2);
           end;
           Inc(i);
     until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
     FreeMem(NCB);
     FreeMem(Adapter);
     FreeMem(Lenum);
     GetMacAdress := _SystemID;
end;

function GetIP : String;//--> Declare a Winsock na clausula uses da unit
var
   WSAData: TWSAData;
   HostEnt: PHostEnt;
   Name : String;
begin
     WSAStartup(2, WSAData);
     SetLength(Name, 255);
     Gethostname(PAnsiChar(Name), 255);
     SetLength(Name, StrLen(PAnsiChar(Name)));
     HostEnt := gethostbyname(PAnsiChar(Name));
     with HostEnt^ do
          Result:=Format('%d.%d.%d.%d',[Byte(h_addr^[0]),
                         Byte(h_addr^[1]),Byte(h_addr^[2]),Byte(h_addr^[3])]);
     WSACleanup;
end;

{
Essa funÁ„o tem o objetivo de executar um aplicativo externo (o Bloco de Notas por exemplo).
Quando este programa for executado, o seu aplicativo ser· automaticamente minimizado e ser· restaurado automaticamente quando o programa que foi executado for finalizado.
Ela retorna True se tudo ocorreu bem e False caso ocorra algum erro (caso o aplicativo indicado n„o exista, por exemplo)
}
function Aguarda_Executar(sComando: String): Boolean;
var
  StartupInfo : TStartupInfo;
  ProcessInfo : TProcessInformation;
begin
  FillChar (StartupInfo, Sizeof(StartupInfo), #0);
  with StartupInfo do
  begin
    cb := sizeof(StartupInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_SHOW;
  end;
  Result:=CreateProcess(nil,PChar(sComando), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  If Result then
  begin
    //Application.Minimize;
    WaitForSingleObject(ProcessInfo.hProcess, Infinite);
    Application.Restore;
  end;
end;
{********* inÌcio - Novas FunÁıes *********
   Projeto Novo - a partir de Agosto 2010}

{--------------------------------------------------------------------------}
{  FunÁ„o para Extrair somente N˙meros de uma String                       }
{  Parametros :  Texto - string que conter· numero que ser· avaliado       }
{  Retorno : String contendo somente n˙meros                               }
{--------------------------------------------------------------------------}
Function Verifica_SoNumero(Texto : String) : String;
var
   TmpRet, sNro : String;
   ind     : integer;
   bNumero : Boolean;
begin
   TmpRet := '';
   for Ind := 1 to Length(Texto) do
   begin
      sNro    := Copy(Texto,Ind,1);
      bNumero := True;
      try
         StrToInt(sNro);
      except
         bNumero := false;
      end;
      if bNumero then
         TmpRet := TmpRet + sNro;
   end;
   Result := TmpRet;
end;

{ SubstituiÁ„o de caracteres do arquivo XML }
function Troca_CaracteresXML(pTexto : String) : String;
var
   sTexto : String;
   sEnter : Char;
begin
     sTexto := remove_caracter(pTexto);
     sTexto := Substitui_Caracteres(sTexto);
     sTexto := Elimina_Caracteres(sTexto, '&', '###');
     sTexto := Elimina_Caracteres(sTexto, '###', '&amp;');
     sTexto := Elimina_Caracteres(sTexto, '<', '&lt;');
     sTexto := Elimina_Caracteres(sTexto, '>', '&gt;');
     sTexto := Elimina_Caracteres(sTexto, '"', '&quot;');
     sTexto := Elimina_Caracteres(sTexto, 'ì', '&quot;');
     sTexto := Elimina_Caracteres(sTexto, 'î', '&quot;');
     sTexto := Elimina_Caracteres(sTexto, '''', '&#39;');
     // ACENTO MENSAGEM Q N√O CONSEGUI SUBSTITUIR NO REMOVE_CARACTER
     sTexto := Elimina_Caracteres(sTexto, '“', 'o');
     sTexto := Elimina_Caracteres(sTexto, '  ', ' ');
     sTexto := Elimina_Caracteres(sTexto, 'ÅÉ', '');
     sTexto := Elimina_Caracteres(sTexto, '¥', '');
     sTexto := Elimina_Caracteres(sTexto, '`', '');
     sTexto := Elimina_Caracteres(sTexto, '''', '');
     sTexto := Elimina_Caracteres(sTexto, 'Ä', '');
     sTexto := Elimina_Caracteres(sTexto, 'ß', '');
     sTexto := Tira_Quebra_Pag(sTexto);
     sTexto := Tira_Quebra_Linha(sTexto);
     Result := sTexto;
end;

{ SubstituiÁ„o de caracteres }
function Troca_Caracteres(pTexto : String) : String;
var
   sTexto : String;
   sEnter : Char;
begin
     sTexto := remove_caracter(pTexto);
     sTexto := Substitui_Caracteres(sTexto);
     // ACENTO MENSAGEM Q N√O CONSEGUI SUBSTITUIR NO REMOVE_CARACTER
     sTexto := Elimina_Caracteres(sTexto, '“', 'o');
     sTexto := Elimina_Caracteres(sTexto, 'ÅÉ', '');
     sTexto := Elimina_Caracteres(sTexto, '¥', '');
     sTexto := Elimina_Caracteres(sTexto, '`', '');
     sTexto := Elimina_Caracteres(sTexto, '''', '');
     sTexto := Elimina_Caracteres(sTexto, 'Ä', '');
     sTexto := Elimina_Caracteres(sTexto, 'ß', '');
     sTexto := Tira_Quebra_Pag(sTexto);
     sTexto := Tira_Quebra_Linha(sTexto);
     Result := sTexto;
end;

{ SubstituiÁ„o de caracteres do arquivo XML }
function DesTroca_CaracteresXML(pTexto : String) : String;
var
   sTexto : String;
begin
     sTexto := remove_caracter(pTexto);
     sTexto := Elimina_Caracteres(sTexto, '&amp;','&');
     sTexto := Elimina_Caracteres(sTexto, '&lt;', '<');
     sTexto := Elimina_Caracteres(sTexto, '&gt;', '>');
     sTexto := Elimina_Caracteres(sTexto, '&quot;', '"');
     sTexto := Elimina_Caracteres(sTexto, '&#39;','''');
     Result := sTexto;
end;

// funcao pra tirar quebra de linha em texto
function Tira_Quebra_Linha(Texto : String) : String;
var
   sFinal : String;
   i      : Integer;
begin
   sFinal := '';
   for i := 1 to Length(Texto) do
   begin
      if (Copy(Texto,i,1) = #$0D) or (Copy(Texto,i,1) = #$0A) then
         sFinal := sFinal + ' '
      else
         sFinal := sFinal + Texto[i];
   end;
   Result := sFinal;
end;

//Ex: AddDays(Data origem, dias a acrescentar)  - ACRESCENTAR DIAS EM UMA DATA
function AddDays (const DT: TDateTime; const Days: Extended): TDateTime;
begin
    Result := DT + Days;
end;

// VERIFICAR DIA ⁄TIL
Function ProximoDiaUtil (dData : TDateTime) : TDateTime;
begin
   if DayOfWeek(dData) = 7 then
      dData := dData + 2
   else
      if DayOfWeek(dData) = 1 then
         dData := dData + 1;
   ProximoDiaUtil := dData;
end;

function Feriados(dData: TDateTime) : Boolean; // True quando È FERIADO
begin
    Result := False;
{    dtmSisGestao.cdsConsulta.Active := False;
    dtmSisGestao.cdsConsulta.CommandText := '';
    dtmSisGestao.cdsConsulta.CommandText := LowerCase('SELECT * FROM GERAL_FERIADO '+
                                                     'WHERE FERIADO_DATA   = :FERIADODATA');
    dtmSisGestao.cdsConsulta.Params.ParamByName('FERIADODATA').AsDate := dData;
    try
       dtmSisGestao.cdsConsulta.Active := True;
    except
    end;
    if not dtmSisGestao.cdsConsulta.FieldByName('FERIADO_DATA').IsNull then
       Result := True;   }
end;

function Busca_Dia_Util(dData: TDateTime) : TDateTime; // busca uma data v·lida (dia ˙til e n„o feriado)
var
    bFeriado : Boolean;
    dDia : TDate;
begin
    dDia := dData;
    // Verifica se esta Data È um Feriado - na Tabela de Feriados
    bFeriado := Feriados(dDia);
    while bFeriado do  // forÁa encontrar uma data que n„o seja feriado
    begin
       dDia := AddDays(date,1);
       bFeriado := Feriados(dDia);
    end;
    // Busca prÛximo dia ˙til (2a a 6a)
    dDia := ProximoDiaUtil(dDia);
    //
    Result := dDia;
end;

function NumLinhasArq(Arqtexto:String): integer;
// Retorna o n˙mero de linhas que um arquivo possui
var
   f: Textfile;
   linha, cont:integer;
begin
   linha := 0;
   cont := 0;
   AssignFile(f,Arqtexto);
   Reset(f);
   While not eof(f) Do
   begin
      ReadLn(f);
      Cont := Cont + 1;
   end;
   Closefile(f);
   result := cont;
end;

{
Essa funÁ„o tem o objetivo de executar um aplicativo externo (o Bloco de Notas por exemplo).
Quando este programa for executado, o seu aplicativo ser· automaticamente minimizado e ser· restaurado automaticamente quando o programa que foi executado for finalizado.

Ela retorna True se tudo ocorreu bem e False caso ocorra algum erro (caso o aplicativo indicado n„o exista, por exemplo)
}
function Compactar(sComando: String): Boolean;
var
  StartupInfo : TStartupInfo;
  ProcessInfo : TProcessInformation;
begin
  FillChar (StartupInfo, Sizeof(StartupInfo), #0);
  with StartupInfo do
  begin
    cb := sizeof(StartupInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_SHOW;
  end;
  Result:=CreateProcess(nil,PChar(sComando), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  If Result then
  begin
    Application.Minimize;
    WaitForSingleObject(ProcessInfo.hProcess, Infinite);
    Application.Restore;
  end;
end;

function Valida_Placa_Veiculo(sPlaca:String): Boolean;
var
   i : byte;
begin
    sPlaca := UpperCase(sPlaca);
    Result := Length(sPlaca) = 7;
    if (Result) then
       // Se tiver 7 caracteres, testar se tem 3 letras e 4 n˙meros
       for i := 1 to 7 do
       begin
           // Testa as Letras...
           if (i < 4) then
               Result := sPlaca[i] in ['A'..'Z'];
           if not(Result) then Exit;
           // Testa os Nros...
           if (i >= 4) then
              Result := sPlaca[i] in ['0'..'9'];
       end;
end;

// CriaÁ„o: 06/12/2011 - Vanessa     Utilidade: Bloquear n„o deixar manipular o banco atravÈs dos campos textos do programa
function Elimina_Comandos_MySQL(Texto : WideString) : WideString;
var
   wsNovo : WideString;
begin
   wsNovo   := Trim(UpperCase(Texto));
   // remover caracteres estranhos
   wsNovo   := remove_caracter(wsNovo);
   // n„o permitir palavras que possam permitir comandos direto no banco
   wsNovo   := Elimina_Caracteres(wsNovo,'TABLE ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'DROP ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'DELETE ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'INSERT ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'SELECT ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'= :','');
   wsNovo   := Elimina_Caracteres(wsNovo,'=:','');
   wsNovo   := Elimina_Caracteres(wsNovo,'=: ','');
   wsNovo   := Elimina_Caracteres(wsNovo,' FROM ','');
   wsNovo   := Elimina_Caracteres(wsNovo,' WHERE ','');
   wsNovo   := Elimina_Caracteres(wsNovo,'ORDER BY','');
   //
   Result := wsNovo;
end;

// CriaÁ„o: 07/12/2011 - Vanessa    Utilidade: deixar somente letraas
function ValidaLetras(Texto :String): String;
var
   iInd, iTam    : integer;
   sTexto, sNovo : string;
begin
    sTexto := Trim(Texto);
    sNovo  := '';
    iTam   := Length(sTexto);
    for iInd := 1 to iTam do
    begin
       // Testa as Letras Mai˙sculas ...
       if sTexto[iInd] in  ['A'..'Z'] then
          sNovo := sNovo+sTexto[iInd];
       // Testa as Letras Min˙sculas ...
       if sTexto[iInd] in  ['a'..'z'] then
          sNovo := sNovo+sTexto[iInd];
    end;
    result := sNovo;
end;

// CriaÁ„o: 07/12/2011 - Vanessa    Utilidade: Validar Caracteres para consultas SPC
function SPC_Valida_Caracteres(Texto : String) : String;
var
   iInd, iTam    : integer;
   sTexto, sNovo : string;
begin
    sTexto := Trim(UpperCase(Texto));
    sNovo  := '';
    iTam   := Length(sTexto);
    for iInd := 1 to iTam do
    begin
       // Testa as Letras ...
       if sTexto[iInd] in ['A'..'Z'] then
          sNovo := sNovo+sTexto[iInd];
       // Testa os N˙meros ...
       if sTexto[iInd] in ['0'..'9'] then
          sNovo := sNovo+sTexto[iInd];
       // Testa Brancos
       if sTexto[iInd] = ' ' then
          sNovo := sNovo+sTexto[iInd];
       // Testa Caracteres Especiais v·lidos no SPC (./-,) parÍnteses, ponto, barra, traÁo e vÌrgula
       if sTexto[iInd] = '(' then
          sNovo := sNovo+sTexto[iInd];
       if sTexto[iInd] = '.' then
          sNovo := sNovo+sTexto[iInd];
       if sTexto[iInd] = '/' then
          sNovo := sNovo+sTexto[iInd];
       if sTexto[iInd] = '-' then
          sNovo := sNovo+sTexto[iInd];
       if sTexto[iInd] = ',' then
          sNovo := sNovo+sTexto[iInd];
       if sTexto[iInd] = ')' then
          sNovo := sNovo+sTexto[iInd];
    end;
    Result := sNovo;
end;

// A funÁ„o abaixo insere uma linha num TStringGrid AP”S uma linha escolhida.
//
// Uso: GridInsertRow(StrGrid,Linha)
// Onde: StrGrid = nome do componente TStringGrid no form.
// Onde: Linha = linha anterior
//
// Exemplo: inserir uma linha apÛs o cabeÁalho do Grid, empurrando todos as outras para baixo: GridInsertRow(meustrgrid,1);
function GridInsertRow(StrGrid: TStringGrid; Linha:integer):integer;
Var Rown,Coln: Integer;
begin
   StrGrid.RowCount := strgrid.RowCount+1;
   if Linha < 1 then
      Linha := 1
   else
      if Linha > strgrid.RowCount-1 then
         Linha := strgrid.RowCount-1;
   if strgrid.RowCount-1 <> Linha then
      for Rown := strgrid.RowCount-1 downto Linha do
          for Coln := 0 to strgrid.ColCount-1 do
              strgrid.Cells[Coln,Rown] := strgrid.Cells[Coln,Rown-1];
   result := Linha;
end;

{aqui}
{ InscriÁıes __________________________________ }

Function Inscricao( Inscricao, Estado : String ) : Boolean; Var

Contador  : ShortInt;
Casos     : ShortInt;
Digitos   : ShortInt;

Tabela_1  : String;
Tabela_2  : String;
Tabela_3  : String;

Base_1    : String;
Base_2    : String;
Base_3    : String;

Valor_1   : ShortInt;

Soma_1    : Integer;
Soma_2    : Integer;

Erro_1    : ShortInt;
Erro_2    : ShortInt;
Erro_3    : ShortInt;

Posicao_1 : string;
Posicao_2 : String;

Tabela    : String;
Rotina    : String;
Modulo    : ShortInt;
Peso      : String;

Digito    : ShortInt;

Resultado : String;
Retorno   : Boolean;

Begin

  Try

  Tabela_1 := ' ';
  Tabela_2 := ' ';
  Tabela_3 := ' ';

  {                                                                               }                                                                                                                 {                                                                                                }
  {         Valores possiveis para os digitos (j)                                 }
  {                                                                               }
  { 0 a 9 = Somente o digito indicado.                                            }
  {     N = Numeros 0 1 2 3 4 5 6 7 8 ou 9                                        }
  {     A = Numeros 1 2 3 4 5 6 7 8 ou 9                                          }
  {     B = Numeros 0 3 5 7 ou 8                                                  }
  {     C = Numeros 4 ou 7                                                        }
  {     D = Numeros 3 ou 4                                                        }
  {     E = Numeros 0 ou 8                                                        }
  {     F = Numeros 0 1 ou 5                                                      }
  {     G = Numeros 1 7 8 ou 9                                                    }
  {     H = Numeros 0 1 2 ou 3                                                    }
  {     I = Numeros 0 1 2 3 ou 4                                                  }
  {     J = Numeros 0 ou 9                                                        }
  {     K = Numeros 1 2 3 ou 9                                                    }
  {                                                                               }
  { -------------------------------------------------------- }
  {                                                                               }
  {         Valores possiveis para as rotinas (d) e (g)                           }
  {                                                                               }
  { A a E = Somente a Letra indicada.                                             }
  {     0 = B e D                                                                 }
  {     1 = C e E                                                                 }
  {     2 = A e E                                                                 }
  {                                                                               }
  { -------------------------------------------------------- }
  {                                                                               }
  {                                  C T  F R M  P  R M  P                        }
  {                                  A A  A O O  E  O O  E                        }
  {                                  S M  T T D  S  T D  S                        }
  {                                                                               }
  {                                  a b  c d e  f  g h  i  jjjjjjjjjjjjjj        }
  {                                  0000000001111111111222222222233333333        }
  {                                  1234567890123456789012345678901234567        }

  IF Estado = 'AC'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     01NNNNNNX.14.00';
  IF Estado = 'AC'   Then Tabela_2 := '2.13.0.E.11.02.E.11.01. 01NNNNNNNNNXY.13.14';
  IF Estado = 'AL'   Then Tabela_1 := '1.09.0.0.11.01. .  .  .     24BNNNNNX.14.00';
  IF Estado = 'AP'   Then Tabela_1 := '1.09.0.1.11.01. .  .  .     03NNNNNNX.14.00';
  IF Estado = 'AP'   Then Tabela_2 := '2.09.1.1.11.01. .  .  .     03NNNNNNX.14.00';
  IF Estado = 'AP'   Then Tabela_3 := '3.09.0.E.11.01. .  .  .     03NNNNNNX.14.00';
  IF Estado = 'AM'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0CNNNNNNX.14.00';
  IF Estado = 'BA'   Then Tabela_1 := '1.08.0.E.10.02.E.10.03.      NNNNNNYX.14.13';
  IF Estado = 'BA'   Then Tabela_2 := '2.08.0.E.11.02.E.11.03.      NNNNNNYX.14.13';
  IF Estado = 'CE'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0NNNNNNNX.14.13';
  IF Estado = 'DF'   Then Tabela_1 := '1.13.0.E.11.02.E.11.01. 07DNNNNNNNNXY.13.14';
  IF Estado = 'ES'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     0ENNNNNNX.14.00';
  IF Estado = 'GO'   Then Tabela_1 := '1.09.1.E.11.01. .  .  .     1FNNNNNNX.14.00';
  IF Estado = 'GO'   Then Tabela_2 := '2.09.0.E.11.01. .  .  .     1FNNNNNNX.14.00';
  IF Estado = 'MA'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     12NNNNNNX.14.00';
  IF Estado = 'MT'   Then Tabela_1 := '1.11.0.E.11.01. .  .  .   NNNNNNNNNNX.14.00';
  IF Estado = 'MS'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     28NNNNNNX.14.00';
  IF Estado = 'MG'   Then Tabela_1 := '1.13.0.2.10.10.E.11.11. NNNNNNNNNNNXY.13.14';
  IF Estado = 'PA'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     15NNNNNNX.14.00';
  IF Estado = 'PB'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     16NNNNNNX.14.00';
  IF Estado = 'PR'   Then Tabela_1 := '1.10.0.E.11.09.E.11.08.    NNNNNNNNXY.13.14';
  IF Estado = 'PE'   Then Tabela_1 := '1.14.1.E.11.07. .  .  .18ANNNNNNNNNNX.14.00';
  IF Estado = 'PI'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     19NNNNNNX.14.00';
  IF Estado = 'RJ'   Then Tabela_1 := '1.08.0.E.11.08. .  .  .      GNNNNNNX.14.00';
  IF Estado = 'RN'   Then Tabela_1 := '1.09.0.0.11.01. .  .  .     20HNNNNNX.14.00';
  IF Estado = 'RS'   Then Tabela_1 := '1.10.0.E.11.01. .  .  .    INNNNNNNNX.14.00';
  IF Estado = 'RO'   Then Tabela_1 := '1.09.1.E.11.04. .  .  .     ANNNNNNNX.14.00';
  IF Estado = 'RO'   Then Tabela_2 := '2.14.0.E.11.01. .  .  .NNNNNNNNNNNNNX.14.00';
  IF Estado = 'RR'   Then Tabela_1 := '1.09.0.D.09.05. .  .  .     24NNNNNNX.14.00';
  IF Estado = 'SC'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
  IF Estado = 'SP'   Then Tabela_1 := '1.12.0.D.11.12.D.11.13.  NNNNNNNNXNNY.11.14';
  IF Estado = 'SP'   Then Tabela_2 := '2.12.0.D.11.12. .  .  .  NNNNNNNNXNNN.11.00';
  IF Estado = 'SE'   Then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
  IF Estado = 'TO'   Then Tabela_1 := '1.11.0.E.11.06. .  .  .   29JKNNNNNNX.14.00';

  IF Estado = 'CNPJ' Then Tabela_1 := '1.14.0.E.11.21.E.11.22.NNNNNNNNNNNNXY.13.14';
  IF Estado = 'CPF'  Then Tabela_1 := '1.11.0.E.11.31.E.11.32.   NNNNNNNNNXY.13.14';

  { Deixa somente os numeros }

  Base_1 := '';

  For Contador := 1 TO 30 Do IF Pos( Copy( Inscricao, Contador, 1 ), '0123456789' ) <> 0 Then Base_1 := Base_1 + Copy( Inscricao, Contador, 1 );

  { Repete 3x - 1 para cada caso possivel  }

  Casos  := 0;

  Erro_1 := 0;
  Erro_2 := 0;
  Erro_3 := 0;

  While Casos < 3 Do Begin

    Casos := Casos + 1;

    IF Casos = 1 Then Tabela := Tabela_1;
    IF Casos = 2 Then Erro_1 := Erro_3  ;
    IF Casos = 2 Then Tabela := Tabela_2;
    IF Casos = 3 Then Erro_2 := Erro_3  ;
    IF Casos = 3 Then Tabela := Tabela_3;

    Erro_3 := 0 ;

    IF Copy( Tabela, 1, 1 ) <> ' ' Then Begin

      { Verifica o Tamanho }

      IF Length( Trim( Base_1 ) ) <> ( StrToInt( Copy( Tabela,  3,  2 ) ) ) Then Erro_3 := 1;

      IF Erro_3 = 0 Then Begin

        { Ajusta o Tamanho }

        Base_2 := Copy( '              ' + Base_1, Length( '              ' + Base_1 ) - 13, 14 );

        { Compara com valores possivel para cada uma da 14 posiÁıes }

        Contador := 0 ;

        While ( Contador < 14 ) AND ( Erro_3 = 0 ) Do Begin

          Contador := Contador + 1;

          Posicao_1 := Copy( Copy( Tabela, 24, 14 ), Contador, 1 );
          Posicao_2 := Copy( Base_2                , Contador, 1 );

          IF ( Posicao_1  = ' '        ) AND (      Posicao_2                 <> ' ' ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'N'        ) AND ( Pos( Posicao_2, '0123456789' )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'A'        ) AND ( Pos( Posicao_2, '123456789'  )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'B'        ) AND ( Pos( Posicao_2, '03578'      )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'C'        ) AND ( Pos( Posicao_2, '47'         )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'D'        ) AND ( Pos( Posicao_2, '34'         )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'E'        ) AND ( Pos( Posicao_2, '08'         )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'F'        ) AND ( Pos( Posicao_2, '015'        )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'G'        ) AND ( Pos( Posicao_2, '1789'       )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'H'        ) AND ( Pos( Posicao_2, '0123'       )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'I'        ) AND ( Pos( Posicao_2, '01234'      )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'J'        ) AND ( Pos( Posicao_2, '09'         )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1  = 'K'        ) AND ( Pos( Posicao_2, '1239'       )  =   0 ) Then Erro_3 := 1;
          IF ( Posicao_1 <>  Posicao_2 ) AND ( Pos( Posicao_1, '0123456789' )  >   0 ) Then Erro_3 := 1;

        End;

        { Calcula os Digitos }

        Rotina  := ' ';
        Digitos := 000;
        Digito  := 000;

        While ( Digitos < 2 ) AND ( Erro_3 = 0 ) Do Begin

          Digitos := Digitos + 1;

          { Carrega peso }

          Peso := Copy( Tabela, 5 + ( Digitos * 8 ), 2 );

          IF Peso <> '  ' Then Begin

            Rotina :=           Copy( Tabela, 0 + ( Digitos * 8 ), 1 )  ;
            Modulo := StrToInt( Copy( Tabela, 2 + ( Digitos * 8 ), 2 ) );

            IF Peso = '01' Then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
            IF Peso = '02' Then Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
            IF Peso = '03' Then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.00.02';
            IF Peso = '04' Then Peso := '00.00.00.00.00.00.00.00.06.05.04.03.02.00';
            IF Peso = '05' Then Peso := '00.00.00.00.00.01.02.03.04.05.06.07.08.00';
            IF Peso = '06' Then Peso := '00.00.00.09.08.00.00.07.06.05.04.03.02.00';
            IF Peso = '07' Then Peso := '05.04.03.02.01.09.08.07.06.05.04.03.02.00';
            IF Peso = '08' Then Peso := '08.07.06.05.04.03.02.07.06.05.04.03.02.00';
            IF Peso = '09' Then Peso := '07.06.05.04.03.02.07.06.05.04.03.02.00.00';
            IF Peso = '10' Then Peso := '00.01.02.01.01.02.01.02.01.02.01.02.00.00';
            IF Peso = '11' Then Peso := '00.03.02.11.10.09.08.07.06.05.04.03.02.00';
            IF Peso = '12' Then Peso := '00.00.01.03.04.05.06.07.08.10.00.00.00.00';
            IF Peso = '13' Then Peso := '00.00.03.02.10.09.08.07.06.05.04.03.02.00';
            IF Peso = '21' Then Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
            IF Peso = '22' Then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
            IF Peso = '31' Then Peso := '00.00.00.10.09.08.07.06.05.04.03.02.00.00';
            IF Peso = '32' Then Peso := '00.00.00.11.10.09.08.07.06.05.04.03.02.00';

            { Multiplica }

            Base_3 := Copy( ( '0000000000000000' + Trim( Base_2 ) ), Length( ( '0000000000000000' + Trim( Base_2 ) ) ) - 13, 14 );

            Soma_1 := 0;
            Soma_2 := 0;

            For Contador := 1 To 14 Do Begin

              Valor_1 := ( StrToInt( Copy( Base_3, Contador, 01 ) ) * StrToInt( Copy( Peso, Contador * 3 - 2, 2 ) ) );

              Soma_1  := Soma_1 + Valor_1;

              IF Valor_1 > 9 Then Valor_1 := Valor_1 - 9;

              Soma_2  := Soma_2 + Valor_1;

            End;

            { Ajusta valor da soma }

            IF Pos( Rotina, 'A2'  ) > 0 Then Soma_1 := Soma_2;
            IF Pos( Rotina, 'B0'  ) > 0 Then Soma_1 := Soma_1 * 10;
            IF Pos( Rotina, 'C1'  ) > 0 Then Soma_1 := Soma_1 + ( 5 + 4 * StrToInt( Copy( Tabela, 6, 1 ) ) );

            { Calcula o Digito }

            IF Pos( Rotina, 'D0'  ) > 0 Then Digito := Soma_1 Mod Modulo;
            IF Pos( Rotina, 'E12' ) > 0 Then Digito := Modulo - ( Soma_1 Mod Modulo);

            IF Digito < 10 Then Resultado := IntToStr( Digito );
            IF Digito = 10 Then Resultado := '0';
            IF Digito = 11 Then Resultado := Copy( Tabela, 6, 1 );

            { Verifica o Digito }

            IF ( Copy( Base_2, StrToInt( Copy( Tabela, 36 + ( Digitos * 3 ), 2 ) ), 1 ) <> Resultado ) Then Erro_3 := 1;

          End;

        End;

      End;

    End;

  End;

  { Retorna o resultado da VerificaÁ„o }

  Retorno := FALSE;

  IF ( Trim( Tabela_1 ) <> '' ) AND ( ERRO_1 = 0 ) Then Retorno := TRUE;
  IF ( Trim( Tabela_2 ) <> '' ) AND ( ERRO_2 = 0 ) Then Retorno := TRUE;
  IF ( Trim( Tabela_3 ) <> '' ) AND ( ERRO_3 = 0 ) Then Retorno := TRUE;

  IF Trim( Inscricao ) = 'ISENTO' Then Retorno := TRUE;

  Result := Retorno;

  Except

  Result := False;

End;

End;

{ Mascara_Inscricao __________________________________}

Function Mascara_Inscricao( Inscricao, Estado : String ) : String; Var

Mascara     : String;

Contador_1  : Integer;
Contador_2  : Integer;

Begin

  IF Estado = 'AC' Then Mascara := '**.***.***/***-**' ;
  IF Estado = 'AL' Then Mascara := '*********'         ;
  IF Estado = 'AP' Then Mascara := '*********'         ;
  IF Estado = 'AM' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'BA' Then Mascara := '******-**'         ;
  IF Estado = 'CE' Then Mascara := '********-*'        ;
  IF Estado = 'DF' Then Mascara := '***********-**'    ;
  IF Estado = 'ES' Then Mascara := '*********'         ;
  IF Estado = 'GO' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'MA' Then Mascara := '*********'         ;
  IF Estado = 'MT' Then Mascara := '**********-*'      ;
  IF Estado = 'MS' Then Mascara := '*********'         ;
  IF Estado = 'MG' Then Mascara := '***.***.***/****'  ;
  IF Estado = 'PA' Then Mascara := '**-******-*'       ;
  IF Estado = 'PB' Then Mascara := '********-*'        ;
  IF Estado = 'PR' Then Mascara := '********-**'       ;
  IF Estado = 'PE' Then Mascara := '**.*.***.*******-*';
  IF Estado = 'PI' Then Mascara := '*********'         ;
  IF Estado = 'RJ' Then Mascara := '**.***.**-*'       ;
  IF Estado = 'RN' Then Mascara := '**.***.***-*'      ;
  IF Estado = 'RS' Then Mascara := '***/*******'       ;
  IF Estado = 'RO' Then Mascara := '***.*****-*'       ;
  IF Estado = 'RR' Then Mascara := '********-*'        ;
  IF Estado = 'SC' Then Mascara := '***.***.***'       ;
  IF Estado = 'SP' Then Mascara := '***.***.***.***'   ;
  IF Estado = 'SE' Then Mascara := '*********-*'       ;
  IF Estado = 'TO' Then Mascara := '***********'       ;

  Contador_2  := 1;

  Result      := '';

  Mascara     := Mascara + '****';

  For Contador_1 := 1 To Length( Mascara ) Do Begin

    IF Copy( Mascara, Contador_1, 1 ) =  '*' Then Result := Result + Copy( Inscricao, Contador_2, 1 );
    IF Copy( Mascara, Contador_1, 1 ) <> '*' Then Result := Result + Copy( Mascara  , Contador_1, 1 );

    IF Copy( Mascara, Contador_1, 1 ) =  '*' Then Contador_2 := Contador_2 + 1;

  End;
  Result := Trim( Result );
end;

// CriaÁ„o: 18.01.2012 - Converter N˙mero em Anos, Meses e Dias
Function Converte_Nro_AnoMesDia(iTempo : Integer) : RDATA;
var iDias, iMeses, iAnos, iDifDias : Integer;
begin
     iDias    := iTempo;
     // Calcular a quantidade de anos, considerando sempre a parte inteira do c·lculo
     iAnos    := Trunc(iDias div 365);
     // Calcular a diferenÁa de dias existente entre os dias totais e os dias que compıe os anos
     iDifDias := iDias - (iAnos * 365);
     // Com a difereÁa, calcular a quantidade de Meses restante
     iMeses   := Trunc(iDifDias / 30);
     // Calcular a diferenÁa de dias existente entre os dias totais e os dias que compıe os meses
     iDifDias := iDifDias - (iDifDias * iMeses);
     // Mostrar o Tempo Encontrado
     // Result := IntToStr(iAnos)+' Anos '+IntToStr(iMeses)+' Meses '+IntToStr(iDifDias)+' Dias ';
     DATA.RD_DIA := iDifDias;
     DATA.RD_MES := iMeses;
     DATA.RD_ANO := iAnos;
end;

// CriaÁ„o: 22.04.2013 - Colocar ponto para separar milhar
Function Formata_Valor_Milhar(sValor : String) : String;
var sParteInteira, sParte1, sParte2, sParte3, sParte4, sParte5, sValorMilhar, sValorDecimal : String;
    i, iParteInteira, iContaMilhar, iVirgula : Integer;
begin
     // Localizar a VÌrgula
     iVirgula := 0;
     for i := 1 to Length(sValor) do
     begin
        if sValor[i] = ',' then
        begin
           iVirgula := i;
           Break;
        end;
     end;
     sValorDecimal := copy(sValor,iVirgula,3);
     sParteInteira := copy(sValor,1,iVirgula-1);
     iParteInteira := length(sParteInteira);
     // Verificar onde colocar os pontos para milhar
     case iParteInteira of
    1,2,3 : sValorMilhar := sParteInteira+sValorDecimal;
        4 : begin
               sParte4      := copy(sParteInteira,1,1);
               sParte5      := copy(sParteInteira,2,3);
               sValorMilhar := sParte4+'.'+sParte5+sValorDecimal;
            end;
        5 : begin
               sParte4      := copy(sParteInteira,1,2);
               sParte5      := copy(sParteInteira,3,3);
               sValorMilhar := sParte4+'.'+sParte5+sValorDecimal;
            end;
        6 : begin
               sParte4      := copy(sParteInteira,1,3);
               sParte5      := copy(sParteInteira,4,3);
               sValorMilhar := sParte4+'.'+sParte5+sValorDecimal;
            end;
        7 : begin
               sParte3      := copy(sParteInteira,1,1);
               sParte4      := copy(sParteInteira,2,3);
               sParte5      := copy(sParteInteira,5,3);
               sValorMilhar := sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
        8 : begin
               sParte3      := copy(sParteInteira,1,2);
               sParte4      := copy(sParteInteira,3,3);
               sParte5      := copy(sParteInteira,6,3);
               sValorMilhar := sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
        9 : begin
               sParte3      := copy(sParteInteira,1,3);
               sParte4      := copy(sParteInteira,4,3);
               sParte5      := copy(sParteInteira,7,3);
               sValorMilhar := sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
       10 : begin
               sParte2      := copy(sParteInteira,1,1);
               sParte3      := copy(sParteInteira,2,3);
               sParte4      := copy(sParteInteira,5,3);
               sParte5      := copy(sParteInteira,8,3);
               sValorMilhar := sParte2+'.'+sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
       11 : begin
               sParte2      := copy(sParteInteira,1,2);
               sParte3      := copy(sParteInteira,3,3);
               sParte4      := copy(sParteInteira,6,3);
               sParte5      := copy(sParteInteira,9,3);
               sValorMilhar := sParte2+'.'+sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
       12 : begin
               sParte2      := copy(sParteInteira,1,3);
               sParte3      := copy(sParteInteira,4,3);
               sParte4      := copy(sParteInteira,7,3);
               sParte5      := copy(sParteInteira,10,3);
               sValorMilhar := sParte2+'.'+sParte3+'.'+sParte4+'.'+sParte5+sValorDecimal;
            end;
     end;
     Result := sValorMilhar;
end;

// CriaÁ„o: 28.05.2013 -  Contar ocorrencia de palavras em um texto
Function Conta_Ocorrencias_Texto(wsTexto : WideString; sPalavra : String) : Integer;
var i, iQtd : Integer;
begin
    iQtd := 0;
    for i := 1 to Length(wsTexto) do begin
      if copy(wsTexto,i,Length(sPalavra)) = sPalavra then
         inc(iQtd);
    end;
    Result := iQtd;
end;

// CriaÁ„o: 06.09.2013 - Localizar ˙ltima pasta de uma string - para auxiliar quando temos um  nome para inicio do nome do arquivo no mesmo string
Function Localiza_Ultima_Pasta(sTexto: String) : String;
var i, iPosicaoFinal : Integer;
begin
    iPosicaoFinal := 0;
    for i := 1 to Length(sTexto) do begin
      if copy(sTexto,i,1) = '\' then
         iPosicaoFinal := i;
    end;
    Result := copy(sTexto,1,iPosicaoFinal);
end;

// CriaÁ„o: 08.02.2014 - C·lculo de DiferenÁa entre Duas Datas (DD/MM/AAAA) e Horas (HH:MM), mostrando dias, horas e minutos - Result Formato (DDDDHHMM)
Function DifereDatas_DiaHoraMinuto(pDataCompara, pDataAtual, pHoraCompara, pHoraAtual: String) : String;
var
  dtDataCompara, dtDataAtual: TDateTime;
  dDias, dHoras, dMinutos: double;
  sResultado, sMinutos, sHoras : String;
begin
    // Validar Horas
    try
       StrToTime(pHoraCompara);
    except
       pHoraCompara := '00:00';
    end;
    try
       StrToTime(pHoraAtual);
    except
       pHoraAtual := '00:00';
    end;
    // Validar Datas
    try
       pDataCompara := FormatDateTime('dd/mm/yy',StrToDate(pDataCompara));
    except
       pDataCompara := '';
    end;
    try
       pDataAtual := FormatDateTime('dd/mm/yy',StrToDate(pDataAtual));
    except
       pDataAtual := '';
    end;
    Result := '';
    // Localizar DiferenÁa
    if (Trim(pDataCompara) <> '') and (Trim(pDataAtual) <> '') then
    begin
        dtDataCompara  := StrToDate(pDataCompara) + StrToTime(pHoraCompara);
        dtDataAtual    := StrToDate(pDataAtual)   + StrToTime(pHoraAtual);
        dDias          := dtDataAtual - dtDataCompara;
        sResultado     := FormatDateTime('HH:MM', Frac(dDias));
        sHoras         := copy(sResultado,1,2);
        dHoras         := StrToFloat(sHoras);
        sHoras         := IntToStr(Trunc(dDias) * 24 + strtoint(sHoras));
        sMinutos       := copy(sResultado,4,2);
        dMinutos       := StrToFloat(sMinutos);
        Result         := PadLeft(FloatToStr(Trunc(dDias)),4,'0')+PadLeft(FloatToStr(Trunc(dHoras)),2,'0')+
                          PadLeft(FloatToStr(Trunc(dMinutos)),2,'0');  // Formato (DDDDHHMM)
    end;
  { sResultado := DifereDatas_DiaHoraMinuto(sDataCompara, sDataAtual, sHoraCompara, sHoraAtual);
    SHOWMESSAGE('Data Compara: '+sDataCompara   +#13+
                'Hora Compara: '+sHoraCompara   +#13+
                '  Data Atual: '+sDataAtual     +#13+
                '  Hora Atual: '+sHoraAtual     +#13+
                '=============================='+#13+
                sResultado                      +#13+
                '   Dias: '+Copy(sResultado,1,4)+#13+
                '  Horas: '+Copy(sResultado,5,2)+#13+
                'Minutos: '+Copy(sResultado,7,2)); }
end;

// Retorna o n˙mero de linhas que um determinado arquivo possui.
function GetNumLinhasArquivoTexto(FileName: String): Integer;
var
  Handle: TextFile;
  QtdLin: Integer;
begin
  QtdLin := 0;
  AssignFile(Handle, FileName);
  try
    Reset(Handle);
    while not Eof(Handle) do
    begin
      ReadLn(Handle);
      QtdLin := QtdLin + 1;
    end;
  finally
    Closefile(Handle);
  end;
  Result := QtdLin;
end;

{ CriaÁ„o C·lculo Modulo 11 para Nosso N˙mero  23.02.2016
  mÛdulo 11, de 2 a 9, utilizando dÌgito X para os restos IGUAL a 10
   Bancos: Banco do Brasil  }
function NossoNro_Modulo11(Numero: String): String;
var
    i, j, k, Soma, Digito : Integer;
    // K = multiplicadores (pesos) que variam de 9 a 2 da direita para esquerda... ex: 78923456789
begin
    Result := '';
    try
       Soma := 0; k:= 2;
       for i := Length(Numero) downto 1 do
       begin
           Soma := Soma + (StrToInt(Numero[i])*k);
           inc(k);
           if k > 9 then k := 2;
       end;
       Digito := 11 - Soma mod 11;
       // Se o Resto for igual a 10 o DV ser· X
       if Digito = 10 then
          Result := 'X';
       Result := Result + Chr(Digito + Ord('0'));
    except
       Result := 'X';
    end;
end;

{ DÕGITO VERIFICADOR GERAL DE C”DIGO DE BARRAS - 23.02.2016, na posiÁ„o 5, È calculado da seguinte forma:
   mÛdulo 11, de 2 a 9, utilizando dÌgito 1 para os restos 0, 10 ou 1;
   considerar posiÁıes de 1 a 4 e de 6 a 44, iniciando pela posiÁ„o 44 e saltando a posiÁ„o 5.
   Bancos: Banco do Brasil}
function CodBarras_DV_Modulo11(CodBarras: String): String;
var
   wTam, wCont, wDV: Integer;
   wS : String;
begin
     wDV   := 0;
     wS    := '';
     wS    := CodBarras;
     wCont := 2;
     for wTam:=Length(wS) downto 1 do
     begin
          wDV := wDV + StrToInt(wS[wTam]) * wCont;
          Inc(wCont);
          If wCont > 9 Then
             wCont := 2;
     end;
     wDV    := 11 - (wDV mod 11);
     if (wDV=0) or (wDV=1) or (wDV>9) then
        wDV := 1;
     Result := IntToStr(wDV);
end;

function Modulo_10(Numero:String):String;
var
  wAux, wTam, wMult, wDV : Integer;
begin
     wDV   := 0;
     wMult := 2;
     for wTam := Length(Numero) downto 1 do
     begin
          wAux := wMult * StrToInt(Numero[wTam]);
          if wAux<10 then
             wDV := wDV + wAux
          else
              wDV := wDV + (wAux - 9);
          if wMult = 2 then
             wMult := 1
          else
             wMult := 2;
     end;
     wDV := 10 - (wDV mod 10);
     if wDV = 10 then
        wDV := 0;
     Result := IntToStr(wDV);
end;

// CriaÁ„o: 11.06.2016 - Separa Cidade e UF
Function Separa_Municipio(sMunicipioUF: String) : String;
var i, iPosicaoFinal : Integer;
begin
   iPosicaoFinal := 0;
   for i := 1 to Length(sMunicipioUF) do
   begin
      if copy(sMunicipioUF,i,1) = '/' then
         iPosicaoFinal := i-2;
   end;
   Result := copy(sMunicipioUF,1,iPosicaoFinal);
end;

// CriaÁ„o: 11.06.2016 - Separa Cidade e UF
Function Separa_UF(sMunicipioUF: String) : String;
var i, iPosicaoInicial, iPosicaoFinal : Integer;
begin
   iPosicaoInicial := 0;
   iPosicaoFinal   := Length(sMunicipioUF);
   for i := 1 to Length(sMunicipioUF) do
   begin
      if copy(sMunicipioUF,i,1) = '/' then
         iPosicaoInicial := i+2;
   end;
   Result := copy(sMunicipioUF,iPosicaoInicial,iPosicaoFinal);
end;

// Separar Telefones na ImportaÁ„o do Gest„o (ex: 2 telefones em 1 campo)
// Retorno String = fone 1 tam 14, fone 2 tam 14
function Importa_Telefones(Texto: String) : String;
var sFone1, sFone2 : String;
    i, iSeparador : Integer;
begin
   Result     := '';
   iSeparador := 0;
   sFone1     := Trim(Texto);
   sFone2     := '';
   // Convers„o Superplac Representantes
   for i := 1 to Length(Texto) do
   begin
       if copy(Texto,i,2) = '  ' then
          iSeparador := i;
   end;
   if iSeparador > 0 then
   begin
      sFone1 := copy(Texto,1,iSeparador-1);
      sFone2 := copy(Texto,iSeparador+2,Length(Texto));
   end;
   // Convers„o Superplac Representantes
   for i := 1 to Length(Texto) do
   begin
       if copy(Texto,i,2) = '**' then
          iSeparador := i;
   end;
   if iSeparador > 0 then
   begin
      sFone1 := copy(Texto,1,iSeparador-1);
      sFone2 := copy(Texto,iSeparador+2,Length(Texto));
   end;
   // Convers„o Superplac Transportadoras
   for i := 1 to Length(Texto) do
   begin
      if copy(Texto,i,1) = '/' then
         iSeparador := i;
   end;
   if iSeparador > 0 then
   begin
      sFone1 := copy(Texto,1,iSeparador);
      sFone2 := copy(Texto,iSeparador+1,Length(Texto));
   end;
   // Retorno
   sFone1 := PadRight(sFone1,14,' ');
   sFone2 := PadRight(sFone2,14,' ');
   Result := sFone1 + sFone2;
end;

{----------------------------------------------------------------------------}
{ Verifica a descriÁ„o da Unidade de Medida                                  }
{ Parametros : Texto - string que conter· a sigla da Unidade                 }
{ Retorno : Texto - string que conter· a DescriÁ„o da Unidade                }
{----------------------------------------------------------------------------}
function Descreve_Unidade_Medida(Texto : String) : String;
var
   iPosicao, iIndice : Integer;
Const
     { Ìndice... array[1..X] onde X deve ser o n˙mero de siglas da tabela}
     cDescricao : Array[1..61] of String = ('AMPOLA','BALDE','BANDEJ','BARRA','BISNAG','BLOCO','BOBINA','BOMB',
                                            'CAPS','CART','CENTO','CJ','CM','CM2',
                                            'CX','CX2','CX3','CX5','CX10',
                                            'CX15','CX20','CX25','CX50',
                                            'CX100','DISP','DUZIA','EMBAL','FARDO','FOLHA','FRASCO','GALAO',
                                            'GF','GRAMAS','JOGO','KG','KIT','LATA','LITRO','M','M2','M3',
                                            'MILHEI','ML','MWH','PACOTE','PALETE','PARES','PC','POTE','K','RESMA',
                                            'ROLO','SACO','SACOLA','TAMBOR','TANQUE','TON','TUBO','UNID','VASIL','VIDRO');
     cUnidade   : Array[1..61] of String = ('AMPOLA','BALDE','BANDEJA','BARRA','BISNAGA','BLOCO','BOBINA','BOMBONA',
                                            'CAPSULA','CARTELA','CENTO','CONJUNTO','CENTIMETRO','CENTIMETRO QUADRADO',
                                            'CAIXA','CAIXA COM 2 UNIDADES','CAIXA COM 3 UNIDADES','CAIXA COM 5 UNIDADES','CAIXA COM 10 UNIDADES',
                                            'CAIXA COM 15 UNIDADES','CAIXA COM 20 UNIDADES','CAIXA COM 25 UNIDADES','CAIXA COM 50 UNIDADES',
                                            'CAIXA COM 100 UNIDADES','DISPLAY','DUZIA','EMBALAGEM','FARDO','FOLHA','FRASCO','GAL√O',
                                            'GARRAFA','GRAMAS','JOGO','QUILOGRAMA','KIT','LATA','LITRO','METRO','METRO QUADRADO','METRO C⁄BICO',
                                            'MILHEIRO','MILILITRO','MEGAWATT HORA','PACOTE','PALETE','PARES','PE«A','POTE','QUILATE','RESMA',
                                            'ROLO','SACO','SACOLA','TAMBOR','TANQUE','TONELADA','TUBO','UNIDADE','VASILHAME','VIDRO');
begin
     iPosicao := 0;
     for iIndice := 1 to High(cUnidade) do
     begin
          if UpperCase(cUnidade[iIndice]) = UpperCase(Texto) then
             iPosicao := iIndice;
     end;
     if iPosicao = 0 then
        Result := Texto + '...'
     else
        Result := cDescricao[iPosicao];
end;



//=============================================================//
//                        ALTERA«’ES LUCAS                     //
//=============================================================//

{Testa se o CGC È v·lido ou n„o}
function TestaCgc(xCGC: String):Boolean;
Var
  d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
  Check : String;
  LocalResult : Boolean;
  localCgc : string;
begin
  localCgc := xCGC;
  if Length(xCGC) > 14 then
  begin
     localCgc := Copy(xCGC,1,2) + Copy(xCGC,4,3) + Copy(xCGC,8,3) +
     Copy(xCGC,12,4) + Copy(xCGC,17,2);
  end;
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length( xCGC )-2 do
  begin
     if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
     begin
        if xx < 5 then
        begin
           fator := 6 - xx;
        end
        else
        begin
           fator := 14 - xx;
        end;
        d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
        if xx < 6 then
        begin
           fator := 7 - xx;
        end
        else
        begin
           fator := 15 - xx;
        end;
        d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
        xx := xx+1;
     end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
     digito1 := 0;
  end
  else
  begin
     digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
     digito2 := 0;
  end
  else
  begin
     digito2 := 11 - resto;
  end;
  Check := IntToStr(Digito1) + IntToStr(Digito2);
  if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
  begin
     LocalResult := False;
  end
  else
  begin
     LocalResult := True;
  end;
  if localResult then
     localResult := not ((Length(Trim(localCgc)) <> 14)     or
                        (Trim(localCgc) = '11111111111111') or
                        (Trim(localCgc) = '22222222222222') or
                        (Trim(localCgc) = '33333333333333') or
                        (Trim(localCgc) = '44444444444444') or
                        (Trim(localCgc) = '55555555555555') or
                        (Trim(localCgc) = '66666666666666') or
                        (Trim(localCgc) = '77777777777777') or
                        (Trim(localCgc) = '88888888888888') or
                        (Trim(localCgc) = '99999999999999') or
                        (Trim(localCgc) = '00000000000000'));
  Result := LocalResult;
end;

function TestaCPF(xCPF: string) : Boolean;
var
   localCPF : string;
   localResult : boolean;
   digit1, digit2 : integer;
   ii,soma : integer;
begin
   localCPF := '';
   localResult := False;
   {analisa CPF no formato 999.999.999-00}
   if Length(xCPF) = 14 then
      if (Copy(xCPF,4,1)+Copy(xCPF,8,1)+Copy(xCPF,12,1) = '..-') then
      begin
         localCPF := Copy(xCPF,1,3) + Copy(xCPF,5,3) + Copy(xCPF,9,3) + Copy(xCPF,13,2);
         localResult := True;
      end;
      {analisa CPF no formato 99999999900}
      if Length(xCPF) = 11 then
      begin
         localCPF := xCPF;
         localResult := True;
      end;
      {comeca a verificacao do digito}
      if localResult then
      try
         {1∞ digito}
         soma := 0;
         for ii := 1 to 9 do Inc(soma, StrToInt(Copy(localCPF, 10-ii, 1))*(ii+1));
         digit1 := 11 - (soma mod 11);
         if digit1 > 9 then digit1 := 0;
         {2∞ digito}
         soma := 0;
         for ii := 1 to 10 do Inc(soma, StrToInt(Copy(localCPF, 11-ii, 1))*(ii+1));
         digit2 := 11 - (soma mod 11);
         if digit2 > 9 then digit2 := 0;
         {Checa os dois dÌgitos}
         if (Digit1 = StrToInt(Copy(localCPF, 10, 1))) and
            (Digit2 = StrToInt(Copy(localCPF, 11, 1))) then
            localResult := True
         else
            localResult := False;
      except
         localResult := False;
      end;
      if localResult then
         localResult := not ((Length(Trim(localCPF)) <> 11)  or
                            (Trim(localCPF) = '11111111111') or
                            (Trim(localCPF) = '22222222222') or
                            (Trim(localCPF) = '33333333333') or
                            (Trim(localCPF) = '44444444444') or
                            (Trim(localCPF) = '55555555555') or
                            (Trim(localCPF) = '66666666666') or
                            (Trim(localCPF) = '77777777777') or
                            (Trim(localCPF) = '88888888888') or
                            (Trim(localCPF) = '99999999999') or
                            (Trim(localCPF) = '00000000000'));
      Result := localResult;
end;

end.

