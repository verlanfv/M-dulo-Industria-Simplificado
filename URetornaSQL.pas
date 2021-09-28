unit URetornaSQL;

interface

Uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, Printers, DB, dbctrls, Stdctrls, Math, Variants, Mapi,
    ShellAPI, Registry, Windows, Mask, Spin, CheckLst,TlHelp32, Wininet,Commctrl,
    Winsock, Grids, NB30, uFuncoes, uDtmSisGestao, URetornaRecord;

//type
//  TRetornaSQL = class

//  private

//  public


    {Procedimentos de Gravação}
    procedure GravaComposicaoProdFinal() ;
    procedure GravaFormulacaoProdAcabado();
    procedure GravaOrdemProducao();
    procedure GravaKardex();
    procedure GravaHistoricoProduto();
    procedure GravaEstMovimento();
    procedure GravaEstMes();
    procedure GravaGeralNotaInd();
    procedure GravaGeralNotaItemInd();

    {Procedimentos de Exclusão}
    procedure ExcluiMateriaPrima (const PROD_CODIGO, PROD_MAT_PRIMA, COMP_SEQ : string);
    procedure ExcluiProdutoAcabado (const PROD_CODIGO : string);
    procedure ExcluiOrdemProducao (const NR_ORDEM : string);

//end;


implementation



procedure ExcluiMateriaPrima(const PROD_CODIGO, PROD_MAT_PRIMA, COMP_SEQ: string);
var
    sSQLExcluir : string;
begin
    sSQLExcluir := 'delete from geral_produtos_composicao '+
                  ' where (PROD_CODIGO       = :PROD_CODIGO) '+
                  ' and   (PROD_MAT_PRIMA    = :PROD_MAT_PRIMA) '+
                  ' and   (COMP_SEQ          = :COMP_SEQ)';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sSQLExcluir);
            Params.ParamByName('PROD_CODIGO').AsString    := PROD_CODIGO;
            Params.ParamByName('PROD_MAT_PRIMA').AsString := PROD_MAT_PRIMA;
            Params.ParamByName('COMP_SEQ').AsString       := COMP_SEQ;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao excluir o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure ExcluiOrdemProducao(const NR_ORDEM: string);
var
    sSQLExcluir : string;
begin
    sSQLExcluir := 'delete from geral_ordem_producao '+
                  ' where (NR_ORDEM   = :NR_ORDEM) ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sSQLExcluir);
            Params.ParamByName('NR_ORDEM').AsString    := NR_ORDEM;


            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao excluir o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure ExcluiProdutoAcabado(const PROD_CODIGO: string);
var
    sSQLExcluir : string;
begin
    sSQLExcluir := 'delete from geral_produtos_composicao '+
                  ' where (PROD_CODIGO       = :PROD_CODIGO) ';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sSQLExcluir);
            Params.ParamByName('PROD_CODIGO').AsString    := PROD_CODIGO;


            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao excluir o registro.' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;


procedure GravaComposicaoProdFinal;
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

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('PROD_CODIGO').AsString      := URetornaRecord.RetornaComposicaoProdFinal.PROD_CODIGO;
            Params.ParamByName('PROD_MAT_PRIMA').AsString   := URetornaRecord.RetornaComposicaoProdFinal.PROD_MAT_PRIMA;
            Params.ParamByName('COMP_SEQ').AsString         := URetornaRecord.RetornaComposicaoProdFinal.COMP_SEQ;

            sAuxQtde := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaComposicaoProdFinal.COMP_QUANTIDADE,',','.'));
            Params.ParamByName('COMP_QUANTIDADE').AsString  := sAuxQtde;

            Params.ParamByName('COMP_CONVERSAO').AsString   := URetornaRecord.RetornaComposicaoProdFinal.COMP_CONVERSAO;
            Params.ParamByName('ATIVO').AsString            := URetornaRecord.RetornaComposicaoProdFinal.ATIVO;
            Params.ParamByName('COMP_FORMULACAO').AsString  := URetornaRecord.RetornaComposicaoProdFinal.COMP_FORMULACAO;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao gravar o registro. Tabela: geral_produtos_composicao' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure GravaEstMes;
var
    sqlGrava : string;
