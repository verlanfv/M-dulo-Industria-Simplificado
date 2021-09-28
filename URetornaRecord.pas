unit URetornaRecord;

interface

Uses
    SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
    Dialogs, Printers, DB, dbctrls, Stdctrls, Math, Variants, Mapi,
    ShellAPI, Registry, Windows, Mask, Spin, CheckLst,TlHelp32, Wininet,Commctrl,
    Winsock, Grids, NB30, uFuncoes, uDtmSisGestao;

type
    rComposicaoProdutoFinal = record
         PROD_CODIGO            : string;
         PROD_MAT_PRIMA         : string;
         COMP_SEQ               : string;
         COMP_QUANTIDADE        : string;
         COMP_CONVERSAO         : string;
         ATIVO                  : string;
         COMP_FORMULACAO        : string;

    end;


    rFormulacaoProdutoFinal = record
         PROD_CODIGO            : string;
         PROD_MAT_PRIMA         : string;
         COMP_SEQ               : string;
         COMP_QUANTIDADE        : string;
         COMP_CONVERSAO         : string;
         ATIVO                  : string;
         COMP_FORMULACAO        : string;

    end;

    rOrdemProducao = record
         NR_ORDEM         : string;
         DATA_EMISSAO     : TDate;
         PROD_CODIGO      : string;
         QTDE_SC          : string;
         QTDE_PC          : string;
         QTDE_KG          : string;
         SITUACAO         : string;
         DATA_ATUALIZACAO : TDate;
         VALOR_TOTAL      : string;
         NR_LOTE          : string;
         DATA_VALIDADE    : TDate;


    end;

    rGeralKardex = record
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

    rGeralHistorico = record
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

    rGeralEstMes = record
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

    rGeralEstMvto = record
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

    rGeralNota = record
        EMPRE_CODIGO		  :INTEGER;	  // CÓDIGO DA EMPRESA */
        NOTA_NUMERO           :INTEGER;   //* CÓDIGO DA NOTA - CHAVE PRIMÁRIA */
        NOTA_NUMERO_AUX       :STRING;   //* CÓDIGO DA NOTA - CHAVE PRIMÁRIA */
        NOTA_SERIE	          :STRING;    //* SÉRIE - CHAVE PRIMÁRIA */
        NOTA_MODELO	          :STRING;    //* MODELO DA NOTA */
        NOTA_CHAVE	          :STRING;    //* MODELO DA NOTA */
        CLI_CODIGO	          :INTEGER;   //* @ CÓDIGO DO CLIENTE OU FORNECEDOR - CHAVE DA TABELA GERAL CLIENTE */
        NOTA_DT_EMISSAO	      :STRING;	    //* DATA DE EMISSÃO */
        NOTA_CFOP		      :STRING;    //* CFOP */
        NATU_CODIGO	          :STRING;   //* @ CÓDIGO DA NATUREZA - CHAVE DA TABELA GERAL NATUREZA */
        NOTA_TIPO		      :STRING;	  //* TIPO DE DOCUMENTO: 1 = ENTRADA / 2 = SAÍDA */
        NATU_NOME             :STRING;    //* Nome da Natureza */
        SITUACAO_CODIGO       :STRING;
        SITUACAO_TIPO_FIN     :STRING;
        SITUACAO_CODIGO_NOTA  :STRING;    //* @ Código da Tabela Geral_Situacao - ex: A(tivo) / I(nativo) / E(xcluído) - zero qndo não existir */
        SITUACAO_CODIGO_FIN   :STRING;    //* Tipo de Cliente - Situação financeira - @ Código da Tabela Geral_Situacao - ex: (C)onsumidor Final / (R)evenda / (N)ormal - zero qndo não existir */
        CLI_NOME    	   	  :STRING;    //* NOME CLIENTE */
        CLI_CNPJCPF 	   	  :STRING;    //* CPF ou CNPJ de Acordo com o Tipo de Pessoa */
        CLI_IE                :STRING;    //* Inscrição Estadual */
        CLI_TIPOPESSOA        :STRING;    //* Tipo de Pessoa: F = Física / J = Jurídica */
        REPRE_CODIGO    	  :STRING;   //* @ CÓDIGO DA TABELA GERAL_REPRESENTANTES */
        PRECO_TABELA   	      :STRING;    //* Código da Tabela Geral_Preco 1 - Não é ligado diretamente a esta tabela */
        TRANSP_CODIGO         :STRING;
        NOTA_PEDIDO           :STRING;
        NOTA_DT_SAIDA 	      :STRING;	  //* DATA DE EMISSÃO */
        NOTA_DT_PEDIDO 	      :STRING;	  //* DATA DO PEDIDO  DESDOBRAMENTO = CONDIÇÕES DE PAGAMENTO */
        COND_CODIGO	  	      :STRING;		//* @ Código da Tabela Geral_Condicoes (Prazos Pgto) */
        NOTA_COND_DTA_01 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_01      :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_02 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_02	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_03      :STRING;		  //* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_03	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_04 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_04	  :STRING;	  //* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_05 	  :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_05	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_06 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_06	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_07 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_07	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_08 	  :STRING;			//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_08	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_09 	  :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_09	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_10 	  :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_10	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_11 	  :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_11	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_DTA_12	  :STRING;		//* DATA VENCIMENTO - CFE DESDOBRAMENTO (COND_CODIGO) */
        NOTA_COND_VLR_12	  :STRING;		//* VALOR TOTAL - CFE DESDOBRAMENTO (COND_CODIGO) */
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
        NOTA_DESC_ITENS_VLR   :STRING;		//* VALOR DO DESCONTO */
        NOTA_VALOR_PROD	      :STRING;		//* VALOR DOS PRODUTOS */
        NOTA_VALOR_NF 	      :STRING;	  //* VALOR NF */
        NOTA_VALOR_CFOP 	  :STRING;	  //* VALOR NF */
        NOTA_ICM_VLR_TOT	  :STRING;		//* VALOR TOTAL ICM */
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
        NOTA_ICM_ISENTAS	  :STRING;		//* BASE ICM ISENTAS */
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
        NOTA_COND_CODPGTO_01 :STRING;
        NOTA_COND_CODPGTO_02 :STRING;
        NOTA_COND_CODPGTO_03 :STRING;
        NOTA_COND_CODPGTO_04 :STRING;
        NOTA_COND_CODPGTO_05 :STRING;
        NOTA_COND_CODPGTO_06 :STRING;
        NOTA_COND_CODPGTO_07 :STRING;
        NOTA_COND_CODPGTO_08 :STRING;
        NOTA_COND_CODPGTO_09 :STRING;
        NOTA_COND_CODPGTO_10 :STRING;
        NOTA_COND_CODPGTO_11 :STRING;
        NOTA_COND_CODPGTO_12 :STRING;
        SITUACAO_TIPO        :STRING;
        NOTA_LIV_OBS         :STRING;
        NOTA_FRETE_TIP       :STRING;
        NOTA_VOL_NR          :STRING;
        NOTA_VOL_ESP         :STRING;
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

    rGeralItem = record
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

    rFuncionario = record
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
        EMPRE_INSCMUNICIPAL        : String;
        EMPRE_CNAE                 : String;
        EMPRE_REGJUNTACOMERCIAL    : String;
        EMPRE_DATAREGISTRO         : TDateTime;
        EMPRE_TELEFONE	           : String;
        EMPRE_FAX	               : String;
        EMPRE_PAGA_IPI	           : INTEGER;
        EMPRE_SITUACAO	           : String;
        EMPRE_SIMPLESNACIONAL	   : INTEGER;
        EMPRE_TIPO_PGTOIPI	       : INTEGER;
        EMPRE_SITE                 : String;
        EMPRE_EMAIL	               : String;
        EMPRE_INTEGRA_CONTAB	   : INTEGER;
        EMPRE_COD_EMPRE_CONTAB 	   : Double;
        EMPRE_PROPRIETARIO	       : String;
        EMPRE_SOCIOPROP	           : String;
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
        CONT_CODIGO                : String;

    end;

    rGeral_Configurador = record
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

    rGeralConfiguraNumeros = record
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


