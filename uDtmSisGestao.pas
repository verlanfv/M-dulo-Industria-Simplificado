{-------------------------------------------------------------------------------
 Programa..: uDtmSisGestao
 Empresa...: SULPASSO INFORMÁTICA
 Finalidade: Gerenciamento das conexões com o banco, configurações, etc...

 Autor          Data     Operação  Descrição
 Antonio Gomes  MAI/2008 Criação
 Vanessa        JAN/2010 Alterar   Arquivo INI
 Vanessa        SET/2010 Alterar   SQL Lowercase + config nfe
 Vanessa        OUT/2011 Alterar   Tabela AUDITORIA SQL + Record +
 Vanessa        MAR/2012 Alterar   Variável Type CONFSISGESTAO.CONFIG_SPC + NATUREZA CRIAR CAMPO EMPRESA FINANCEIRO
 Vanessa        SET/2012 Alterar   Criar Tabela de Configuração Específicas Empresa
 Vanessa        JAN/2013 Alterar   Criar Tabela de Configuração de Pedidos do Faturamento
 Vanessa        FEV/2013 Alterar   Acertar campos configurador Geral (ex: ramo da empresa = combustível)
 Vanessa        AGO/2013 Alterar   Versão NFe  2.51  2Gv1.3 (06/05/2013)        Alterações para REJEITAR notas não encontradas na Sefaz
 Vanessa        OUT/2013 Alterar   Versão NFe  2.52  2Gv1.3 (06/05/2013)        Alterações para IGUALAR a versão da NFe 2G
 Vanessa        FEV/2015 Alterar   NF-e 3a Geração - Versão 3.08
 Vanessa        MAR/2015 Alterar   NF-e 3a Versão 3.09 - Liberar uso do Registro 028 (Cupom Referenciado)
 Vanessa        ABR/2015 Alterar   NF-e 3a Versão 3.10 - Danfe Simple3s Nacional (Origem + CSOSN) e demais alterações para igualar versão 3.10 dos demais
 Vanessa        MAR/2015 Alterar   NF-e 3a Versão 3.10   Alteração - Acrescentar Data de Saída no XML
 Vanessa        MAI/2015 Alterar   NF-e 3a Versão 3.11   Alteração - Controlar Login Usuário só na hora de importar... até obter retorno do lote
 Vanessa        JUN/2015 Alterar   NF-e 3a Versão 3.12   Alteração - Ajustar impressão cpf Danfe NFCE / notas denegadas em marrom / msg nao é pedido valido zerado
 Vanessa        JUL/2015 Alterar   NF-e 3a Versão 3.13   Alteração - NFC-e Ajustar QRCODE - não pode ser gerado no xml o destinatário, caso o consumidor não seja informado
 Vanessa        AGO/2015 Alterar   NF-e 3a Versão 3.14   Alteração - Permite cancelamento até 7 dias (168 horas) após autorização
 Vanessa        AGO/2015 Alterar   NF-e 3a Versão 3.15   Alteração - Obs Cancelamento, Danfe 1 linha, NF Denegada cor Marrom, Configurador NFE
 Vanessa        AGO/2015 Alterar   NF-e 3a Versão 3.16   Alteração - Evento Cancelamento (NFe 168 horas, NFCe 24 horas), Msg Email Tempo maior Maxipel, Configurador NFe
 Vanessa        SET/2015 Alterar   NF-e 3a Versão 3.17   Alteração - Web Services...  NOVA DLL
 Vanessa        SET/2015 Alterar   NF-e 3a Versão 3.18   Alteração - Evento CCe - tempo Indeterminado
 Vanessa        SET/2015 Alterar   NF-e 3a Versão 3.19   Alteração - Busca Lote
 Vanessa        MAR/2016 Alterar   NF-e 3a Versão 3.29   Alteração - campos CEST, UFDEst...
 Vanessa        SET/2016 Alterar   NF-e 3a Versão 3.30   Alteração - NF Exportação ...
 Vanessa        OUT/2016 Alterar   NF-e 3a Versão 3.31   Alteração - Retorno de Notas em Processamento (Atualizar Pedido e Pré-Venda)
 Vanessa        NOV/2016 Alterar   NF-e 3a Versão 3.32   Alteração - DIAS PARA CANCELAMENTO, Liberar notas 7 dias
 Vanessa        DEZ/2016 Alterar   NF-e 3a Versão 3.33   Alteração - Liberar emissão de NFC-e
 Vanessa        JAN/2017 Alterar   NF-e 3a Versão 3.34   Alteração - NFC-e com ST
 Vanessa        JAN/2017 Alterar   NF-e 3a Versão 3.35   Alteração - NFe Devolução com IPI
 Vanessa        MAR/2017 Alterar   NF-e 3a Versão 3.36   Alteração - NFe puxar da pasta caminhonfe - buscava arquivo texto na pasta retorno
 Vanessa        MAR/2017 Alterar   NF-e 3a Versão 3.37   Alteração - Cancelamento NF-e alterando situação da Pré-Venda
 Vanessa        ABR/2017 Alterar   NF-e 3a Versão 3.38   Alteração - Diminuir colunas Grid consulta pra nao dar erro memoria
 Vanessa        ABR/2017 Alterar   NF-e 3a Versão 3.39   Alteração - Cancelamento NF-e alterando situação da Pré-Venda
-------------------------------------------------------------------------------}
unit uDtmSisGestao;

interface

uses
  SysUtils, Classes, {DBXpress,} FMTBcd, DB, DBClient, TConnect, SqlExpr, Provider,Messages , Dialogs,
  IniFiles, Forms, Graphics, ActiveX, ShellAPI, ppBands, ppCtrls, ppVar, {NFe_Util_2G_TLB,}
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  Data.DBXMySQL, ppDesignLayer, ppParameter, uFuncoes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet;


function VerificaCadastroMenu(pFuncCodigo,pMenuCodigo : String;
                              pEmpreCodigo: Double;
                              var pNivel : string) : Boolean;
procedure Limpa_variavel(var pRetorno : String);

function VerificaTipoUsuario(pFuncCodigo : String;
                              pEmpreCodigo : Double) : Boolean;

type
  TdtmSisGestao = class(TDataModule)
    FdConnection: TFDConnection;
    FdQryGeral: TFDQuery;
    FdQryConsulta: TFDQuery;
    FdQryGeralDados: TFDQuery;
    FDWait: TFDGUIxWaitCursor;
    FDMySQLDriverLink: TFDPhysMySQLDriverLink;
    FdTransaction: TFDTransaction;
    DataSetProvider1: TDataSetProvider;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dspSisGestaoAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DataModuleCreate(Sender: TObject);
    procedure Le_Dados_Configuracao;
    procedure Grava_Dados_Iniciais;
    procedure Escreve_Dados_INI;
    procedure Le_Dados_INI;
    Procedure ConectaMysqlGestao;
    Procedure ConectaFireBirdGestao;
    procedure Verifica_Pastas;
    procedure Verifica_Usuarios_Logados(var pRetorno : String);
    procedure Gravar_Auditoria;
    function  Carrega_Config_Geral : Boolean;
    procedure iniEcf;
    procedure Flexdocs_Versao;
    procedure Preenche_Type_Usuario;
    procedure CarregaGeral_Nfe(Sender: TObject);
    procedure CarregaEmpresaEspecifica;
    procedure FdConnectionBeforeConnect(Sender: TObject);

  private
    { Private declarations }

  public

        bPrimeiravez, bExisteNFCe, bExisteNFe, bDiretorio, bRetSefaz, bLancouNF, bNFeAutomatica : Boolean;
        sVersaoNFe, sVersaoDLL, sSistema, sModeloLogin, sRetornoLogado, sCaminhoLogin,
        // delonei para controle de um programa para outro
        svisualizar,
        // Variáveis Retorno
        gsRetEmpresa, gsRetSerie, gsRetNFe, gsRetPedido, gsRetRota, gsRetDataEmissao, gsRetCfop, gsRetProtocolo, gsRetChaveAcesso, gsRetCliente,
        gsRetErro, gsSituacao, gsRetVariavel, gsRetModelo : String;

    { Public declarations }
  end;

type
    RLINHAPARCELA = record
                       indice :STRING;
                       data   :STRING;
                       valor  :STRING;
                    end;
    RECF = record
               ecf_empresa           : string;
               ecf_modelo            : string; // 0 - Urano, 1 - Bematech
               ecf_serie             : string; // 0 - Urano, 1 - Bematech
               ecf_cupom_serie       : string; // 0 - Urano, 1 - Bematech
               ecf_portaserial       : String;
               ecf_terminal          : string;
               ecf_gaveta            : string;
               caminho_logo          : string;
               caminho_arquivo       : string;
         end;

    RLINHADIGITACAO = record
                          indice             : String;
                      situacao           : String;
                      quantidade         : String;
                      barras             : String;
                      tabela             : String;
                      precounidade       : String;
                      valordesconto      : String;
                      percentualdesconto : String;
                      descricaoproduto   : String;
                      unidadevenda       : String;
                      aliquota           : String;
                      prctipo            : String;
                      tipoqtd            : String;
                      totalitem          : String;
                      tipodesconto       : String;
       end;

  RCONFIGURAECF = record
    ecf_empresa          :string;
    ecf_codigo           :string;
    ecf_fornecedor       :string;
    ecf_marca            :string;
    ecf_dll_versao       :string;
    ecf_modelo           :string;
    ecf_serie            :string;
    ecf_data             :string;
    ecf_situacao         :string;
    ecf_obs              :widestring;
    ecf_mens_promo       :string;
    ecf_m_dsc_item       :string;
    ecf_m_acr_sub        :string;
    ecf_m_dsc_sub        :string;
    ecf_m_can_item       :string;
    ecf_m_can_dsc_item   :string;
    ecf_cliente_default  :string;
    ecf_natureza_default :string;
    ecf_gaveta           :string;
    ecf_dsc_item         :string;
    ecf_acr_subtotal     :string;
    ecf_dsc_Subtotal     :string;
    ecf_qtd_item         :string;
    ecf_tab_prc          :string;
    ecf_tipo_qtd         :string;
    ecf_tipo_desc        :string;
    ecf_decimais         :string;
    ecf_repre            :string;
    ecf_tab              :string;
    ecf_modeloemissao   :string;
