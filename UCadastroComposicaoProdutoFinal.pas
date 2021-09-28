{-------------------------------------------------------------------------------
 Programa..: UCadastroComposicaoProdutoFinal
 Empresa...: Sulapsso Informatica
 Finalidade: Cadastro de Composição Produto Final
 Autor          Data      Operação  Descrição
 Verlan Fernandes  JUL/2020 Criação
-------------------------------------------------------------------------------}

unit UCadastroComposicaoProdutoFinal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, URetornaRecord, URetornaSQL, uFuncoes;


type
  TfrmCadastroComposicaoProdutoFinal = class(TForm)
    pnlProdutoFinal: TPanel;
    lbProduto: TLabel;
    edtCodigoProduto: TMaskEdit;
    pnlComposicaoProduto: TPanel;
    pnlRodape: TPanel;
    edtSequencia: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtCodMateriaPrima: TMaskEdit;
    cbxMateriaPrima: TComboBox;
    chxAtivo: TCheckBox;
    Label4: TLabel;
    edtQuantidade: TMaskEdit;
    chxCalculaConversao: TCheckBox;
    btnAltera: TBitBtn;
    btnCancela: TBitBtn;
    btnSair: TBitBtn;
    btnGrava: TBitBtn;
    btnExclui: TBitBtn;
    btnNovo: TBitBtn;
    cbxProduto: TComboBox;
    pnlFormulacao: TPanel;
    Label3: TLabel;
    mmoDescFormulacao: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxProdutoClick(Sender: TObject);
    procedure cbxMateriaPrimaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCodigoProdutoExit(Sender: TObject);
    procedure cbxProdutoExit(Sender: TObject);
    procedure btnAlteraClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluiClick(Sender: TObject);
    procedure edtCodMateriaPrimaExit(Sender: TObject);
    procedure edtQuantidadeClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure mmoDescFormulacaoEnter(Sender: TObject);
    procedure mmoDescFormulacaoExit(Sender: TObject);
    procedure mmoDescFormulacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoProdutoEnter(Sender: TObject);
    procedure cbxProdutoEnter(Sender: TObject);
    procedure edtCodMateriaPrimaEnter(Sender: TObject);
    procedure cbxMateriaPrimaExit(Sender: TObject);
    procedure edtSequenciaEnter(Sender: TObject);
    procedure edtSequenciaExit(Sender: TObject);
    procedure edtCodMateriaPrimaClick(Sender: TObject);
  private
    procedure MostraDados();
    procedure ResetDados();
    procedure CarregaComboProdutos();
    procedure CarregaComboMatPrima();
    procedure ControlaBotoes(Estado: String);
    procedure HabilitaDesabilitaCampos(Estado: String);
    procedure SelectMaxSequencia();
    procedure LimpaCampos(Sender: TObject);
    procedure SaveRecord();
    procedure CorCampos(Estado: string);
    procedure SaveFormulacao;
    procedure Cadastra_Campos(Sender: TObject);
    procedure ValidaPermissoesCampos;

    { Private declarations }

  public
    {Declaração das classes}
    //RetornaRecord : TRetornaRecord;
    //RetornaSQL : TRetornaSQL;

    {Declaração para retornar os records}
    //RetornaDados : rComposicaoProdutoFinal;
    //RetornaFormulacao : rFormulacaoProdutoFinal;

    {Variaveis de uso geral}
    sAcao : string;
    sCodSeq : Integer;
    bGravouDados : Boolean;
    sLayoutCadastro, SCodProduto : string;
  end;

var
  frmCadastroComposicaoProdutoFinal: TfrmCadastroComposicaoProdutoFinal;

implementation

{$R *.dfm}

uses uDtmSisGestao;