begin
    sqlGrava := 'insert into geral_estatistica_mensal (empre_codigo,prod_codigo,estmes_data,estmes_sai_qtd,estmes_sai_vlr,estmes_ent_qtd,estmes_ent_vlr) '+
                       'values (:emprecodigo,:prodcodigo,:estmesdata,:estmessaiqtd,:estmessaivlr,:estmesentqtd,:estmesentvlr) '+
                       'on duplicate key update  empre_codigo       = :emprecodigo,'+
                                                'prod_codigo        = :prodcodigo,'+
                                                'estmes_data        = :estmesdata,'+
                                                'estmes_sai_qtd     = :estmessaiqtd,'+
                                                'estmes_sai_vlr     = :estmessaivlr, '+
                                                'estmes_ent_qtd     = :estmesentqtd, '+
                                                'estmes_ent_vlr     = :estmesentvlr';
    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('emprecodigo').AsInteger     := URetornaRecord.RetornaGeralEstMes.EMPRE_CODIGO;
            Params.ParamByName('prodcodigo').AsInteger      := URetornaRecord.RetornaGeralEstMes.PROD_CODIGO;
            Params.ParamByName('estmesdata').AsInteger      := URetornaRecord.RetornaGeralEstMes.ESTMES_DATA;
            Params.ParamByName('estmessaiqtd').AsString     := Trim(URetornaRecord.RetornaGeralEstMes.ESTMES_SAI_QTD);
            Params.ParamByName('estmessaivlr').AsString     := Trim(URetornaRecord.RetornaGeralEstMes.ESTMES_SAI_VLR);
            Params.ParamByName('estmesentqtd').AsString     := Trim(URetornaRecord.RetornaGeralEstMes.ESTMES_ENT_QTD);
            Params.ParamByName('estmesentvlr').AsString     := Trim(URetornaRecord.RetornaGeralEstMes.ESTMES_ENT_VLR);

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_estatistica_mensal' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;}

end;

procedure GravaEstMovimento;
var
    sqlGrava : string;
begin
    sqlGrava := 'insert into geral_movimento (empre_codigo,prod_codigo,estmvto_data,estmvto_documento,estmvto_serie,cli_codigo,'+
                '                             estmvto_quantidade,estmvto_valor,natu_codigo,repre_codigo,estmvto_custo) '+
                'values (:emprecodigo,:prodcodigo,:estmvtodata,:estmvtodocumento,:estmvtoserie,:clicodigo,'+
                '        :estmvtoquantidade,:estmvtovalor,:natucodigo,:reprecodigo,:estmvtocusto) '+

                'on duplicate key update  empre_codigo          = :emprecodigo,'+
                                                'prod_codigo           = :prodcodigo,'+
                                                'estmvto_data          = :estmvtodata,'+
                                                'estmvto_documento     = :estmvtodocumento,'+
                                                'estmvto_serie         = :estmvtoserie,'+
                                                'cli_codigo            = :clicodigo,'+
                                                'estmvto_quantidade    = :estmvtoquantidade,'+
                                                'estmvto_valor         = :estmvtovalor,'+
                                                'natu_codigo           = :natucodigo,'+
                                                'repre_codigo          = :reprecodigo,'+
                                                'estmvto_custo         = :estmvtocusto ';
    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('EMPRECODIGO').AsInteger        := URetornaRecord.RetornaGeralEstMov.EMPRE_CODIGO;
            Params.ParamByName('PRODCODIGO').AsInteger         := URetornaRecord.RetornaGeralEstMov.PROD_CODIGO;
            Params.ParamByName('ESTMVTODATA').AsDate           := StrToDate(URetornaRecord.RetornaGeralEstMov.ESTMVTO_DATA);
            Params.ParamByName('ESTMVTODOCUMENTO').AsInteger   := URetornaRecord.RetornaGeralEstMov.ESTMVTO_DOCUMENTO;
            Params.ParamByName('ESTMVTOSERIE').AsString        := Trim(URetornaRecord.RetornaGeralEstMov.ESTMVTO_SERIE);
            Params.ParamByName('CLICODIGO').AsInteger          := URetornaRecord.RetornaGeralEstMov.CLI_CODIGO;
            Params.ParamByName('ESTMVTOQUANTIDADE').AsString   := Trim(URetornaRecord.RetornaGeralEstMov.ESTMVTO_QUANTIDADE);
            Params.ParamByName('ESTMVTOVALOR').AsString        := Trim(URetornaRecord.RetornaGeralEstMov.ESTMVTO_VALOR);
            Params.ParamByName('NATUCODIGO').AsInteger         := URetornaRecord.RetornaGeralEstMov.NATU_CODIGO;
            Params.ParamByName('REPRECODIGO').AsString         := URetornaRecord.RetornaGeralEstMov.REPRE_CODIGO;
            Params.ParamByName('ESTMVTOCUSTO').AsString        := Trim(URetornaRecord.RetornaGeralEstMov.ESTMVTO_CUSTO);

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_movimento' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;}