END;
 RGERALLIVRO = record
         EMPRE_CODIGO          : Integer;
         LIV_DATA_LCTO         : String;
         LIV_ESPECIE           : String;
         LIV_SERIE             : String;
         LIV_NR_NF             : Integer;
         LIV_CFOP              : String;
         CLI_CODIGO            : Integer;
         LIV_DATA_EMIS		     : String;
         NATU_CODIGO    		   : Integer;
         LIV_VALOR_NF 		     : String;
         LIV_ICM_BASE1 		     : String;
         LIV_ICM_ALIQ1 		     : String;
         LIV_ICM_BASE2 		     : String;
         LIV_ICM_ALIQ2 		     : String;
         LIV_ICM_BASE3 		     : String;
         LIV_ICM_ALIQ3 		     : String;
         LIV_ICM_BASE4 		     : String;
         LIV_ICM_ALIQ4 		     : String;
         LIV_ICM_BASE5 		     : String;
         LIV_ICM_ALIQ5 		     : String;
         LIV_ICM_BASE6 		     : String;
         LIV_ICM_ALIQ6 		     : String;
         LIV_ICM_VALOR		     : String;
         LIV_ICM_ISENTAS		   : String;
         LIV_ICM_OUTRAS 	     : String;
         LIV_ST_BASE  		     : String;
         LIV_ST_VALOR 		     : String;
         LIV_PIS_BASE  		     : String;
         LIV_PIS_VALOR 		     : String;
         LIV_COFINS_BASE       : String;
         LIV_COFINS_VALOR      : String;
         LIV_IPI_BASE 		     : String;
         LIV_IPI_IMP_CRED      : String;
         LIV_IPI_ISENTAS 	     : String;
         LIV_IPI_OUTRAS 	     : String;
         LIV_OBSERVACAO		     : String;
         LIV_FUNRURAL_VLR 	   : String;
         LIV_FUNRURAL_BASE 	   : String;
         LIV_VLR_EV   	       : String;
         LIV_VLR_ANTERIOR      : String;
         LIV_COD_CONT				   : Integer;
    end;
 RGERALNOTA = record

        EMPRE_CODIGO		      :INTEGER;	  // CÓDIGO DA EMPRESA */
        NOTA_NUMERO           :INTEGER;   //* CÓDIGO DA NOTA - CHAVE PRIMÁRIA */
        NOTA_NUMERO_AUX       :STRING;   //* CÓDIGO DA NOTA - CHAVE PRIMÁRIA */
        NOTA_SERIE	          :STRING;    //* SÉRIE - CHAVE PRIMÁRIA */
        NOTA_MODELO	          :STRING;    //* MODELO DA NOTA */
        NOTA_CHAVE	          :STRING;    //* MODELO DA NOTA */
        CLI_CODIGO	          :INTEGER;   //* @ CÓDIGO DO CLIENTE OU FORNECEDOR - CHAVE DA TABELA GERAL CLIENTE */
        NOTA_DT_EMISSAO	      :STRING;	    //* DATA DE EMISSÃO */
        NOTA_CFOP		          :STRING;    //* CFOP */
        NATU_CODIGO	          :STRING;   //* @ CÓDIGO DA NATUREZA - CHAVE DA TABELA GERAL NATUREZA */
        NOTA_TIPO		          :STRING;	  //* TIPO DE DOCUMENTO: 1 = ENTRADA / 2 = SAÍDA */
        NATU_NOME             :STRING;    //* Nome da Natureza */
        SITUACAO_CODIGO       :STRING;
        SITUACAO_TIPO_FIN     :STRING;
        SITUACAO_CODIGO_NOTA  :STRING;    //* @ Código da Tabela Geral_Situacao - ex: A(tivo) / I(nativo) / E(xcluído) - zero qndo não existir */
        SITUACAO_CODIGO_FIN   :STRING;    //* Tipo de Cliente - Situação financeira - @ Código da Tabela Geral_Situacao - ex: (C)onsumidor Final / (R)evenda / (N)ormal - zero qndo não existir */
        CLI_NOME    	   	    :STRING;    //* NOME CLIENTE */
        CLI_CNPJCPF 	   	    :STRING;    //* CPF ou CNPJ de Acordo com o Tipo de Pessoa */
        CLI_IE                :STRING;    //* Inscrição Estadual */
        CLI_TIPOPESSOA        :STRING;    //* Tipo de Pessoa: F = Física / J = Jurídica */
        REPRE_CODIGO    	    :STRING;   //* @ CÓDIGO DA TABELA GERAL_REPRESENTANTES */
        PRECO_TABELA   	      :STRING;    //* Código da Tabela Geral_Preco 1 - Não é ligado diretamente a esta tabela */
        TRANSP_CODIGO         :STRING;
        NOTA_PEDIDO           :STRING;
        NOTA_DT_SAIDA 	      :STRING;	  //* DATA DE EMISSÃO */
        NOTA_DT_PEDIDO 	      :STRING;	  //* DATA DO PEDIDO  DESDOBRAMENTO = CONDIÇÕES DE PAGAMENTO */
        COND_CODIGO	  	      :STRING;		//* @ Código da Tabela Geral_Condicoes (Prazos Pgto) */
        NOTA_COND_DTA_01 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_01      :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_02 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_02	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_03      :STRING;		  //* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_03	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_04 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_04	    :STRING;	  //* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_05 	    :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_05	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_06 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_06	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_07 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_07	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_08 	    :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_08	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_09 	    :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_09	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_10 	    :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_10	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_11 	    :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_11	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_12	    :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_12	    :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        BANCO_CODIGO          :STRING;   //* @ código do Banco */
        NOTA_VLR_COM          :STRING;
        NOTA_PERC_COM_T       :STRING;
        NOTA_COMIS_T          :STRING;
        NOTA_FRETE_VLR        :STRING;
        NOTA_DESC_CALC        :STRING;
        NOTA_DESP_FAT_CALC    :STRING;
        NOTA_ICM_BC_TOT       :STRING;
        NOTA_DESC_PERC        :STRING;		//* PERC DESCONTO */
        NOTA_DESC_VLR 	      :STRING;		//* VALOR DO DESCONTO */
        NOTA_DESC_ITENS_VLR 	:STRING;		//* VALOR DO DESCONTO */
        NOTA_VALOR_PROD	      :STRING;		//* VALOR DOS PRODUTOS */
        NOTA_VALOR_NF 	      :STRING;	  //* VALOR NF */
        NOTA_VALOR_CFOP 	    :STRING;	  //* VALOR NF */
        NOTA_ICM_VLR_TOT	    :STRING;		//* VALOR TOTAL ICM */
        NOTA_ICM_BASE1 	      :STRING;		//* BASE ICM 1 */
        NOTA_ICM_ALIQ1 	      :STRING;	  //* ALIQ ICM 1 */
        NOTA_ICM_BASE2 	      :STRING;		//* BASE ICM 2 */
        NOTA_ICM_ALIQ2 	      :STRING;		//* ALIQ ICM 2 */
        NOTA_ICM_BASE3 	      :STRING;		//* BASE ICM 3 */
        NOTA_ICM_ALIQ3 	      :STRING;		//* ALIQ ICM 3 */
        NOTA_ICM_BASE4 	      :STRING;		//* BASE ICM 4 */
        NOTA_ICM_ALIQ4 	      :STRING;	  //* ALIQ ICM 4 */
        NOTA_ICM_BASE5 	      :STRING;		//* BASE ICM 5 */
        NOTA_ICM_ALIQ5 	      :STRING;	  //* ALIQ ICM 5 */
        NOTA_ICM_BASE6 	      :STRING;		//* BASE ICM 6 */
        NOTA_ICM_ALIQ6 	      :STRING;		//* ALIQ ICM 6 */
        NOTA_ICM_ISENTAS	    :STRING;		//* BASE ICM ISENTAS */
        NOTA_ICM_OUTRAS       :STRING;	  //* BASE ICM OUTRAS (DIFERIDO / SUSPENSO) */
        NOTA_ICM_REV          :STRING;
        NOTA_LEI_IV           :STRING;
        NOTA_ST_BASE          :STRING;
        NOTA_ST_VALOR         :STRING;		//* VALOR ST */
        NOTA_PIS_BASE  	      :STRING;		//* BASE PIS */
        NOTA_PIS_VALOR 	      :STRING;	  //* VALOR PIS */
        NOTA_COFINS_BASE  	  :STRING;		//* BASE COFINS */
        NOTA_COFINS_VALOR 	  :STRING;		//* VALOR COFINS */
        NOTA_IPI_BASE         :STRING;
        NOTA_IPI_VALOR        :STRING;
        NOTA_VOL_QTD          :STRING;
        NOTA_PESO_LIQ         :STRING;
        NOTA_PESO_BRU         :STRING;
        NOTA_MSG_06           :STRING;
        NOTA_CHV_NFE          :STRING;
        NOTA_TERMINAL         :STRING;
        REPRE_CODIGO2         :STRING;
        NOTA_PERC_COM_EX      :STRING;
        NOTA_COMIS_EX         :STRING;
        NOTA_VALOR_ENTRADA    :STRING;
        classificao_fiscal    :STRING;
        NOTA_ISS_VALOR        :STRING;		//* VALOR ISENTO */
        NOTA_SITUACAO         :STRING;		//* SITUACAO DA NOTA */
        NOTA_SITUACAO_NOTA    :STRING;		//* SITUACAO DA NOTA */

        NOTA_COND_CODPGTO_01   :STRING;
        NOTA_COND_CODPGTO_02   :STRING;
        NOTA_COND_CODPGTO_03   :STRING;
        NOTA_COND_CODPGTO_04   :STRING;
        NOTA_COND_CODPGTO_05   :STRING;
        NOTA_COND_CODPGTO_06   :STRING;
        NOTA_COND_CODPGTO_07   :STRING;
        NOTA_COND_CODPGTO_08   :STRING;
        NOTA_COND_CODPGTO_09   :STRING;
        NOTA_COND_CODPGTO_10   :STRING;
        NOTA_COND_CODPGTO_11   :STRING;
        NOTA_COND_CODPGTO_12   :STRING;
        SITUACAO_TIPO          :STRING;
        NOTA_LIV_OBS           :STRING;
        NOTA_FRETE_TIP         :STRING;
        NOTA_VOL_NR            :STRING;
        NOTA_VOL_ESP           :STRING;
        NOTA_MSG_07          :STRING;
        NOTA_MSG_08          :STRING;
        NOTA_MSG_09          :STRING;
        NOTA_MSG_10          :STRING;
        NOTA_MSG_11          :STRING;
        NOTA_MSG_12          :STRING;
        NOTA_MSG_13          :STRING;
        NOTA_CHV_NFE_REF     :STRING;
        NOTA_CHV_CTE_REF     :STRING;

    end;

    RGERALITEM = record
    EMPRE_CODIGO    :string;
    NOTA_NUMERO     :string;
    NOTA_SERIE      :STRING;
    CLI_CODIGO      :string;
    NOTA_DT_EMISSAO :STRING;
    NOTA_CFOP       :STRING;
    ITENS_SEQ       :string;
    NOTA_TERMINAL   :STRING;
    PREVENDA        :STRING;
    ITENS_MODELO    :STRING;
    NOTA_HORA       :STRING;
    PROD_CODIGO     :string;
    ITENS_BARRAS    :STRING;
    ITENS_REPRE     :STRING;
    ITENS_UNIDADE   :STRING;
    ITENS_QUANTIDADE:STRING;
    ITENS_CST       :STRING;
    ITENS_DESC_PERC :STRING;
    ITENS_DESC2     :STRING;
    ITENS_DESC3     :STRING;
    ITENS_ACRES     :STRING;
    ITENS_COD_ORIGEM:STRING;
    ITENS_PESO      :STRING;
    ITENS_FAIXA     :STRING;
    ITENS_DATA_FAB  :STRING;
    ITENS_DATA_VAL  :STRING;
    ITENS_PRECO_BRUTO  :STRING;
    ITENS_PRECO_ST     :STRING;
    ITENS_PRECO_CLIENTE:STRING;
    ITENS_PRECO_INT    :STRING;
    ITENS_PMC          :STRING;
    ITENS_PRECO_PROMOC :STRING;
    ITENS_QTDE_PROMOC  :STRING;
    ITENS_COMIS_PERC   :STRING;
    ITENS_COMIS_BASE   :STRING;
    ITENS_CUST_CONTRIB :STRING;
    ITENS_CUST_COMPRA  :STRING;
    ITENS_CUST_MEDIO   :STRING;
    ITENS_LOTE_NR_01   :STRING;
    ITENS_LOTE_QTD_01  :STRING;
    ITENS_LOTE_NR_02   :STRING;
    ITENS_LOTE_QTD_02  :STRING;
    ITENS_LOTE_NR_03   :STRING;
    ITENS_LOTE_QTD_03  :STRING;
    ITENS_LOTE_NR_04   :STRING;
    ITENS_LOTE_QTD_04  :STRING;
    ITENS_LOTE_NR_05   :STRING;
    ITENS_LOTE_QTD_05:STRING;
    ITENS_COD_MED:STRING;
    ITENS_COD_COMPRA:STRING;
    ITENS_RECEITA:STRING;
    MENSICMS_CODIGO:STRING;
    ITENS_TAB_ICMS:INTEGER;
    ITENS_ICM_BASE:STRING;
    ITENS_ICM_ALIQ:STRING;
    ITENS_ICM_VALOR:STRING;
    ITENS_RED_BASE:STRING;
    ITENS_RED_IS:STRING;
    ITENS_ICM_ISENTAS:STRING;
    ITENS_ICM_OUTRAS:STRING;
    ITENS_ALIQ_MVA:STRING;
    ITENS_ST_BASE:STRING;
    ITENS_ST_ALIQ:STRING;
    ITENS_ST_VALOR:STRING;
    ITENS_TAB_IPI:INTEGER;
    ITENS_ALIQ_IPI:STRING;
    ITENS_IPI_BASE:STRING;
    ITENS_IPI_VALOR:STRING;
    ITENS_TAB_PIS :INTEGER;
    ITENS_ALIQ_PIS:STRING;
    ITENS_PIS_BASE:STRING;
    ITENS_PIS_VALOR:STRING;
    ITENS_TAB_COFINS :INTEGER;
    ITENS_ALIQ_COFINS:STRING;
    ITENS_COFINS_BASE:STRING;
    ITENS_COFINS_VALOR:STRING;
    ITENS_FRETE:STRING;
    ITENS_DESCONTO:STRING;
    ITENS_ACRESCIMO:STRING;
    ITENS_IO :STRING;
    ITENS_S_ICM:STRING;
    ITENS_V_IC:STRING;
    ITENS_B_PC :STRING;
    ITENS_PROD_GRADE:STRING;
    ITENS_DESC_GRADE:STRING;
    ITENS_NCM:STRING;
    PROD_GRADE:STRING;
    ITENS_GRADE:STRING;
    ITENS_VALOR_IBTP :STRING;
    ITENS_SUB_TOTAL_CUPOM :STRING;
    ITENS_TOTAL_CUPOM :STRING;
    ITENS_TOTAL_DESCONTO_CUPOM:STRING;
    ITENS_PRECO_LIQUIDO:STRING;
    ITENS_TOTAL_DESCONTO:STRING;
    ITENS_VALOR_IMPOSTO:STRING;
    ITENS_ACRES_PERC :STRING;
    ITENS_SITUACAO:STRING;
    SITUACAO_FISCAL:STRING;
    ITENS_CSOSN :STRING;
    ITENS_CSOSN_ICM :STRING;
    ITENS_CSOSN_PIS :STRING;
    ITENS_CSOSN_COFINS :STRING;
    PRECO_TABELA  :STRING;
    PROD_GRADE_AUX  :STRING;
    CODIGO_BARRAS   :STRING;
    PROD_USA_GRADE  :STRING;
    PROD_CEST   :STRING;
    PROD_ANP  :STRING;
    PROD_CODAGREGACAO :STRING;
    PROD_CODANVISA :STRING;
    PROD_MOTANVISA :STRING;
    PROD_CODIF :STRING;
    DESCRICAO_ANP :STRING;
    ITENS_VALOR_TOTAL :STRING;
    CODIGO_BENEFICIO :STRING;


    end;
      RGERALFORMAPAGAMENTO = record
      forma_pagamento_codigo :String;
      forma_pagamento_descricao :String;
      forma_pagamento_descricao_impressora :String;
      natu_codigo  :String;
      banco_codigo :String;
   end;
    RGERAL_BANCO = record
      banco_codigo	       : string;
      banco_nome           : string;
      banco_tipo           : string;
      banco_diretorio      : string;
      banco_diretorioret   : string;
      banco_agencia        : string;
      banco_contacorrente  : string;
      banco_carteira       : string;
      banco_aceite         : string;
      banco_nrconvenio     : string;
      banco_tarifa         : string;
      banco_remessa        : string;
      banco_mensagem       : string;
      banco_lctocontab     : string;
      banco_emp            : string;
      banco_saldo          : string;
      banco_cense          : string;
      banco_cip            : string;
      banco_posto          : string;
      banco_cedente        : string;
      banco_impfiscal	     : string;

   end;
    RGERAL_BANCO_PARCELADO = record
      banco_entrada	       : string;
      banco_codigo1	       : string;
      banco_codigo2	       : string;
      banco_codigo3	       : string;
      banco_codigo4	       : string;
      banco_codigo5	       : string;
      banco_codigo6	       : string;
      banco_codigo7	       : string;
      banco_codigo8	       : string;
      banco_codigo9	       : string;
      banco_codigo10	       : string;
      banco_codigo11	       : string;
      banco_codigo12	       : string;

   END;

    RGERALPRODUTOHISTORICO = record
        EMPRE_CODIGO                     : Integer;
        PROD_CODIGO                      : Integer;
        HISTP_QTD_ESTOQUE_ATUAL          : double;
        HISTP_QTD_ANTERIOR               : double;
        HISTP_QTD_ULTIMA_ENTRADA         : String;
        HISTP_DATA_VALIDADE_PRECO        : String;
        HISTP_DATA_ULTIMA_SAIDA          : String;
        HISTP_DATA_ULTIMA_ENTRADA        : String;
        HISTP_CUSTO_COMPRA               : String;
        HISTP_CUSTO_INVENTARIO           : String;
        HISTP_CUSTO_CONTRIBUICAO         : String;
        HISTP_CUSTO_MEDIO                : String;
        HISTP_CUSTO_MEDIO_INVENTARIO     : String;
        HISTP_PRECO_COMPRA               : String;
        HISTP_PRECO_COMPRA_LIQUIDO       : String;
        HISTP_NR_LANCAMENTO              : Integer;
        HISTP_SITUACAO                   : String;
        HISTP_SITUACAO_ANTERIOR          : String;
    end;
    RGERALKARDEX = record
        EMPRE_CODIGO                     : Integer;
        PROD_CODIGO                      : Integer;
        KARD_LANCAMENTO                  : Integer;
        KARD_DATA                        : String;
        KARD_DOCUMENTO                   : Integer;
        KARD_TIPO                        : String;
        KARD_QUANTIDADE                  : String;
        KARD_ESTOQUE                     : String;
        CLI_CODIGO                       : Integer;
        EMPRE_CODIGOF                    : Integer;
        FUNC_CODIGO                      : String;
        KARD_COMPLEMENTO                 : String;
    end;
    RGERALESTMES = record
        EMPRE_CODIGO                     : Integer;
        PROD_CODIGO                      : Integer;
        ESTMES_DATA                      : Integer;
        ESTMES_ENT_QTD                   : String;
        ESTMES_ENT_VLR                   : String;
        ESTMES_SAI_QTD                   : String;
        ESTMES_SAI_VLR                   : String;
        ESTMES_CUSTO_FINAL               : String;
        ESTMES_SUPERAVIT                 : String;
        ESTMES_PCO_ULT_VEN               : String;
        ESTMES_MENOR_PRECO               : String;
        ESTMES_MENOR_QTD                 : String;
        ESTMES_MENOR_NF                  : Integer;
        ESTMES_MENOR_DATA                : String;
        VALOR_ITEM                       : String;



    end;
    RGERALESTMVTO = record
        EMPRE_CODIGO          : Integer;
        PROD_CODIGO           : Integer;
        ESTMVTO_DATA          : String;
        ESTMVTO_DOCUMENTO     : Integer;
        ESTMVTO_SERIE         : String;
        CLI_CODIGO            : Integer;
        ESTMVTO_QUANTIDADE    : String;
        ESTMVTO_VALOR         : String;
        NATU_CODIGO           : Integer;
        REPRE_CODIGO          : string;
        ESTMVTO_CUSTO         : String;
        ESTMVTO_RECEITUARIO   : Integer;
        ESTMVTO_SUPERAVIT     : String;
        ESTMVTO_PERC_COMISSAO : String;
    end;
    RGERALCLIENTE = record
      CLI_CODIGO          : String; // Chave da Tabela Cliente
           CLI_TIPOCADAST      : String;
           SITUACAO_TIPO       : String; // tipo de cliente
           SITUACAO_CODIGO     : String; // tipo de cliente
           CLI_NOME            : String;
           CLI_TIPOPESSOA      : String;
           // GERAL
           CLI_CNPJCPF         : String;
           CLI_DATNASC         : String;
           TIPOLOGIA_CODIGO    : String;
           ATIVIDADE_CODIGO    : String;
           SITUACAO_TIPO1      : String; // tipo de cliente
           SITUACAO_CODIGO1    : String; // Situação do Cliente
           CLI_FOTO            : String;
           CLI_FICHA           : String;
           CLI_REDE            : String;
           CLI_ESPECIAL1       : String;
           CLI_ESPECIAL2       : String;
           CLI_OBS             : WideString;
           CLI_DATAINC         : String;
           CLI_DATAALT         : String;
           CLI_DATAEXC         : String;
           CLI_LIMITECRED      : String;
           CLI_COMPRADATA      : String;
           CLI_COMPRAVALOR     : String;
           EMPRE_CODIGO        : STRING; // EMPRESA
           CLI_SEXO            : String;
           CIDADE_CODDNE       : STRING; // NATURALIDADE
           CLI_ESTCIVIL        : String;
           CLI_IDENTIDADE      : String;
           CLI_IDEORGEXP       : String;
           CLI_IDEUF           : String;
           CLI_IDEDATA         : String;
           CLI_CNH             : String;
           CLI_CNHCATEG        : String;
           CLI_TITULO          : String;
           CLI_TITZONA         : String;
           CLI_TITSECAO        : String;
           CLI_CONSTIPO        : String;
           CLI_CONSNUMERO      : String;
           CLI_CONSUF          : String;
           CLI_FANTASIA        : String;
           CLI_CONTATO         : String;
           CLI_IE              : String;
           CLI_INSCMUN         : String;
           CLI_CNAE            : String;
           CLI_INSSUFRAMA      : String;
           CLI_REPLEGAL        : String;
           CLI_REPCPF          : String;
           CLI_REPIDENTIDADE   : String;
           CLI_REPIDEORGEXP    : String;
           CLI_REPIDEUF        : String;
           CLI_AREA_LIVRE_COM  : String;
           // ENDEREÇO
           CLI_RESCEP          : String;
           CIDADE_CODDNERESID  : String;
           CLI_RESCAIXAPOSTAL  : String;
           CLI_RESENDERECO     : String;
           CLI_RESENDCOMPLEM   : String;
           CLI_RESENDNUMERO    : String;
           CLI_RESBAIRRO       : String;
           CLI_RESEMAIL        : String;
           CLI_RESSITE         : String;
           CLI_RESTELEFONE     : String;
           CLI_RESFAX          : String;
           CLI_RESCELULAR      : String;
           CLI_ENTSIM          : String;
           CLI_ENTCEP          : String;
           CIDADE_CODDNEENT    : String;
           CLI_ENTENDERECO     : String;
           CLI_ENTENDCOMPLEM   : String;
           CLI_ENTENDNUMERO    : String;
           CLI_ENTBAIRRO       : String;
           CLI_ENTTELEFONE     : String;
           CLI_ENTCELULAR      : String;
           CLI_PONTOREF        : String;
           CLI_COBSIM          : String;
           // COBRANÇA
           CLI_COBCEP          : String;
           CIDADE_CODDNECOB    : String;
           CLI_COBENDERECO     : String;
           CLI_COBENDCOMPLEM   : String;
           CLI_COBENDNUMERO    : String;
           CLI_COBBAIRRO       : String;
           CLI_COBTELEFONE     : String;
           CLI_COBFAX          : String;
           CLI_COBCELULAR      : String;
           CLI_COBEMAIL        : String;
           CLI_COBCAIXAPOSTAL  : String;
           NATU_CODIGO         : String;
           BANCO_CODIGO        : String;
           PRECO_TABELA        : String;
           PRECO_TABELA2       : String;
           PRECO_TABELA3       : String;
           PRECO_TABELA4       : String;
           TRANSP_CODIGO       : String;
           COND_CODIGO         : String;
           SITUACAO_TIPO2      : String; // tipo de cliente
           SITUACAO_CODIGO2    : String; // Situação de Crédito
           CLI_BOLETOTAXA      : String;
           CLI_BOLETOMSG       : String;
           CLI_CONDPGTO1       : String;
           CLI_CONDPGTO2       : String;
           CLI_CONDPGTO3       : String;
           CLI_CONDPGTO4       : String;
           CLI_COBFRETE        : String;
           CLI_PRAZOENT        : String;
           // ROTA / REPRESENTANTE
           CLI_PRODGRAVOSO     : String;
           ROTA_CODIGO         : String;
           REPRE_CODIGO        : String;
           REPRE_CODIGO2       : String;
           REPRE_CODIGO3       : String;
           REPRE_CODIGO4       : String;
           REPRE_CODIGO5       : String;
           CLI_DIASENT1        : String;
           CLI_DIASENT2        : String;
           CLI_DIASENT3        : String;
           CLI_DIASENT4        : String;
           CLI_DIASENT5        : String;
           CLI_ZONEA1          : String;
           CLI_ZONEA2          : String;
           CLI_ZONEA3          : String;
           CLI_ZONEA4          : String;
           CLI_ZONEA5          : String;
         CLI_ENDERECO		        : String;
         CLI_NUMERO		          : String;
         CLI_UF		              : String;
         CLI_TELEFONE           : String;
         CLI_CIDADE             : String;
         CLI_BAIRRO             : String;
         CLI_COMP               : String;
         CLI_MUNIBGE            : String;
         CLI_CEP                : String;
         CLI_PESSOA             : String;
         SITUACAO_TIPO_FIN      : String;
         SITUACAO_CODIGO_FIN    : String;
         SITUACAO_CODIGO_FIS    : String;
         SITUACAO_TIPO_FIS      : String;
         SALDO_DEVEDOR    : double;
         end;
    RGERALTRIBUTACAOPRODUTO = RECORD
        imposto_cod_prod   :string;
        imposto_tipo       :string;
        imposto_sit_fiscal :string;
        imposto_uf         :string;
        imposto_cod_tab    :string;

    end;
    RGERALIMPOSTOS = RECORD
         impostos_tipo   :string;
         impostos_tabela  :string;
         impostos_aliquota  :string;
         impostos_base     :string;
         impostos_mva    :string;
         impostos_tabela_st  :string;
         impostos_deflator   :string;
         impostos_cst    :string;
         impostos_cod_msg  :string;
         impostos_red_io   :string;
         impostos_sit_tributaria    :string;
         impostos_csosn    :string;

    end;
    RGERALLIVROSAIDA = RECORD
                LIVRO_SAIDA_EMPRESA          :INTEGER;
                LIVRO_SAIDA_DT_EMISSAO       :STRING;		//* DATA DE EMISSÃO */
                LIVRO_SAIDA_ESPECIE          :STRING; 	//* ESPECIE NOTA FISCAL - CUPOM */
                LIVRO_SAIDA_SERIE            :STRING;	//* SERIE */
                LIVRO_SAIDA_NR               :INTEGER;	//* SAIDA INICIAL */
                LIVRO_SAIDA_NR_FINAL         :STRING;		//* SAIDA FINAL */
                LIVRO_SAIDA_COD_FISCAL       :STRING;       //* CODIGO FISCAL - CFOP */
                LIVRO_SAIDA_VLR_CONTABIL     :STRING;		//* VALOR DA NOTA */
                LIVRO_SAIDA_UF               :STRING;		//* SAIDA UF */
                LIVRO_SAIDA_CID              :STRING;	//* SAIDA CIDADE */
                LIVRO_SAIDA_B_CALC_ICM1      :STRING;		//* BASE DE CALCULO DE ICMS */
              	LIVRO_SAIDA_B_CALC_ICM2      :STRING;		//* BASE DE CALCULO DE ICMS */
              	LIVRO_SAIDA_B_CALC_ICM3      :STRING;		//* BASE DE CALCULO DE ICMS */
              	LIVRO_SAIDA_B_CALC_ICM4      :STRING;		//* BASE DE CALCULO DE ICMS */
              	LIVRO_SAIDA_B_CALC_ICM5      :STRING;		//* BASE DE CALCULO DE ICMS */
              	LIVRO_SAIDA_B_CALC_ICM6      :STRING;		//* BASE DE CALCULO DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM1        :STRING;		//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM2        :STRING;		//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM3        :STRING;		//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM4        :STRING;			//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM5        :STRING;			//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ALIQ_ICM6        :STRING;			//* ALIQUOTA DE ICMS */
                LIVRO_SAIDA_ISENTAS_ICM      :STRING;		//* ISENTAS DE ICMS */
                LIVRO_SAIDA_OUTRAS_ICM       :STRING;		//* OUTRAS DE ICMS */
                LIVRO_SAIDA_ICM_FRETE        :STRING;			//* ICMS PARA FRETE */
                LIVRO_SAIDA_VLR_ST           :STRING;			//* VALOR SUBSTITUIÇÃO TRIBUTARIA */
                LIVRO_SAIDA_VLR_EVENTUAL     :STRING;			// VALOR EVENTUAL */
                LIVRO_SAIDA_B_CALC_IPI       :STRING;			//* BASE CALCULO IPI */
                LIVRO_SAIDA_IMP_DB_IPI       :STRING;			//* BASE CALCULO IPI */
                LIVRO_SAIDA_ISENTAS_IPI      :STRING;		//* BASE CALCULO ISENTAS IPI */
                LIVRO_SAIDA_OUTRAS_IPI       :STRING;		//* BASE CALCULO OUTRAS IPI */
                LIVRO_SAIDA_OBS              :STRING;		//* OBSERVAÇÃO */
                CLI_CODIGO    		           :INTEGER;			//* @ CODIGO DO FORNECEDOR / CLIENTE */
		            NATU_CODIGO    		           :INTEGER;                    // @ CÓDIGO DA TABELA GERAL_NATUREZA - ZERO QNDO NÃO EXISTIR */
                LIVRO_SAIDA_PED              :STRING;		// PED */
                LIVRO_SAIDA_CANCANCELADO     :STRING;		//* NOTAS CUPONS SITUACAO CANCELADO CANCELADO */
                LIVRO_SAIDA_VENDEDOR         :STRING;		// */
                LIVRO_SAIDA_VLR_ICM          :STRING;		//* VALOR DO ICM */
                TRANSP_CODIGO                :INTEGER;             	//* @ CÓDIGO DA TABELA GERAL_TRANSPORTADORA */
                LIVRO_SAIDA_MSG              :STRING;
                LIVRO_SAIDA_BASE_ST          :STRING;
                LIVRO_SAIDA_COD_IS           :STRING;
           	    LIVRO_SAIDA_COD_OU           :STRING;
           	    LIVRO_SAIDA_COD_ST           :STRING;
           	    LIVRO_SAIDA_BASE_R_ST        :STRING;
           	    LIVRO_SAIDA_BASE_IMP         :STRING;
           	    LIVRO_SAIDA_VLR_ST_06        :STRING;
           	    LIVRO_SAIDA_CID_ORIGEM       :STRING;
           	    LIVRO_SAIDA_ISENTAS_CB       :STRING;
           	    LIVRO_SAIDA_BASE_R_ST_AL     :STRING;
   END;
    RGERALCOMISSAO = RECORD
          EMPRE_CODIGO               :INTEGER;//*CODIGO DA EMPESA*/
          COMISSAOREPRE_DATA         :TDateTime;//* DATA ATUAL*/
          REPRE_CODIGO               :INTEGER;//* CODIGO REPRESENTANTE*/
          NATU_CODIGO                :INTEGER;//*CODIGO DA NATUREZA DA OPERAÇÃO*/
          COMISSAOREPRE_NR_NF        :INTEGER;//*NUMERO DA NOTA FISCAL OU CUPOM*/
          PREVENDA_CODIGO            :STRING;//*NUMERO DO PEDIDO*/
          CLI_CODIGO                 :INTEGER;//*NUMERO DA NOTA FISCAL*/
          COMISSAOREPRE_CLI          :STRING;//NOME DO CLIENTE */
          COMISSAOREPRE_VLR_NF       :STRING;//*VALOR DA NOTA FISCAL*/
          COMISSAOREPRE_COMIPERC     :STRING;//*COMISSAO PERCENTUAL*/
          COMISSAOREPRE_QTD          :STRING;//*QUANTIDADE*/
          COMISSAOREPRE_COMISSAO          :INTEGER;//*QUANTIDADE*/
   END;

   RGERALITEMGRADE = record
        EMPRE_CODIGO           : Integer;
        PROD_CODIGO	           : Integer;
        PROD_DATA_VALIDADE     : String;
        PROD_LOTE              : String;
        GRADE_CODIGO	         : Integer;
        GRADE_DESCRICA0        : String;
        PROD_QUANTIDADE        : String;
        PROD_DATA_FABRICACAO   : String;
        GRADE_DESCRICAO        : String;
    end;

    RGERAL_PONTUACAO = record
        NR_CUPOM      : String;
        NOTA_SERIE    : String;
        CLI_CODIGO    : String;
        LCTO          : String;
        VALOR_COMPRA  : String;
        data_compra   : String;
        pontuacao     : String;
        data_validade : String;
        data_resgate  : String;
        situacao      : String;
        valor_bonus   : String;
        SITUACAO_DESCONTO  : String;
  end;
  RGERALCUPOMTEMPORARIO = record
  EMPRE_CODIGO      :String;
  NOTA_NUMERO       :String;
  NOTA_SERIE        :String;
  CLI_CODIGO        :String;
  NOTA_DT_EMISSAO   :String;
  NOTA_CFOP         :String;
  NOTA_HORA         :String;
  ITENS_SEQ         :String;
  PROD_CODIGO       :String;
  PROD_GRADE        :String;
  ITENS_GRADE       :String;
  ITENS_BARRAS      :String;
  PEDIDO_NUMERO     :String;
  ITENS_REPRE       :String;
  ITENS_DTA_PEDIDO  :String;
  ITENS_NCM         :String;
  ITENS_UNIDADE     :String;
  ITENS_QUANTIDADE  :String;
  ITENS_CST         :String;
  ITENS_DESC_PERC   :String;
  ITENS_DESC2       :String;
  ITENS_DESC3       :String;
  ITENS_ACRES_PERC  :String;
  ITENS_PESO        :String;
  ITENS_PRECO_BRUTO :String;
  ITENS_PRECO_LIQUIDO :String;
  ITENS_PRECO_INT     :String;
  ITENS_PMC           :String;
  ITENS_TAB_ICMS      :String;
  ITENS_ICM_BASE      :String;
  ITENS_ICM_ALIQ      :String;
  ITENS_ICM_VALOR     :String;
  ITENS_RED_BASE      :String;
  ITENS_RED_IS        :String;
  ITENS_ICM_ISENTAS   :String;
  ITENS_ICM_OUTRAS    :String;
  ITENS_ALIQ_MVA      :String;
  ITENS_ST_BASE       :String;
  ITENS_ST_ALIQ       :String;
  ITENS_ST_VALOR      :String;
  ITENS_TAB_IPI       :String;
  ITENS_ALIQ_IPI      :String;
  ITENS_IPI_BASE      :String;
  ITENS_IPI_VALOR     :String;
  ITENS_TAB_PIS       :String;
  ITENS_ALIQ_PIS      :String;
  ITENS_PIS_BASE      :String;
  ITENS_PIS_VALOR     :String;
  ITENS_TAB_COFINS    :String;
  ITENS_ALIQ_COFINS   :String;
  ITENS_COFINS_BASE   :String;
  ITENS_COFINS_VALOR  :String;
  ITENS_DESCONTO      :String;
  ITENS_ACRESCIMO     :String;
  ITENS_IO            :String;
  ITENS_PROD_GRADE    :String;
  ITENS_DESC_GRADE    :String;
  ITENS_SITUACAO      :String;
  ITENS_MODELO        :String;
  ITENS_IS            :String;
   // VARIAVEIS DE TELA
  ITENS_SUB_TOTAL_CUPOM      :String;
  ITENS_TOTAL_CUPOM          :String;
  ITENS_TOTAL_DESCONTO_CUPOM :String;

  ITENS_TOTAL_DESCONTO :String;
  ITENS_VALOR_IMPOSTO  :String;


 END;
  RGERALPRODUTOS = record
       empre_codigo :string;
       prod_codigo:string;
       prod_grupo:string;
       prod_subgrp:string;
       prod_divisao:string;
       prod_descricao:string;
       prod_complemento:string;
       prod_unid_venda:string;
       prod_ref_forn:string;
       prod_marca:string;
       prod_ncm:string;
       prod_barras:string;
       prod_qtd_caixa:string;
       preco_tabela:string;
       preco_preco :string;
       prod_ex :string;
       prod_cest :string;
       PROD_lote :string;
       prod_PesoBruto :string;
       prod_QtdVenda :string;
       prod_VlrUnitario :string;
       prod_pmc :string;
       prod_per_pmc :string;
       prod_grade :string;
       ITENS_ESTOQUE_ATUAL : double;
       prod_cst :string;
       PROD_USA_GRADE  :Integer;
       PROD_GRADE_AUX  :STRING;
       PROD_ANP : STRING;
       PROD_CODAGREGACAO : STRING;
       PROD_CODANVISA : STRING;
       PROD_MOTANVISA : STRING;
       PROD_CODIF: STRING;
       PROD_DESCRICAOANP: STRING;

     end; 

      RGERALCANCELACUPOM = record
        EMPRE_CODIGO                     : Integer;
        CODIGO_PRODUTO                   : INTEGER;
        CODIGO_CLIENTE                   : INTEGER;
        CODIGO_REPRESENTANTE             : INTEGER;
        QUANTIDADE                       : String;
        PRECO_BRUTO                      : String;
        PRECO_LIQUIDO                    : String;
        DESCONTO                         : String;
        CUPOM                            : INTEGER;
        SERIE                            : String;
        TABELA                           : String;
        CODIGO_NATUREZA                  : INTEGER;
        PEDIDO01                         : String;
        PEDIDO02                         : String;
        VALOR_NOTA                       :STRING;
        NATUREZA                         :STRING;
        PROD_GRADE                       :INTEGER;
        GRADE                            :STRING;
        DATA                             :STRING;

    end;

    RGERALIBPT = record
      ibpt_codigo        :string;
      ibpt_ex	           :string;
      ibpt_tabela	    :string;
      ibpt_descricao     :string;
      ibpt_Aliq_Nacional   :string;
      ibpt_Aliq_Importada  :string;
      ibpt_Versao         :string;

    end;
    RCONFIGURADORPEDIDO = record
               empre_codigo              :string;
               config_ped_digitado       :string;
               config_ped_vendrepre      :string;
               repre_codigo              :string;
               config_ped_comissao       :string;
               config_ped_natureza       :string;
               natu_codigo               :string;
               config_ped_banco          :string;
               banco_codigo              :string;
               config_ped_transportadora :string;
               transp_codigo             :string;
               config_ped_redespacho     :string;
               respacho_codigo           :string;
               config_ped_impressora     :string;
               config_imp_colunas        :string;
               config_ped_pesovolume     :string;
               config_ped_valorfrete     :string;
               config_ped_observacao     :string;
               config_ped_contato        :string;
               config_ped_descontoTotal    : string;
               config_ped_vlrDescontoTotal : string;
               config_ped_descontoItem     : string;
               config_ped_vlrDescontoItem  : string;
               config_ped_dataentrega     :string;
               config_ped_especie        :string;
               config_ped_controlaestoque:string;
               config_ped_sujestaocompra :string;
               config_ped_tabela         :string;
               config_ped_tabelaPreco    :string;
               cli_codigo                :string;
               config_ped_cliente        :string;
               config_modelo_barras      :string;
               configura_pedido          :string;
               config_relatorios          :string;
               config_ped_pesquisa          :string;
               natu_codigo_condicional   :string;


     end;
   RCONFIGURACAOECF = record
   Terminal            : Integer;
                  ConfPedeQuantidade  : String;
                  ConfPedeDesconto    : String;
                  ConfTipoDesconto    : String;
                  ConfValorDesconto   : String;
                  ConfPedeAcrescimo   : String;
                  ConfTipoAcrescimo   : String;
                  ConfValorAcrescimo  : String;
                  ConfPedeGrade       : String;
                  ConfPedeCliente     : String;
                  ConfCliente         : String;
                  ConfPedeVendedor    : String;
                  ConfVendedor        : String;
                  ConfPedeTabela      : String;
                  ConfTabela          : String;
                  ConfPedeDescontoTotal    : String;
                  ConfTipoDescontoTotal    : String;
                  ConfValorDescontoTotal   : String;
                  ConfPedeAcrescimoTotal   : String;
                  ConfTipoAcrescimoTotal   : String;
                  ConfValorAcrescimoTotal  : String;
                  ConfLimiteCredito    : String;
                  ConfVerificaEstoque : String;
                  ConfMsgPromocional  : String;
                  ConfCaminhoGeracaoVenda  : String;
                  ConfCaminhoGeracaoFechamento  : String;
                  ConfCaminhoAtualizacao  : String;
                  ConfCaminhoGestao : String;
                  ConfNatureza  : String;
                  ConfMeioPagamento : String;
                  config_ped_natureza  : String;
                  natu_codigo        : String;
                  ConfModeloBusca         : String;
                  ConfAlteraPreco        : String;
                  ConfValorAlteracao     : String;


                  end;
    RCONFIGURA_REPRE = record

  EMPRE_CODIGO :STRING;
  CONF_REPRE_TIPO :STRING;
  CONF_REPRE_VALOR1 :STRING;
  CONF_REPRE_VALOR2 :STRING;
  CONF_REPRE_VALOR3 :STRING;
  CONF_REPRE_VALOR4 :STRING;
  CONF_REPRE_VALOR5 :STRING;
  CONF_REPRE_VALOR6 :STRING;
  CONF_REPRE_VALOR7 :STRING;
  CONF_REPRE_VALOR8 :STRING;
  CONF_REPRE_VALOR9 :STRING;
  CONF_REPRE_VALOR10 :STRING;
  CONF_REPRE_TIPO_COMISS :STRING;
  CONF_REPRE_COMISS1 :STRING;
  CONF_REPRE_COMISS2 :STRING;
  CONF_REPRE_COMISS3 :STRING;
  CONF_REPRE_COMISS4 :STRING;
  CONF_REPRE_COMISS5 :STRING;
  CONF_REPRE_COMISS6 :STRING;
  CONF_REPRE_COMISS7 :STRING;
  CONF_REPRE_COMISS8 :STRING;
  CONF_REPRE_COMISS9 :STRING;
  CONF_REPRE_COMISS10 :STRING;

 end;
  //Cupom Fiscal
   RLINHAFORMATADA = record
                    EMPRE_CODIGO            : Integer;
                    CUPOM_DATA              : TDateTime;
                    CUPOM_NUMERO            : String;
                    CUPOM_SEQUENCIA         : String;
                    CUPOM_SITUACAO          : string;
                    PROD_CODIGO             : string;
                    PROD_DATA_VALIDADE      : String;
                    PROD_DATA_PEDIDO        : String;
                    PROD_LOTE               : String;
                    CODIGO_GRADE            : string;
                    DESC_GRADE              : string;
                    CUPOM_BARRAS            : String;
                    CUPOM_QUANTIDADE        : String;
                    CUPOM_CASASDECIMAIS     : INTEGER;
                    CUPOM_TIPOQUANTIDADE    : STRING;
                    CUPOM_TIPODESCONTO    : STRING;
                    CUPOM_PRECO_UNITARIO    : String;
                    CUPOM_PRECO    : String;
                    CUPOM_PRECO_TOTAL       : String;
                    CUPOM_DESCONTO_ITEM     : String;
                    CUPOM_TABELA            : String;
                    PROD_DESCRICAO          : String;
                    CUPOM_QTD_CAIXA         : String;
                    PROD_USA_GRADE          : String;
                    PROD_ALIQUOTA           : String;
                    UNIDADEVENDA            : String;
                    TIPO_PEDIDO             : String;
                    PROD_EX                 : String;
                    PROD_TABELA             : String;
                    ITENS_NCM               : String;
                    ITENS_VALOR_IMP         : String;
    end;

    RREDUCAO = record
         reducao_loja     : Double;
         reducao_data     : String;
         reducao_maq      : Double;
         reducao_nr_serie : String[15];
         reducao_cup_ini  : Double;
         reducao_cup_fim  : Double;
         reducao_cup_red  : Double;
         reducao_gt_ini   : Double;
         reducao_gt_final : Double;
         reducao_aliq1    : Double;
         reducao_aliq2	  : Double;
         reducao_aliq3	  : Double;
         reducao_aliq4	  : Double;
         reducao_aliq5	  : Double;
         reducao_aliq6    : Double;
         reducao_aliq7	  : Double;
         reducao_aliq8	  : Double;
         reducao_aliq9	  : Double;
         reducao_aliq10   : Double;
         reducao_aliq11   : Double;
         reducao_aliq12   : Double;
         reducao_aliq13   : Double;
         reducao_aliq14   : Double;
         reducao_aliq15   : Double;
         reducao_aliq16   : Double;
         reducao_vlr1     : Double;
         reducao_vlr2     : Double;
         reducao_vlr3     : Double;
         reducao_vlr4     : Double;
         reducao_vlr5     : Double;
         reducao_vlr6     : Double;
         reducao_vlr7     : Double;
         reducao_vlr8     : Double;
         reducao_vlr9     : Double;
         reducao_vlr10    : Double;
         reducao_vlr11    : Double;
         reducao_vlr12    : Double;
         reducao_vlr13    : Double;
         reducao_vlr14    : Double;
         reducao_vlr15    : Double;
         reducao_vlr16    : Double;
         reducao_st	      : Double;
         reducao_nt	      : Double;
         reducao_is	      : Double;
         reducao_issqn	  : Double;
         reducao_canc	    : Double;
         reducao_desc	    : Double;
         reducao_status1	: String[15];
         reducao_seqarq	  : Double;
    end;

    RCLIENTE = record
               CODIGO_CLIENTE  :STRING[1];
               NOME_CLIENTE    :STRING[42];
               TIPO            :STRING[1];
               CPF_CGC         :STRING[14];
               ENDERECO        :STRING[42];
               TELEFONE        :STRING[14];
               IE              :STRING[14];
    end;
    RPARAMETROS = record
                    PARA_CODIGO : Real;
                    PARA_CAMINHO : String[80];
    end;
    RPARAMETRO_EMPRESA = record
                        PARA_CODIGO_EMPRESA:REAL ;
                        PARA_CAMINHO_EMPRESA:STRING[80];
    end;

    RCAMINHOCONTBILINI = record
            Versao          : String;
            CaminhoG        : String;
            CaminhoR        : String;
            CaminhoA        : String;
            CaminhoZ        : String;
            CaminhoB        : String;
            CaminhoLeituraG : String;
            CaminhoLeituraR : String;
            CaminhoLeituraA : String;
            CaminhoLeituraZ : String;
            CaminhoLeituraB : String;
            CaminhoOracle   : String;
            dataBaseName    : String;
            Usuario         : String;
    end;
    RARQUIVOINI = record
                  SERVIDOR           : String;
                   CAMINHOBASE        : String;
                   CAMINHONFE         : String;
                   CORFUNDO           : Integer;
                   BKPNFE             : String;
                   USUARIO            : String;
                   SENHA              : String;
                   CAMINHOXML         : String;
                   RETORNOXML         : String;
                   CAMINHORETORNO     : String;
                   CAMINHOSESSAO      : String;
                   CAMINHOFOTOUSUARIO : String;
                   PDF1VIA            : String;
                   BUSCALOTE          : String;
                   RESOLUCAO          : Integer;
                   SISGESTAOSERVIDOR  : String; // UTILIZADO PARA DIRECIONAR O BANCO DIRETAMENTE PARA PASTA SISGESTAO DO COMPUTADOR LOCAL OU SERVIDOR
                   EXESERVIDOR        : String; // UTILIZADO PARA DIRECIONAR DIRETAMENTE A PASTA SISGESTAO DO SERVIDOR
                   TERMINALECF           : String; // UTILIZADO PARA DIRECIONAR DIRETAMENTE A PASTA SISGESTAO DO SERVIDOR
                   CAMINHOATUALIZA           : String;
                   LOGERROSBACKUP     : String;

    end;
    RCONFSISGESTAO = record
                    empre_codigo            :integer; // Configuração para Empresa */
                    config_imagemfundo      : String; // Tela inicial do Sistema */
                    config_imagemsplash     : String; // Imagem de Abertura Quando usar splash */
                    config_caminhoskin      : String; // Caminho dos Skins para interface */
                    config_logorelatorio 	  : String; // Caminho para logo de relatorios */
                    config_fotosprodutos    : String; // Caminho para fotos de produtos */
                    config_fotosclientes    : String; // Caminho para fotos de Clientes */
                    config_fotosfuncionario : String; // Caminho para fotos de Funcionarios */
                    config_sessaologin      : String; // Caminho para sessao do login */
                    config_rss              : String; // Caminho para os feeds de noticias online */
                    config_spc              : String; // Caminho para o histórico do spc */
                    config_erros_backup     : String; // caminho para gravar os erros do backup
    end;

    RCONFIGURAETIQUETAS = record
                          caminhoetiqueta : String;
                          modeloetiqueta  : String;
    end;

    RFUNCIONARIO = record
                   EMPRE_CODIGO               : Integer;
                   FUNC_CODIGO                : String;
                   FUNC_NOME                  : String;
                   FUNC_ENDERECO              : String;
                   FUNC_NUMERO                : String;
                   FUNC_COMPLEMENTO           : String;
                   FUNC_BAIRRO                : String;
                   FUNC_CEP                   : String;
                   CIDADE_CODDNE              : Integer;
                   FUNC_TELFIXO               : String;
                   FUNC_TELCELULAR            : String;
                   FUNC_SEXO                  : String;
                   FUNC_EMAIL                 : String;
                   FUNC_CTPSNUMERO            : String;
                   FUNC_CTPSSERIE             : String;
                   FUNC_CPF                   : String;
                   FUNC_TITELEITORALNUMERO    : String;
                   FUNC_TITELEITORALZONA      : String;
                   FUNC_TITELEITORALSECAO     : String;
                   FUNC_IDENTIDADE            : String;
                   FUNC_ORGAOEMISSOR          : String;
                   FUNC_DATAADMISSAO          : TDateTime;
                   FUNC_DATADEMISSAO          : TDateTime;
                   CARGO_CODIGO               : Double;
                   FUNC_NASCIMENTO            : TDateTime;
                   FUNC_NACIONALIDADE         : String;
                   FUNC_GRAUINSTRUCAO         : String;
                   FUNC_ESTADOCIVIL           : String;
                   FUNC_NOMECONJUGE           : String;
                   FUNC_HABILITACAO           : String;
                   FUNC_CATEGORIA             : String;
                   FUNC_VALIDADE              : TDateTime;
                   FUNC_PRIMHABILITACAO       : TDateTime;
                   FUNC_SISTEMA               : String;
                   FUNC_CERTMILITAR_SERIE     : String;
                   FUNC_CERTMILITAR_CATEGORIA : String;
                   FUNC_FILIACAO_MAE          : String;
                   FUNC_FILIACAO_PAI          : String;
                   FUNC_FGTS_OPTANTE          : String;
                   FUNC_FGTS_DATAOPCAO        : TDateTime;
                   FUNC_FGTS_DATARETRATACAO   : TDateTime;
                   FUNC_FGTS_BANCODEPOSITARIO : Integer;
                   FUNC_PIS_DATACADASTRO      : TDateTime;
                   FUNC_PIS_NUMERO            : String;
                   BANCO_CODIGO               : Integer;
                   FUNC_BANCOAGENCIA          : Integer;
                   FUNC_BANCOCONTA            : String;
                   SENHA_SENHA                : String;
                   SENHA_SKIN                 : String;
                   SENHA_NIVEL                : string;
                   SENHA_CORCAMPOS            : Longint;
                   FUNC_RETORNOSENHA          : String;
                   MENU_ATUAL                 : String;
                   EMPRE_RAZAOSOCIAL          : String;
                   EMPRE_CNPJ	                : String;
                   EMPRE_UF                   : String;
                   EMPRE_INSCESTADUAL         : String;
                   EMPRE_INSCMUNICIPAL     : String;
                   EMPRE_CNAE              : String;
                   EMPRE_REGJUNTACOMERCIAL : String;
                   EMPRE_DATAREGISTRO      : TDateTime;
                   EMPRE_TELEFONE	         : String;
                   EMPRE_FAX	             : String;
                   EMPRE_PAGA_IPI	         : INTEGER;
                   EMPRE_SITUACAO	         : String;
                   EMPRE_SIMPLESNACIONAL	 : INTEGER;
                   EMPRE_TIPO_PGTOIPI	     : INTEGER;
                   EMPRE_SITE              : String;
                   EMPRE_EMAIL	           : String;
                   EMPRE_INTEGRA_CONTAB	   : INTEGER;
                   EMPRE_COD_EMPRE_CONTAB	 : Double;
                   EMPRE_PROPRIETARIO	     : String;
                   EMPRE_SOCIOPROP	       : String;
                   EMPRE_RESP_TECNICO	     : String;
                   EMPRE_CONTADOR	         : String;
                   EMPRE_CRC	             : String;
                   EMPRE_FONE_CONTADOR	   : String;
                   EMPRE_CIDCONTADOR	     : Double;
                   EMPRE_ATIVIDADE         : String;
                   EMPRE_LOGOTIPO          : String;
                   EMPRE_MODELODANFE       : String;
                   EMPRE_AMBIENTE          : String;
                   EMPRE_MODCOMPROVANTE    : String;
                   EMPRE_CONTINGENCIA      : String;
                   EMPRE_CANCELAMENTO      : String;
                   EMPRE_DTCERTIFIC        : String;
                   EMPRE_CERTIFICADO       : String;
                   EMPRE_SIGLAWS           : String;
                   EMPRE_VERSAONFE         : String;
                   EMPRE_CONSICM           : String;
                   EMPRE_CONSCEP           : String;
                   EMPRE_PROXY             : String;
                   EMPRE_PROXYPORTA        : String;
                   EMPRE_PROXYUSUARIO      : String;
                   EMPRE_PROXYSENHA        : String;
                   FUNC_REPLICA            : String;
                   FUNC_TIPO_USU           : String;
                   FUNC_BOTOES             : String;
                   // vanessa - NFe
                   EMPRE_CEP	             : String;
                   EMPRE_ENDERECO	         : String;
                   EMPRE_NUMERO	           : String;
                   EMPRE_COMPLEMENTO	     : String;
                   EMPRE_BAIRRO	           : String;
                   EMPRE_CIDADE	           : String;
                   EMPRE_CRT               : String;
                   NFE_LOGOTIPO            : String;
                   nfe_geranota            : String;
                   nfe_caminhonfe          : String;
                   nfe_backupnfe           : String;
                   nfe_retornonfe          : String;
                   nfe_retornoxml          : String;
                   nfe_geratxtxml          : String;
                   nfe_versao              : String;
                   nfe_siglaws             : String;
                   nfe_consultaicm         : String;
                   nfe_consultacep         : String;
                   nfe_ctaemail            : String;
                   nfe_gerapdf             : String;
                   nfe_caminhopdf          : String;
                   nfe_2via                : String;
                   nfe_segundos            : String;
                   nfe_obs                 : String;
                   EMPRE_ESPECIFICA        : Integer;
                   nfe_bat_retorno         : String;
                   nfe_bat_cancelamento    : String;
                   nfe_testa_versao        : String;
                   // ALTERAÇÕES NFE 3a GERAÇÃO
                   NFE_DANFE               : String;
                   NFE_HORA_UTC            : String;
                   NFE_VARIOS_USUARIOS     : String;	// Permite vários usuários utilizarem a nota ao mesmo tempo - (S)im ou (N)ão */
                   NFCE_DANFE              : String;  // Modelo da Danfe NFC-e (0 = SEM DANFE / 1 = A4 / 2 = IMPRESSORA TÉRMICA) */
                   NFCE_LOGOTIPO           : String;  // Logotipo para NFCe */
                   NFCE_TEMPO_RETORNO      : String;	// Tempo aguardado para o Retorno do Envio de NFC-e */
                   NFCE_QRCODE_VERSAO      : String;	// Versão do QRCODE */
                   NFCE_QRCODE_IDTOKEN     : String;	// IdToquen do QRCODE */
                   NFCE_QRCODE_CSC   	     : String;	// CSC do QRCODE */
                   NFCE_QRCODE_ESCALA   	 : String;	// Escala do QRCODE - 1 A 5 */
                   NFCE_QRCODE_PASTA   	   : String;	// Pasta do QRCODE */
                   NFE_TABLET_USA  	       : String;	// Usa TABLET - (S)im ou (N)ão */
                   NFE_TABLET_PASTA	       : String;	// Usa TABLET - Pasta para Retorno de Arquivos para o Tablet */
                   NFE_TABLET_PDF  	       : String;	// Usa TABLET - (S)im ou (N)ão - Retornar Arquivo .PDF - conforme nome do arquivo .PED - ex: VVVVSSSS (Vendedor e Sequencial) */
                   NFE_TABLET_XML  	       : String;	// Usa TABLET - (S)im ou (N)ão - Retornar Arquivo .XML - conforme nome do arquivo .PED - ex: VVVVSSSS (Vendedor e Sequencial) */
                   NFE_TABLET_RET  	       : String;	// Usa TABLET - (S)im ou (N)ão - Retornar Arquivo .RET - conforme nome do arquivo .PED - ex: VVVVSSSS (Vendedor e Sequencial) */
                   NFCE_CONTINGENCIA       : String;






                     // Novos Campos v3.17
                   MODELO_DOC              : String;  // Modelo NFe 55 ou NFCe 65
                   FUNC_CODDNE                : string;
                   FUNC_CIDADEIBGE            : string;
                   FUNC_CIDADENOME            : string;
                   FUNC_UFNOME                : string;
                   FUNC_UFIBGE                : string;
                   FUNC_PAISIBGE              : string;
                   EMPRE_NOMEFANTASIA         : String;
                   EMPRE_CODDNE               : string;
                   EMPRE_CIDADEIBGE           : string;
                   EMPRE_CIDADENOME           : string;
                   EMPRE_UFNOME               : string;
                   EMPRE_UFIBGE               : string;
                   EMPRE_PAISIBGE             : string;
                   // CAMPOS SPED
                   CONT_CODIGO              : String;







    end;


    RLOGININI = record
                      NOMEUSUARIO    : String;
                      NOMECOMPUTADOR : String;
                      NUMEROIP       : String;
                      NUMEROMAC      : String;
                      NUMEROSERIAL   : String;
                      NUMEROMACATUAL : String;
                      PROXY          : String;
                      SENHA          : String;
                end;

    RGERAL_CONFIGURADOR = record
            EMPRE_CODIGO        : String;
            GER_DIASGRAVOSO     : String;
            GER_DIASBLOQUEIO    : String;
            GER_DIASREPOUSO     : String;
            GER_DIASINATIVO     : String;
            GER_RAMOCLIENTE     : String;
            GER_PIS             : String;
            GER_COFINS          : String;
            GER_CUSADM          : String;
            GER_IMPOSTOVIG      : String;
            GER_MARGEMMIN       : String;
            GER_MARGEMMAX       : String;
            GER_CPMF            : String;
            GER_ISSQN           : String;
            GER_LIVROMES        : String;
            GER_LIVROANO        : String;
            GER_BCOCXAMES       : String;
            GER_BCOCXAANO       : String;
            GER_DESCESPNOTA     : String;
            GER_DESCESPITEM     : String;
            GER_IPITIPO         : String;
            GER_IPITABELA       : String;
            GER_ICMPAUTA        : String;
            GER_ICMPAUTATAB     : String;
            GER_ACUMULADUPLIC   : String;
            GER_DIASBLOQMENOS   : String;
            GER_ENTDECPRECO     : String;
            GER_ENTDECQUANT     : String;
            GER_SAIDECPRECO     : String;
            GER_SAIDECQUANT     : String;
            GER_NATUREZATROC1   : String;
            GER_NATUREZATROC2   : String;
            GER_NATUREZATROC3   : String;
            GER_PEDIDOMINIMO    : String;
            GER_BOLETOMINIMO    : String;
            GER_MULTA           : String;
            GER_JUROSDIA        : String;
            GER_JUROSSUP        : String;
            GER_LIMDIAS         : String;
            GER_JUROS_TIPO      : String;
            GER_COMISSAO        : String;
            GER_FRETE           : String; // FRETE (T)RIBUTADO (N)ÃO TRIBUTADO
            GER_CORTE        : String;
    end;

          RGERALPREVENDA = record
               EMPRE_CODIGO          : Integer;
               PREVENDA_DATA         : STRING;
               PREVENDA_CODIGO       : Integer;
               PREVENDA_OBSERVACAO   : String;
               PREVENDA_DESCONTO     : Double;
               PREVENDA_DESCONTO_VALOR : Double;
               PREVENDA_ACRESCIMO    : Double;
               PREVENDA_ARECEBER     : Double;
               PREVENDA_TROCO        : Double;
               PREVENDA_ENTRADA      : Double;
               PREVENDA_TOTAL        : Double;
               COND_CODIGO           : Integer;
               BANCO_CODIGO          : integer;
               BANCO_DESCRICAO       : string;
               NATU_CODIGO           : Integer;
               NATU_NOME             : String;
               TIPO                  : String;
               PREVENDA_LEOBSERVACAO : String;
               PREVENDA_HORA         : String;
               REPRE_CODIGO          : Integer;
               REPRE_CODIGO2         : string;
               PRECO_TABELA          : Integer;
               PREVENDA_SITUACAO     : String;
               CLI_CODIGO            : Integer;
               PREVENDA_NOMECLIENTE  : String;
               PREVENDA_CPFCNPJ      : String;
               PREVENDA_OBS          : String;
               PREVENDA_DESC_ITEM    : Double;
               PREVENDA_SUBTOTAL     : Double;
               PREVENDA_ANO          : String;

               CLI_CNPJCPF           : String;
               CLI_RESENDERECO       : String;
               CLI_RESBAIRRO         : String;
               CLI_RESENDNUMERO      : String;
               CLI_TIPOPESSOA        : String;
               CLI_RESCEP            : String;
               CLI_RESTELEFONE       : String;
               CLI_RESCELULAR        : String;
               CLI_INSCMUN           : String;
               SITUACAO_CODIGO1      : String;

               CIDADE_CODDNE         : String;
               REPRE_DESCRICAO       : String;
               REPRE_DESCRICAO2      : String;
               CIDADE_DESCRICAO      : String;
               CIDADE_UF             : String;
               SERVICO_SUBTOTAL      : Double;
               SERVICO_DESCONTO      : Double;
               SERVICO_ACRESCIMO     : Double;
               ITENS_SUBTOTAL        : Double;
               ITENS_DESCONTO        : Double;
               ITENS_ACRESCIMO       : Double;
               PREVENDA_FRETE        : double;
               PREVENDA_DATAENTREGA        : String;
               PREVENDA_HORAENTREGA        : String;
               PREVENDA_TRANSPORTADORA     : integer;
               TRANSPORTADORA_DESC     : STRING;


               PREVENDA_ORDEMCOMPRA        : integer;
               PREVENDA_COND_VLR_01        : String;
               PREVENDA_COND_DTA_01        : String;
               PREVENDA_COND_DTA_02        : String;
               PREVENDA_COND_VLR_02        : String;
               PREVENDA_COND_DTA_03        : String;
               PREVENDA_COND_VLR_03        : String;
               PREVENDA_COND_DTA_04        : String;
               PREVENDA_COND_VLR_04        : String;
               PREVENDA_COND_DTA_05        : String;
               PREVENDA_COND_VLR_05        : String;
               PREVENDA_COND_DTA_06        : String;
               PREVENDA_COND_VLR_06        : String;
               PREVENDA_COND_DTA_07        : String;
               PREVENDA_COND_VLR_07        : String;
               PREVENDA_COND_DTA_08        : String;
               PREVENDA_COND_VLR_08        : String;
               PREVENDA_COND_DTA_09        : String;
               PREVENDA_COND_VLR_09        : String;
               PREVENDA_COND_DTA_10        : String;
               PREVENDA_COND_VLR_10        : String;
               PREVENDA_COND_DTA_11        : String;
               PREVENDA_COND_VLR_11        : String;
               PREVENDA_COND_DTA_12        : String;
               PREVENDA_COND_VLR_12        : String;
               PREVENDA_DATA_FECHAMENTO    : String;
               PREVENDA_FRETE_TIPO         : String;

               PREVENDA_CST                : String;
               PREVENDA_TAB_ICMS           : String;
               PREVENDA_ICM_BASE           : String;
               PREVENDA_ICM_ALIQ           : String;
               PREVENDA_ICM_VALOR          : String;
               PREVENDA_RED_BASE           : String;
               PREVENDA_RED_IS             : String;
               PREVENDA_ICM_ISENTAS        : String;
               PREVENDA_ICM_OUTRAS         : String;
               PREVENDA_ALIQ_MVA           : String;
               PREVENDA_ST_BASE            : String;
               PREVENDA_ST_ALIQ            : String;
               PREVENDA_ST_VALOR           : String;
               PREVENDA_TAB_IPI            : String;
               PREVENDA_ALIQ_IPI           : String;
               PREVENDA_IPI_BASE           : String;
               PREVENDA_IPI_VALOR          : String;
               PREVENDA_TAB_PIS            : String;
               PREVENDA_ALIQ_PIS           : String;
               PREVENDA_PIS_BASE           : String;
               PREVENDA_PIS_VALOR          : String;
               PREVENDA_TAB_COFINS         : String;
               PREVENDA_ALIQ_COFINS        : String;
               PREVENDA_COFINS_BASE        : String;
               PREVENDA_COFINS_VALOR       : String;
               PREVENDA_IO                 : String;
               PREVENDA_S_ICM              : String;
               PREVENDA_V_IC               : String;
               PREVENDA_B_PC               : String;

    end;
    RCONFIGURA_PED_COMPRA = record
          EMPRE_CODIGO  :Integer;
          OBS           :String;
          PROGRAMA      :String;
          PROD_INI      :Integer;
          PROD_FIN      :Integer;
          GRADE_INI     :Integer;
          GRADE_FIN     :Integer;
          PEDIDO_PDF    :String;
    end;
  RFINANCCONTASRECEBER = record
            EMPRE_CODIGO            : Integer;
            CLI_CODIGO              : Integer;
            CONTREC_NR_FATURA       : String;
            CONTREC_SIT_TITULO      : String;
            CONTREC_TIPO_DOCUMENTO  : String;
            CONTREC_DT_EMISSAO      : TDateTime;
            CONTREC_REPRE1          : Integer;
            CONTREC_VLR_ORIGINAL    : String;
            CONTREC_VALOR_DOCUMENTO : String;
            CONTREC_DT_PGTO         : TDateTime;
            CONTREC_DT_VCTO         : TDateTime;
            CONTREC_VLR_PGTO        : String;
            PREVENDA_DATA           : TDateTime;
            PREVENDA_CODIGO         : Integer;
            CONTREC_COD_NT          : String;
            CONTREC_COD_BCO         : String;
            CONTREC_NR_BARRAS       : String;

  end;
    RFINANCCONTASRECBAIXA =  record
            EMPRE_CODIGO             : Integer;
            CLI_CODIGO               : Integer;
            CONTREC_NR_FATURA        : String;
            CONTBAIXA_SEQ            : Integer;
            CONTBAIXA_DATA_PAGAMENTO : TDateTime;
            CONTBAIXA_VLR_PGTO       : String;
    end;