procedure TfrmCadastroComposicaoProdutoFinal.btnAlteraClick(Sender: TObject);
begin
    if (Trim(edtCodigoProduto.Text) = '') then
    begin
        Informacao('Não há dados para alteração.','Aviso!');
        btnAltera.SetFocus;
        Exit;
    end;

    sAcao := 'ALTERAR';
    ControlaBotoes(sAcao);
    HabilitaDesabilitaCampos(sAcao);

    if sLayoutCadastro = 'COMPOSICAO' then
    begin
        if Trim(edtSequencia.Text) = '0' then
        begin
            pnlFormulacao.Align          := alClient;
            pnlFormulacao.Visible        := True;
            pnlComposicaoProduto.Visible := False;
        end
        else
        begin
            pnlComposicaoProduto.Align   := alClient;
            pnlComposicaoProduto.Visible := True;
            pnlFormulacao.Visible        := False;
        end;

        if (sAcao = 'ALTERAR') then
            edtCodMateriaPrima.SetFocus;
        if (sAcao = 'INSERIR') then
            edtCodigoProduto.SetFocus;

    end
    else if sLayoutCadastro = 'FORMULACAO' then
    begin
        pnlFormulacao.Align          := alClient;
        pnlFormulacao.Visible        := True;
        pnlComposicaoProduto.Visible := False;
        mmoDescFormulacao.SetFocus;
    end;

    //if (sAcao = 'ALTERAR') and (Trim(edtSequencia.Text) <> '0') then
    //    edtCodMateriaPrima.SetFocus;
    //if (sAcao = 'INSERIR') and (Trim(edtSequencia.Text) <> '0') then
    //    edtCodigoProduto.SetFocus;
    //if Trim(edtSequencia.Text) = '0' then
    //    mmoDescFormulacao.SetFocus;

    CorCampos(sAcao);

end;

procedure TfrmCadastroComposicaoProdutoFinal.btnCancelaClick(Sender: TObject);
begin
    if bGravouDados then
        ResetDados()
    else
        MostraDados();


    sAcao := 'INATIVO';
    ControlaBotoes(sAcao);
    HabilitaDesabilitaCampos(sAcao);
    btnSair.SetFocus;
    bGravouDados := False;
    CorCampos(sAcao);

    edtQuantidade.OnExit(Self);

    if Trim(edtSequencia.Text) = '0' then
    begin
        pnlComposicaoProduto.Visible := False;
        pnlComposicaoProduto.Align   := alBottom;
        pnlFormulacao.Visible        := True;
    end
    else if (Trim(edtSequencia.Text) <> '0') and (edtSequencia.Text <> '') then
    begin
        pnlComposicaoProduto.Visible := True;
        pnlComposicaoProduto.Align   := alClient;
        pnlFormulacao.Visible        := False;
    end;


end;

procedure TfrmCadastroComposicaoProdutoFinal.btnExcluiClick(Sender: TObject);
begin
    bGravouDados := False;
    if (Trim(edtCodigoProduto.Text) <> '') and (Trim(edtCodMateriaPrima.Text) <> '') and (Trim(edtSequencia.Text) <> '') then
    begin
        if Confirma_Exclusao() then
        begin
            URetornaSQL.ExcluiMateriaPrima(edtCodigoProduto.Text, edtCodMateriaPrima.Text, edtSequencia.Text);

            sAcao := 'INATIVO' ;
            ControlaBotoes(sAcao);
            LimpaCampos(Sender);

            btnNovo.SetFocus;
            Exit;
        end;

    end
    else
    begin
        Informacao('Não há dados para exclusão....','Aviso...');
        sAcao := 'INATIVO' ;
        ControlaBotoes(sAcao);
        LimpaCampos(Sender);
        
        btnNovo.SetFocus;
        Exit;
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.btnGravaClick(Sender: TObject);
var
    sComp_Conversao, sAtivo : string;
    sCodSeq : Integer;
    ErroGravar : Boolean;