end;

procedure GravaFormulacaoProdAcabado;
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

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('PROD_CODIGO').AsString      := URetornaRecord.RetornaFormulacaoProdFinal.PROD_CODIGO;
            Params.ParamByName('PROD_MAT_PRIMA').AsString   := URetornaRecord.RetornaFormulacaoProdFinal.PROD_MAT_PRIMA;
            Params.ParamByName('COMP_SEQ').AsString         := URetornaRecord.RetornaFormulacaoProdFinal.COMP_SEQ;

            sAuxQtde := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaFormulacaoProdFinal.COMP_QUANTIDADE,',','.'));
            Params.ParamByName('COMP_QUANTIDADE').AsString  := sAuxQtde;

            Params.ParamByName('COMP_CONVERSAO').AsString   := URetornaRecord.RetornaFormulacaoProdFinal.COMP_CONVERSAO;
            Params.ParamByName('ATIVO').AsString            := URetornaRecord.RetornaFormulacaoProdFinal.ATIVO;
            Params.ParamByName('COMP_FORMULACAO').AsString  := URetornaRecord.RetornaFormulacaoProdFinal.COMP_FORMULACAO;

            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao gravar o registro. Tabela: geral_produtos_composicao' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

procedure GravaGeralNotaInd;
var
    sqlGrava : string;