RGERALCONFIGNATUREZA = record





              TABELA_PIS      : Integer;
              TABELA_COFINS   : Integer;
              MENSAGEM       : String;


              NATU_CODIGO	           : Integer;
              NATU_CODFISCALDENTRO   : String;
              NATU_MARCACFOPDENTRO   : String;
              NATU_CODFISCALFORA     : String;
              NATU_MARCACFOPFORA     : String;
              NATU_CODIGOGIA         : String;
              NATU_NOME              : String;
              NATU_ABREV             : String;
              NATU_CLAFISPRODENT1    : String;
              NATU_CLAFISPRODENT2    : String;
              NATU_CLAFISPRODSAI1    : String;
              NATU_CLAFISPRODSAI2    : String;
              NATU_MENSAGEM          : String;
              NATU_TIPO              : String;
              NATU_EMITENOTA         : String;
              NATU_LIVROFISCAL       : String;
              NATU_LFATUAOBS         : String;
              NATU_LFATUATIPO        : String;
              NATU_CTARECEBER        : String;
              DCTA_CODIGO            : Integer;
              HIST_CODIGO            : Integer;
              HIST_CODIGO2           : Integer;
              NATU_CTAPAGAR          : String;
              NATU_MAPAATUALIZA      : String;
              NATU_MAPAOPERACAO      : String;
              NATU_MAPAOPETIPO       : String;
              BANCO_CODIGO           : Integer;
              NATU_TABELAPRECO       : Integer;
              NATU_REPRESENTANTE     : String;
              NATU_ESTOQUE           : String;
              NATU_ESTOQUEQTD        : String;
              NATU_SAIDAQTD          : String;
              NATU_SAIDAVLR          : String;
              NATU_ENTRADAQTD        : String;
              NATU_ENTRADAVLR        : String;
              NATU_CONTRIBUICAO      : String;
              NATU_CUSTOCONTRIB      : String;
              NATU_CUSTOPRODUTO      : String;
              NATU_CUSTOMEDIO        : String;
              NATU_PEDELOJADEST      : String;
              NATU_PEDENFORIGEM      : String;
              NATU_LCTOVENC          : String;
              NATU_LCTOVALOR         : String;
              NATU_TRANSFER          : Integer;
              NATU_CREDIARIO         : String;
              NATU_IPI               : String;
              NATU_PEDEPEDIDO        : String;
              NATU_PROXIMA           : Integer;
              NATU_SIMPLESNAC        : String;
              NATU_SERIE_NFE         : String;
              NATU_CST               : String;
              EMPRE_CODIGO           : String;
              IMPOSTOS_TABELA2 : Integer; // @ geral_impostos para tabela icms - TIPO = 2 (PIS) [0 - ICMS 1 - IPI 2 - PIS 3 - COFINS] */
              IMPOSTOS_TABELA3 : Integer; // @ geral_impostos para tabela icms - TIPO = 3 (COFINS) */
              CFOP                   : String;
              CLASSIF_FISCAL         : String;
              NATU_FINANCEIRO        : String;
              NATU_SERIE             : String;  // SÉRIE PARA NFE
              CST_ICMS               : String;
              UF_FORNECEDOR          : String;  // UF DO FORNECEDOR PARA COMPARAR COM UF DA EMPRESA
              NATU_MODELO_NF         : String; // 55 = NFE  OU   65 = NFCE
              IMPOSTOS3_TABELA       : STRING;
              IMPOSTOS4_TABELA       : STRING;
    end;
    RGERALHISTORICO = record
        EMPRE_CODIGO                     : Integer;
        PROD_CODIGO                      : Integer;
        HISTP_QTD_ESTOQUE_ATUAL          : String;
        HISTP_QTD_ANTERIOR               : String;
        HISTP_QTD_ULTIMA_SAIDA           : String;
        HISTP_QTD_ULTIMA_ENTRADA         : String;
        HISTP_DATA_VALIDADE_PRECO        : String;
        HISTP_DATA_ULTIMA_SAIDA          : String;
        HISTP_DATA_ULTIMA_ENTRADA        : String;
        HISTP_CUSTO_COMPRA               : String;
        HISTP_CUSTO_INVENTARIO           : String;
        HISTP_CUSTO_CONTRIBUICAO         : String;
        HISTP_CUSTO_MEDIO                : String;
        HISTP_CUSTO_MEDIO_INVENTARIO     : String;
        HISTP_PRECO_COMPRA               : String;
        HISTP_PRECO_COMPRA_LIQUIDO       : String;
        HISTP_NR_LANCAMENTO              : Integer;
        HISTP_SITUACAO                   : String;
        HISTP_SITUACAO_ANTERIOR          : String;
    end;
  RGERALCONFIGURACONDICOES = record
       cond_codigo            :string;
       cond_desdobramento01   :string;
       cond_desdobramento02   :string;
       cond_desdobramento03   :string;
       cond_desdobramento04   :string;
       cond_desdobramento05   :string;
       cond_desdobramento06   :string;
       cond_desdobramento07   :string;
       cond_desdobramento08   :string;
       cond_desdobramento09   :string;
       cond_desdobramento10   :string;
       cond_desdobramento11   :string;
       cond_desdobramento12   :string;
       cond_data_inicial      :TDateTime;
       cond_dia_fixo          :string;
       cond_dias_uteis        :string;
       cond_acrescimo         :string;
       cond_desconto          :string;
       cond_Vlr_desconto      :double;
       cond_Vlr_Acrescimo     :double;