var
    {Declara todos os records}
     RetornaComposicaoProdFinal : rComposicaoProdutoFinal;
     RetornaFormulacaoProdFinal : rFormulacaoProdutoFinal;
     RetornaOrdemProducao       : rOrdemProducao;
     RetornaGeralKardex         : rGeralKardex;
     RetornaGeralHistorico      : rGeralHistorico;
     RetornaGeralEstMes         : rGeralEstMes;
     RetornaGeralEstMov         : rGeralEstMvto;
     RetornaGeralNota           : rGeralNota;
     RetornaGeralNotaItem       : rGeralItem;
     RetornaFuncionario         : rFuncionario;

    procedure LimpaRecordOrdemProducao();
    procedure LimpaRecordComposicaoProdFinal();
    procedure LimpaRecordFormulacaoProdFinal();

implementation

procedure LimpaRecordOrdemProducao();
begin
    with RetornaOrdemProducao do
    begin
        NR_ORDEM         := '';
        DATA_EMISSAO     := StrToDate('30/12/1899');
        PROD_CODIGO      := '';
        QTDE_SC          := '';
        QTDE_PC          := '';
        QTDE_KG          := '';
        SITUACAO         := '';
        VALOR_TOTAL      := '';
        NR_LOTE          := '';
        DATA_VALIDADE    := StrToDate('30/12/1899');
    end;

end;

procedure LimpaRecordComposicaoProdFinal();
begin
    with RetornaComposicaoProdFinal do
    begin
        PROD_CODIGO            := '';
         PROD_MAT_PRIMA        := '';
         COMP_SEQ              := '';
         COMP_QUANTIDADE       := '';
         COMP_CONVERSAO        := '';
         ATIVO                 := '';
         COMP_FORMULACAO       := '';
    end;
end;

procedure LimpaRecordFormulacaoProdFinal();
begin
    with RetornaFormulacaoProdFinal do
    begin
        PROD_CODIGO            := '';
        PROD_MAT_PRIMA        := '';
        COMP_SEQ              := '';
        COMP_QUANTIDADE       := '';
        COMP_CONVERSAO        := '';
        ATIVO                 := '';
        COMP_FORMULACAO       := '';
    end;
end;

end.