begin
    sqlGrava :=  'INSERT INTO GERAL_NOTAS_CAPA (EMPRE_CODIGO,NOTA_NUMERO,NOTA_SERIE,CLI_CODIGO,NOTA_DT_EMISSAO,NOTA_CFOP,NOTA_TIPO,'+
                                                    'NATU_CODIGO,NATU_NOME,CLI_CNPJCPF,CLI_IE,CLI_TIPOPESSOA,SITUACAO_TIPO,SITUACAO_CODIGO,'+
                                                    'NOTA_SITUACAO,NOTA_VALOR_NF,NOTA_MODELO) '+
                                           'VALUES (:EMPRECODIGO,:NOTANUMERO,:NOTASERIE,:CLICODIGO,:NOTADTEMISSAO,:NOTACFOP,:NOTATIPO,'+
                                                   ':NATUCODIGO,:NATUNOME,:CLICNPJCPF,:CLIIE,:CLITIPOPESSOA,:SITUACAOTIPO,:SITUACAOCODIGO,'+
                                                   ':NOTASITUACAO,:NOTAVALORNF,:NOTAMODELO) '+
                          'ON DUPLICATE KEY UPDATE  EMPRE_CODIGO          = :EMPRECODIGO,'+
                                                   'NOTA_NUMERO 		      = :NOTANUMERO,'+
                                                   'NOTA_SERIE 		        = :NOTASERIE,'+
                                                   'CLI_CODIGO 		        = :CLICODIGO,'+
                                                   'NOTA_DT_EMISSAO 	    = :NOTADTEMISSAO,'+
                                                   'NOTA_CFOP   		      = :NOTACFOP,'+
                                                   'NOTA_TIPO   		      = :NOTATIPO,'+
                                                   'NATU_CODIGO  	  	    = :NATUCODIGO,'+
                                                   'NATU_NOME 	  	      = :NATUNOME,'+
                                                   'CLI_CNPJCPF 		      = :CLICNPJCPF,'+
                                                   'CLI_IE 			          = :CLIIE,'+
                                                   'CLI_TIPOPESSOA 		    = :CLITIPOPESSOA,'+
                                                   'SITUACAO_TIPO		      = :SITUACAOTIPO,'+
                                                   'SITUACAO_CODIGO 	    = :SITUACAOCODIGO,'+
                                                   'NOTA_SITUACAO         = :NOTASITUACAO,'+
                                                   'NOTA_VALOR_NF         = :NOTAVALORNF,'+
                                                   'NOTA_MODELO         = :NOTAMODELO';



    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('EMPRECODIGO').AsInteger := URetornaRecord.RetornaGeralNota.EMPRE_CODIGO;
            Params.ParamByName('NOTANUMERO').AsInteger  := URetornaRecord.RetornaGeralNota.NOTA_NUMERO;
            Params.ParamByName('NOTASERIE').AsString    := URetornaRecord.RetornaGeralNota.NOTA_SERIE;
            Params.ParamByName('CLICODIGO').AsInteger   := URetornaRecord.RetornaGeralNota.CLI_CODIGO;
            if AllTrim(URetornaRecord.RetornaGeralNota.NOTA_DT_EMISSAO) <> '//'  then
                Params.ParamByName('NOTADTEMISSAO').AsDate     := StrToDate(Trim(URetornaRecord.RetornaGeralNota.NOTA_DT_EMISSAO))
            else // cria o campo data como nulo
            begin
                Params.ParamByName('NOTADTEMISSAO').AsDate     := StrToDate('11/11/1111');
                Params.ParamByName('NOTADTEMISSAO').Clear;
            end;
            Params.ParamByName('NOTACFOP').AsString           := URetornaRecord.RetornaGeralNota.NOTA_CFOP;
            Params.ParamByName('NATUCODIGO').AsString         := URetornaRecord.RetornaGeralNota.NATU_CODIGO;
            Params.ParamByName('NOTATIPO').AsString           := URetornaRecord.RetornaGeralNota.NOTA_TIPO;
            Params.ParamByName('NATUNOME').AsString           := URetornaRecord.RetornaGeralNota.NATU_NOME;
            Params.ParamByName('CLICNPJCPF').AsString         := URetornaRecord.RetornaGeralNota.CLI_CNPJCPF;
            Params.ParamByName('CLIIE').AsString              := URetornaRecord.RetornaGeralNota.CLI_IE;
            Params.ParamByName('CLITIPOPESSOA').AsString      := URetornaRecord.RetornaGeralNota.CLI_TIPOPESSOA;
            Params.ParamByName('NOTAVALORNF').AsString        := URetornaRecord.RetornaGeralNota.NOTA_VALOR_NF;
            Params.ParamByName('NOTAMODELO').AsString         := URetornaRecord.RetornaGeralNota.NOTA_MODELO;
            Params.ParamByName('NOTASITUACAO').AsString       := URetornaRecord.RetornaGeralNota.NOTA_SITUACAO;
            Params.ParamByName('SITUACAOCODIGO').AsString     := URetornaRecord.RetornaGeralNota.SITUACAO_CODIGO;
            Params.ParamByName('SITUACAOTIPO').AsString       := URetornaRecord.RetornaGeralNota.SITUACAO_TIPO;

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_notas_capa' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;}


end;

procedure GravaGeralNotaItemInd;
var
    sqlGrava : string;