end;

 RGERALCONFIGURANUMEROS = record
   EMPRE_CODIGO           :String;
   NRO_ENTSERIE           :String;
   NRO_ENTNOTA            :String;
   NRO_SAISERIE           :String;
   NRO_SAINOTA            :String;
   NRO_LIVROLCTOENT       :String;
   NRO_LIVROLCTOSAI       :String;
   NRO_PEDIDO_VENDA       :String;
   NRO_PEDIDO_VENDA_NR    :String;
   NRO_PEDIDO_COMPRA      :String;
   NRO_PEDIDO_COMPRA_NR   :String;
   NRO_AUTORIZAVENDA      :String;
   NRO_DESCONTO           :String;
   NRO_ACRESCIMO          :String;
   NRO_COMISSAO           :String;
   NRO_PARCELAS           :String;
   NRO_RECIBO_RECEBIMENTO :String;
   NRO_RECIBO_PAGAMENTO   :String;
   NRO_RECIBO_VARIAVEL    :String;
 end;

    // Campos para Auditoria
    RGERALAUDITORIA = record
        EMPRE_CODIGO 	 	    : Integer;
        FUNC_CODIGO 		    : String;
        MENU_CODIGO			    : String;
        CAMPO_CODIGO		    : String;
        AUDIT_DATA			    : String;
        AUDIT_HORA			    : String;
        AUDIT_ACAO			    : String;
        AUDIT_TABELA			  : String;
        AUDIT_REG_ANTERIOR	: String;
        AUDIT_REG_ATUAL		  : String;
    end;

    // Campos para Controle de Auditoria
    RAUXAUDITORIA = record
        CAMPO_CODIGO		    : Array of String;
        AUDIT_TABELA			  : Array of String;
        AUDIT_REG_ANTERIOR	: Array of String;
        INDICE_COMPONENTE   : Array of Integer;
    end;

    // Campos para Controle de Auditoria
    RGERALCAMPOACESSO = record
        EMPRE_CODIGO 	 	    : Array of Integer;
        FUNC_CODIGO 		    : Array of String;
        MENU_CODIGO			    : Array of String;
        CAMPO_CODIGO		    : Array of String;
        CAMPO_SENHA  		    : Array of String;
        CAMPO_OPCAO			    : Array of String;
        CAMPO_AUDITORIA	    : Array of String;
        REGISTRO_ANTES      : Array of String;
        INDICE_COMPONENTE   : Array of Integer;
    end;

 RGERALCONFIGURACUPOM = record
     empre_codigo              :String;
     confcupom_nr_pedido       :String;
     confcupom_tef             :String;
     confcupom_consiste        :String;
     confcupom_desconto        :String;
     confcupom_acrescimo       :String;
     confcupom_qtd_max_item    :String;
     confcupom_limite          :String;
     confcupom_estoque         :String;
     confcupom_reducaoZ        :String;
     confcupom_rel_gerencial   :String;
     confcupom_comissao        :String;
     confcupom_desconto_real   :String;
     confcupom_acrescimo_real  :String;
     confcupom_natureza        :String;
     confcupom_grade           :String;
     confcupom_barras          :String;
     confcupom_ped_compras     :String;
     confcupom_metodo_busca    :String;
     confcupom_layout_impressao:String;
     confcupom_Dias_pontuacao         :string;
     confcupom_valor                  :string;
     confpontuacao                    :string;
     confcupom_pontuacao_Min           :string;
     confcupom_naturezas1             :string;
     confcupom_naturezas2             :string;
     confcupom_naturezas3             :string;
     confcupom_naturezas4             :string;
     confcupom_naturezas5             :string;
     confcupom_naturezas6             :string;
     confcupom_naturezas7             :string;
     confcupom_naturezas8             :string;
     confcupom_naturezas9             :string;
     confcupom_naturezas10            :string;
     confcupom_TodasNatu              :string;




     confcupom_vlr_min_compra         :string;
     confDescBonificacao              :string;
     CONF_ENTRADAAVISTA               :string;
  end;


  { CONFIGURADOR DE PEDIDOS DO FATURAMENTO - CONFIG_PEDIDOS_FAT}
  RCONFIGPEDFAT = record
	              EMPRE_CODIGO		      : Integer;	//* CÓDIGO DA EMPRESA */
	              CPEDFAT_AUTOMATICO	  : String;	  //* GERA PEDIDO AUTOMÁTICO - Valores: (S)im  /  (N)ão */
	              CPEDFAT_TELEVENDA	    : String;	  //* PEDE TELEVENDA (tabela representante) - Valores: (S)im  /  (N)ão */
	              CPEDFAT_ROTA		      : String;	  //* POR ROTA - Valores: (S)im: Tab. Rota / (N)ão: Tab. Representante */
	              CPEDFAT_DESCONTO      : String;	  //* PEDE DESCONTO - Valores: N, R, P, A */
//* (N)ão Habilita / Habilita em (R)eais - no final do pedido / Habilita em (P)ercentual - nos itens / Habilita (A)mbos - R$ Pedido e % Itens */
                CPEDFAT_ACRESCIMO	    : String;	  //* PEDE ACRÉSCIMO - Valores: N, R, P */
//* (N)ão Habilita / Habilita em (R)eais - no final do pedido / Habilita em (P)ercentual - nos itens */
	              CPEDFAT_COMISSAO	    : String;	  //* PEDE COMISSAO - Valores: NH, NF, FP, RN, TP */
//* (NH) Não Habilita / (NF) Sobre a Nota Fiscal / (FP) Sobre Faturamento e Produto / (RN) Sobre Representante e Nível (Grp/Sub/Div) / (TP) Segue Tabela de Programação */
	              CPEDFAT_VENDA		      : String;	  //* PEDIDO VENDA PEDE - Valores: (C)ódigo / (R)eferência */
	              CPEDFAT_NATUREZA	    : String;	  //* PEDE NATUREZA OU PUXA AUTOMÁTICO CLIENTE - Valores: (S)olicita / (C)liente */
	              CPEDFAT_BANCO		      : String;	  //* PEDE BANCO OU PUXA AUTOMÁTICO CLIENTE - Valores: (S)olicita / (C)liente */
	              CPEDFAT_PRAZO		      : String;	  //* PEDE PRAZO (DESDOBRAMENTO) OU PUXA AUTOMÁTICO CLIENTE - Valores: (S)olicita / (C)liente */
	              CPEDFAT_TABELA_PRECO	: String;	  //* PEDE PRAZO OU PUXA AUTOMÁTICO CLIENTE - Valores: (S)olicita / (C)liente */
	              CPEDFAT_FAT_TRANSP	  : String;	  //* HABILITA TRANSPORTADORA - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_REDESP	  : String;	  //* HABILITA TRANSPORTADORA REDESPACHO - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_DESPESA	  : String;	  //* HABILITA DESPESA - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_VOLUMES	  : String;	  //* HABILITA VOLUME (NÚMERO/QUANTIDADE/ESPÉCIE) - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_PESOS	    : String;	  //* HABILITA PRESOS - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_FRETE	    : String;	  //* HABILITA FRETE - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_MENSAGEM	: String;	  //* HABILITA MENSAGEM - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_SEGURO	  : String;	  //* HABILITA SEGURO - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_DT_PEDIDO	: String;	  //* HABILITA DATA DO PEDIDO - Valores: (S)im  /  (N)ão */
	              CPEDFAT_FAT_BXA_ESTOQ	: String;	  //* ATUALIZA ESTOQUE NA DIGITAÇÃO DO ITEM - SOMENTE TABELA KARDEX - Valores: (S)im  /  (N)ão */
	              CPEDFAT_PRECO      	  : String;	  //* PRECO - Valores: (S)im  /  (N)ão */
 end;
  RGERALNUMERO = record
          EMPRE_CODIGO	        : Integer;
          NROENTSERIE           : String;
          NROENTNOTA            : Double;
          NROSAISERIE           : String;
          NROSAINOTA            : Double;
          NROLIVROLCTOENT       : Integer;
          NROLIVROLCTOSAI       : Integer;
          NROPEDIDOVENDA        : String;
          NROPEDIDOVENDANR      : String;
          NROPEDIDOCOMPRA       : String;
          NROPEDIDOCOMPRANR     : String;
          NROAUTORIZAVENDA      : String;
          NRODESCONTO           : String;
          NROACRESCIMO          : String;
          NROCOMISSAO           : String;
          NROPARCELAS           : String;
          NRORECIBORECEBIMENTO  : Integer;
          NRORECIBOPAGAMENTO    : Integer;
          NRORECIBOVARIAVEL     : Integer;
    end;

 REMPRESAESPECIFICA = record
    EMPRE_CODIGO       : STRING;
 end;
 
