unit URetornaSQL;

interface

Uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, Printers, DB, dbctrls, Stdctrls, Math, Variants, Mapi,
    ShellAPI, Registry, Windows, Mask, Spin, CheckLst,TlHelp32, Wininet,Commctrl,
    Winsock, Grids, NB30, uFuncoes, uDtmSisGestao, URetornaRecord;

type
  TRetornaSQL = class

  private

  public
     //RetornaRecord : TRetornaRecord;

     {declara todos os record}
     RetornaComposicaoProdFinal : rComposicaoProdutoFinal;
     RetornaProduto : rProduto;


    procedure ExcluiMateriaPrima (const PROD_CODIGO, PROD_MAT_PRIMA, COMP_SEQ : string);
    procedure ExcluiProdutoAcabado (const PROD_CODIGO : string);
    procedure GravaComposicaoProdFinal() ;

    procedure GravaProtuto();
end;


implementation




procedure TRetornaSQL.ExcluiMateriaPrima(const PROD_CODIGO, PROD_MAT_PRIMA, COMP_SEQ: string);
var
    sSQLExcluir : string;
begin
    sSQLExcluir := 'delete from geral_produtos_composicao '+
                  ' where (PROD_CODIGO       = :PROD_CODIGO) '+
                  ' and   (PROD_MAT_PRIMA    = :PROD_MAT_PRIMA) '+
                  ' and   (COMP_SEQ          = :COMP_SEQ)';

    if dtmSisGestao.scnSisGestao.InTransaction then
        dtmSisGestao.scnSisGestao.Commit(tdSisGestao);
    dtmSisGestao.scnSisGestao.StartTransaction(tdSisGestao);

    try
        with dtmSisGestao.cdsGeralDados do
        begin
            Active := False;
            CommandText := sSQLExcluir;
            Params.ParamByName('PROD_CODIGO').AsString    := PROD_CODIGO;
            Params.ParamByName('PROD_MAT_PRIMA').AsString := PROD_MAT_PRIMA;
            Params.ParamByName('COMP_SEQ').AsString       := COMP_SEQ;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
            Informacao('Erro ao excluir o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.scnSisGestao.Commit(tdSisGestao);

end;

procedure TRetornaSQL.ExcluiProdutoAcabado(const PROD_CODIGO: string);
var
    sSQLExcluir : string;
begin
    sSQLExcluir := 'delete from geral_produtos_composicao '+
                  ' where (PROD_CODIGO       = :PROD_CODIGO) ';

    if dtmSisGestao.scnSisGestao.InTransaction then
        dtmSisGestao.scnSisGestao.Commit(tdSisGestao);
    dtmSisGestao.scnSisGestao.StartTransaction(tdSisGestao);

    try
        with dtmSisGestao.cdsGeralDados do
        begin
            Active := False;
            CommandText := sSQLExcluir;
            Params.ParamByName('PROD_CODIGO').AsString    := PROD_CODIGO;


            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
            Informacao('Erro ao excluir o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.scnSisGestao.Commit(tdSisGestao);

end;


procedure TRetornaSQL.GravaComposicaoProdFinal;
var
    sqlGrava : string;
    sAuxQtde : string;
begin
    sqlGrava := 'insert into geral_produtos_composicao(PROD_CODIGO, PROD_MAT_PRIMA, COMP_SEQ, '+
                ' COMP_QUANTIDADE, COMP_CONVERSAO, ATIVO, COMP_FORMULACAO) '+

                'Values (:PROD_CODIGO, :PROD_MAT_PRIMA, :COMP_SEQ,'+
                '        :COMP_QUANTIDADE, :COMP_CONVERSAO, :ATIVO, :COMP_FORMULACAO)'+

                '        on duplicate key update   PROD_CODIGO          = :PROD_CODIGO, '+
                '                                  PROD_MAT_PRIMA       = :PROD_MAT_PRIMA,  '+
                '                                  COMP_SEQ             = :COMP_SEQ,'+
                '                                  COMP_QUANTIDADE      = :COMP_QUANTIDADE,'+
                '                                  COMP_CONVERSAO       = :COMP_CONVERSAO,'+
                '                                  ATIVO                = :ATIVO,'+
                '                                  COMP_FORMULACAO      = :COMP_FORMULACAO';

    if dtmSisGestao.scnSisGestao.InTransaction then
        dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
    dtmSisGestao.scnSisGestao.StartTransaction(tdSisGestao);

    try
        with dtmSisGestao.cdsGeralDados do
        begin
            Active := False;
            CommandText := '';
            CommandText := sqlGrava;
            Params.ParamByName('PROD_CODIGO').AsString      := RetornaComposicaoProdFinal.PROD_CODIGO;
            Params.ParamByName('PROD_MAT_PRIMA').AsString   := RetornaComposicaoProdFinal.PROD_MAT_PRIMA;
            Params.ParamByName('COMP_SEQ').AsString         := RetornaComposicaoProdFinal.COMP_SEQ;

            sAuxQtde := AllTrim(Elimina_Caracteres(RetornaComposicaoProdFinal.COMP_QUANTIDADE,',','.'));
            Params.ParamByName('COMP_QUANTIDADE').AsString  := sAuxQtde;

            Params.ParamByName('COMP_CONVERSAO').AsString   := RetornaComposicaoProdFinal.COMP_CONVERSAO;
            Params.ParamByName('ATIVO').AsString            := RetornaComposicaoProdFinal.ATIVO;
            Params.ParamByName('COMP_FORMULACAO').AsString  := RetornaComposicaoProdFinal.COMP_FORMULACAO;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.scnSisGestao.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.scnSisGestao.Commit(tdSisGestao);

end;

procedure TRetornaSQL.GravaProtuto;
begin
{criar operação de gravação de produtos}
//....

end;

end.