begin
    sqlGrava :=  'INSERT INTO geral_notas_itens (EMPRE_CODIGO,NOTA_NUMERO,NOTA_SERIE,CLI_CODIGO,NOTA_DT_EMISSAO,NOTA_CFOP,ITENS_SEQ,PROD_CODIGO,'+
                    '  ITENS_UNIDADE,ITENS_QUANTIDADE,ITENS_PRECO_BRUTO)'+
                '  VALUES( :EMPRE_CODIGO,:NOTA_NUMERO,:NOTA_SERIE,:CLI_CODIGO,:NOTA_DT_EMISSAO,:NOTA_CFOP,:ITENS_SEQ,:PROD_CODIGO,'+
                '  :ITENS_UNIDADE,:ITENS_QUANTIDADE,:ITENS_PRECO_BRUTO)';

    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('EMPRE_CODIGO').AsString  := URetornaRecord.RetornaGeralNotaItem.EMPRE_CODIGO;
            Params.ParamByName('NOTA_NUMERO').AsString   := URetornaRecord.RetornaGeralNotaItem.NOTA_NUMERO;
            Params.ParamByName('NOTA_SERIE').AsString    := URetornaRecord.RetornaGeralNotaItem.NOTA_SERIE;
            Params.ParamByName('CLI_CODIGO').AsString    := URetornaRecord.RetornaGeralNotaItem.CLI_CODIGO;
            if AllTrim(URetornaRecord.RetornaGeralNota.NOTA_DT_EMISSAO) <> '//'  then
                Params.ParamByName('NOTA_DT_EMISSAO').AsDate     := StrToDate(Trim(URetornaRecord.RetornaGeralNotaItem.NOTA_DT_EMISSAO))
            else // cria o campo data como nulo
            begin
                Params.ParamByName('NOTA_DT_EMISSAO').AsDate     := StrToDate('11/11/1111');
                Params.ParamByName('NOTA_DT_EMISSAO').Clear;
            end;
            Params.ParamByName('NOTA_CFOP').AsString            := URetornaRecord.RetornaGeralNotaItem.NOTA_CFOP;
            Params.ParamByName('ITENS_SEQ').AsString            := URetornaRecord.RetornaGeralNotaItem.ITENS_SEQ;
            Params.ParamByName('PROD_CODIGO').AsString          := URetornaRecord.RetornaGeralNotaItem.PROD_CODIGO;
            Params.ParamByName('ITENS_UNIDADE').AsString        := URetornaRecord.RetornaGeralNotaItem.ITENS_UNIDADE;
            Params.ParamByName('ITENS_QUANTIDADE').AsString     := URetornaRecord.RetornaGeralNotaItem.ITENS_QUANTIDADE;
            Params.ParamByName('ITENS_PRECO_BRUTO').AsString    := URetornaRecord.RetornaGeralNotaItem.ITENS_PRECO_BRUTO;

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_notas_itens' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;}


end;

procedure GravaHistoricoProduto;
var
    sqlGrava : string;
begin
    sqlGrava := 'insert into geral_historico_produto(empre_codigo,prod_codigo,histp_qtd_estoque_atual,histp_qtd_anterior,histp_data_ultima_saida,histp_data_ultima_entrada,histp_nr_lancamento, histp_qtd_ultima_saida, histp_qtd_ultima_entrada )'+
                '            values(:empre_codigo,:prod_codigo,:histp_qtd_estoque_atual,:histp_qtd_anterior,:histp_data_ultima_saida, :histp_data_ultima_entrada, :histp_nr_lancamento, :histp_qtd_ultima_saida, :histp_qtd_ultima_entrada)'+

                'on duplicate key update  histp_qtd_estoque_atual    =:histp_qtd_estoque_atual,'+
                '                         histp_qtd_anterior         =:histp_qtd_anterior,      '+
                '                         histp_data_ultima_saida    =:histp_data_ultima_saida, '+
                '                         histp_data_ultima_entrada  =:histp_data_ultima_entrada, '+
                '                         histp_nr_lancamento        =:histp_nr_lancamento,   '+
                '                         histp_qtd_ultima_saida     =:histp_qtd_ultima_saida,   '+
                '                         histp_qtd_ultima_entrada   =:histp_qtd_ultima_entrada  ';
    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('empre_codigo').AsInteger           := URetornaRecord.RetornaGeralHistorico.EMPRE_CODIGO;
            Params.ParamByName('prod_codigo').AsInteger            := URetornaRecord.RetornaGeralHistorico.PROD_CODIGO;
            Params.ParamByName('histp_qtd_estoque_atual').AsString := Elimina_Caracteres(URetornaRecord.RetornaGeralHistorico.HISTP_QTD_ESTOQUE_ATUAL,',','.');
            Params.ParamByName('histp_qtd_anterior').AsString      := Elimina_Caracteres(URetornaRecord.RetornaGeralHistorico.HISTP_QTD_ANTERIOR,',','.');
            if URetornaRecord.RetornaGeralHistorico.HISTP_DATA_ULTIMA_SAIDA <> '' then
                Params.ParamByName('histp_data_ultima_saida').AsDate    := strtodate(URetornaRecord.RetornaGeralHistorico.HISTP_DATA_ULTIMA_SAIDA)
            else
            begin
                Params.ParamByName('histp_data_ultima_saida').AsDate := StrToDate('11/11/1111');
                Params.ParamByName('histp_data_ultima_saida').Clear;
            end;

            if URetornaRecord.RetornaGeralHistorico.HISTP_DATA_ULTIMA_ENTRADA <> '' then
                Params.ParamByName('histp_data_ultima_entrada').AsDate  := strtodate(URetornaRecord.RetornaGeralHistorico.HISTP_DATA_ULTIMA_ENTRADA)
            else
            begin
                Params.ParamByName('histp_data_ultima_entrada').AsDate := StrToDate('11/11/1111');
                Params.ParamByName('histp_data_ultima_entrada').Clear;
            end;

            Params.ParamByName('histp_qtd_ultima_saida').AsString    := URetornaRecord.RetornaGeralHistorico.HISTP_QTD_ULTIMA_SAIDA;
            Params.ParamByName('histp_qtd_ultima_entrada').AsString  := URetornaRecord.RetornaGeralHistorico.HISTP_QTD_ULTIMA_ENTRADA;
            Params.ParamByName('histp_nr_lancamento').AsInteger      := URetornaRecord.RetornaGeralHistorico.HISTP_NR_LANCAMENTO;

            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_historico_produto' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;}