// SQL's para acessos,manutenção e leitura de dados...
Const
  //   sSQLSelecionaUsuario = 'SELECT GERAL_FUNCIONARIO.*,GERAL_FUNCIONARIO_SENHA.* '+
  //                           'FROM GERAL_FUNCIONARIO,GERAL_FUNCIONARIO_SENHA '+
    //                         'WHERE (GERAL_FUNCIONARIO.FUNC_CODIGO = GERAL_FUNCIONARIO_SENHA.FUNC_CODIGO) AND '+
      //                       '(GERAL_FUNCIONARIO.EMPRE_CODIGO = GERAL_FUNCIONARIO_SENHA.EMPRE_CODIGO) AND '+
        //                     '(GERAL_FUNCIONARIO.FUNC_CODIGO = :FUNCCODIGO) AND '+
          //                  '(GERAL_FUNCIONARIO.EMPRE_CODIGO = :EMPRECODIGO)';



    sSQLSelecionaUsuario = 'select * from geral_funcionario '+
                                  'where (geral_funcionario.func_codigo = :funccodigo) and '+
                                  '      (geral_funcionario.empre_codigo = :emprecodigo)';


     sSQLSelecionaMenus = 'select * from geral_acesso,geral_menu '+
                          'where (geral_acesso.menu_codigo = geral_menu.menu_codigo)and'+
                          ' (func_codigo = :funccodigo) and '+
                          ' (empre_codigo = :emprecodigo)';

     sSQLLeBarras = 'SELECT EST010.EST010_DESCR,'+
                     '       EST010.EST010_CODIGO,'+
                     '       EST010.EST010_COD_BARRA,'+
                     '       EST010.EST010_PRC_TAB,'+
                     '       EST010.EST010_UNID,'+
                     '       EST010.EST010_GRP,'+
                     '       EST010.EST010_TAB_CF FROM EST010  WHERE EST010_COD_BARRA =:BARRAS';


     sSQLLeCodigo = 'SELECT EST010.EST010_DESCR,'+
                     '       EST010.EST010_CODIGO,'+
                     '       EST010.EST010_COD_BARRA,'+
                     '       EST010.EST010_PRC_TAB,'+
                     '       EST010.EST010_UNID,'+
                     '       EST010.EST010_GRP,'+
                     '       EST010.EST010_TAB_CF FROM EST010  WHERE EST010.EST010_CODIGO =:CODIGO';

     sSQLLeTabelaPreco = 'SELECT * FROM EST010A '+
                         'WHERE (EST010A.EST010A_LOJA = :EST010ALOJA) AND '+
                         '      (EST010A.EST010A_CODIGO = :EST010ACODIGO)';


     // GRAVA TABELA AUDITORIA
      sSQLGravaAuditoria = 'INSERT INTO GERAL_AUDITORIA (EMPRE_CODIGO,FUNC_CODIGO,MENU_CODIGO,CAMPO_CODIGO,AUDIT_DATA,'+
                                                        'AUDIT_HORA,AUDIT_ACAO,AUDIT_TABELA,AUDIT_REG_ANTERIOR,AUDIT_REG_ATUAL) '+
                                                'VALUES (:EMPRECODIGO,:FUNCCODIGO,:MENUCODIGO,:CAMPOCODIGO,:AUDITDATA,'+
                                                        ':AUDITHORA,:AUDITACAO,:AUDITTABELA,:AUDITREGANTERIOR,:AUDITREGATUAL) '+
                                   'ON DUPLICATE KEY UPDATE  EMPRE_CODIGO       = :EMPRECODIGO,'+
                                                            'FUNC_CODIGO		    = :FUNCCODIGO,'+
                                                            'MENU_CODIGO		    = :MENUCODIGO,'+
                                                            'CAMPO_CODIGO		    = :CAMPOCODIGO,'+
                                                            'AUDIT_DATA 	      = :AUDITDATA,'+
                                                            'AUDIT_HORA 	      = :AUDITHORA,'+
                                                            'AUDIT_ACAO 	      = :AUDITACAO,'+
                                                            'AUDIT_TABELA 	    = :AUDITTABELA,'+
                                                            'AUDIT_REG_ANTERIOR	= :AUDITREGANTERIOR,'+
                                                            'AUDIT_REG_ATUAL    = :AUDITREGATUAL ';

     VK_PAGEUP = 33;
     VK_PAGEDOWN = 34;

var
   //Util : NFe_Util_2G_Interface;
   dtmSisGestao: TdtmSisGestao;
   tdSisGestao : TTransactionDesc;
   tfArquivoIni, tfArquivoLogin, tfControla : TIniFile;
   bAchouArquivoINI, bTemFilial, bPastas, bF12, bFechacupom, bimprimePedido, bFechacupomParcelado, bTempoNFe, bNFeAutomatica  : Boolean;
   ARQUIVOINI : RARQUIVOINI;
   CONFSISGESTAO : RCONFSISGESTAO;
   CONFIGURA_PED_COMPRA : RCONFIGURA_PED_COMPRA;
   SPEDCONTABIL:RCAMINHOCONTBILINI;
   CONFIGURA_ECF:RCONFIGURAECF;
   CONFIGPEDFAT : RCONFIGPEDFAT;  // Configurador de Pedidos do Faturamento
   ECF : RECF;
   LINHADIGITACAO : RLINHADIGITACAO; //dados de visualizaçao
   LINHAFORMATADA : RLINHAFORMATADA;
   CLIENTE : RCLIENTE;
   PARAMETROS : RPARAMETROS;
   PARAMETROS_CAD_EMPRESA :RPARAMETRO_EMPRESA ;
   LinhaParcela:RLINHAPARCELA    ;
   REDUCAO:RREDUCAO;
   GERAL_ETIQUETA : RCONFIGURAETIQUETAS;
   GERAL_CONFIGURADOR : RGERAL_CONFIGURADOR;
   GERALAUDITORIA   : RGERALAUDITORIA;
   AUXAUDITORIA   : RAUXAUDITORIA;
   GERALCAMPOACESSO : RGERALCAMPOACESSO;
   FUNCIONARIO : RFUNCIONARIO;
   LOGININI : RLOGININI;
   sArquivoSobre, sCaminhoIni, sCaminhoExe, sAcao ,sConexao, sFuncCodigo,
   sSenhaSenha, sRet, sEmpresa, sCaminhoSkin, sArquivoINI, sErro, sCaminho,
   sRetorno, sAcaoNFe, sAcaoInt, sLiberaEnvio : String;
   bmPontoDeVolta,bmPontoDeVolta2 : TBookMark;
   ifArquivo : TIniFile;
   aPasta : array[0..9] of string;
   aFamiliasSelecionas, aVendedoresSelecionados : array of String;
   FINANCCONTASRECEBER    : RFINANCCONTASRECEBER;

   FINANCCONTASRECBAIXA   : RFINANCCONTASRECBAIXA;
   GERALCONFIGNATUREZA    : RGERALCONFIGNATUREZA;
   GERALCONFIGURACONDICOES: RGERALCONFIGURACONDICOES;
   GERALCONFIGURA_NUMEROS : RGERALCONFIGURANUMEROS;
   GERALCONFIGURACUPOM    : RGERALCONFIGURACUPOM;
   GERALKARDEX            : RGERALKARDEX ;
   GERALNOTA              :RGERALNOTA;

  GERALFORMAPAGAMENTO        : RGERALFORMAPAGAMENTO;
  GERALCLIENTE:RGERALCLIENTE;

  GERALIMPOSTOS : RGERALIMPOSTOS ;

  GERALPRODUTOSHISTORICO:RGERALPRODUTOHISTORICO;
  GERALLIVROSAIDA:RGERALLIVROSAIDA;
  GERALESTMES :RGERALESTMES;
  GERALESTMVTO              : RGERALESTMVTO;
  GERAL_BANCO               : RGERAL_BANCO;
  GERAL_PRODUTOS            : RGERALPRODUTOS;

  CONFIGURA_PEDIDO          :RCONFIGURADORPEDIDO;
  GERALIBPT                 :RGERALIBPT;
  CONFIGURA_REPRE           :RCONFIGURA_REPRE;
  GERALITEM                :RGERALITEM ;

  GERALCOMISSAO          : RGERALCOMISSAO;
  GERALITEMGRADE         :RGERALITEMGRADE;
  GERAL_BANCO_PARCELADO  :RGERAL_BANCO_PARCELADO;
  GERALTRIBUTACAOPRODUTO :RGERALTRIBUTACAOPRODUTO;
  GERALPREVENDA          : RGERALPREVENDA;

  EMPRESA_ESPECIFICAS    :REMPRESAESPECIFICA ;
  CONFIGURACAOECF :RCONFIGURACAOECF;
  GERALNUMERO:RGERALNUMERO ;
  GERALLIVRO :RGERALLIVRO ;

implementation

 {uConfiguracaoINI, uConfiguracaoSisGestao, uCadastroConfigGeral,
      uLogin, uFuncoesBancarias, UcadastroAtividades, uCadastroConfigCustos}

uses URetornaRecord,uSisIndustria;

{$R *.dfm}


procedure TdtmSisgestao.CarregaGeral_Nfe(Sender: TObject);
begin
 // Localizar Configurador da NF-e
            if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryGeralDados.SQL.Clear;
            dtmSisGestao.FdQryGeralDados.SQL.Add( LowerCase('SELECT * FROM GERAL_NFE WHERE (empre_codigo = :emprecodigo)'));
            dtmSisGestao.FdQryGeralDados.Params.ParamByName('emprecodigo').AsString := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
            dtmSisGestao.FdQryGeralDados.Active := True;
            if not (dtmSisGestao.FdQryGeralDados.FieldByName('empre_codigo').IsNull) then
            begin
               FUNCIONARIO.empre_modelodanfe    := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_danfe').asstring;
              funcionario.empre_modcomprovante := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_comprovante').asstring;
              funcionario.empre_ambiente       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_ambiente').asstring;
              funcionario.empre_contingencia   := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_contingencia').asstring;
              funcionario.empre_cancelamento   := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_chavecancelamento').asstring;
              funcionario.empre_dtcertific     := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_certificadodata').asstring;
              funcionario.empre_certificado    := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_certificadonome').asstring;
              funcionario.empre_siglaws        := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_siglaws').asstring;
              funcionario.empre_versaonfe      := '4.00';//dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_versao').asstring;
              funcionario.empre_consicm        := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_consultaicm').asstring;
              funcionario.empre_conscep        := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_consultacep').asstring;
            //  funcionario.empre_logotipo       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_logotipo').asstring;
               // pastas
              funcionario.nfe_geranota         := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_geranota').asstring;
              funcionario.nfe_caminhonfe       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_caminhonfe').asstring;
              funcionario.nfe_backupnfe        := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_backupnfe').asstring;
              funcionario.nfe_retornonfe       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_retornonfe').asstring;
              funcionario.nfe_retornoxml       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_retornoxml').asstring;
              funcionario.nfe_geratxtxml       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_geratxtxml').asstring;
              funcionario.nfe_versao           := '4.10';//dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_versao').asstring;
              funcionario.nfe_siglaws          := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_siglaws').asstring;
              funcionario.nfe_consultaicm      := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_consultaicm').asstring;
              funcionario.nfe_consultacep      := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_consultacep').asstring;
              funcionario.nfe_ctaemail         := dtmsisgestao.FdQryGeralDados.fieldbyname('email_conta').asstring;
              funcionario.nfe_gerapdf          := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_gerapdf').asstring;
              funcionario.nfe_caminhopdf       := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_caminhopdf').asstring;
              funcionario.nfe_2via             := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_2via').asstring;
              funcionario.nfe_segundos         := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_tempo_retorno').asstring;
              funcionario.nfe_obs              := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_obs').asstring;
              funcionario.nfe_bat_retorno      := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_bat_retorno').asstring;
              funcionario.nfe_bat_cancelamento := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_bat_cancelamento').asstring;
              funcionario.nfe_testa_versao     := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_testa_versao').asstring;
              funcionario.NFE_DANFE            := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_danfe').asstring;
              funcionario.NFE_HORA_UTC         := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_hora_utc').asstring;
               // nfc-e
              funcionario.NFE_VARIOS_USUARIOS  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_VARIOS_USUARIOS').asstring;
              funcionario.NFCE_DANFE           := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_DANFE').asstring;
              funcionario.NFCE_LOGOTIPO        := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_LOGOTIPO').asstring;
              funcionario.NFCE_TEMPO_RETORNO   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_TEMPO_RETORNO').asstring;
              funcionario.NFCE_QRCODE_VERSAO   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_VERSAO').asstring;
              funcionario.NFCE_QRCODE_IDTOKEN  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_IDTOKEN').asstring;
              funcionario.NFCE_QRCODE_CSC   	  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_CSC').asstring;
              funcionario.NFCE_QRCODE_ESCALA   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_ESCALA').asstring;
              funcionario.NFCE_QRCODE_PASTA   	:= dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_PASTA').asstring;
              funcionario.NFE_TABLET_USA  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_USA').asstring;
              funcionario.NFE_TABLET_PASTA	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PASTA').asstring;
              funcionario.NFE_TABLET_PDF  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PDF').asstring;
              funcionario.NFE_TABLET_XML  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_XML').asstring;
              funcionario.NFE_TABLET_RET  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_RET').asstring;
              funcionario.nfce_contingencia    := dtmsisgestao.FdQryGeralDados.fieldbyname('nfce_contingencia').asstring;
           end;
end;

Procedure limpa_variavel(var pRetorno : String);
begin
       FUNCIONARIO.EMPRE_CODIGO               :=0;
       FUNCIONARIO.FUNC_CODIGO                :='';
       FUNCIONARIO.FUNC_NOME                  :='';
       FUNCIONARIO.FUNC_ENDERECO              :='';
       FUNCIONARIO.FUNC_NUMERO                :='';
       FUNCIONARIO.FUNC_COMPLEMENTO           :='';
       FUNCIONARIO.FUNC_BAIRRO                :='';
       FUNCIONARIO.FUNC_CEP                   :='';
       FUNCIONARIO.CIDADE_CODDNE              := 0;
       FUNCIONARIO.FUNC_TELFIXO               :='';
       FUNCIONARIO.FUNC_TELCELULAR            :='';
       FUNCIONARIO.FUNC_SEXO                  :='';
       FUNCIONARIO.FUNC_EMAIL                 :='';
       FUNCIONARIO.FUNC_CTPSNUMERO            :='';
       FUNCIONARIO.FUNC_CTPSSERIE             :='';
       FUNCIONARIO.FUNC_CPF                   :='';
       FUNCIONARIO.FUNC_TITELEITORALNUMERO    :='';
       FUNCIONARIO.FUNC_TITELEITORALZONA      :='';;
       FUNCIONARIO.FUNC_TITELEITORALSECAO     :='';
       FUNCIONARIO.FUNC_IDENTIDADE            :='';
       FUNCIONARIO.FUNC_ORGAOEMISSOR          :='';
       FUNCIONARIO.FUNC_NACIONALIDADE         :='';
       FUNCIONARIO.FUNC_GRAUINSTRUCAO         :='';
       FUNCIONARIO.FUNC_ESTADOCIVIL           :='';
       FUNCIONARIO.FUNC_NOMECONJUGE           :='';
       FUNCIONARIO.FUNC_HABILITACAO           :='';
       FUNCIONARIO.FUNC_CATEGORIA             :='';
       FUNCIONARIO.FUNC_SISTEMA               :='';
       FUNCIONARIO.FUNC_CERTMILITAR_SERIE     :='';
       FUNCIONARIO.FUNC_CERTMILITAR_CATEGORIA :='';
       FUNCIONARIO.FUNC_FILIACAO_MAE          :='';
       FUNCIONARIO.FUNC_FILIACAO_PAI          :='';
       FUNCIONARIO.FUNC_FGTS_OPTANTE          :='';
       FUNCIONARIO.SENHA_SKIN                 :='';
       FUNCIONARIO.SENHA_NIVEL                := '';
       FUNCIONARIO.FUNC_BOTOES                := '';
       FUNCIONARIO.SENHA_CORCAMPOS            :=0;
       FUNCIONARIO.FUNC_RETORNOSENHA          :='';
       FUNCIONARIO.MENU_ATUAL                 :='';
       FUNCIONARIO.EMPRE_RAZAOSOCIAL          :='';
       FUNCIONARIO.EMPRE_CNPJ	                :='';
       FUNCIONARIO.EMPRE_UF                   :='';
       FUNCIONARIO.EMPRE_INSCESTADUAL         :='';
       FUNCIONARIO.EMPRE_LOGOTIPO             :='';
       GERAL_CONFIGURADOR.EMPRE_CODIGO        := '';
       GERAL_CONFIGURADOR.GER_DIASGRAVOSO     := '';
       GERAL_CONFIGURADOR.GER_DIASBLOQUEIO    := '';
       GERAL_CONFIGURADOR.GER_DIASREPOUSO     := '';
       GERAL_CONFIGURADOR.GER_DIASINATIVO     := '';
       GERAL_CONFIGURADOR.GER_RAMOCLIENTE     := '';
       GERAL_CONFIGURADOR.GER_PIS             := '';
       GERAL_CONFIGURADOR.GER_COFINS          := '';
       GERAL_CONFIGURADOR.GER_CUSADM          := '';
       GERAL_CONFIGURADOR.GER_IMPOSTOVIG      := '';
       GERAL_CONFIGURADOR.GER_MARGEMMIN       := '';
       GERAL_CONFIGURADOR.GER_MARGEMMAX       := '';
       GERAL_CONFIGURADOR.GER_CPMF            := '';
       GERAL_CONFIGURADOR.GER_ISSQN           := '';
       GERAL_CONFIGURADOR.GER_LIVROMES        := '';
       GERAL_CONFIGURADOR.GER_LIVROANO        := '';
       GERAL_CONFIGURADOR.GER_BCOCXAMES       := '';
       GERAL_CONFIGURADOR.GER_BCOCXAANO       := '';
       GERAL_CONFIGURADOR.GER_DESCESPNOTA     := '';
       GERAL_CONFIGURADOR.GER_DESCESPITEM     := '';
       GERAL_CONFIGURADOR.GER_IPITIPO         := '';
       GERAL_CONFIGURADOR.GER_IPITABELA       := '';
       GERAL_CONFIGURADOR.GER_ICMPAUTA        := '';
       GERAL_CONFIGURADOR.GER_ICMPAUTATAB     := '';
       GERAL_CONFIGURADOR.GER_ACUMULADUPLIC   := '';
       GERAL_CONFIGURADOR.GER_DIASBLOQMENOS   := '';
       GERAL_CONFIGURADOR.GER_ENTDECPRECO     := '';
       GERAL_CONFIGURADOR.GER_ENTDECQUANT     := '';
       GERAL_CONFIGURADOR.GER_SAIDECPRECO     := '';
       GERAL_CONFIGURADOR.GER_SAIDECQUANT     := '';
       GERAL_CONFIGURADOR.GER_NATUREZATROC1   := '';
       GERAL_CONFIGURADOR.GER_NATUREZATROC2   := '';
       GERAL_CONFIGURADOR.GER_NATUREZATROC3   := '';
       GERAL_CONFIGURADOR.GER_PEDIDOMINIMO    := '';
       GERAL_CONFIGURADOR.GER_BOLETOMINIMO    := '';
       GERAL_CONFIGURADOR.GER_MULTA           := '';
       GERAL_CONFIGURADOR.GER_JUROSDIA        := '';
       GERAL_CONFIGURADOR.GER_JUROSSUP        := '';
       GERAL_CONFIGURADOR.GER_LIMDIAS         := '';
       GERAL_CONFIGURADOR.GER_JUROS_TIPO      := '';
       GERAL_CONFIGURADOR.GER_COMISSAO        := '';
       GERAL_CONFIGURADOR.GER_FRETE           := '';
       GERAL_CONFIGURADOR.GER_CORTE           := '';
end;

procedure TdtmSisGestao.IniECF;
var
   i : Integer;
   sCaminhoIni:string;
BEGIN
     sCaminhoIni := ExtractFileDir(Application.ExeName);
     sCaminhoIni   := sCaminhoExe+'\ECF.ini';
     //Le dados do arquivo INI...
     tfArquivoIni            := TIniFile.Create(sCaminhoIni);


     ECF.ecf_empresa         := tfArquivoIni.ReadString('ECF','Empresa',ECF.ecf_empresa);
     ECF.ecf_modelo          := tfArquivoIni.ReadString('ECF','Modelo',ECF.ecf_modelo);
     if ECF.ecf_modelo =  'BEMATECH' then
     ECF.ecf_modelo:= '0';


     ECF.ecf_serie           := copy(tfArquivoIni.ReadString('ECF','Serie',ECF.ecf_serie),1,50);
     ECF.ecf_cupom_serie     := tfArquivoIni.ReadString('ECF','SerieCupom',ECF.ecf_cupom_serie);
     ECF.ecf_gaveta          := tfArquivoIni.ReadString('ECF','Gaveta',ECF.ecf_gaveta);
     ECF.ecf_portaserial     := tfArquivoIni.ReadString ('ECF','PortaSerial',ECF.ecf_portaserial);
     ECF.ecf_terminal        := tfArquivoIni.ReadString('ECF','Terminal',ECF.ecf_terminal);
     ECF.caminho_logo        := tfArquivoIni.ReadString('ECF','Caminho_Logo',ECF.caminho_logo);

end;

function  VerificaTipoUsuario(pFuncCodigo : String;
                              pEmpreCodigo : Double) : Boolean;
Const

     sSQLRetornaFuncionario = 'select * from geral_funcionario '+
                              'where (geral_funcionario.func_codigo = :funccodigo) and '+
                              '      (geral_funcionario.empre_codigo = :emprecodigo)and '+
                              '      (geral_funcionario.func_sistema = "0")and '+
                              '      (geral_funcionario.func_tipo_usu = "A")';
begin
     if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeral.Active := False;
     dtmSisGestao.FdQryGeral.SQL.Clear;
     dtmSisGestao.FdQryGeral.SQL.Add(LowerCase(sSQLRetornaFuncionario));
     dtmsisgestao.FdQryGeral.params.parambyname('funccodigo').asstring  := pfunccodigo;
     dtmsisgestao.FdQryGeral.params.parambyname('emprecodigo').asfloat  := pemprecodigo;

     dtmSisGestao.FdQryGeral.Active := True;
     if dtmSisGestao.FdQryGeral.FieldByName('func_codigo').IsNull then
     begin
          dtmSisGestao.FdQryGeral.Active := False;
          dtmSisGestao.FdQryGeral.Active := False;
          dtmSisGestao.FdConnection.Rollback;
          Informacao('Contate o Administrador do Sistema'+ #13+
                     'Usuario não tem Permissão','Aviso');
          Result := False;
          Exit;
     end;
end;

function VerificaCadastroMenu(pFuncCodigo,pMenuCodigo : String;
                              pEmpreCodigo : Double;
                              var pNivel : String) : Boolean;
Const
     aSQLVerificaAcessoAosMenus = 'select * from geral_acesso '+
                                  'where (func_codigo = :func_codigo) and '+
                                  ' (empre_codigo = :empre_codigo) and (menu_codigo = :menu_codigo)';

     sSQLVerificaMenu = 'select * from geral_menu '+
                        'where menu_codigo = :menucodigo';

     sSQLRetornaNivelAcesso = 'select * from geral_funcionario '+
                              'where (geral_funcionario.func_codigo = :funccodigo) and '+
                              '      (geral_funcionario.empre_codigo = :emprecodigo)';
begin
     if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeral.Active := False;
     dtmSisGestao.FdQryGeral.SQL.Clear;
     dtmSisGestao.FdQryGeral.SQL.Add(LowerCase(aSQLVerificaAcessoAosMenus));
     dtmsisgestao.FdQryGeral.params.parambyname('func_codigo').asstring  := pfunccodigo;
     dtmsisgestao.FdQryGeral.params.parambyname('empre_codigo').asfloat  := pemprecodigo;
     dtmsisgestao.FdQryGeral.params.parambyname('menu_codigo').asstring  := pmenucodigo;
     dtmSisGestao.FdQryGeral.Active := True;
     if dtmSisGestao.FdQryGeral.FieldByName('MENU_CODIGO').IsNull then
     begin
          dtmSisGestao.FdQryGeralDados.Active := False;
          dtmSisGestao.FdQryGeral.Active := False;
          dtmSisGestao.FdConnection.Rollback;
          Informacao('Menu: '+ pMenuCodigo +', não cadastrado...','Aviso...');
          Result := False;
          Exit;
     end;
     // Verifica se o usuario tem acesso ao menu/form....
     // Usuario com acesso ao menu/form...
       if (dtmSisGestao.FdQryGeral.FieldByName('ACESSO_NIVEL').AsString = 'S') or
          (dtmSisGestao.FdQryGeral.FieldByName('ACESSO_NIVEL').AsString = 'L') then
     begin
          dtmSisGestao.FdQryGeralDados.Active := False;
          dtmSisGestao.FdQryGeralDados.SQL.Clear;
          dtmSisGestao.FdQryGeralDados.SQL.Add(LowerCase(sSQLVerificaMenu));
          dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUCODIGO').AsString := pMenuCodigo;
          try
             dtmSisGestao.FdQryGeralDados.Active := True;
             if dtmSisGestao.FdQryGeralDados.FieldByName('MENU_DESCRICAO').IsNull then
             begin
                  dtmSisGestao.FdQryGeralDados.Active := False;
                  dtmSisGestao.FdQryGeral.Active := False;
                  dtmSisGestao.FdConnection.Rollback;
                  Informacao('Menu: '+pMenuCodigo+', não cadastrado...','Aviso...');
                  Result := False; Exit;
             end;
          except
                dtmSisGestao.FdQryGeralDados.Active := False;
                dtmSisGestao.FdQryGeral.Active := False;
                dtmSisGestao.FdConnection.Rollback;
                Informacao('Erro! Menu: '+pMenuCodigo+', não cadastrado...','Aviso...');
                Result := False; Exit;
          end;
          // Verifica se o acesos esta cadastrado...
          dtmSisGestao.FdQryGeralDados.Active := False;
          dtmSisGestao.FdQryGeralDados.SQL.Clear;
          dtmSisGestao.FdQryGeralDados.SQL.Add(LowerCase(sSQLRetornaNivelAcesso));
          dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := pFuncCodigo;
          dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsFloat  := pEmpreCodigo;

          dtmSisGestao.FdQryGeralDados.Active := True;

          if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').IsNull then
          begin
               dtmSisGestao.FdQryGeralDados.Active := False;
               dtmSisGestao.FdQryGeral.Active := False;
               dtmSisGestao.FdConnection.Rollback;
               Informacao('Acesso não encontrado... '+pMenuCodigo,'Aviso...');
               Result := False; Exit;
          end;
          pNivel := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').AsString;
          dtmSisGestao.FdConnection.Commit;
          Result := True;
     end
     else
     begin
          dtmSisGestao.FdConnection.Rollback;
          Informacao('Acesso não autorizado....','Aviso...');
          Result := False; Exit;
     end;