begin
    if (edtCodigoProduto.Text = '') or (cbxProduto.Text = '') then
    begin
        Informacao('Campo Código do Produto é obrigatório','Verifique!!');
        edtCodigoProduto.SetFocus;
        Exit;
     end;

    if sLayoutCadastro = 'FORMULACAO' then
    begin
        SaveFormulacao();
        if URetornaRecord.RetornaFormulacaoProdFinal.COMP_FORMULACAO <> '' then
        begin
            dtmSisGestao.FdQryGeralDados.Active := False;
            dtmSisGestao.FdQryGeralDados.SQL.Clear;
            dtmSisGestao.FdQryGeralDados.SQL.Add('select * from geral_produtos_composicao '+
                                                     ' where comp_seq = 0 '+
                                                     ' and prod_codigo = '+ URetornaRecord.RetornaFormulacaoProdFinal.PROD_CODIGO);
            dtmSisGestao.FdQryGeralDados.Active := True;
            if dtmSisGestao.FdQryGeralDados.RecordCount > 0 then
            begin
                if Pergunta ('Já existe formulação cadastrada para este produto acabado.'+#13+#10+ 'Deseja substituir pela formulação digitada?', 'Atenção!') then
                begin
                    URetornaSQL.GravaFormulacaoProdAcabado();
                end;
            end
            else
            begin
                URetornaSQL.GravaFormulacaoProdAcabado();
            end;

            dtmSisGestao.FdQryGeralDados.Active := False;

        end;

        sAcao := 'INATIVO';
        HabilitaDesabilitaCampos(sAcao);
        ControlaBotoes(sAcao);
        btnNovo.SetFocus;

    end
    else if sLayoutCadastro = 'COMPOSICAO' then
    begin
        if (edtCodMateriaPrima.Text = '') or (cbxMateriaPrima.Text = '') then
        begin
            Informacao('Campo Código da Matéria Prima é obrigatório','Verifique!!');
            edtCodMateriaPrima.SetFocus;
            Exit;
         end;

        if (edtQuantidade.Text = '') or (AllTrim(edtQuantidade.Text) = ',') then
        begin
            Informacao('Campo Quantidade é obrigatório','Verifique!!');
            edtQuantidade.SetFocus;
            Exit;
         end;


        if chxAtivo.Checked then
            sAtivo := 'S'
        else
            sAtivo := 'N';

        if chxCalculaConversao.Checked then
            sComp_Conversao := 'S'
        else
            sComp_Conversao := 'N';

        {Carrega dados para o Record}
        SaveRecord();
        {procedimento para execução da gravação}
        URetornaSQL.GravaComposicaoProdFinal();


        if sAcao = 'INSERIR' then
        begin
            if PerguntaSim('Deseja incluir novo item para a composição do Produto: '+ cbxProduto.Text, '' ) then
            begin
                edtCodigoProduto.OnExit(Self);
                pnlProdutoFinal.Enabled := False;
                edtCodMateriaPrima.Clear;
                cbxMateriaPrima.ItemIndex := -1;
                edtQuantidade.Clear;
                chxCalculaConversao.Checked := False;
                mmoDescFormulacao.Clear;
                edtCodMateriaPrima.SetFocus;
            end
            else
            begin
                sAcao := 'INATIVO';
                HabilitaDesabilitaCampos(sAcao);
                ControlaBotoes(sAcao);
                btnNovo.SetFocus;
            end;
        end
        else
        begin
            sAcao := 'INATIVO';
            HabilitaDesabilitaCampos(sAcao);
            ControlaBotoes(sAcao);
            btnNovo.SetFocus;
        end;
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.btnNovoClick(
  Sender: TObject);
begin
    {pnlComposicaoProduto.Align   := alCustom;
    pnlComposicaoProduto.Height  := 158;
    pnlComposicaoProduto.Width   := 694;


    pnlFormulacao.Align          := alCustom;
    pnlFormulacao.Height         := 130;
    pnlFormulacao.Width          := 694;

    pnlComposicaoProduto.Align   := alBottom;
    pnlFormulacao.Align          := alClient;
    pnlComposicaoProduto.Visible := True;
    pnlFormulacao.Visible        := True; }

    if sLayoutCadastro = 'FORMULACAO' then
    begin
        URetornaRecord.LimpaRecordFormulacaoProdFinal();
        pnlComposicaoProduto.Visible := False;
        pnlComposicaoProduto.Align   := alClient;
        pnlFormulacao.Visible        := True;
        mmoDescFormulacao.Clear;
    end
    else if sLayoutCadastro = 'COMPOSICAO' then
    begin
        URetornaRecord.LimpaRecordComposicaoProdFinal();
        pnlComposicaoProduto.Visible := True;
        pnlComposicaoProduto.Align   := alClient;
        pnlFormulacao.Visible        := False;
    end;


    bGravouDados := False;
    sAcao := 'INSERIR';
    LimpaCampos(Sender);

    HabilitaDesabilitaCampos(sAcao);
    ControlaBotoes(sAcao);
    cbxProduto.OnClick(Sender);
    edtCodigoProduto.SetFocus;

    CorCampos(sAcao);

    edtQuantidade.OnExit(Self);
end;

procedure TfrmCadastroComposicaoProdutoFinal.btnSairClick(Sender: TObject);
begin
    if (sAcao <> 'INATIVO') then
    begin
        Informacao('Trabalho pendente! Salve-o ou cancele-o.','Aviso...');
        btnCancela.SetFocus;
        Exit;
    end
    else
        Close;
end;

procedure TfrmCadastroComposicaoProdutoFinal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    {Encerramento das classes}
    //RetornaRecord.Destroy();
    //RetornaSQL.Destroy();
end;

procedure TfrmCadastroComposicaoProdutoFinal.FormCreate(Sender: TObject);
begin
    {Criação das classes}
    //RetornaRecord := TRetornaRecord.Create();
    //RetornaSQL := TRetornaSQL.Create();
end;

procedure TfrmCadastroComposicaoProdutoFinal.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
        VK_RETURN          : Perform(WM_NEXTDLGCTL,0,0);
        VK_ESCAPE          : btnSair.OnClick(Self);
        VK_F2              : begin
                                if (btnNovo.Enabled) and (btnNovo.Visible) then
                                    btnNovo.OnClick(Self);
                             end;
        VK_F3              : begin
                                if (btnAltera.Enabled) and (btnAltera.Visible) then
                                    btnAltera.OnClick(Self);
                             end;
        VK_F4              : begin
                                if (btnGrava.Enabled) and (btnGrava.Visible) then
                                    btnGrava.OnClick(Self);
                             end;
        VK_F6              : begin
                                if (btnExclui.Enabled) and (btnExclui.Visible) then
                                    btnExclui.OnClick(Self);
                             end;
        VK_F7              : begin
                                if btnCancela.Enabled then
                                    btnCancela.OnClick(Self);
                             end;

    end;
end;

procedure TfrmCadastroComposicaoProdutoFinal.FormShow(Sender: TObject);
begin
    Cadastra_Campos(Sender);
    ValidaPermissoesCampos();
    {Padrão da tela}
    pnlComposicaoProduto.Visible := True;
    pnlComposicaoProduto.Align   := alBottom;
    pnlFormulacao.Visible        := True;
    pnlFormulacao.Align          := alClient;

    bGravouDados := False;
    {Carrega dados para os Combos}
    CarregaComboProdutos();
    CarregaComboMatPrima();
    {if SCodProduto <> '' then
    begin
        edtCodigoProduto.Text := SCodProduto;
        edtCodigoProduto.OnExit(Self);
    end;}

    if (sAcao = 'INATIVO') then
     begin
        HabilitaDesabilitaCampos(sAcao);
        ControlaBotoes(sAcao);
        MostraDados;
     end;

    if sAcao = 'INSERIR' then
    begin
        if sLayoutCadastro = 'FORMULACAO' then
        begin
            pnlComposicaoProduto.Visible := False;
            pnlFormulacao.Align          := alClient;
            pnlFormulacao.Visible        := True;
        end
        else if sLayoutCadastro = 'COMPOSICAO' then

        begin
            pnlComposicaoProduto.Visible := True;
            pnlComposicaoProduto.Align   := alClient;
            pnlFormulacao.Visible        := False;
        end;

        chxAtivo.Checked := True;
        SelectMaxSequencia();

        btnNovo.OnClick(Self);
    end;

    if (sAcao = 'ALTERAR') then
     begin
        MostraDados();
        btnAlteraClick(Sender);

        if Trim(edtSequencia.Text) = '0' then
         begin
            pnlComposicaoProduto.Visible := False;
            pnlComposicaoProduto.Align   := alBottom;
            pnlFormulacao.Visible        := True;
         end
         else
         begin
            pnlComposicaoProduto.Visible := True;
            pnlComposicaoProduto.Align   := alClient;
            pnlFormulacao.Visible        := False;
         end;
     end;
     edtQuantidade.OnExit(Self);

end;

procedure TfrmCadastroComposicaoProdutoFinal.HabilitaDesabilitaCampos(Estado: String);
begin
    //CbxProduto.Style := csDropDownList;
    if sAcao = 'ALTERAR' then
    begin
        pnlProdutoFinal.Enabled      := False;
        pnlComposicaoProduto.Enabled := True;
        pnlFormulacao.Enabled        := True;

    end;

    if sAcao = 'INSERIR' then
    begin
        pnlProdutoFinal.Enabled      := True;
        pnlComposicaoProduto.Enabled := True;
        pnlFormulacao.Enabled        := True;

    end;

    if sAcao = 'INATIVO' then
    begin
        pnlProdutoFinal.Enabled      := False;
        pnlComposicaoProduto.Enabled := False;
        pnlFormulacao.Enabled        := False;
    end;


end;

procedure TfrmCadastroComposicaoProdutoFinal.LimpaCampos(Sender: TObject);
var
    iIndice : Integer;
begin
    for iIndice := 0 to ComponentCount - 1 do
    begin
        if Components[iIndice] is TEdit then
            TEdit(Components[iIndice]).Clear;
        if Components[iIndice] is TMaskEdit then
            TMaskEdit(Components[iIndice]).Clear;
        if Components[iIndice] is TMemo then
            TMemo(Components[iIndice]).Clear;
    end;
    cbxProduto.ItemIndex := -1;
    cbxMateriaPrima.ItemIndex := -1;
    chxAtivo.Checked := True;
    chxCalculaConversao.Checked := False;
end;

procedure TfrmCadastroComposicaoProdutoFinal.mmoDescFormulacaoEnter(
  Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
    KeyPreview := False;
end;

procedure TfrmCadastroComposicaoProdutoFinal.mmoDescFormulacaoExit(
  Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    KeyPreview := True;
end;

procedure TfrmCadastroComposicaoProdutoFinal.mmoDescFormulacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    {case Key of
          VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
    end;}
end;

procedure TfrmCadastroComposicaoProdutoFinal.MostraDados;
var
    i : integer;
begin
    if URetornaRecord.RetornaComposicaoProdFinal.PROD_CODIGO <> '' then
        edtCodigoProduto.Text  := PadLeft(URetornaRecord.RetornaComposicaoProdFinal.PROD_CODIGO,8,'0')
    else
    begin
        edtCodigoProduto.Text := '' ;
        cbxProduto.ItemIndex := -1;
    end;


    for i := 0 to (cbxProduto.items.count -1) do
    begin
        application.processmessages;
        if edtCodigoProduto.Text = (trim(copy(cbxProduto.items[i],44,8)))  then
        begin
            application.processmessages;
            cbxProduto.itemindex := i;
            cbxProduto.text := cbxProduto.items[i];
            break;
        end;
    end;

    edtSequencia.Text := URetornaRecord.RetornaComposicaoProdFinal.COMP_SEQ;

    if URetornaRecord.RetornaComposicaoProdFinal.ATIVO = 'S' then
        chxAtivo.Checked := True
    else
        chxAtivo.Checked := False;

    if URetornaRecord.RetornaComposicaoProdFinal.PROD_MAT_PRIMA <> '' then
        edtCodMateriaPrima.Text := PadLeft(URetornaRecord.RetornaComposicaoProdFinal.PROD_MAT_PRIMA,8,'0')
    else
    begin
        edtCodMateriaPrima.Text := '';
        cbxMateriaPrima.ItemIndex := -1;
    end;

    for i := 0 to (cbxMateriaPrima.items.count -1) do
    begin
        application.processmessages;
        if edtCodMateriaPrima.Text = (trim(copy(cbxMateriaPrima.items[i],44,8)))  then
        begin
            application.processmessages;
            cbxMateriaPrima.itemindex := i;
            cbxMateriaPrima.text := cbxMateriaPrima.items[i];
            break;
        end;
    end;

    edtQuantidade.Text      := URetornaRecord.RetornaComposicaoProdFinal.COMP_QUANTIDADE;

    if URetornaRecord.RetornaComposicaoProdFinal.COMP_CONVERSAO = 'S' then
        chxCalculaConversao.Checked := True
    else
        chxCalculaConversao.Checked := False;

    mmoDescFormulacao.Text := URetornaRecord.RetornaComposicaoProdFinal.COMP_FORMULACAO;
end;

procedure TfrmCadastroComposicaoProdutoFinal.ResetDados;
var
    i : Integer;
begin
    if URetornaRecord.RetornaComposicaoProdFinal.ATIVO = 'S' then
        chxAtivo.Checked := True
    else
        chxAtivo.Checked := False;

    if URetornaRecord.RetornaComposicaoProdFinal.PROD_MAT_PRIMA <> '' then
        edtCodMateriaPrima.Text := PadLeft(URetornaRecord.RetornaComposicaoProdFinal.PROD_MAT_PRIMA,8,'0')
    else
    begin
        edtCodMateriaPrima.Text := '';
        cbxMateriaPrima.ItemIndex := -1;
    end;

    for i := 0 to (cbxMateriaPrima.items.count -1) do
    begin
        application.processmessages;
        if edtCodMateriaPrima.Text = (trim(copy(cbxMateriaPrima.items[i],44,8)))  then
        begin
            application.processmessages;
            cbxMateriaPrima.itemindex := i;
            cbxMateriaPrima.text := cbxMateriaPrima.items[i];
            break;
        end;
    end;

    edtQuantidade.Text      := URetornaRecord.RetornaComposicaoProdFinal.COMP_QUANTIDADE;

    if URetornaRecord.RetornaComposicaoProdFinal.COMP_CONVERSAO = 'S' then
        chxCalculaConversao.Checked := True
    else
        chxCalculaConversao.Checked := False;

    mmoDescFormulacao.Text := URetornaRecord.RetornaComposicaoProdFinal.COMP_FORMULACAO;

end;

procedure TfrmCadastroComposicaoProdutoFinal.SaveRecord;
begin
    bGravouDados := True;
    with URetornaRecord.RetornaComposicaoProdFinal do
    begin
        PROD_CODIGO       := Trim(edtCodigoProduto.Text);
        PROD_MAT_PRIMA    := Trim(edtCodMateriaPrima.Text);
        COMP_SEQ          := Trim(edtSequencia.Text);
        COMP_QUANTIDADE   := Trim(edtQuantidade.Text);

        if chxAtivo.Checked then
            ATIVO  := 'S'
        else
            ATIVO  := 'N';

        if chxCalculaConversao.Checked then
            COMP_CONVERSAO  := 'S'
        else
            COMP_CONVERSAO  := 'N';

        COMP_FORMULACAO   := '';
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.SaveFormulacao;
begin
    with URetornaRecord.RetornaFormulacaoProdFinal do
    begin
        PROD_CODIGO       := Trim(edtCodigoProduto.Text);
        PROD_MAT_PRIMA    := '0';
        COMP_SEQ          := '0';
        COMP_QUANTIDADE   := '0';
        ATIVO             := '';
        COMP_CONVERSAO    := '';
        COMP_FORMULACAO   := Substitui_Caracteres(mmoDescFormulacao.Text);
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.SelectMaxSequencia;
begin
    if (Trim(edtCodigoProduto.Text) <> '') and (sAcao = 'INSERIR') then
    begin
        dtmSisGestao.FdQryGeralDados.Active := False;
        dtmSisGestao.FdQryGeralDados.SQL.Clear;
        dtmSisGestao.FdQryGeralDados.SQL.Add('select max(comp_seq)+ 1 as sequencia from geral_produtos_composicao '+
                                                  ' where prod_codigo = ' + edtCodigoProduto.Text);
        dtmSisGestao.FdQryGeralDados.Active := True;
        if dtmSisGestao.FdQryGeralDados.FieldByName('sequencia').IsNull then
            sCodSeq := 1
        else
            sCodSeq := dtmSisGestao.FdQryGeralDados.FieldByName('sequencia').AsInteger;

        dtmSisGestao.FdQryGeralDados.Active := False;

        edtSequencia.Text := IntToStr(sCodSeq);
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.CarregaComboMatPrima;
begin
    dtmSisGestao.FdQryGeralDados.Active      := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(' select prod_codigo, prod_descricao from geral_produtos where prod_atv = 1 '+
                                             ' order by prod_descricao');

    dtmSisGestao.FdQryGeralDados.Active := true;
    cbxMateriaPrima.Clear;
    cbxMateriaPrima.Items.Add(Copy(PadRight(' ',40,' '),1,40) + '   ' + PadLeft (' ',8,' '));
    dtmSisGestao.FdQryGeralDados.Next;
    dtmSisGestao.FdQryGeralDados.First;
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        Application.ProcessMessages;
        cbxMateriaPrima.Items.Add(Copy(PadRight(dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString,40,' '),1,40)
                                + ' - ' + PadLeft(dtmSisGestao.FdQryGeralDados.FieldByName('prod_codigo').AsString,8,'0'));
        dtmSisGestao.FdQryGeralDados.Next;
    end;
end;

procedure TfrmCadastroComposicaoProdutoFinal.CarregaComboProdutos;
begin
    dtmSisGestao.FdQryGeralDados.Active      := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Add(' select prod_codigo, prod_descricao from geral_produtos where prod_atv = 4 '+
                                             ' order by prod_descricao');

    dtmSisGestao.FdQryGeralDados.Active := true;
    cbxProduto.Clear;
    cbxProduto.Items.Add(Copy(PadRight(' ',40,' '),1,40) + '   ' + PadLeft (' ',8,' '));
    dtmSisGestao.FdQryGeralDados.Next;
    dtmSisGestao.FdQryGeralDados.First;
    while not dtmSisGestao.FdQryGeralDados.Eof do
    begin
        Application.ProcessMessages;
        cbxProduto.Items.Add(Copy(PadRight(dtmSisGestao.FdQryGeralDados.FieldByName('prod_descricao').AsString,40,' '),1,40)
                                + ' - ' + PadLeft(dtmSisGestao.FdQryGeralDados.FieldByName('prod_codigo').AsString,8,'0'));
        dtmSisGestao.FdQryGeralDados.Next;
    end;


end;

procedure TfrmCadastroComposicaoProdutoFinal.cbxMateriaPrimaClick(
  Sender: TObject);
begin
    edtCodMateriaPrima.Text := Copy(PadLeft(cbxMateriaPrima.Text,0,'8'),44,8);
end;

procedure TfrmCadastroComposicaoProdutoFinal.cbxMateriaPrimaExit(
  Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
end;

procedure TfrmCadastroComposicaoProdutoFinal.cbxProdutoClick(Sender: TObject);
begin
    edtCodigoProduto.Text:=Copy(PadLeft(cbxProduto.Text,0,'8'),44,8);
end;

procedure TfrmCadastroComposicaoProdutoFinal.cbxProdutoEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroComposicaoProdutoFinal.cbxProdutoExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    SelectMaxSequencia();
end;

procedure TfrmCadastroComposicaoProdutoFinal.ControlaBotoes(Estado: String);
begin
    btnNovo.Enabled        := (Estado = 'INATIVO');
    btnAltera.Enabled      := (Estado = 'INATIVO');
    btnExclui.Enabled      := (Estado = 'INATIVO');
    btnGrava.Enabled       := not (Estado = 'INATIVO');
    btnCancela.Enabled     := not (Estado = 'INATIVO');

end;

procedure TfrmCadastroComposicaoProdutoFinal.CorCampos(Estado: string);
var
    iIndice : Integer;
begin
    if Estado = 'INATIVO' then
    begin
        for iIndice := 0 to ComponentCount - 1 do
        begin
            if Components[iIndice] is TEdit then
                TEdit(Components[iIndice]).Color := clBtnFace;
            if Components[iIndice] is TMaskEdit then
                TMaskEdit(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TMemo then
                TMemo(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TComboBox then
                TComboBox(Components[iIndice]).Color:= clBtnFace;
            if Components[iIndice] is TCheckBox then
                TCheckBox(Components[iIndice]).Color:= clBtnFace;
        end;
    end
    else
    begin
        for iIndice := 0 to ComponentCount - 1 do
        begin
            if Components[iIndice] is TEdit then
                TEdit(Components[iIndice]).Color := clWindow;
            if Components[iIndice] is TMaskEdit then
                TMaskEdit(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TMemo then
                TMemo(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TComboBox then
                TComboBox(Components[iIndice]).Color:= clWindow;
            if Components[iIndice] is TCheckBox then
                TCheckBox(Components[iIndice]).Color:= clWindow;
        end;

    end;
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtCodigoProdutoEnter(
  Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtCodigoProdutoExit(Sender: TObject);
var
   iInd : Integer;
   sCodigo : String;
   bAchou : Boolean;
begin
    Cor_Campo(Sender, clWindow);
    SelectMaxSequencia();
    sCodigo := PadLeft(Trim(edtCodigoProduto.Text),8,'0');

    bAchou := False;
    for iInd := 0 to (cbxProduto.Items.Count -1) do
    begin
      if sCodigo = Copy(cbxProduto.Items[iInd],44,8) then
      begin
           bAchou := True;
           Break;
      end;
    end;
    if not(bAchou ) then
    begin
        cbxProduto.ItemIndex := -1;
        Exit;
    end;
    cbxProduto.ItemIndex := iInd;
    cbxProduto.Text := cbxProduto.Items[cbxProduto.ItemIndex];

end;

procedure TfrmCadastroComposicaoProdutoFinal.edtCodMateriaPrimaClick(
  Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = '' then
    begin
        ( Sender as TMaskEdit ).Clear;
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtCodMateriaPrimaEnter(
  Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtCodMateriaPrimaExit(
  Sender: TObject);
var
   iInd : Integer;
   sCodigo : String;
   bAchou : Boolean;
begin
    Cor_Campo(Sender, clWindow);
    SelectMaxSequencia();
    sCodigo := PadLeft(Trim(edtCodMateriaPrima.Text),8,'0');

    bAchou := False;
    for iInd := 0 to (cbxMateriaPrima.Items.Count -1) do
    begin
      if sCodigo = Copy(cbxMateriaPrima.Items[iInd],44,8) then
      begin
           bAchou := True;
           Break;
      end;
    end;
    if not(bAchou ) then
    begin
        cbxMateriaPrima.ItemIndex := -1;
        Exit;
    end;
    cbxMateriaPrima.ItemIndex := iInd;
    cbxMateriaPrima.Text := cbxMateriaPrima.Items[cbxMateriaPrima.ItemIndex];
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtQuantidadeClick(
  Sender: TObject);
begin
    if AllTrim((Sender as TMaskEdit).Text) = ',' then
    begin
        ( Sender as TMaskEdit ).SelStart := 0;
        ( Sender as TMaskEdit ).SelLength := 0;
    end;

end;

procedure TfrmCadastroComposicaoProdutoFinal.edtQuantidadeExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
    if AllTrim(edtQuantidade.Text) <> ',' then
        edtQuantidade.Text := Formata_Valor(AllTrim(edtQuantidade.Text),6,3);
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtSequenciaEnter(Sender: TObject);
begin
    Cor_Campo(Sender, URetornaRecord.RetornaFuncionario.SENHA_CORCAMPOS);
end;

procedure TfrmCadastroComposicaoProdutoFinal.edtSequenciaExit(Sender: TObject);
begin
    Cor_Campo(Sender, clWindow);
end;

procedure TfrmCadastroComposicaoProdutoFinal.Cadastra_Campos(Sender: TObject);
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
                             '(FUNC_CODIGO,EMPRE_CODIGO,MENU_CODIGO,CAMPO_CODIGO,CAMPO_OPCAO,CAMPO_AUDITORIA) '+
                             'VALUES (:FUNCCODIGO,:EMPRECODIGO,:MENUCODIGO,:CAMPOCODIGO,:CAMPOOPCAO,:CAMPOAUDITORIA) '+
                             'ON DUPLICATE KEY UPDATE FUNC_CODIGO     = :FUNCCODIGO, '+
                                                     'EMPRE_CODIGO    = :EMPRECODIGO, '+
                                                     'MENU_CODIGO     = :MENUCODIGO, '+
                                                     'CAMPO_CODIGO    = :CAMPOCODIGO, '+
                                                     'CAMPO_OPCAO     = :CAMPOOPCAO, '+
                                                     'CAMPO_AUDITORIA = :CAMPOAUDITORIA ');
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
               (*dtmSisGestao.cdsConsulta.Active := False;
               dtmSisGestao.cdsConsulta.CommandText := '';
               dtmSisGestao.cdsConsulta.CommandText := LowerCase(sSQLAcesso);
               dtmSisGestao.cdsConsulta.Params.ParamByName('FUNCCODIGO').AsString     := Trim(URetornaRecord.RetornaFuncionario.FUNC_CODIGO);
               dtmSisGestao.cdsConsulta.Params.ParamByName('EMPRECODIGO').AsString    := IntToStr(URetornaRecord.RetornaFuncionario.EMPRE_CODIGO);
               dtmSisGestao.cdsConsulta.Params.ParamByName('MENUCODIGO').AsString     := copy(URetornaRecord.RetornaFuncionario.MENU_ATUAL,1,21);
               dtmSisGestao.cdsConsulta.Params.ParamByName('CAMPOCODIGO').AsString    := copy(UpperCase(Components[iIndice].Name),1,21);
               dtmSisGestao.cdsConsulta.Params.ParamByName('CAMPOOPCAO').AsString     := 'S';
               dtmSisGestao.cdsConsulta.Params.ParamByName('CAMPOAUDITORIA').AsString := 'S';
               dtmSisGestao.cdsConsulta.Execute;*)
          end;
     end;
     dtmSisGestao.FdConnection.Commit;
end;

procedure TfrmCadastroComposicaoProdutoFinal.ValidaPermissoesCampos();
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