end;

procedure GravaKardex;
var
    sqlGrava : string;
begin
    sqlGrava := 'INSERT INTO GERAL_KARDEX (EMPRE_CODIGO,PROD_CODIGO,KARD_LANCAMENTO,KARD_DATA,KARD_DOCUMENTO,KARD_TIPO,'+
                                           'KARD_QUANTIDADE,KARD_ESTOQUE,CLI_CODIGO,EMPRE_CODIGOF,FUNC_CODIGO,KARD_COMPLEMENTO) '+
                       'VALUES (:EMPRECODIGO,:PRODCODIGO,:KARDLANCAMENTO,:KARDDATA,:KARDDOCUMENTO,:KARDTIPO,'+
                               ':KARDQUANTIDADE,:KARDESTOQUE,:CLICODIGO,:EMPRECODIGOF,:FUNCCODIGO,:KARDCOMPLEMENTO) ';
    //if dtmSisGestao.FdConnection.InTransaction then
    //    dtmSisGestao.FdConnection.Rollback(tdSisGestao);
    //dtmSisGestao.FdConnection.StartTransaction;

    //try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('EMPRECODIGO').AsInteger            := URetornaRecord.RetornaGeralKardex.EMPRE_CODIGO;
            Params.ParamByName('PRODCODIGO').AsInteger             := URetornaRecord.RetornaGeralKardex.PROD_CODIGO;
            Params.ParamByName('KARDLANCAMENTO').AsInteger         := URetornaRecord.RetornaGeralKardex.KARD_LANCAMENTO;
            if (AllTrim(URetornaRecord.RetornaGeralKardex.KARD_DATA) <> '//') and (Trim(URetornaRecord.RetornaGeralKardex.KARD_DATA) <> '')  then
                Params.ParamByName('KARDDATA').AsDate := StrToDate(Trim(URetornaRecord.RetornaGeralKardex.KARD_DATA))
            else // cria o campo data como nulo
            begin
                Params.ParamByName('KARDDATA').AsDate := StrToDate('11/11/1111');
                Params.ParamByName('KARDDATA').Clear;
            end;
            Params.ParamByName('KARDDOCUMENTO').AsInteger  := URetornaRecord.RetornaGeralKardex.KARD_DOCUMENTO;
            Params.ParamByName('KARDTIPO').AsString        := Trim(URetornaRecord.RetornaGeralKardex.KARD_TIPO);
            Params.ParamByName('KARDQUANTIDADE').AsString  := Trim(URetornaRecord.RetornaGeralKardex.KARD_QUANTIDADE);
            Params.ParamByName('KARDESTOQUE').AsString     := Trim(URetornaRecord.RetornaGeralKardex.KARD_ESTOQUE);
            Params.ParamByName('CLICODIGO').AsInteger      := URetornaRecord.RetornaGeralKardex.CLI_CODIGO;
            Params.ParamByName('EMPRECODIGOF').AsInteger   := URetornaRecord.RetornaGeralKardex.EMPRE_CODIGOF;
            Params.ParamByName('FUNCCODIGO').AsString      := URetornaRecord.RetornaGeralKardex.FUNC_CODIGO;
            Params.ParamByName('KARDCOMPLEMENTO').AsString := 'O.P.';


            Execute();
        end;

    {except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('Erro ao gravar o registro. Tabela: geral_kardex' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit; }

end;

procedure GravaOrdemProducao;
var
    sqlGrava : string;
    sAuxQtdeKG, sAuxQtdeSC, sAuxQtdePC, sAuxVlrTotal  : string;

begin
    sqlGrava := 'insert into geral_ordem_producao(NR_ORDEM, DATA_EMISSAO, PROD_CODIGO, QTDE_SC, QTDE_PC, QTDE_KG,  '+
                ' SITUACAO, VALOR_TOTAL, NR_LOTE, DATA_VALIDADE ) '+

                'Values (:NR_ORDEM, :DATA_EMISSAO, :PROD_CODIGO, :QTDE_SC, :QTDE_PC, :QTDE_KG,  '+
                ' :SITUACAO, :VALOR_TOTAL, :NR_LOTE, :DATA_VALIDADE )'+

                '        on duplicate key update   NR_ORDEM           = :NR_ORDEM, '+
                '                                  DATA_EMISSAO       = :DATA_EMISSAO,  '+
                '                                  PROD_CODIGO        = :PROD_CODIGO,'+
                '                                  QTDE_SC            = :QTDE_SC,'+
                '                                  QTDE_PC            = :QTDE_PC,'+
                '                                  QTDE_KG            = :QTDE_KG,'+
                '                                  SITUACAO           = :SITUACAO,'+
                '                                  VALOR_TOTAL        = :VALOR_TOTAL,'+
                '                                  NR_LOTE            = :NR_LOTE,'+
                '                                  DATA_VALIDADE      = :DATA_VALIDADE';

    if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;

    try
        with dtmSisGestao.FdQryGeralDados do
        begin
            Active := False;
            SQL.Clear;
            SQL.Add(sqlGrava);
            Params.ParamByName('NR_ORDEM').AsString           := URetornaRecord.RetornaOrdemProducao.NR_ORDEM;
            Params.ParamByName('DATA_EMISSAO').AsString       := FormatDateTime('yyyy/mm/dd', URetornaRecord.RetornaOrdemProducao.DATA_EMISSAO);
            Params.ParamByName('PROD_CODIGO').AsString        := URetornaRecord.RetornaOrdemProducao.PROD_CODIGO;

            sAuxQtdeSC := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaOrdemProducao.QTDE_SC,',','.'));
            Params.ParamByName('QTDE_SC').AsString  := sAuxQtdeSC;

            sAuxQtdePC := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaOrdemProducao.QTDE_PC,',','.'));
            Params.ParamByName('QTDE_PC').AsString  := sAuxQtdePC;

            sAuxQtdeKG := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaOrdemProducao.QTDE_KG,',','.'));
            Params.ParamByName('QTDE_KG').AsString  := sAuxQtdeKG;

            Params.ParamByName('SITUACAO').AsString                := URetornaRecord.RetornaOrdemProducao.SITUACAO;

            sAuxVlrTotal := AllTrim(Elimina_Caracteres(URetornaRecord.RetornaOrdemProducao.VALOR_TOTAL,',','.'));
            Params.ParamByName('VALOR_TOTAL').AsString  := sAuxVlrTotal;

            Params.ParamByName('NR_LOTE').AsString               := URetornaRecord.RetornaOrdemProducao.NR_LOTE;
            Params.ParamByName('DATA_VALIDADE').AsString         := FormatDateTime('yyyy/mm/dd', URetornaRecord.RetornaOrdemProducao.DATA_VALIDADE);


            Execute();
        end;

    except
        on e : Exception do
        begin
            dtmSisGestao.FdConnection.Rollback;
            Informacao('Erro ao gravar o registro. Tabela: geral_ordem_producao' +#10+#13+ 'Mensagem do erro:' + e.Message, 'Aviso..');
            Exit;
        end;
    end;

    dtmSisGestao.FdConnection.Commit;

end;

end.