end;

procedure TdtmSisGestao.Le_Dados_Configuracao;
begin
     if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := false;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Add('select * from geral_configuracao where (empre_codigo =:codigo)');
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('CODIGO').AsString:= IntToStr(funcionario.empre_codigo);
     dtmSisGestao.FdQryGeralDados.Active:=true;
     // Coloca os dados na estrutura em memoria...
     confsisgestao.empre_codigo            := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_codigo').asinteger;
     confsisgestao.config_imagemfundo      := dtmsisgestao.FdQrygeraldados.fieldbyname('config_imagemfundo').asstring;
     confsisgestao.config_imagemsplash     := dtmsisgestao.FdQrygeraldados.fieldbyname('config_imagemsplash').asstring;
     confsisgestao.config_caminhoskin      := dtmsisgestao.FdQrygeraldados.fieldbyname('config_caminhoskin').asstring;
     confsisgestao.config_fotosfuncionario := dtmsisgestao.FdQrygeraldados.fieldbyname('config_fotosfuncionario').asstring;
     confsisgestao.config_logorelatorio    := dtmsisgestao.FdQrygeraldados.fieldbyname('config_logorelatorio').asstring;
     confsisgestao.config_fotosprodutos    := dtmsisgestao.FdQrygeraldados.fieldbyname('config_fotosprodutos').asstring;
     confsisgestao.config_fotosclientes    := dtmsisgestao.FdQrygeraldados.fieldbyname('config_fotosclientes').asstring;
     confsisgestao.config_sessaologin      := dtmsisgestao.FdQrygeraldados.fieldbyname('config_sessaologin').asstring;
     confsisgestao.config_rss              := dtmsisgestao.FdQrygeraldados.fieldbyname('config_rss').asstring;
     confsisgestao.config_spc              := dtmsisgestao.FdQrygeraldados.fieldbyname('config_spc').asstring;
     dtmSisGestao.FdQryGeralDados.Active     := False;
     dtmSisGestao.FdConnection.Commit;
end;

procedure TdtmSisGestao.Grava_Dados_Iniciais;
begin
     if FdConnection.InTransaction then
        FdConnection.Commit;
     FdConnection.StartTransaction;
     // Verifica se tem empresa ZERO cadastrada - empresa de suporte...
     FdQryGeralDados.Active := False;
     FdQryGeralDados.SQL.Clear;
     FdQryGeralDados.SQL.Add( LowerCase('select * from geral_empresa where empre_codigo = 0'));
     FdQryGeralDados.Active := True;
     if (FdQryGeralDados.FieldByName('EMPRE_CODIGO').IsNull) then // Se não tem empresa cadastrada, cadastra a empresa de suporte....
     begin
          FdQryGeralDados.Active := False;
          FdQryGeralDados.SQL.Clear;
          FdQryGeralDados.SQL.Add(LowerCase(
                  'insert into geral_empresa(empre_codigo,empre_razaosocial,'+
                  'empre_nomefantasia,cidade_coddne) values(0,''suporte'',''suporte'',0)'));
          FdQryGeralDados.Execute;
     end;

     // Verifica se tem usuario ZERO cadastrado - usuario de suporte...
     FdQryGeralDados.Active := False;
     FdQryGeralDados.SQL.Clear;
     FdQryGeralDados.SQL.Add(('select func_codigo,func_nome '+
                                  'from geral_funcionario where (func_codigo = ''0'')'));
     Application.ProcessMessages;
     FdQryGeralDados.Active := True;
     Application.ProcessMessages;
     if (FdQryGeralDados.FieldByName('FUNC_CODIGO').IsNull) then // Se não tem usuario cadastrado, cadastra o usuario de suporte....
     begin
          FdQryGeralDados.Active := False;
          FdQryGeralDados.SQL.Clear;
          FdQryGeralDados.SQL.Add(LowerCase(
                'insert into geral_funcionario(func_codigo,empre_codigo,'+
                'func_nome,func_sexo,func_sistema,cidade_coddne,func_nivel,'+
                'func_senha,func_skin,func_corcampos,func_replica,func_tipo_usu,func_botoes)'+
                'values(:func_codigo,:empre_codigo,:func_nome,:func_sexo,:func_sistema,:cidade_coddne,:func_nivel,'+
                ':func_senha,:func_skin,:func_corcampos,:func_replica,:func_tipo_usu,:func_botoes)'));
          FdQrygeraldados.params.parambyname('func_codigo').asstring := '0';
          FdQrygeraldados.params.parambyname('empre_codigo').asinteger := 0;
          FdQrygeraldados.params.parambyname('func_nome').asstring := 'suporte';
          FdQrygeraldados.params.parambyname('func_sexo').asstring := '0';
          FdQrygeraldados.params.parambyname('func_sistema').asstring := '0';
          FdQrygeraldados.params.parambyname('cidade_coddne').asstring := '0';
          FdQrygeraldados.params.parambyname('func_senha').asstring := encripta('1');
          FdQrygeraldados.params.parambyname('func_skin').asstring := 'macos.skn';
          FdQrygeraldados.params.parambyname('func_nivel').asstring := 'S';
          FdQrygeraldados.params.parambyname('func_corcampos').asinteger := clskyblue;
          FdQrygeraldados.params.parambyname('func_replica').AsString := '0';
          FdQrygeraldados.params.parambyname('func_tipo_usu').AsString :='A';
          FdQrygeraldados.params.parambyname('func_botoes').AsString :='D';

          FdQryGeralDados.Execute;
         { FdQryGeralDados.Active := False;
          FdQryGeralDados.CommandText := '';
          FdQryGeralDados.CommandText := LowerCase(
                'INSERT INTO GERAL_FUNCIONARIO_SENHA(FUNC_CODIGO,EMPRE_CODIGO,'+
                'SENHA_SENHA,SENHA_SKIN,SENHA_NIVEL,SENHA_CORCAMPOS) '+
                'VALUES(:FUNCCODIGO,:EMPRECODIGO,:SENHASENHA,:SENHASKIN,'+
                ':SENHANIVEL,:SENHACORCAMPOS)');
          FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := '0';
          FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := 0;
          FdQryGeralDados.Params.ParamByName('SENHASENHA').AsString := Encripta('1');
          FdQryGeralDados.Params.ParamByName('SENHASKIN').AsString := 'macos.skn';
          FdQryGeralDados.Params.ParamByName('SENHANIVEL').AsString := '5';
          FdQryGeralDados.Params.ParamByName('SENHACORCAMPOS').AsInteger := clSkyBlue;
          FdQryGeralDados.Execute; }

     end;
     // Cadastra os acessos para o usuario de SUPORTE...
     FdQryGeral.Active := False;
     FdQryGeral.SQL.Clear;
     FdQrygeral.SQL.Add(lowercase('insert into geral_acesso(func_codigo,empre_codigo,menu_codigo,acesso_nivel) '+
                                       'values(:func_codigo,:empre_codigo,:menu_codigo,:acesso_nivel)'+
                                       'on duplicate key update   func_codigo   = :func_codigo, '+
                                       '                          empre_codigo  = :empre_codigo, '+
                                       '                          menu_codigo   = :menu_codigo, '+
                                       '                          acesso_nivel  = :acesso_nivel '));
     FdQryGeralDados.Active := False;
     Application.ProcessMessages;
     FdQryGeralDados.SQL.Clear;
     FdQryGeralDados.SQL.Add(LowerCase('select * from geral_menu'));
     Application.ProcessMessages;
     FdQryGeralDados.Active := True;
     while not FdQryGeralDados.Eof do
     begin
          FdQryGeral.Active := False;
          FdQryGeral.Params.ParamByName('FUNC_CODIGO').AsString := '0';
          FdQryGeral.Params.ParamByName('EMPRE_CODIGO').AsString := '0';
          FdQryGeral.Params.ParamByName('ACESSO_NIVEL').AsString := 'S';
          FdQryGeral.Params.ParamByName('MENU_CODIGO').AsString := FdQryGeralDados.FieldByName('MENU_CODIGO').AsString;
          try
             FdQryGeral.Execute;
          except
          end;
          FdQryGeralDados.Next;
     end;
     FdConnection.Commit;
end;

procedure TdtmSisGestao.Le_Dados_INI;
var
   i : Integer;
BEGIN
     //Le dados do arquivo INI...
     tfArquivoIni                  := TIniFile.Create(sCaminhoIni);
     ARQUIVOINI.CAMINHOBASE        := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoBase','X');
     ARQUIVOINI.SERVIDOR           := tfArquivoIni.ReadString('SISINDUSTRIA','Servidor','X');
     ARQUIVOINI.CORFUNDO           := tfArquivoIni.ReadInteger('SISINDUSTRIA','CorFundo',0);
     ARQUIVOINI.CAMINHOSESSAO      := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoSessao','X');
     ARQUIVOINI.USUARIO            := {Decripta_Email}(Trim(tfArquivoIni.ReadString('SISINDUSTRIA','usuario','X')));
     ARQUIVOINI.SENHA              := {Decripta_Email}(trim(tfArquivoIni.ReadString('SISINDUSTRIA','senha','X')));
     ARQUIVOINI.CAMINHOFOTOUSUARIO := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoFotoUsuario','X');
     ARQUIVOINI.SISGESTAOSERVIDOR  := tfArquivoIni.ReadString('SISINDUSTRIA','SisgestaoServidor','X');
     ARQUIVOINI.EXESERVIDOR        := tfArquivoIni.ReadString('SISINDUSTRIA','ExeServidor','X');
     ARQUIVOINI.CAMINHONFE         := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoNFE','c:\sisgestao\nfe\');
     ARQUIVOINI.PDF1VIA            := tfArquivoIni.ReadString('SISINDUSTRIA','PDF1VIA','X');
     ARQUIVOINI.LOGERROSBACKUP     := tfArquivoIni.ReadString('SISINDUSTRIA','LogErrosBackup','X');
     ARQUIVOINI.CAMINHONFE         := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoNfe','X');
     ARQUIVOINI.BKPNFE             := tfArquivoIni.ReadString('SISINDUSTRIA','bkpnfe','X');
     ARQUIVOINI.USUARIO            := tfArquivoIni.ReadString('SISINDUSTRIA','usuario','X');
     //ARQUIVOINI.USUARIO            := Decripta_Email(ARQUIVOINI.USUARIO);
     ARQUIVOINI.SENHA              := tfArquivoIni.ReadString('SISINDUSTRIA','senha','X');
     //ARQUIVOINI.SENHA              := Decripta_Email(ARQUIVOINI.SENHA);
     ARQUIVOINI.CAMINHOXML         := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoXML','X');
     ARQUIVOINI.CAMINHORETORNO     := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoRetorno','X');
     ARQUIVOINI.RETORNOXML         := tfArquivoIni.ReadString('SISINDUSTRIA','RetornaXML','X');
     ARQUIVOINI.CAMINHOSESSAO      := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoSessao','X');
     ARQUIVOINI.CAMINHOFOTOUSUARIO := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoFotoUsuario','X');
     ARQUIVOINI.SISGESTAOSERVIDOR  := tfArquivoIni.ReadString('SISINDUSTRIA','SisgestaoServidor','X');
     ARQUIVOINI.EXESERVIDOR        := tfArquivoIni.ReadString('SISINDUSTRIA','ExeServidor','X');
     SPEDCONTABIL.CaminhoG        := tfArquivoIni.ReadString('SPED','CaminhoG',SPEDCONTABIL.CaminhoG);
     SPEDCONTABIL.CaminhoR        := tfArquivoIni.ReadString('SPED','CaminhoR',SPEDCONTABIL.CaminhoR);
     SPEDCONTABIL.CaminhoA        := tfArquivoIni.ReadString('SPED','CaminhoA',SPEDCONTABIL.CaminhoA);
     SPEDCONTABIL.CaminhoZ        := tfArquivoIni.ReadString('SPED','CaminhoZ',SPEDCONTABIL.CaminhoZ);
     SPEDCONTABIL.CaminhoB        := tfArquivoIni.ReadString('SPED','CaminhoB',SPEDCONTABIL.CaminhoB);
     SPEDCONTABIL.CaminhoLeituraG := tfArquivoIni.ReadString('SPED','CaminhoLeituraG',SPEDCONTABIL.CaminhoLeituraG);
     SPEDCONTABIL.CaminhoLeituraR := tfArquivoIni.ReadString('SPED','CaminhoLeituraR',SPEDCONTABIL.CaminhoLeituraR);
     SPEDCONTABIL.CaminhoLeituraA := tfArquivoIni.ReadString('SPED','CaminhoLeituraA',SPEDCONTABIL.CaminhoLeituraA);
     SPEDCONTABIL.CaminhoLeituraZ := tfArquivoIni.ReadString('SPED','CaminhoLeituraZ',SPEDCONTABIL.CaminhoLeituraZ);
     SPEDCONTABIL.CaminhoLeituraB := tfArquivoIni.ReadString('SPED','CaminhoLeituraB',SPEDCONTABIL.CaminhoLeituraB);
     SPEDCONTABIL.CaminhoOracle   := tfArquivoIni.ReadString('SPED','CaminhoOracle',SPEDCONTABIL.CaminhoOracle);
     SPEDCONTABIL.dataBaseName    := tfArquivoIni.ReadString('SPED','DatabaseName',SPEDCONTABIL.dataBaseName);
     SPEDCONTABIL.Usuario         := tfArquivoIni.ReadString('SPED','User',SPEDCONTABIL.Usuario);
     SPEDCONTABIL.Versao          := tfArquivoIni.ReadString('SPED','Versao',SPEDCONTABIL.Versao);


     ECF.ecf_empresa              := tfArquivoIni.ReadString('ECF','Empresa',ECF.ecf_empresa);
     ECF.ecf_modelo               := tfArquivoIni.ReadString('ECF','Modelo',ECF.ecf_modelo);
     ECF.ecf_serie                := tfArquivoIni.ReadString('ECF','Serie',ECF.ecf_serie);
   //  ECF.ecf_cupom_serie          := tfArquivoIni.ReadString('ECF','SerieCupom',ECF.ecf_cupom_serie);
     ECF.ecf_gaveta               := tfArquivoIni.ReadString('ECF','Gaveta',ECF.ecf_gaveta);
     ECF.ecf_portaserial          := tfArquivoIni.ReadString('ECF','PortaSerial',ECF.ecf_portaserial);
     ECF.ecf_terminal             := tfArquivoIni.ReadString('ECF','Terminal',ECF.ecf_terminal);
     ECF.caminho_logo             := tfArquivoIni.ReadString('ECF','Caminho_Logo',ECF.caminho_logo);
end;

procedure TdtmSisGestao.Escreve_Dados_INI;
begin
     // arquivo ini
     tfArquivoIni.WriteString('SISINDUSTRIA','Servidor',ARQUIVOINI.SERVIDOR);
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoBase',ARQUIVOINI.CAMINHOBASE);
     tfArquivoIni.WriteInteger('SISINDUSTRIA','CorFundo',ARQUIVOINI.CORFUNDO);
     tfArquivoIni.WriteString('SISINDUSTRIA','bkpnfe',ARQUIVOINI.BKPNFE);
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoXML',ARQUIVOINI.CAMINHOXML);
     tfArquivoIni.WriteString('SISINDUSTRIA','RetornaXML',ARQUIVOINI.RETORNOXML);
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoRetorno',ARQUIVOINI.CAMINHORETORNO);
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoSessao',ARQUIVOINI.CAMINHOSESSAO);
     tfArquivoIni.WriteInteger('SISINDUSTRIA','resolucao',ARQUIVOINI.RESOLUCAO);
     tfArquivoIni.WriteString('SISINDUSTRIA','usuario',Encripta_Email(ARQUIVOINI.USUARIO));
     tfArquivoIni.WriteString('SISINDUSTRIA','senha',Encripta_Email(ARQUIVOINI.SENHA));
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoFotoUsuario',ARQUIVOINI.CAMINHOFOTOUSUARIO);
     tfArquivoIni.WriteString('SISINDUSTRIA','SisgestaoServidor',ARQUIVOINI.SISGESTAOSERVIDOR);
     tfArquivoIni.WriteString('SISINDUSTRIA','ExeServidor',ARQUIVOINI.EXESERVIDOR);
     tfArquivoIni.WriteString('SISINDUSTRIA','CaminhoNFE',ARQUIVOINI.CAMINHONFE);
     tfArquivoIni.WriteString('SISINDUSTRIA','PDF1VIA',ARQUIVOINI.PDF1VIA);
     tfArquivoIni.WriteString('SISINDUSTRIA','LogErrosBackup',ARQUIVOINI.LOGERROSBACKUP);
     //DADOS CONFIGURAÇÃO  DO SPED CONTABIL
     tfArquivoIni.WriteString('SPED','CaminhoG',SPEDCONTABIL.CaminhoG);
     tfArquivoIni.WriteString('SPED','CaminhoR',SPEDCONTABIL.CaminhoR);
     tfArquivoIni.WriteString('SPED','CaminhoA',SPEDCONTABIL.CaminhoA);
     tfArquivoIni.WriteString('SPED','CaminhoZ',SPEDCONTABIL.CaminhoZ);
     tfArquivoIni.WriteString('SPED','CaminhoB',SPEDCONTABIL.CaminhoB);
     tfArquivoIni.WriteString('SPED','CaminhoLeituraG',SPEDCONTABIL.CaminhoLeituraG);
     tfArquivoIni.WriteString('SPED','CaminhoLeituraR',SPEDCONTABIL.CaminhoLeituraR);
     tfArquivoIni.WriteString('SPED','CaminhoLeituraA',SPEDCONTABIL.CaminhoLeituraA);
     tfArquivoIni.WriteString('SPED','CaminhoLeituraZ',SPEDCONTABIL.CaminhoLeituraZ);
     tfArquivoIni.WriteString('SPED','CaminhoLeituraB',SPEDCONTABIL.CaminhoLeituraB);
     tfArquivoIni.WriteString('SPED','CaminhoOracle',SPEDCONTABIL.CaminhoOracle);
     tfArquivoIni.WriteString('SPED','DatabaseName',SPEDCONTABIL.dataBaseName);
     tfArquivoIni.WriteString('SPED','User',SPEDCONTABIL.Usuario);
     tfArquivoIni.WriteString('SPED','Versao',SPEDCONTABIL.Versao);


     tfArquivoIni.WriteString('ECF','empresa',ECF.ECF_EMPRESA);
     tfArquivoIni.WriteString('ECF','modelo',ECF.ECF_MODELO);
     tfArquivoIni.WriteString('ECF','serie',ECF.ecf_serie);
     tfArquivoIni.WriteString('ECF','terminal',ECF.ecf_terminal);
     tfArquivoIni.WriteString('ECF','Caminho_Logo',ECF.caminho_logo);


     ifArquivo.Free;
end;

procedure TdtmSisGestao.ConectaMysqlGestao;
//var
   //Formulario : TfrmConfiguracaoINISisGestao;
begin

     with FdConnection do
    begin
       Connected := false;
        Params.Clear;
        Params.Values['DriverID'] := 'MySQL';
        Params.Values['Server'] := AllTrim(ARQUIVOINI.SISGESTAOSERVIDOR);
        Params.Values['Database'] := AllTrim(ARQUIVOINI.CAMINHOBASE);
        Params.Values['User_Name'] := AllTrim(ARQUIVOINI.USUARIO);
        Params.Values['Password'] := AllTrim(ARQUIVOINI.SENHA);

        Connected := True;
    end;

end;

Procedure  TdtmSisGestao.ConectaFireBirdGestao;
begin
     // Conecção do banco de dados...
     FdConnection.Connected := False;
     FdConnection.Params.Values['User_Name']     :=AllTrim(ARQUIVOINI.USUARIO);
     FdConnection.Params.Values['Password']      :=AllTrim(ARQUIVOINI.SENHA);
     scaminho:= Trim(ARQUIVOINI.SERVIDOR)+':'+Trim(ARQUIVOINI.CAMINHOBASE);
     FdConnection.Params.Values['Database']      := Trim (scaminho);
     FdConnection.Params.Values['SQLDialect']    := '3';
     //try
        FdConnection.Connected := True;
     //except
           //Informacao('Erro no acesso ao BANCO DE DADOS...'+#13+
           //           'Caminho: '+Trim(ARQUIVOINI.CAMINHOBASE),'Aviso...');
           //Formulario := TfrmConfiguracaoINISisGestao.Create(Self);
           //Formulario.sDeOnde := 'CRIACAO';
           //Formulario.ShowModal;
           //Formulario.Free;
           //Application.Terminate; Exit;
     //end;
end;

procedure TdtmSisGestao.DataModuleCreate(Sender: TObject);
var
   //Formulario : TfrmConfiguracaoINISisGestao;
   i : Integer;
   scaminho : String;
begin
     FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
     FormatSettings.ShortTimeFormat := 'hh:mm';
     FormatSettings.TimeAMString := '';
     FormatSettings.TimePMString := '';
     // Seta a variavel de controle da transação....
     tdSisGestao.TransactionID  := 1;
     tdSisGestao.IsolationLevel := xilREADCOMMITTED;
     // Procura o Config um diretório acima......
     bAchouArquivoINI := True;
     sCaminhoExe := ExtractFileDir(Application.ExeName);
     sArquivoSobre := sCaminhoExe;
     sCaminhoSkin := sCaminhoExe+'\Skins';
     sCaminhoIni   := sCaminhoExe+'\SisIndustria.INI'; //GestaoComercial.INI
     sArquivoSobre := sArquivoSobre+'\Sobre.TXT';
     // Se nao existe, cria com parametros padroes...
     if not FileExists(sCaminhoIni) then
     begin
          {Formulario := TfrmConfiguracaoINISisGestao.Create(Self);
          Formulario.sDeOnde := 'CRIACAO';
          Formulario.ShowModal;
          Formulario.Free; }
     end
     else
     begin // Existe arquivo, nao existe secao...
          tfArquivoIni := TIniFile.Create(sCaminhoIni);
          ARQUIVOINI.CAMINHOBASE := tfArquivoIni.ReadString('SISINDUSTRIA','CaminhoBase','NAOEXISTESECAO');
          if ARQUIVOINI.CAMINHOBASE = 'NAOEXISTESECAO' then
             Escreve_Dados_INI;
          tfArquivoIni.Free;
     end;
     LE_Dados_INI;
     tfArquivoIni.Free;
     {--------------- controle de Versões -------------------------------------
       Versão  DLL                        Exe pNFe    Data           Alteração
      -------------------------------------------------------------------------
       3.00                                           27/10/2011     Criada a partir da Versão 2.39 (26/10/2011) - SEMPRE ATUALIZADA DE ACORDO COM A 2.39
               2Gv0.9.2.7                 MAI/2012                   Danfe Modelo Paisagem (Sadia); Controle Retorno e Chave de Acesso;
               2Gv0.9b de 28/06/2012      SET/2012    17/09/2012     CRIAR CADASTRO EMPRESAS ESPECIFICAS (CON150) E FAZER TESTES DANFES
       3.1     2Gv1.1.6.0 (02/11/2012)    NOV/2012                   Cancelamento por Evento (de acordo com a versão 2.44)
                                                                     Equivalente a versão 2.45 do Sisgestao2
       3.2     2Gv1.1.6.0 (02/11/2012)    ABR/2013    16/04/2013     Corrigir NUMERAÇÃO de páginas na Danfe.. ex: Folha 3 de 2 (iTotItens na Observação deve multiplicar por 2)
       2.50    2Gv1.3 (06/05/2013)        JUL/2013                   Alterações para igualar com a versão da NF-e 2G - DLLNFe_Util 2G  () – schemas 006r
       2.51    2Gv1.3 (06/05/2013)        SET/2013    02/09/2013     Alterações para REJEITAR notas não encontradas na Sefaz
       2.52    2Gv1.3 (06/05/2013)        OUT/2013    14/10/2013     Alterações para IGUALAR versão nota
       **** 3a Geração ****
       3.08                               FEV/2015                   Alteração notas 3a Geração conforme versão pNFe3G
       3.09                               MAR/2015                   Liberar uso do Registro 028 (Cupom Referenciado)
       3.10   2Gv2.0.5beta (02/12/20140   ABR/2015                   Danfe Simples Nacional (Origem + CSOSN) e demais alterações para igualar versão 3.10 dos demais
       3.10  - MAR/2015   Alteração - Acrescentar Data de Saída no XML  - alterar coluna CSOSN cfe lefisc
       3.11  - MAI/2015   Alteração - Controlar Login Usuário só na hora de importar... até obter retorno do lote
       3.12  - JUN/2015   Alteração - Ajustar impressão cpf Danfe NFCE / notas denegadas em marrom / msg nao é pedido valido zerado
       3.13  - JUL/2015   Alteração - NFC-e Ajustar QRCODE - não pode ser gerado no xml o destinatário, caso o consumidor não seja informado
       3.14  - AGO/2015   Alteração - Permite cancelamento até 7 dias (168 horas) após autorização
       3.15  - AGO/2015   Alteração - Obs Cancelamento, Danfe 1 linha, NF Denegada cor Marrom, Configurador NFE
       3.16  - AGO/2015   Alteração - Evento Cancelamento (NFe 168 horas, NFCe 24 horas), Msg Email Tempo maior Maxipel, Configurador NFe
       3.17  - SET/2015   Alteração - Web Services...  NOVA DLL
       3.18  - SET/2015   Alteração - Liberar Evento CCe para qualquer data de NFe
       3.19  - SET/2015   Alteração - Busca Lote
       3.29  - MAR/2016   Alteração - campos CEST, UFDEst...

 Vanessa        SET/2016 Alterar   NF-e 3a Versão 3.30   Alteração - NF Exportação ...
 Vanessa        OUT/2016 Alterar   NF-e 3a Versão 3.31   Alteração - Retorno de Notas em Processamento (Atualizar Pedido e Pré-Venda)
 Vanessa        NOV/2016 Alterar   NF-e 3a Versão 3.32   Alteração - DIAS PARA CANCELAMENTO, Liberar notas 7 dias
 Vanessa        DEZ/2016 Alterar   NF-e 3a Versão 3.33   Alteração - Liberar emissão de NFC-e
 Vanessa        JAN/2017 Alterar   NF-e 3a Versão 3.34   Alteração - NFC-e com ST
 Vanessa        JAN/2017 Alterar   NF-e 3a Versão 3.35   Alteração - NFe Devolução com IPI
 Vanessa        MAR/2017 Alterar   NF-e 3a Versão 3.36   Alteração - NFe puxar da pasta caminhonfe - buscava arquivo texto na pasta retorno
 Vanessa        MAR/2017 Alterar   NF-e 3a Versão 3.37   Alteração - Cancelamento NF-e alterando situação da Pré-Venda
 Vanessa        ABR/2017 Alterar   NF-e 3a Versão 3.38   Alteração - Diminuir colunas Grid consulta pra nao dar erro memoria
 Vanessa        ABR/2017 Alterar   NF-e 3a Versão 3.39   Alteração - Cancelamento NF-e alterando situação da Pré-Venda
     }
     // dtmSisGestao.sVersaoNFe := ' - Versão 3... *** SOMENTE P/ TESTES ***';
     dtmSisGestao.sVersaoNFe := '  Versão 3.39 ';
     //
     ConectaMysqlGestao;
     //ConectaFireBirdGestao ;
 //   TIREI DANIEL
     Le_Dados_Configuracao;

end;

procedure TdtmSisGestao.dspSisGestaoAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin

end;

// testar pastas
procedure TdtmSisGestao.Verifica_Pastas;
var ind,iPasta : integer;
    sDirEmail  : sTring;
begin
   for iPasta:= 0 to High(aPasta) do
       aPasta[iPasta] := '';
   ind := 0;
   // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
   bDiretorio := CreateDir(FUNCIONARIO.nfe_caminhonfe);
   if not DirectoryExists(FUNCIONARIO.nfe_caminhonfe) then
   begin
      inc(ind);
      aPasta[ind] := ' Arquivo NFE: '+FUNCIONARIO.nfe_caminhonfe;
      bPastas := False;
   end;
   // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
   bDiretorio := CreateDir(FUNCIONARIO.nfe_retornonfe);
   if not DirectoryExists(FUNCIONARIO.nfe_retornonfe) then
   begin
      inc(ind);
      aPasta[ind] := 'Retorno NF-e: '+FUNCIONARIO.nfe_retornonfe;
      bPastas := False;
   end;
   // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
   bDiretorio := CreateDir(FUNCIONARIO.nfe_retornoxml);
   if not DirectoryExists(FUNCIONARIO.nfe_retornoxml) then
   begin
      inc(ind);
      aPasta[ind] := 'XML da NF-e: '+FUNCIONARIO.nfe_retornoxml;
      bPastas := False;
   end;
   // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
   bDiretorio := CreateDir('c:\sisgestao\enviar\');
   if not DirectoryExists('c:\sisgestao\enviar\') then
   begin
      inc(ind);
      aPasta[ind] := 'E-mail XML: '+'c:\sisgestao\enviar\';
      bPastas := False;
   end;
   // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
   bDiretorio := CreateDir('c:\sisgestao\xml\');
   if not DirectoryExists('c:\sisgestao\xml\') then
   begin
      inc(ind);
      aPasta[ind] := 'XML Local: '+'c:\sisgestao\xml\';
      bPastas := False;
   end;
   if FUNCIONARIO.nfe_gerapdf = 'S' then
   begin
      // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
      bDiretorio := CreateDir(FUNCIONARIO.nfe_caminhopdf);
      if not DirectoryExists(FUNCIONARIO.nfe_caminhopdf) then
      begin
         inc(ind);
         aPasta[ind] := 'PDF da NF-e: '+FUNCIONARIO.nfe_caminhopdf;
         bPastas := False;
      end;
   end;
   // Arquivo BAT para retorno das NF-e ao gestão
   if Trim(FUNCIONARIO.nfe_bat_retorno) <> '' then
      if not FileExists(Trim(FUNCIONARIO.nfe_bat_retorno)) then
      begin
         inc(ind);
         aPasta[ind] := 'NÃO EXISTE BAT PARA O RETORNO DAS NOTAS: '+Trim(FUNCIONARIO.nfe_bat_retorno);
         bPastas := False;
      end;
   // Arquivo BAT para Cancelamento das NF-e ao gestão
   if Trim(FUNCIONARIO.nfe_bat_cancelamento) <> '' then
      if not FileExists(Trim(FUNCIONARIO.nfe_bat_cancelamento)) then
      begin
         inc(ind);
         aPasta[ind] := 'NÃO EXISTE BAT PARA O CANCELAMENTO DAS NOTAS: '+Trim(FUNCIONARIO.nfe_bat_cancelamento);
         bPastas := False;
      end;
end;

//  Procedure para verificar a existencia de usuario logados, quando o usuario
//  estiver rodando indo projeto de notafiscal eletronica (uPrincipalNotaFiscalEletronica
procedure TdtmSisGestao.Verifica_Usuarios_Logados(var pRetorno : String);
var
   iInd : Integer;
   bAchou, bExisteLogin : Boolean;
   sExcLogin : String;
begin
    if (dtmSisGestao.sSistema = 'PNF-e') or (dtmSisGestao.sSistema = 'PENVIA') then
    begin
      bAchou := False; bExisteLogin := False;
      for iInd := Length(Trim(FUNCIONARIO.nfe_retornoxml)) downto 1 do
      begin
         if (Copy(Trim(FUNCIONARIO.nfe_retornoxml),iInd,1) = '\') then
         begin
            bAchou := True;
            sCaminhoLogin := FUNCIONARIO.nfe_retornoxml;
            Break;
         end;
      end;
{   ALTERAÇÕES DEVIDO VERSÃO 3G
      // Criar Diretório - CreateDir(CaminhoDir) - Tenta criar o diretório informado.
      try
         bDiretorio := CreateDir(sCaminhoLogin);
      except
         sCaminhoLogin := 'c:\sisgestao\sessao\';
         bDiretorio := CreateDir(sCaminhoLogin);
      end;
}
{      sCaminhoLogin := sCaminhoLogin+
                       IntToStr(FUNCIONARIO.EMPRE_CODIGO)+'_'+Trim(FUNCIONARIO.FUNC_CODIGO)+'_'+
                       'Login.INI';
}
      // versão 3.11
    {  sCaminhoLogin := sCaminhoLogin+IntToStr(FUNCIONARIO.EMPRE_CODIGO)+'_'+smodelologin+'_'+'Login.INI';
      //
      if FileExists(sCaminhoLogin) then
      begin
         // Já existe o arquivo, consequentemente tem um usuario utilizando o sistema,
         // le os dados para mostrar para o usuario que está tentando abrir o sistema
         // Lê dados no arquivo .INI....
         tfArquivoIni := TIniFile.Create(sCaminhoLogin);
         LOGININI.NOMEUSUARIO    := tfArquivoIni.ReadString('LOGIN','NomeUsuario','X');
         LOGININI.NOMECOMPUTADOR := tfArquivoIni.ReadString('LOGIN','NomeComputador','X');
         LOGININI.NUMEROIP       := tfArquivoIni.ReadString('LOGIN','NumeroIP','X');
         LOGININI.NUMEROMAC      := tfArquivoIni.ReadString('LOGIN','NumeroMAC','X');
         LOGININI.NUMEROSERIAL   := tfArquivoIni.ReadString('LOGIN','NumeroSerial','X');
         LOGININI.PROXY          := tfArquivoIni.ReadString('LOGIN','Proxy','X');
         LOGININI.SENHA          := tfArquivoIni.ReadString('LOGIN','Senha','X');
         tfArquivoIni.Free;
         // Lê o numero MAC do usuario logado atualmente....
         LOGININI.NUMEROMACATUAL := GetMACAdress;
         if (Trim(LOGININI.NUMEROMAC) <> Trim(LOGININI.NUMEROMACATUAL)) then
         begin
            if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Rollback(tdSisGestao);
            Informacao('>>> ATENÇÃO <<<'+#13+
                       'Há usuário utilizando o Certificado...'+#13+
                       'Dados do usuário LOGADO...'+#13+
                       PadLeft('-',40,'-')+#13+
                       'Nome do usuário: '+LOGININI.NOMEUSUARIO+#13+
                       'Nome do computador: '+LOGININI.NOMECOMPUTADOR+#13+
                       'Número do IP: '+LOGININI.NUMEROIP+#13+
                       'Número MAC: '+LOGININI.NUMEROMAC+#13+
                       'Número Serial do HD: '+LOGININI.NUMEROSERIAL+#13+
                       'Proxy: '+LOGININI.PROXY+#13+
                       'Senha: '+LOGININI.SENHA,
                       'Aviso...');
            pRetorno := 'EM_USO'
         end
         else
         begin
            // quando ocorre erro de sair forçado do envio e o Login.ini fica gravado na pasta
            {sExcLogin := FUNCIONARIO.nfe_retornoxml+
                         IntToStr(FUNCIONARIO.EMPRE_CODIGO)+'_'+Trim(FUNCIONARIO.FUNC_CODIGO)+'_'+
                         'Login.INI';     }
             // versão 3.11
           { sExcLogin := FUNCIONARIO.nfe_retornoxml+IntToStr(FUNCIONARIO.EMPRE_CODIGO)+'_'+smodelologin+'_'+'Login.INI';
            if FileExists(sExcLogin) then
            begin
               try
                  DeleteFile(sExcLogin);
               except
                  Informacao('Ocorreu um erro no Arquivo de Login '+sExcLogin,'Atenção');
                  bExisteLogin := True;
               end;
               if not bExisteLogin then
               begin
                   pRetorno := 'OK';
                   // "Pega" dados referente ao usuario LOGADO...
                   LOGININI.NOMEUSUARIO    := NomeUsuario;
                   LOGININI.NOMECOMPUTADOR := NomeComputador;
                   LOGININI.NUMEROIP       := GetIP;
                   LOGININI.NUMEROMAC      := GetMACAdress;
                   LOGININI.NUMEROMACATUAL := LOGININI.NUMEROMAC;
                   LOGININI.NUMEROSERIAL   := NumeroSerie('C');
                   LOGININI.PROXY          := LOGININI.PROXY;
                   LOGININI.SENHA          := LOGININI.SENHA;
                   // Grava dados no arquivo .INI....
                   tfArquivoIni := TIniFile.Create(sCaminhoLogin);
                   tfArquivoIni.WriteString('LOGIN','NomeUsuario',LOGININI.NOMEUSUARIO);
                   tfArquivoIni.WriteString('LOGIN','NomeComputador',LOGININI.NOMECOMPUTADOR);
                   tfArquivoIni.WriteString('LOGIN','NumeroIP',LOGININI.NUMEROIP);
                   tfArquivoIni.WriteString('LOGIN','NumeroMAC',LOGININI.NUMEROMAC);
                   tfArquivoIni.WriteString('LOGIN','NumeroSerial',LOGININI.NUMEROSERIAL);
                   tfArquivoIni.WriteString('LOGIN','Proxy',LOGININI.PROXY);
                   tfArquivoIni.WriteString('LOGIN','Senha',LOGININI.SENHA);
                   tfArquivoIni.Free;
               end;
            end;
         end;
      end }
    {  else // Não há usuário LOGADO, cria o arquivo de LOGIN....
      begin
         pRetorno := 'OK';
         // "Pega" dados referente ao usuario LOGADO...
         LOGININI.NOMEUSUARIO    := NomeUsuario;
         LOGININI.NOMECOMPUTADOR := NomeComputador;
         LOGININI.NUMEROIP       := GetIP;
         LOGININI.NUMEROMAC      := GetMACAdress;
         LOGININI.NUMEROMACATUAL := LOGININI.NUMEROMAC;
         LOGININI.NUMEROSERIAL   := NumeroSerie('C');
         LOGININI.PROXY          := LOGININI.PROXY;
         LOGININI.SENHA          := LOGININI.SENHA;
         // Grava dados no arquivo .INI....
         tfArquivoIni := TIniFile.Create(sCaminhoLogin);
         tfArquivoIni.WriteString('LOGIN','NomeUsuario',LOGININI.NOMEUSUARIO);
         tfArquivoIni.WriteString('LOGIN','NomeComputador',LOGININI.NOMECOMPUTADOR);
         tfArquivoIni.WriteString('LOGIN','NumeroIP',LOGININI.NUMEROIP);
         tfArquivoIni.WriteString('LOGIN','NumeroMAC',LOGININI.NUMEROMAC);
         tfArquivoIni.WriteString('LOGIN','NumeroSerial',LOGININI.NUMEROSERIAL);
         tfArquivoIni.WriteString('LOGIN','Proxy',LOGININI.PROXY);
         tfArquivoIni.WriteString('LOGIN','Senha',LOGININI.SENHA);
         tfArquivoIni.Free;
      end;}
   end;
end;

procedure TdtmSisGestao.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
     Informacao('Aconteceu um erro e a mensagem de erro é : '+E.Message,'*** ATENÇÃO ***')
end;

function TdtmSisGestao.Carrega_Config_Geral : Boolean;
var
    bAuxConfigura : Boolean;
    //Formulario : TfrmCadastroConfigGeral;
begin
    bAuxConfigura := False;
    if  dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;
    // Ler configurador GERAL para EMPRESA LOGADA -> EMPRE_CODIGO = FUNCIONARIO.EMPRE_CODIGO
    dtmSisGestao.FdQryConsulta.Active := False;
    dtmSisGestao.FdQryConsulta.SQL.Clear;
    dtmSisGestao.FdQryConsulta.SQL.Add ('select * from geral_configurador where (empre_codigo = :emprecodigo)');
    dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
    dtmSisGestao.FdQryConsulta.Active:=true;
    Application.ProcessMessages;
    if not (dtmSisGestao.FdQryConsulta.FieldByName('empre_codigo').IsNull) then
       bAuxConfigura := True
    else  // Se não existir Configurador para empresa logada - Ler configurador GERAL para todas as empresas -> EMPRE_CODIGO = 0
    begin
        dtmSisGestao.FdQryConsulta.Active := False;
        dtmSisGestao.FdQryConsulta.SQL.Clear;
        dtmSisGestao.FdQryConsulta.SQL.Add('select * from geral_configurador where empre_codigo = :emprecodigo');
        dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := '0';
        dtmSisGestao.FdQryConsulta.Active:=true;
        Application.ProcessMessages;
        if not (dtmSisGestao.FdQryConsulta.FieldByName('empre_codigo').IsNull) then
           bAuxConfigura := True
    end;
    if bAuxConfigura then
    begin
        GERAL_CONFIGURADOR.EMPRE_CODIGO         := dtmSisGestao.FdQryConsulta.FieldByName('EMPRE_CODIGO').AsString;//referente a empresa se for 0 para todos <> cada empresa
        GERAL_CONFIGURADOR.GER_DIASGRAVOSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASGRAVOSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQUEIO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQUEIO').AsString;
        GERAL_CONFIGURADOR.GER_DIASREPOUSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASREPOUSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASINATIVO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASINATIVO').AsString;
        GERAL_CONFIGURADOR.GER_RAMOCLIENTE      := dtmSisGestao.FdQryConsulta.FieldByName('GER_RAMOCLIENTE').AsString;
        GERAL_CONFIGURADOR.GER_PIS              := dtmSisGestao.FdQryConsulta.FieldByName('GER_PIS').AsString;
        GERAL_CONFIGURADOR.GER_COFINS           := dtmSisGestao.FdQryConsulta.FieldByName('GER_COFINS').AsString;
        GERAL_CONFIGURADOR.GER_CUSADM           := dtmSisGestao.FdQryConsulta.FieldByName('GER_CUSADM').AsString;
        GERAL_CONFIGURADOR.GER_IMPOSTOVIG       := dtmSisGestao.FdQryConsulta.FieldByName('GER_IMPOSTOVIG').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMIN        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMIN').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMAX        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMAX').AsString;
        GERAL_CONFIGURADOR.GER_CPMF             := dtmSisGestao.FdQryConsulta.FieldByName('GER_CPMF').AsString;
        GERAL_CONFIGURADOR.GER_ISSQN            := dtmSisGestao.FdQryConsulta.FieldByName('GER_ISSQN').AsString;
        GERAL_CONFIGURADOR.GER_LIVROMES         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROMES').AsString;
        GERAL_CONFIGURADOR.GER_LIVROANO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROANO').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAMES        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAMES').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAANO        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAANO').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPNOTA      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPNOTA').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPITEM      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPITEM').AsString;
        GERAL_CONFIGURADOR.GER_IPITIPO          := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITIPO').AsString;
        GERAL_CONFIGURADOR.GER_IPITABELA        := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITABELA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTATAB      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTATAB').AsString;
        GERAL_CONFIGURADOR.GER_ACUMULADUPLIC    := dtmSisGestao.FdQryConsulta.FieldByName('GER_ACUMULADUPLIC').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQMENOS    := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQMENOS').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC1    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC1').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC2    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC2').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC3    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC3').AsString;
        GERAL_CONFIGURADOR.GER_PEDIDOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_PEDIDOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_BOLETOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_BOLETOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_MULTA            := dtmSisGestao.FdQryConsulta.FieldByName('GER_MULTA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSDIA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_DIA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSSUP         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_SUP').AsString;
        GERAL_CONFIGURADOR.GER_LIMDIAS          := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIM_DIAS_JUROS').AsString;
        GERAL_CONFIGURADOR.GER_JUROS_TIPO       := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_TIPO').AsString;
        GERAL_CONFIGURADOR.GER_COMISSAO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_COMISSAO').AsString;// COMISSÃO CALCULADA POR   (N)OTA   (P)RODUTO
        GERAL_CONFIGURADOR.GER_FRETE            := dtmSisGestao.FdQryConsulta.FieldByName('GER_FRETE').AsString;   // FRETE (T)RIBUTADO (N)ÃO TRIBUTADO
        GERAL_CONFIGURADOR.GER_CORTE            := dtmSisGestao.FdQryConsulta.FieldByName('GER_CONTROLA_CORTE').AsString;   // FRETE (T)RIBUTADO (N)ÃO TRIBUTADO

        // BUSCAR CONFIGURADOR NÚMEROS
        dtmSisGestao.FdQryGeral.Active := False;
        dtmSisGestao.FdQryGeral.SQL.Clear;
        dtmSisGestao.FdQryGeral.SQL.Add('select * from geral_numeros where (empre_codigo = :emprecodigo)');
        dtmSisGestao.FdQryGeral.Params.ParamByName('emprecodigo').AsString := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
        dtmSisGestao.FdQryGeral.Active:=true;
        Application.ProcessMessages;
        if not (dtmSisGestao.FdQryGeral.FieldByName('EMPRE_CODIGO').IsNull) then
        begin
             GERALCONFIGURA_NUMEROS.EMPRE_CODIGO           := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
             GERALCONFIGURA_NUMEROS.NRO_ENTSERIE           := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_ENTSERIE').AsString);
             GERALCONFIGURA_NUMEROS.NRO_ENTNOTA            := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_ENTNOTA').AsString);
             GERALCONFIGURA_NUMEROS.NRO_SAISERIE           := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_SAISERIE').AsString);
             GERALCONFIGURA_NUMEROS.NRO_SAINOTA            := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_SAINOTA').AsString);
             GERALCONFIGURA_NUMEROS.NRO_LIVROLCTOENT       := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_LIVROLCTOENT').AsString);
             GERALCONFIGURA_NUMEROS.NRO_LIVROLCTOSAI       := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_LIVROLCTOSAI').AsString);
             GERALCONFIGURA_NUMEROS.NRO_PEDIDO_VENDA       := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_PEDIDO_VENDA').AsString);
             GERALCONFIGURA_NUMEROS.NRO_PEDIDO_VENDA_NR    := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_PEDIDO_VENDA_NR').AsString);
             GERALCONFIGURA_NUMEROS.NRO_PEDIDO_COMPRA      := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_PEDIDO_COMPRA').AsString);
             GERALCONFIGURA_NUMEROS.NRO_PEDIDO_COMPRA_NR   := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_PEDIDO_COMPRA_NR').AsString);
             GERALCONFIGURA_NUMEROS.NRO_AUTORIZAVENDA      := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_AUTORIZAVENDA').AsString);
             GERALCONFIGURA_NUMEROS.NRO_DESCONTO           := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_DESCONTO').AsString);
             GERALCONFIGURA_NUMEROS.NRO_ACRESCIMO          := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_ACRESCIMO').AsString);
             GERALCONFIGURA_NUMEROS.NRO_COMISSAO           := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_COMISSAO').AsString);
             GERALCONFIGURA_NUMEROS.NRO_PARCELAS           := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_PARCELAS').AsString);
             GERALCONFIGURA_NUMEROS.NRO_RECIBO_RECEBIMENTO := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_RECIBO_RECEBIMENTO').AsString);
             GERALCONFIGURA_NUMEROS.NRO_RECIBO_PAGAMENTO   := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_RECIBO_PAGAMENTO').AsString);
             GERALCONFIGURA_NUMEROS.NRO_RECIBO_VARIAVEL    := Trim(dtmSisGestao.FdQryGeral.FieldByName('NRO_RECIBO_VARIAVEL').AsString);
        end;
    end;
    Application.ProcessMessages;
    dtmSisGestao.FdConnection.Commit;
    Result := bAuxConfigura;
end;

procedure TdtmSisgestao.Gravar_Auditoria;
begin
    if  dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Rollback;
    dtmSisGestao.FdConnection.StartTransaction;
    FdQryConsulta.Active      := False;
    FdQryConsulta.SQL.Clear;
    FdQryConsulta.SQL.Add(LowerCase(sSQLGravaAuditoria));
    FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsInteger     := GERALAUDITORIA.EMPRE_CODIGO;
    FdQryConsulta.Params.ParamByName('FUNCCODIGO').AsString       := copy(GERALAUDITORIA.FUNC_CODIGO,1,16);
    FdQryConsulta.Params.ParamByName('MENUCODIGO').AsString       := copy(GERALAUDITORIA.MENU_CODIGO,1,21);
    FdQryConsulta.Params.ParamByName('CAMPOCODIGO').AsString      := copy(GERALAUDITORIA.CAMPO_CODIGO,1,21);
    FdQryConsulta.Params.ParamByName('AUDITDATA').AsDate          := StrToDate(GERALAUDITORIA.AUDIT_DATA);
    FdQryConsulta.Params.ParamByName('AUDITHORA').AsString        := GERALAUDITORIA.AUDIT_HORA;
    FdQryConsulta.Params.ParamByName('AUDITACAO').AsString        := copy(GERALAUDITORIA.AUDIT_ACAO,1,20);
    FdQryConsulta.Params.ParamByName('AUDITTABELA').AsString      := copy(GERALAUDITORIA.AUDIT_TABELA,1,40);
    FdQryConsulta.Params.ParamByName('AUDITREGANTERIOR').AsString := copy(GERALAUDITORIA.AUDIT_REG_ANTERIOR,1,100);
    FdQryConsulta.Params.ParamByName('AUDITREGATUAL').AsString    := copy(GERALAUDITORIA.AUDIT_REG_ATUAL,1,100);
    try
       FdQryConsulta.Execute;
       svisualizar := '';
    except
       svisualizar := 'Não Gravou Auditoria';
       Informacao('Não Gravou Auditoria','Aviso');
    end;
    dtmSisGestao.FdConnection.Commit;
end;

procedure TdtmSisGestao.FdConnectionBeforeConnect(Sender: TObject);
begin
    FDMySQLDriverLink.VendorLib := ExtractFilePath(Application.ExeName) + 'libmysql.dll';
end;

procedure TdtmSisGestao.Flexdocs_Versao;
var wsVersao2G,wsDllNome, wsDllVersao, wsDllData, wsDllDtValidade, wsUrlVersao, wsUrlData : WideString;
begin
{     Util        := CoUtil.Create;
     wsVersao2G  := Util.versao2G(wsDllNome,wsDllVersao,wsDllData,wsDllDtValidade,wsUrlVersao,wsUrlData);
     Util        := nil;
     Informacao('Versão do Sistema '+dtmSisGestao.sVersaoNFe+#13#13+
                'DLL em uso é: '+wsDllNome+' '+wsDllVersao+' de '+wsDllData+#13#13+
                'Versão do ws2.xml: ' +wsUrlVersao+ ' de ' +wsUrlData,'ATENÇÃO!');}
end;

procedure TdtmSisGestao.Preenche_Type_Usuario;
var bAuxConfigura : Boolean;
begin
     // Seleciona o usuario escolhido....
     if dtmSisGestao.FdConnection.InTransaction then
        dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Add(
          'select * from geral_funcionario left outer join geral_nfe on '+
          '              (geral_funcionario.empre_codigo = geral_nfe.empre_codigo), '+
          '              geral_empresa,geral_cidade '+
          'where (geral_funcionario.empre_codigo  = geral_empresa.empre_codigo) and '+
          '      (geral_EMPRESA.cidade_coddne = geral_cidade.cidade_coddne) and'+
          '      (geral_funcionario.func_codigo   = :funccodigo) and '+
          '      (geral_funcionario.empre_codigo  = :emprecodigo)');
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString   := Trim(FUNCIONARIO.FUNC_CODIGO);
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := FUNCIONARIO.EMPRE_CODIGO;
     dtmSisGestao.FdQryGeralDados.Active := True;
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').IsNull) then
        Exit;
     //LIMPA AS VARIAVEIS ANTES DE PEGAR OS DADOS DO USUARIO
     {Limpa_variavel(sPalavra);}
     // Passagem de dados para a estrutura de usuarios...
     FUNCIONARIO.EMPRE_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').AsInteger;
     FUNCIONARIO.EMPRE_UF                   := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_UF').AsString;
     FUNCIONARIO.FUNC_CODIGO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').AsString;
     FUNCIONARIO.FUNC_NOME                  := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOME').AsString;
     FUNCIONARIO.FUNC_ENDERECO              := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ENDERECO').AsString;
     FUNCIONARIO.FUNC_NUMERO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NUMERO').AsString;
     FUNCIONARIO.FUNC_COMPLEMENTO           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_COMPLEMENTO').AsString;
     FUNCIONARIO.FUNC_BAIRRO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BAIRRO').AsString;
     FUNCIONARIO.FUNC_CEP                   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CEP').AsString;
     FUNCIONARIO.CIDADE_CODDNE              := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_CODDNE').AsInteger;
     FUNCIONARIO.FUNC_TELFIXO               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELFIXO').AsString;
     FUNCIONARIO.FUNC_TELCELULAR            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELCELULAR').AsString;
     FUNCIONARIO.FUNC_SEXO                  := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SEXO').AsString;
     FUNCIONARIO.FUNC_EMAIL                 := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_EMAIL').AsString;
     FUNCIONARIO.FUNC_CTPSNUMERO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CTPSNUMERO').AsString;
     FUNCIONARIO.FUNC_CPF                   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CPF').AsString;
     FUNCIONARIO.FUNC_TITELEITORALNUMERO    := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALNUMERO').AsString;
     FUNCIONARIO.FUNC_TITELEITORALZONA      := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALZONA').AsString;
     FUNCIONARIO.FUNC_TITELEITORALNUMERO    := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALSECAO').AsString;
     FUNCIONARIO.FUNC_IDENTIDADE            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_IDENTIDADE').AsString;
     FUNCIONARIO.FUNC_ORGAOEMISSOR          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ORGAOEMISSOR').AsString;
     FUNCIONARIO.FUNC_DATAADMISSAO          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATAADMISSAO').AsDateTime;
     FUNCIONARIO.FUNC_DATADEMISSAO          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATADEMISSAO').AsDateTime;
     FUNCIONARIO.CARGO_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('CARGO_CODIGO').AsInteger;
     FUNCIONARIO.FUNC_NASCIMENTO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
     FUNCIONARIO.FUNC_NACIONALIDADE         := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NACIONALIDADE').AsString;
     FUNCIONARIO.FUNC_GRAUINSTRUCAO         := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_GRAUINSTRUCAO').AsString;
     FUNCIONARIO.FUNC_ESTADOCIVIL           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ESTADOCIVIL').AsString;
     FUNCIONARIO.FUNC_NOMECONJUGE           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOMECONJUGE').AsString;
     FUNCIONARIO.FUNC_HABILITACAO           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_HABILITACAO').AsString;
     FUNCIONARIO.FUNC_CATEGORIA             := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CATEGORIA').AsString;
     FUNCIONARIO.FUNC_VALIDADE              := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_VALIDADE').AsDateTime;
     FUNCIONARIO.FUNC_PRIMHABILITACAO       := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PRIMHABILITACAO').AsDateTime;
     FUNCIONARIO.FUNC_SISTEMA               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsString;
     FUNCIONARIO.FUNC_CERTMILITAR_SERIE     := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_SERIE').AsString;
     FUNCIONARIO.FUNC_CERTMILITAR_CATEGORIA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_CATEGORIA').AsString;
     FUNCIONARIO.FUNC_FILIACAO_MAE          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_MAE').AsString;
     FUNCIONARIO.FUNC_FILIACAO_PAI          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_PAI').AsString;
     FUNCIONARIO.FUNC_FGTS_OPTANTE          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_OPTANTE').AsString;
     FUNCIONARIO.FUNC_FGTS_DATAOPCAO        := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATAOPCAO').AsDateTime;
     FUNCIONARIO.FUNC_FGTS_DATARETRATACAO   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATARETRATACAO').AsDateTime;
     FUNCIONARIO.FUNC_FGTS_BANCODEPOSITARIO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_BANCODEPOSITARIO').AsInteger;
     FUNCIONARIO.FUNC_PIS_DATACADASTRO      := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
     FUNCIONARIO.FUNC_PIS_NUMERO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PIS_NUMERO').AsString;
     FUNCIONARIO.BANCO_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('BANCO_CODIGO').AsInteger;
     FUNCIONARIO.FUNC_BANCOAGENCIA          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOAGENCIA').AsInteger;
     FUNCIONARIO.FUNC_BANCOCONTA            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOCONTA').AsString;
     FUNCIONARIO.SENHA_SENHA                := trim(Decripta(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString));
     FUNCIONARIO.SENHA_NIVEL                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').AsString;
     FUNCIONARIO.FUNC_REPLICA                := trim(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_REPLICA').AsString);
     FUNCIONARIO.FUNC_TIPO_USU               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TIPO_USU').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').IsNull then
        FUNCIONARIO.SENHA_CORCAMPOS := clSkyBlue
     else
         FUNCIONARIO.SENHA_CORCAMPOS := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').AsInteger;
     FUNCIONARIO.SENHA_SKIN := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').IsNull then
        FUNCIONARIO.SENHA_SKIN := 'macos.skn';
     FUNCIONARIO.EMPRE_RAZAOSOCIAL  := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_RAZAOSOCIAL').AsString;
     FUNCIONARIO.EMPRE_CNPJ         := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CNPJ').AsString;
     FUNCIONARIO.EMPRE_INSCESTADUAL := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_INSCESTADUAL').AsString;
     FUNCIONARIO.EMPRE_UF           := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_UF').AsString;
     FUNCIONARIO.EMPRE_LOGOTIPO     := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_LOGOTIPO').AsString;
     // configurar variaveis utilizadas na NF-e
     FUNCIONARIO.empre_endereco       := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_endereco').asstring;
     FUNCIONARIO.empre_numero         := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_numero').asstring;
     FUNCIONARIO.empre_complemento    := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_complemento').asstring;
     FUNCIONARIO.empre_cep            := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_cep').asstring;
     FUNCIONARIO.empre_bairro         := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_bairro').asstring;
     FUNCIONARIO.empre_cidade         := dtmsisgestao.FdQrygeraldados.fieldbyname('cidade_nome').AsString;
     FUNCIONARIO.empre_telefone       := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_telefone').asstring;
     FUNCIONARIO.empre_fax            := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_fax').asstring;
     FUNCIONARIO.empre_inscmunicipal  := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_inscmunicipal').asstring;
     FUNCIONARIO.empre_site           := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_site').asstring;
     FUNCIONARIO.empre_modelodanfe    := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_danfe').asstring;
     FUNCIONARIO.empre_modcomprovante := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_comprovante').asstring;
     FUNCIONARIO.empre_ambiente       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_ambiente').asstring;
     FUNCIONARIO.empre_contingencia   := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_contingencia').asstring;
     FUNCIONARIO.empre_cancelamento   := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_chavecancelamento').asstring;
     FUNCIONARIO.empre_dtcertific     := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_certificadodata').asstring;
     FUNCIONARIO.empre_certificado    := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_certificadonome').asstring;
     FUNCIONARIO.empre_siglaws        := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_siglaws').asstring;
     FUNCIONARIO.empre_versaonfe      := '4.00';//dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_versao').asstring;
     FUNCIONARIO.empre_consicm        := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_consultaicm').asstring;
     FUNCIONARIO.empre_conscep        := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_consultacep').asstring;
     FUNCIONARIO.nfe_logotipo         := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_logotipo').asstring;
     try
        FUNCIONARIO.EMPRE_ESPECIFICA  := StrToInt(Trim(dtmsisgestao.FdQrygeraldados.fieldbyname('empre_especifica').asstring));
     except
        FUNCIONARIO.EMPRE_ESPECIFICA  := 0;
     end;
     // pastas
     FUNCIONARIO.nfe_geranota         := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_geranota').asstring;
     FUNCIONARIO.nfe_caminhonfe       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_caminhonfe').asstring;
     FUNCIONARIO.nfe_backupnfe        := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_backupnfe').asstring;
     FUNCIONARIO.nfe_retornonfe       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_retornonfe').asstring;
     FUNCIONARIO.nfe_retornoxml       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_retornoxml').asstring;
     FUNCIONARIO.nfe_geratxtxml       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_geratxtxml').asstring;
     FUNCIONARIO.nfe_versao           :=  '4.00';//dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_versao').asstring;
     FUNCIONARIO.nfe_siglaws          := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_siglaws').asstring;
     FUNCIONARIO.nfe_consultaicm      := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_consultaicm').asstring;
     FUNCIONARIO.nfe_consultacep      := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_consultacep').asstring;
     FUNCIONARIO.nfe_ctaemail         := dtmsisgestao.FdQrygeraldados.fieldbyname('email_conta').asstring;
     FUNCIONARIO.nfe_gerapdf          := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_gerapdf').asstring;
     FUNCIONARIO.nfe_caminhopdf       := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_caminhopdf').asstring;
     FUNCIONARIO.nfe_2via             := dtmsisgestao.FdQrygeraldados.fieldbyname('nfe_2via').asstring;
     FUNCIONARIO.nfe_segundos         := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_tempo_retorno').asstring;
     FUNCIONARIO.nfe_obs              := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_obs').asstring;
     FUNCIONARIO.nfe_bat_retorno      := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_bat_retorno').asstring;
     FUNCIONARIO.nfe_bat_cancelamento := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_bat_cancelamento').asstring;
     FUNCIONARIO.nfe_testa_versao     := dtmsisgestao.FdQryGeralDados.fieldbyname('nfe_testa_versao').asstring;
     // ALTERAÇÕES NFE 3a GERAÇÃO
     FUNCIONARIO.NFE_DANFE            := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_DANFE').asstring;
     FUNCIONARIO.NFE_HORA_UTC         := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_HORA_UTC').asstring;
     FUNCIONARIO.NFE_VARIOS_USUARIOS  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_VARIOS_USUARIOS').asstring;
     FUNCIONARIO.NFCE_DANFE           := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_DANFE').asstring;
     FUNCIONARIO.NFCE_LOGOTIPO        := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_LOGOTIPO').asstring;
     FUNCIONARIO.NFCE_TEMPO_RETORNO   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_TEMPO_RETORNO').asstring;
     FUNCIONARIO.NFCE_QRCODE_VERSAO   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_VERSAO').asstring;
     FUNCIONARIO.NFCE_QRCODE_IDTOKEN  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_IDTOKEN').asstring;
     FUNCIONARIO.NFCE_QRCODE_CSC   	  := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_CSC').asstring;
     FUNCIONARIO.NFCE_QRCODE_ESCALA   := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_ESCALA').asstring;
     FUNCIONARIO.NFCE_QRCODE_PASTA   	:= dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_PASTA').asstring;
     FUNCIONARIO.NFE_TABLET_USA  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_USA').asstring;
     FUNCIONARIO.NFE_TABLET_PASTA	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PASTA').asstring;
     FUNCIONARIO.NFE_TABLET_PDF  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PDF').asstring;
     FUNCIONARIO.NFE_TABLET_XML  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_XML').asstring;
     FUNCIONARIO.NFE_TABLET_RET  	    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFE_TABLET_RET').asstring;
     FUNCIONARIO.NFCE_CONTINGENCIA    := dtmsisgestao.FdQryGeralDados.fieldbyname('NFCE_CONTINGENCIA').asstring;
{     // Localizar Empresa Específica
     FUNCIONARIO.EMPRE_ESPECIFICA      := 0;
     dtmSisGestao.FdQryGeral.Active      := False;
     dtmSisGestao.FdQryGeral.CommandText := '';
     dtmSisGestao.FdQryGeral.CommandText := LowerCase('SELECT * FROM GERAL_EMP_ESPECIFICAS WHERE (EMPRE_CODIGO = :EMPRECODIGO)');
     dtmSisGestao.FdQryGeral.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
     dtmSisGestao.FdQryGeral.Active      := True;
     if not (dtmsisgestao.FdQrygeral.fieldbyname('EMPRE_CODIGO').isnull) then
        FUNCIONARIO.EMPRE_ESPECIFICA   := dtmsisgestao.FdQrygeral.fieldbyname('ESP_CODIGO').AsInteger;
     //
     }
     FUNCIONARIO.empre_proxy          := '';
     FUNCIONARIO.empre_proxyporta     := '';
     FUNCIONARIO.empre_proxyusuario   := '';
     FUNCIONARIO.empre_proxysenha     := '';
     //
     bAuxConfigura := False;
     // Ler configurador GERAL para EMPRESA LOGADA -> EMPRE_CODIGO = FUNCIONARIO.EMPRE_CODIGO
     dtmSisGestao.FdQryConsulta.Active := False;
     dtmSisGestao.FdQryConsulta.SQL.Clear;
     dtmSisGestao.FdQryConsulta.SQL.Add('select * from geral_configurador where empre_codigo = :emprecodigo');
     dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
     dtmSisGestao.FdQryConsulta.Active:=true;
     Application.ProcessMessages;
     if not (dtmSisGestao.FdQryConsulta.FieldByName('ger_diasgravoso').IsNull) then
        bAuxConfigura := True
     else  // Se não existir Configurador para empresa logada - Ler configurador GERAL para todas as empresas -> EMPRE_CODIGO = 0
     begin
         dtmSisGestao.FdQryConsulta.Active := False;
         dtmSisGestao.FdQryConsulta.SQL.Clear;
         dtmSisGestao.FdQryConsulta.SQL.Add('select * from geral_configurador where empre_codigo = :emprecodigo');
         dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := '0';
         dtmSisGestao.FdQryConsulta.Active:=true;
         Application.ProcessMessages;
         if not (dtmSisGestao.FdQryConsulta.FieldByName('ger_diasgravoso').IsNull) then
            bAuxConfigura := True
     end;
     if bAuxConfigura then
     begin
        GERAL_CONFIGURADOR.EMPRE_CODIGO         := dtmSisGestao.FdQryConsulta.FieldByName('EMPRE_CODIGO').AsString;//referente a empresa se for 0 para todos <> cada empresa
        GERAL_CONFIGURADOR.GER_DIASGRAVOSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASGRAVOSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQUEIO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQUEIO').AsString;
        GERAL_CONFIGURADOR.GER_DIASREPOUSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASREPOUSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASINATIVO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASINATIVO').AsString;
        GERAL_CONFIGURADOR.GER_RAMOCLIENTE      := dtmSisGestao.FdQryConsulta.FieldByName('GER_RAMOCLIENTE').AsString;
        GERAL_CONFIGURADOR.GER_PIS              := dtmSisGestao.FdQryConsulta.FieldByName('GER_PIS').AsString;
        GERAL_CONFIGURADOR.GER_COFINS           := dtmSisGestao.FdQryConsulta.FieldByName('GER_COFINS').AsString;
        GERAL_CONFIGURADOR.GER_CUSADM           := dtmSisGestao.FdQryConsulta.FieldByName('GER_CUSADM').AsString;
        GERAL_CONFIGURADOR.GER_IMPOSTOVIG       := dtmSisGestao.FdQryConsulta.FieldByName('GER_IMPOSTOVIG').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMIN        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMIN').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMAX        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMAX').AsString;
        GERAL_CONFIGURADOR.GER_CPMF             := dtmSisGestao.FdQryConsulta.FieldByName('GER_CPMF').AsString;
        GERAL_CONFIGURADOR.GER_ISSQN            := dtmSisGestao.FdQryConsulta.FieldByName('GER_ISSQN').AsString;
        GERAL_CONFIGURADOR.GER_LIVROMES         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROMES').AsString;
        GERAL_CONFIGURADOR.GER_LIVROANO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROANO').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAMES        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAMES').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAANO        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAANO').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPNOTA      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPNOTA').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPITEM      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPITEM').AsString;
        GERAL_CONFIGURADOR.GER_IPITIPO          := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITIPO').AsString;
        GERAL_CONFIGURADOR.GER_IPITABELA        := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITABELA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTATAB      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTATAB').AsString;
        GERAL_CONFIGURADOR.GER_ACUMULADUPLIC    := dtmSisGestao.FdQryConsulta.FieldByName('GER_ACUMULADUPLIC').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQMENOS    := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQMENOS').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC1    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC1').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC2    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC2').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC3    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC3').AsString;
        GERAL_CONFIGURADOR.GER_PEDIDOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_PEDIDOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_BOLETOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_BOLETOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_MULTA            := dtmSisGestao.FdQryConsulta.FieldByName('GER_MULTA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSDIA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_DIA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSSUP         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_SUP').AsString;
        GERAL_CONFIGURADOR.GER_COMISSAO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_COMISSAO').AsString;// COMISSÃO CALCULADA POR   (N)OTA   (P)RODUTO
        GERAL_CONFIGURADOR.GER_FRETE            := dtmSisGestao.FdQryConsulta.FieldByName('GER_FRETE').AsString;   // FRETE (T)RIBUTADO (N)ÃO TRIBUTADO
        GERAL_CONFIGURADOR.GER_CORTE            := dtmSisGestao.FdQryConsulta.FieldByName('GER_CONTROLA_CORTE').AsString;   // FRETE (T)RIBUTADO (N)ÃO TRIBUTADO
     end;
     Application.ProcessMessages;
     dtmSisGestao.FdConnection.Commit;
end;

procedure TdtmSisGestao.CarregaEmpresaEspecifica;
begin
    if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add('select * from geral_emp_especificas where (empre_codigo > 0) ');
    dtmSisGestao.FdQryGeralDados.Active := True;
    if not (dtmSisGestao.FdQryGeralDados.FieldByName('empre_codigo').IsNull) then
       EMPRESA_ESPECIFICAS.EMPRE_CODIGO := dtmsisgestao.FdQrygeraldados.fieldbyname('empre_codigo').asstring;
    dtmSisGestao.FdQryGeralDados.Active := false;
end;



end.

