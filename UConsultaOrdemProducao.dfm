object frmConsultaOrdemProducao: TfrmConsultaOrdemProducao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Consulta de Ordens de Produ'#231#227'o  - v.1.0'
  ClientHeight = 580
  ClientWidth = 1104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1104
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlPesquisar: TPanel
      Left = 984
      Top = 0
      Width = 120
      Height = 89
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object btnPesquisa: TBitBtn
        Left = 6
        Top = 4
        Width = 108
        Height = 72
        Cursor = crHandPoint
        Align = alCustom
        Caption = 'P&esquisa (F5)'
        Glyph.Data = {
          B60D0000424DB60D000000000000360000002800000030000000180000000100
          180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCD2E2B9BDCFD8D1D7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7
          E7DBDBDBE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFC8D0E1285A9F2B5899626F8DABA2AEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFE5E5E59B9B9B9797979D9D9DC8C8C8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D1E3285EA55BD3F977DBF426589F70
          7B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69B9B9BADAD
          ADB0B0B0979797ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8D2E5
          2963AC5BD5FA7EE3FA45AFF11879DE255099FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE6E6E69D9D9DAEAEAEB2B2B2A8A8A89E9E9E9A9A9AFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC9D4E72967B45CD5FA7FE3FA45AFF1177FE41F5AADC9
          D4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E69E9E9EAEAEAEB2B2B2A8A8
          A89F9F9F9B9B9BE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9D5E9296CBA5CD5FC
          7FE3FA44AFF1177FE41F5EB6C9D5E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
          E7E79F9F9FAEAEAEB2B2B2A8A8A89F9F9F9C9C9CE7E7E7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFC9D6EA2971C15CD5FC7EE3FA44AFF1177FE41F63BDC9D6EAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFE7E7E7A0A0A0AEAEAEB2B2B2A8A8A89F9F9F9D9D
          9DE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F7E7
          E5E6E6E5E6F4F3F3FFFFFFFFFFFFFFFFFFFFFFFF447DC551C3F47EE3FA44AFEF
          177FE41F67C3C9D8ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFAFAFAF1F1F1F1F1F1F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFADADADAB
          ABABB2B2B2A8A8A89F9F9F9E9E9EE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFCFCB6B2B66A636C483F48564950534952453B455C545CA8A3A8F7F7
          F7EFEDF1B4C2D52E79C83DA2E91780E41F6CC8C9D9EDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFED5D5D5A9A9A9929292939393939393909090
          A2A2A2CDCDCDFAFAFAF4F4F4CECECE9E9E9EA6A6A69F9F9F9F9F9FE7E7E7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEEF6C646E66574AAD9D6FFBDCACFF
          E6C4FFEECDFFF5CCC0C8A6606263483C4871647F9CA1B691A9BC2372CB1F70D2
          C9DBF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A8A8A89595
          95A4A4A4B5B5B5B8B8B8BABABABABABAAEAEAE989898949494A0A0A0A9A9A9A9
          A9A99D9D9DA0A0A0E8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEEF
          5D56618E7753F2C18FFFCFA9FFD6B3FFE6C9FFEDD0FFF2D3FFF8D8FFFCDF97AC
          A6453B45726374C8C1CBE0EEFAD4E3F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF5F5F59E9E9E9C9C9CB0B0B0B4B4B4B6B6B6B9B9B9BABABABBBBBB
          BBBBBBBCBCBCA8A8A89090909B9B9BD5D5D5F2F2F2EDEDEDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF7A737E8D734FEAB486F5BC91F6BD91FFD8B6FF
          E8CDFFEED2FFF3D7FFF9E0FFFDE9FFFEF095AEAD463C49CDC9CDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE9B9B9BADADADB0B0
          B0B0B0B0B6B6B6B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEA9A9A9909090DF
          DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C6CB6F5C51
          DAA574EDB489E2A97EF8BF93FFDAB9FFE7CDFFEED5FFF4DAFFF9E3FFFDEFFFFE
          F7FFFEEE6B7175A5A1A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDEDEDE979797A9A9A9AEAEAEABABABB0B0B0B6B6B6B9B9B9BABABABBBBBB
          BCBCBCBEBEBEBFBFBFBEBEBE9C9C9CCBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8F8792A07F52E1A87DDBA277DDA479F6BD92FFD7B5FF
          E7CEFFEDD4FFF2DAFFF7E1FFFAE7FFFDEDFFFCE7CCD6C05D555FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B79E9E9EABABABA9A9A9AAAA
          AAB0B0B0B6B6B6B9B9B9BABABABBBBBBBCBCBCBDBDBDBEBEBEBDBDBDB2B2B29F
          9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF706471C4905D
          DDA479D39A6FF8BF94FFD0ACFFDABCFFEBD8FFEBD4FFEED7FFF4DDFFF7E1FFF8
          E1FFF9DEFFFAD75D525FF0F0F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF9F9F9FA4A4A4AAAAAAA7A7A7B0B0B0B4B4B4B7B7B7BABABABABABABBBBBB
          BCBCBCBCBCBCBCBCBCBCBCBCBCBCBC969696F7F7F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF7C6A78C0895BDAA176EFB68BDAA176E5AC81FDC498FF
          DCBDFFEFE0FFECD5FFEED6FFF2DAFFF4DAFFF3D8FFF2CF7D7179D6D5D8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DA3A3A3A9A9A9AEAEAEA9A9
          A9ACACACB2B2B2B7B7B7BBBBBBBABABABABABABBBBBBBBBBBBBBBBBBBABABA9D
          9D9DE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7181BE8759
          D89F74E4AB80FFCCA5FFE1CBFFDBBFFFCCA4FFDFC3FFECDBFFE9D1FFECD3FFED
          D3FFEDD1FFEFCE7F767BDAD8DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF9E9E9EA2A2A2A8A8A8ABABABB4B4B4B8B8B8B7B7B7B3B3B3B8B8B8BBBBBB
          BABABABABABABABABABABABABABABA9E9E9EE9E9E9FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF827788BF8857D0976CF3BA8FFFE1CBFFEEE2FFF9F5FF
          DABDFFCBA3FFE6D1FFE4CBFFE5CBFFE7CDFFE7CCFFECC26A5E6BF1F1F2FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A5A2A2A2A6A6A6AFAFAFB8B8
          B8BBBBBBBEBEBEB7B7B7B3B3B3B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B999
          9999F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A0ACA68053
          CB9267EBB287FFD9BBFFEADAFFF1E7FFDEC5F1B88DFFDBBFFFCCA3FED3AEFFD8
          B6FFDDC0D3C594796F7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC0C0C09F9F9FA5A5A5ADADADB6B6B6BABABABCBCBCB8B8B8AFAFAFB7B7B7
          B3B3B3B5B5B5B6B6B6B7B7B7AEAEAEA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDFDCE08B776FBF8656D9A075FCC398FFDCC2FFE5D2FF
          CCA5FBC297FCC398ECB388F3BA8EFFC99EFCD1A08C8171BCB8BEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E79E9E9EA2A2A2A9A9A9B1B1
          B1B7B7B7B9B9B9B4B4B4B1B1B1B1B1B1ADADADAFAFAFB3B3B3B3B3B39F9F9FD4
          D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABA4AF
          9D7E5CC0885CDBA277EEB58AFBC297F6BD92EEB58AD1986DDDA479F1B88DF4BE
          91B09F77847A89FCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFBFBFBF9F9F9FA3A3A3A9A9A9AEAEAEB1B1B1B0B0B0AEAEAEA7A7A7
          AAAAAAAFAFAFB0B0B0A5A5A5ADADADFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA9C929FA0825FBF8857CD9469D69D72DD
          A479DBA277E3AA7FEAB186DFAC7BAB976F857988E9E8EBFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBB0B0B0A0A0A0A2A2
          A2A6A6A6A8A8A8AAAAAAA9A9A9ABABABADADADABABABA4A4A4A7A7A7F1F1F1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FAFAFAB2ABB598867DAD875AC38C5BBC8558C28B5DCF9967BA9668958475968F
          9BEDECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFBFBFBC1C1C1A2A2A2A1A1A1A3A3A3A2A2A2A3A3A3A6A6A6
          A4A4A4A1A1A1B3B3B3F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E0E4B7AFBA9D91A09F
          919DA1939D968B9BA69FABD7D3D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8
          E8C4C4C4ACACACA6A6A6A6A6A6A9A9A9BBBBBBE1E1E1FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnPesquisaClick
      end
    end
    object pnlFiltro: TPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 89
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 27
        Top = 38
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Registros'
      end
      object lblProcurarPor: TLabel
        Left = 7
        Top = 13
        Width = 65
        Height = 13
        Caption = 'Procurar Por?'
      end
      object cbxProcurar: TComboBox
        Left = 78
        Top = 4
        Width = 131
        Height = 22
        Style = csDropDownList
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'NR. ORDEM'
        OnChange = cbxProcurarChange
        Items.Strings = (
          'NR. ORDEM'
          'DATA_EMISS'#195'O'
          'C'#211'D. PRODUTO')
      end
      object cbxResultados: TComboBox
        Left = 78
        Top = 29
        Width = 131
        Height = 22
        Style = csDropDownList
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ItemIndex = 3
        ParentFont = False
        TabOrder = 1
        Text = 'TODOS'
        Items.Strings = (
          '10'
          '50'
          '100'
          'TODOS')
      end
    end
    object pnlDigitacao: TPanel
      Left = 225
      Top = 0
      Width = 759
      Height = 89
      Align = alClient
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        755
        85)
      object lblProcurar: TLabel
        Left = 88
        Top = 12
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'XXXXXX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtProcurar: TMaskEdit
        Left = 136
        Top = 5
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = ''
      end
      object dtpDataEmissao: TDateTimePicker
        Left = 137
        Top = 5
        Width = 130
        Height = 21
        Date = 44026.424763611110000000
        Time = 44026.424763611110000000
        TabOrder = 1
      end
      object rdgSituacao: TRadioGroup
        Left = 137
        Top = 32
        Width = 368
        Height = 45
        Caption = ' Situa'#231#227'o '
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Aberto'
          'Finalizado'
          'Estornado'
          'Todos')
        TabOrder = 3
        OnClick = rdgSituacaoClick
      end
      object Panel3: TPanel
        Left = 691
        Top = 0
        Width = 64
        Height = 85
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object btnLimpar: TBitBtn
          Left = 0
          Top = 3
          Width = 32
          Height = 25
          Align = alCustom
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B46E23A44E2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E2
            3B46E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D
            9D9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF9D9D9D9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3B46E2616BF9616BF93842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF3842E0616BF9616BF93B46E2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9D9D9DA5A5A5A5A5A59C9C9CFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA5A5A5A5A5A59D9D9DFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E15660F1737CFE7E87FE626CF938
            42E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3842E0626CF97E87FE
            737CFE5660F13A44E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DA3A3A3A9A9
            A9AAAAAAA5A5A59C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CA5A5A5AAAAAAA9A9A9A3A3A39D9D9DFFFFFFFFFFFFFFFFFFFFFFFF3842E0
            4C54EA6169F66972FC757FFE848DFE636DFA3842E0FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF3842E0636DFA848DFE757FFE6972FC6169F64C54EA3842E0FFFFFFFF
            FFFFFFFFFF9C9C9CA0A0A0A5A5A5A7A7A7A9A9A9ABABABA6A6A69C9C9CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA6A6A6ABABABA9A9A9A7A7A7A5A5A5A0A0
            A09C9C9CFFFFFFFFFFFFFFFFFF3741DF464FE75961F1626BF86B74FE7882FE82
            8CFE616BF93943E1FFFFFFFFFFFFFFFFFF3943E1616BF9828CFE7882FE6B74FE
            626BF85961F1464FE73741DFFFFFFFFFFFFFFFFFFF9C9C9C9F9F9FA3A3A3A5A5
            A5A7A7A7AAAAAAABABABA5A5A59D9D9DFFFFFFFFFFFFFFFFFF9D9D9DA5A5A5AB
            ABABAAAAAAA7A7A7A5A5A5A3A3A39F9F9F9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
            3741DF4851E85C64F3646CF96A73FD747DFE7B85FE5D67F73B46E2FFFFFF3B46
            E25D67F77B85FE747DFE6A73FD646CF95C64F34851E83741DFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9C9C9CA0A0A0A4A4A4A6A6A6A7A7A7A9A9A9AAAAAAA4A4A4
            9D9D9DFFFFFF9D9D9DA4A4A4AAAAAAA9A9A9A7A7A7A6A6A6A4A4A4A0A0A09C9C
            9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4851E85A62F2616AF766
            6FFA6D76FE717BFE6B74FE3B46E26B74FE717BFE6D76FE666FFA616AF75A62F2
            4851E83741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA0A0
            A0A3A3A3A5A5A5A6A6A6A8A8A8A8A8A8A7A7A79D9D9DA7A7A7A8A8A8A8A8A8A6
            A6A6A5A5A5A3A3A3A0A0A09C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3741DF4750E75860F15D65F4616AF7646DF96770FB6770FB6770
            FB646DF9616AF75D65F45860F14750E73741DFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C9F9F9FA3A3A3A4A4A4A5A5A5A6A6A6
            A6A6A6A6A6A6A6A6A6A6A6A6A5A5A5A4A4A4A3A3A39F9F9F9C9C9CFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3640DE424AE34E
            55E9575FF05A62F25C64F35C64F35C64F35A62F2575FF04E55E9424AE33640DE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF9C9C9C9E9E9EA1A1A1A3A3A3A3A3A3A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A1
            A1A19E9E9E9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3640DE4E55E9575FF05A62F25C64F35C64F35C64
            F35A62F2575FF04E55E93640DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA1A1A1A3A3A3A3A3A3
            A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A1A1A19C9C9CFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36
            40DE575FF05A62F25C64F35C64F35C64F35A62F2575FF03640DEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF9C9C9CA3A3A3A3A3A3A4A4A4A4A4A4A4A4A4A3A3A3A3A3A39C
            9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF3640DE4E55E9575FF05A62F25C64F35C64F35C64
            F35A62F2575FF04E55E93640DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA1A1A1A3A3A3A3A3A3
            A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A1A1A19C9C9CFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3640DE424AE34E
            55E9575FF05A62F25C64F35C64F35C64F35A62F2575FF04E55E9424AE33640DE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF9C9C9C9E9E9EA1A1A1A3A3A3A3A3A3A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A1
            A1A19E9E9E9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3741DF4750E75860F15D65F4616AF7646DF96770FB6770FB6770
            FB646DF9616AF75D65F45860F14750E73741DFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C9F9F9FA3A3A3A4A4A4A5A5A5A6A6A6
            A6A6A6A6A6A6A6A6A6A6A6A6A5A5A5A4A4A4A3A3A39F9F9F9C9C9CFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3741DF4851E85A62F2616AF766
            6FFA6D76FE717BFE6B74FE3B46E26B74FE717BFE6D76FE666FFA616AF75A62F2
            4851E83741DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA0A0
            A0A3A3A3A5A5A5A6A6A6A8A8A8A8A8A8A7A7A79D9D9DA7A7A7A8A8A8A8A8A8A6
            A6A6A5A5A5A3A3A3A0A0A09C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            3741DF4851E85C64F3646CF96A73FD747DFE7B85FE5D67F73B46E2FFFFFF3B46
            E25D67F77B85FE747DFE6A73FD646CF95C64F34851E83741DFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9C9C9CA0A0A0A4A4A4A6A6A6A7A7A7A9A9A9AAAAAAA4A4A4
            9D9D9DFFFFFF9D9D9DA4A4A4AAAAAAA9A9A9A7A7A7A6A6A6A4A4A4A0A0A09C9C
            9CFFFFFFFFFFFFFFFFFFFFFFFF3741DF464FE75961F1626BF86B74FE7882FE82
            8CFE616BF93943E1FFFFFFFFFFFFFFFFFF3943E1616BF9828CFE7882FE6B74FE
            626BF85961F1464FE73741DFFFFFFFFFFFFFFFFFFF9C9C9C9F9F9FA3A3A3A5A5
            A5A7A7A7AAAAAAABABABA5A5A59D9D9DFFFFFFFFFFFFFFFFFF9D9D9DA5A5A5AB
            ABABAAAAAAA7A7A7A5A5A5A3A3A39F9F9F9C9C9CFFFFFFFFFFFFFFFFFF3842E0
            4C54EA6169F66972FC757FFE848DFE636DFA3842E0FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF3842E0636DFA848DFE757FFE6972FC6169F64C54EA3842E0FFFFFFFF
            FFFFFFFFFF9C9C9CA0A0A0A5A5A5A7A7A7A9A9A9ABABABA6A6A69C9C9CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA6A6A6ABABABA9A9A9A7A7A7A5A5A5A0A0
            A09C9C9CFFFFFFFFFFFFFFFFFFFFFFFF3A44E15660F1737CFE7E87FE626CF938
            42E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3842E0626CF97E87FE
            737CFE5660F13A44E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DA3A3A3A9A9
            A9AAAAAAA5A5A59C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C
            9C9CA5A5A5AAAAAAA9A9A9A3A3A39D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3B46E2616BF9616BF93842E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF3842E0616BF9616BF93B46E2FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9D9D9DA5A5A5A5A5A59C9C9CFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CA5A5A5A5A5A59D9D9DFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B46E23A44E2FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A44E2
            3B46E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D
            9D9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF9D9D9D9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Layout = blGlyphBottom
          NumGlyphs = 2
          TabOrder = 0
          TabStop = False
          OnClick = btnLimparClick
        end
      end
      object dtpDataEmissaoFim: TDateTimePicker
        Left = 284
        Top = 5
        Width = 130
        Height = 21
        Date = 44026.424763611110000000
        Time = 44026.424763611110000000
        TabOrder = 2
      end
    end
  end
  object pnlGridPrincipal: TPanel
    Left = 0
    Top = 89
    Width = 1104
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 416
      Width = 1104
      Height = 40
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 1102
        Height = 21
        Align = alTop
        TabOrder = 0
        DesignSize = (
          1102
          21)
        object Label3: TLabel
          Left = 135
          Top = 4
          Width = 47
          Height = 13
          Caption = 'QTD. KG:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 268
          Top = 4
          Width = 46
          Height = 13
          Caption = 'QTD. SC:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 569
          Top = 4
          Width = 57
          Height = 13
          Caption = 'PRODUTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 17
          Top = 4
          Width = 24
          Height = 13
          Caption = 'O.P.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 404
          Top = 4
          Width = 63
          Height = 13
          Caption = 'VLR.TOTAL:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtQtdKG: TDBEdit
          Left = 184
          Top = -1
          Width = 70
          Height = 21
          TabStop = False
          DataField = 'QTDE_KG'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edtQtdSC: TDBEdit
          Left = 317
          Top = -1
          Width = 70
          Height = 21
          TabStop = False
          DataField = 'QTDE_SC'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 699
          Top = -1
          Width = 403
          Height = 21
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          DataField = 'prod_descricao'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 628
          Top = -1
          Width = 70
          Height = 21
          TabStop = False
          DataField = 'PROD_CODIGO'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 45
          Top = -1
          Width = 70
          Height = 21
          TabStop = False
          DataField = 'NR_ORDEM'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit3: TDBEdit
          Left = 469
          Top = -1
          Width = 84
          Height = 21
          TabStop = False
          DataField = 'VALOR_TOTAL'
          DataSource = dtsOrdemProducao
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
      end
    end
    object pgcGeral: TPageControl
      Left = 0
      Top = 0
      Width = 1104
      Height = 416
      ActivePage = tsOrdemProducao
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnChange = pgcGeralChange
      object tsOrdemProducao: TTabSheet
        Caption = 'Ordens de Produ'#231#227'o'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grdOrdemProducao: TDBGrid
          Left = 0
          Top = 0
          Width = 1096
          Height = 388
          Align = alClient
          DataSource = dtsOrdemProducao
          DrawingStyle = gdsGradient
          GradientStartColor = clWindow
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = popGridOP
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grdOrdemProducaoCellClick
          OnDrawColumnCell = grdOrdemProducaoDrawColumnCell
          OnDblClick = grdOrdemProducaoDblClick
          OnEnter = grdOrdemProducaoEnter
          OnExit = grdOrdemProducaoExit
          OnKeyDown = grdOrdemProducaoKeyDown
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SITUACAO'
              Title.Alignment = taCenter
              Title.Caption = 'Situa'#231#227'o'
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NR_ORDEM'
              Title.Alignment = taCenter
              Title.Caption = 'Nr. Ordem'
              Width = 71
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_EMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Emiss'#227'o'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROD_CODIGO'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Produto'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prod_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 218
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QTDE_KG'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. KG'
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'QTDE_SC'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. SC'
              Width = 66
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_ATUALIZACAO'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Atualiza'#231#227'o'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_ESTORNO'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Estorno'
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Total'
              Width = 75
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NR_LOTE'
              Title.Alignment = taCenter
              Title.Caption = 'Nr. Lote'
              Width = 66
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_VALIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Dt. Validade'
              Width = 78
              Visible = True
            end>
        end
      end
      object tsItens: TTabSheet
        Caption = 'Itens da Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel2: TPanel
          Left = 0
          Top = 348
          Width = 1096
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Label7: TLabel
            Left = 460
            Top = 4
            Width = 68
            Height = 13
            Caption = 'QTD. TOTAL:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 820
            Top = 6
            Width = 66
            Height = 13
            Caption = 'VLR. TOTAL:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 680
            Top = 6
            Width = 57
            Height = 13
            Caption = 'VLR. UNIT:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtQtdeTotalItem: TEdit
            Left = 530
            Top = 1
            Width = 70
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 603
            Top = 1
            Width = 50
            Height = 21
            DataField = 'prod_unid_compra'
            DataSource = dtsItensOrdem
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object edtVlrTotalItem: TEdit
            Left = 888
            Top = 1
            Width = 71
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object edtVlrUnitItem: TEdit
            Left = 739
            Top = 1
            Width = 71
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object grdItens: TDBGrid
          Left = 0
          Top = 0
          Width = 1096
          Height = 348
          Align = alClient
          DataSource = dtsItensOrdem
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = grdItensCellClick
          OnEnter = grdItensEnter
          OnExit = grdItensExit
          OnKeyDown = grdItensKeyDown
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COMP_SEQ'
              Title.Alignment = taCenter
              Title.Caption = 'Seq.'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PROD_MAT_PRIMA'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'd. Produto'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prod_descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 359
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COMP_QUANTIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 82
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COMP_CONVERSAO'
              Title.Alignment = taCenter
              Title.Caption = 'Convers'#227'o?'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 545
    Width = 1104
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object btnPrimeiro: TBitBtn
      Left = 1
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Primeiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A47158A47158A47158A4
        7158A47158A47158A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E9E9E9E
        9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF58A37085BD9D85BD9D85BD9D85BD9D85BD9D85BD9D56A26EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9E9E9EA7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A79D
        9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56A26C84D5B1C2EAD9C2EAD9C2EA
        D9C2EAD99ED5B753A06AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FABABAB
        B5B5B5B5B5B5B5B5B5B5B5B5AEAEAE9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF53A0698CD8B6BEE9D6BEE9D6BEE9D6BEE9D69BD4B5509E67FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9E9E9EACACACB5B5B5B5B5B5B5B5B5B5B5B5ADADAD9C
        9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF509D6592DBBAB8E7D2B8E7D2B8E7
        D2B8E7D296D3B24D9B63FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DADADAD
        B4B4B4B4B4B4B4B4B4B4B4B4ACACAC9B9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4D9A6097DDBEB2E6CFB2E6CFB2E6CFB2E6CF91D3B14A985EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9C9C9CAEAEAEB3B3B3B3B3B3B3B3B3B3B3B3ACACAC9A
        9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF49975C99DEC0ABE4CBABE4CBABE4
        CBABE4CB8CD2AE46955AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BAFAFAF
        B2B2B2B2B2B2B2B2B2B2B2B2ABABAB999999FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4593579ADFC0A5E2C7A5E2C7A5E2C7A5E2C787D1AC429155FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9A9A9AAFAFAFB1B1B1B1B1B1B1B1B1B1B1B1ABABAB98
        9898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41905398DEBF9DE0C29DE0C29DE0
        C29DE0C280D1A93E8E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999AFAFAF
        AFAFAFAFAFAFAFAFAFAFAFAFAAAAAA979797FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF3E8C4E94DDBD96DEBE96DEBE96DEBE96DEBE7AD0A63B8A4BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF989898AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA9A9A996
        9696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3989488FDDBA8FDDBA8FDDBA8FDD
        BA8FDDBA75D0A3368745FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797ADADAD
        ADADADADADADADADADADADADA8A8A8959595FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF36854388DBB688DBB688DBB688DBB688DBB66FCFA1338340FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF969696ACACACACACACACACACACACACACACACA7A7A794
        9494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF2F803B2F803B2F803B2F803B2F803B80D9B180D9B180D9B180D9
        B180D9B168CD9D2F803B2F803B2F803B2F803B2F803BEBEEEDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF939393939393939393939393939393ABABAB
        ABABABABABABABABABABABABA6A6A6939393939393939393939393939393F6F6
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B7C3684E0B67AD7AD7A
        D7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD
        58BA842B7C36FBFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9292
        92ACACACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        AAAAAAAAAAAAAAAAA1A1A1929292FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF2779328DE3BB73D5A973D5A973D5A973D5A973D5A973D5
        A973D5A973D5A973D5A973D5A958BF89277932FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191AEAEAEA9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A2A2A2919191FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF24762D98
        E6C26DD4A66DD4A66DD4A66DD4A66DD4A66DD4A66DD4A66DD4A658C38E24762D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF909090B0B0B0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A3A3A3909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF217329A4E9C967D2A267D2A267D2A267D2
        A267D2A267D2A257C690217329FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FB1B1B1A7A7A7
        A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A3A3A38F8F8FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF1E7126AFECD063D19F63D19F63D19F63D19F58C9931E7126FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8F8F8FB3B3B3A6A6A6A6A6A6A6A6A6A6A6A6A4A4A48F
        8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B6F22B8EFD55ED09D5ED0
        9D59CC971B6F22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E
        B5B5B5A6A6A6A6A6A6A5A5A58E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF196D1FBEF1D95ACD99196D1FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8DB6B6B6A6A6A68D8D8DFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF176B1D176B
        1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8D8D8D8D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnPrimeiroClick
    end
    object btnAnterior: TBitBtn
      Left = 101
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'A&nterior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBFCFCEBEEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B7C362F803BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292939393
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27
        793258BA842F803BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF919191A1A1A1939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF24762D58BF897AD7AD2F803BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090A2A2A2AAAAAA939393
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21732958C38E73
        D5A97AD7AD2F803BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8F8F8FA3A3A3A9A9A9AAAAAA939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF1E712657C6906DD4A673D5A97AD7AD2F803B3383403687453B8A
        4B3E8E5042915546955A4A985E4D9B63509E6753A06A56A26E58A471FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FA3A3A3A8A8A8A9A9A9AAAAAA939393
        9494949595959696969797979898989999999A9A9A9B9B9B9C9C9C9D9D9D9D9D
        9D9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B6F2258C99367D2A26DD4A673
        D5A97AD7AD68CD9D6FCFA175D0A37AD0A680D1A987D1AC8CD2AE91D3B196D3B2
        9BD4B59ED5B785BD9D58A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8EA4A4
        A4A7A7A7A8A8A8A9A9A9AAAAAAA6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABABAB
        ABABACACACACACACADADADAEAEAEA7A7A79E9E9EFFFFFFFFFFFFFFFFFFFFFFFF
        196D1F59CC9763D19F67D2A26DD4A673D5A97AD7AD80D9B188DBB68FDDBA96DE
        BE9DE0C2A5E2C7ABE4CBB2E6CFB8E7D2BEE9D6C2EAD985BD9D58A471FFFFFFFF
        FFFFFFFFFFFFFFFF8D8D8DA5A5A5A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABAB
        ACACACADADADAEAEAEAFAFAFB1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B5B5B5A7A7
        A79E9E9EFFFFFFFFFFFFFFFFFF176B1D5ACD995ED09D63D19F67D2A26DD4A673
        D5A97AD7AD80D9B188DBB68FDDBA96DEBE9DE0C2A5E2C7ABE4CBB2E6CFB8E7D2
        BEE9D6C2EAD985BD9D58A471FFFFFFFFFFFFFFFFFF8D8D8DA6A6A6A6A6A6A6A6
        A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACACADADADAEAEAEAFAFAFB1B1B1B2
        B2B2B3B3B3B4B4B4B5B5B5B5B5B5A7A7A79E9E9EFFFFFFFFFFFFFFFFFF176B1D
        BEF1D95ED09D63D19F67D2A26DD4A673D5A97AD7AD80D9B188DBB68FDDBA96DE
        BE9DE0C2A5E2C7ABE4CBB2E6CFB8E7D2BEE9D6C2EAD985BD9D58A471FFFFFFFF
        FFFFFFFFFF8D8D8DB6B6B6A6A6A6A6A6A6A7A7A7A8A8A8A9A9A9AAAAAAABABAB
        ACACACADADADAEAEAEAFAFAFB1B1B1B2B2B2B3B3B3B4B4B4B5B5B5B5B5B5A7A7
        A79E9E9EFFFFFFFFFFFFFFFFFFFFFFFF196D1FB8EFD563D19F67D2A26DD4A673
        D5A97AD7AD80D9B188DBB68FDDBA96DEBE9DE0C2A5E2C7ABE4CBB2E6CFB8E7D2
        BEE9D6C2EAD985BD9D58A471FFFFFFFFFFFFFFFFFFFFFFFF8D8D8DB5B5B5A6A6
        A6A7A7A7A8A8A8A9A9A9AAAAAAABABABACACACADADADAEAEAEAFAFAFB1B1B1B2
        B2B2B3B3B3B4B4B4B5B5B5B5B5B5A7A7A79E9E9EFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF1B6F22AFECD067D2A26DD4A673D5A97AD7AD80D9B188DBB68FDDBA94DD
        BD98DEBF9ADFC099DEC097DDBE92DBBA8CD8B684D5B185BD9D58A471FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8E8E8EB3B3B3A7A7A7A8A8A8A9A9A9AAAAAAABABAB
        ACACACADADADAEAEAEAFAFAFAFAFAFAFAFAFAEAEAEADADADACACACABABABA7A7
        A79E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E7126A4E9C96DD4A673
        D5A97AD7AD2F803B3685433989483E8C4E41905345935749975C4D9A60509D65
        53A06956A26C58A37058A471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F
        8FB1B1B1A8A8A8A9A9A9AAAAAA9393939696969797979898989999999A9A9A9B
        9B9B9C9C9C9D9D9D9E9E9E9F9F9F9E9E9E9E9E9EFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF21732998E6C273D5A97AD7AD2F803BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FB0B0B0A9A9A9AAAAAA939393
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF24762D8D
        E3BB7AD7AD2F803BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF909090AEAEAEAAAAAA939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF27793284E0B62F803BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191ACACAC939393
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF2B7C362F803BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF929292939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnAnteriorClick
    end
    object btnProximo: TBitBtn
      Left = 201
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'P&r'#243'ximo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEEEDFBFCFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6FE
        FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF2F803B2B7C36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF939393929292FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F803B58BA84277932FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393A1
        A1A1919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF2F803B7AD7AD58BF8924762DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF939393AAAAAAA2A2A2909090FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F803B7AD7AD73D5A958C38E
        217329FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393AA
        AAAAA9A9A9A3A3A38F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        58A47156A26E53A06A509E674D9B634A985E46955A4291553E8E503B8A4B3687
        453383402F803B7AD7AD73D5A96DD4A657C6901E7126FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9E9E9E9D9D9D9D9D9D9C9C9C9B9B9B9A9A9A999999989898
        979797969696959595949494939393AAAAAAA9A9A9A8A8A8A3A3A38F8F8FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47185BD9D9ED5B79BD4B596D3B291
        D3B18CD2AE87D1AC80D1A97AD0A675D0A36FCFA168CD9D7AD7AD73D5A96DD4A6
        67D2A258C9931B6F22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA7A7A7AEAE
        AEADADADACACACACACACABABABABABABAAAAAAA9A9A9A8A8A8A7A7A7A6A6A6AA
        AAAAA9A9A9A8A8A8A7A7A7A4A4A48E8E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        58A47185BD9DC2EAD9BEE9D6B8E7D2B2E6CFABE4CBA5E2C79DE0C296DEBE8FDD
        BA88DBB680D9B17AD7AD73D5A96DD4A667D2A263D19F59CC97196D1FFFFFFFFF
        FFFFFFFFFFFFFFFF9E9E9EA7A7A7B5B5B5B5B5B5B4B4B4B3B3B3B2B2B2B1B1B1
        AFAFAFAEAEAEADADADACACACABABABAAAAAAA9A9A9A8A8A8A7A7A7A6A6A6A5A5
        A58D8D8DFFFFFFFFFFFFFFFFFFFFFFFF58A47185BD9DC2EAD9BEE9D6B8E7D2B2
        E6CFABE4CBA5E2C79DE0C296DEBE8FDDBA88DBB680D9B17AD7AD73D5A96DD4A6
        67D2A263D19F5ED09D5ACD99176B1DFFFFFFFFFFFFFFFFFF9E9E9EA7A7A7B5B5
        B5B5B5B5B4B4B4B3B3B3B2B2B2B1B1B1AFAFAFAEAEAEADADADACACACABABABAA
        AAAAA9A9A9A8A8A8A7A7A7A6A6A6A6A6A6A6A6A68D8D8DFFFFFFFFFFFFFFFFFF
        58A47185BD9DC2EAD9BEE9D6B8E7D2B2E6CFABE4CBA5E2C79DE0C296DEBE8FDD
        BA88DBB680D9B17AD7AD73D5A96DD4A667D2A263D19F5ED09DBEF1D9176B1DFF
        FFFFFFFFFFFFFFFF9E9E9EA7A7A7B5B5B5B5B5B5B4B4B4B3B3B3B2B2B2B1B1B1
        AFAFAFAEAEAEADADADACACACABABABAAAAAAA9A9A9A8A8A8A7A7A7A6A6A6A6A6
        A6B6B6B68D8D8DFFFFFFFFFFFFFFFFFF58A47185BD9DC2EAD9BEE9D6B8E7D2B2
        E6CFABE4CBA5E2C79DE0C296DEBE8FDDBA88DBB680D9B17AD7AD73D5A96DD4A6
        67D2A263D19FB8EFD5196D1FFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA7A7A7B5B5
        B5B5B5B5B4B4B4B3B3B3B2B2B2B1B1B1AFAFAFAEAEAEADADADACACACABABABAA
        AAAAA9A9A9A8A8A8A7A7A7A6A6A6B5B5B58D8D8DFFFFFFFFFFFFFFFFFFFFFFFF
        58A47185BD9D84D5B18CD8B692DBBA97DDBE99DEC09ADFC098DEBF94DDBD8FDD
        BA88DBB680D9B17AD7AD73D5A96DD4A667D2A2AFECD01B6F22FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9E9E9EA7A7A7ABABABACACACADADADAEAEAEAFAFAFAFAFAF
        AFAFAFAEAEAEADADADACACACABABABAAAAAAA9A9A9A8A8A8A7A7A7B3B3B38E8E
        8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A47158A37056A26C53A069509D654D
        9A6049975C4593574190533E8C4E3989483685432F803B7AD7AD73D5A96DD4A6
        A4E9C91E7126FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E9E9E9E9F9F
        9F9E9E9E9D9D9D9C9C9C9B9B9B9A9A9A999999989898979797969696939393AA
        AAAAA9A9A9A8A8A8B1B1B18F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF2F803B7AD7AD73D5A998E6C2217329FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF939393AAAAAAA9A9A9B0B0B08F8F8FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F803B7AD7AD8DE3BB24762D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF939393AA
        AAAAAEAEAE909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF2F803B84E0B6277932FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF939393ACACAC919191FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F803B2B7C36FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93939392
        9292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnClick = btnProximoClick
    end
    object btnRelatorio: TBitBtn
      Tag = 1
      Left = 701
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Relat'#243'rio (F9)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5BEC3035C8100
        5B84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDCDCDC949494929292FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF8F8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8
        FAFAFAFDFDFDB5BEC30C6E8C005B84005B84FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFDFDFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
        FCFCFCFCFCFCFCFCFDFDFDFFFFFFDCDCDC999999929292929292FFFFFFFFFFFF
        FFFFFFFDFDFDEDEDEDCECECEB58158B48056B48055B47F55B47F55B48055B480
        55B47F55B38056B48056B48056B58158CECECEB4BABA0A5F7A0069910F6287CA
        CACAFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E7E7E7A2A2A2A0A0A0A0A0A0A0A0A0
        A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A2A2A2E7E7E7DBDBDB9696
        96949494989898E5E5E5FFFFFFAAABAB7171716E6F6F5B5B5B333333B18057F3
        DEC5F4DEC5F3DDC5F3DEC5F4DDC5F4DEC5F3DEC5F4DEC5F3DDC5F3DEC7B27F57
        2A2A2A0A34480053770788B176797BFFFFFFFFFFFFC6C6C6A1A1A1A0A0A09B9B
        9B8F8F8FA0A0A0B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7A0A0A08C8C8C8B8B8B9090909A9A9AAEAEAEFFFFFFFFFFFF686868
        6162625E5F5F4849491B1B1BB38158F9EADAF8EADAF8EADAF8E9DAF8EADAF8EA
        DAF2E4D4E4D6C7EDE0D1F8E9DAB381580053770053770685AE414B4F646565FF
        FFFFFFFFFF9B9B9B989898979797929292868686A1A1A1BABABABABABABABABA
        BABABABABABABABABAB8B8B8B5B5B5B7B7B7BABABAA1A1A19090909090909A9A
        9A9292929A9A9AFFFFFFFFFFFF8E8F8F878888838484636464232323B4845BFB
        F1E7FBF2E7FBF1E7FBF1E7E6DDD5A088749A6C448E5F36A773459991766A6348
        003E4E042A3D5A62658788888B8C8CFFFFFFFFFFFFA7A7A7A1A1A1A0A0A09898
        98888888A1A1A1BCBCBCBCBCBCBCBCBCBCBCBCB7B7B7A2A2A29B9B9B9898989D
        9D9DA2A2A29797978B8B8B888888989898A1A1A1A4A4A4FFFFFFFFFFFF949495
        8D8D8E89898A69696A272727B6875FFBF2E7FBF1E7FBF1E7DED6CCCFA06CF0DC
        C0F4E6D1F7ECDCF5E7D8F3E2CBE4CDAE23493E68686989898A8D8D8E919192FF
        FFFFFFFFFFA9A9A9A3A3A3A2A2A29A9A9A898989A2A2A2BCBCBCBCBCBCBCBCBC
        B5B5B5A7A7A7B6B6B6B8B8B8BABABAB9B9B9B8B8B8B2B2B28E8E8E9A9A9AA2A2
        A2A3A3A3A6A6A6FFFFFFFFFFFF9B9B9C95959692929378787943434429292A26
        26272626272626276D492BFCF9F5FCF8F4FFFFFFFFFFFFFFFFFFFEFBF8FCF8F4
        A48C6676767792929395959699999AFFFFFFFFFFFFAAAAAAA5A5A5A4A4A49E9E
        9E9090908A8A8A898989898989898989929292BEBEBEBEBEBEBFBFBFBFBFBFBF
        BFBFBEBEBEBEBEBEA1A1A19D9D9DA4A4A4A5A5A5A8A8A8FFFFFFFFFFFFA9A9AA
        A4A4A5A3A3A49898998484857A7A7B7979797979796C6B6BDBBB94F7EDDFFFFE
        FCFFFEFCFFFFFFFFFFFFFFFFFFF9F4EAF7EDDF7C7975A3A3A4A4A4A5A7A7A8FF
        FFFFFFFFFFAEAEAEA9A9A9A8A8A8A6A6A6A1A1A19E9E9E9E9E9E9E9E9E9A9A9A
        AEAEAEBABABABFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBCBCBCBABABA9E9E9EA8A8
        A8A9A9A9ACACACFFFFFFFFFFFFBCBCBCB8B8B8B8B8B8B7B7B7B4B4B4B3B3B3B3
        B3B3B3B3B3979390E0BB8CF5E7D6FFFFFFFEFBF8FEFBF8FEFBF8FCF8F4FCF7F1
        F1DFC4948579B8B8B8B8B8B8BBBBBBFFFFFFFFFFFFB3B3B3AEAEAEAEAEAEADAD
        ADADADADACACACACACACACACACA4A4A4ADADADB9B9B9BFBFBFBEBEBEBEBEBEBE
        BEBEBEBEBEBDBDBDB7B7B7A1A1A1AEAEAEAEAEAEB1B1B1FFFFFFFFFFFFCFCFCF
        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCA9A5A1D3A46CEEDABCF7EC
        DCF7ECDCF8EEE1F7EDDFF9F3E7F8F0E3E2C093A19287EAEAEAEAEAEACECECEFF
        FFFFFFFFFFB8B8B8B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3A9A9A9
        A8A8A8B5B5B5BABABABABABABBBBBBBABABABCBCBCBBBBBBAFAFAFA4A4A4BABA
        BABABABAB6B6B6FFFFFFFFFFFFDDDDDDDADADADADADADADADA3F3F3F3F3F3F3F
        3F3F3F3F3F3A3A3AAF7E49D4A66EE5C399E9CFA8EEDABCF5E9D8F7EADAE7CBA3
        CF9E65B1AEACC4C4C4C4C4C5DCDCDCFFFFFFFFFFFFBBBBBBB6B6B6B6B6B6B6B6
        B68F8F8F8F8F8F8F8F8F8F8F8F8E8E8E9F9F9FA8A8A8B0B0B0B2B2B2B5B5B5B9
        B9B9BABABAB1B1B1A6A6A6ABABABB1B1B1B1B1B1B9B9B9FFFFFFFFFFFFE0E0E0
        DEDEDEDEDEDEDEDEDE494949626262747474909090B0B0B09C8A7EB57E43C791
        56D4A66EE6C79DF0DBBFDEB785BD864A74553BDEDEDE8B8C8B8B8B8BE0E0E0FF
        FFFFFFFFFFBBBBBBB7B7B7B7B7B7B7B7B79292929898989D9D9DA4A4A4ACACAC
        A3A3A39F9F9FA3A3A3A8A8A8B0B0B0B6B6B6ACACACA1A1A1959595B7B7B7A2A2
        A2A2A2A2BABABAFFFFFFFFFFFFD0D0D0CDCDCDCDCDCDCDCDCD53545462626275
        7574909090B0B0B0CECECFAD9785AB723BB37A40BD874BBD864AAE743B826349
        4F4F50CDCDCDCDCDCDCDCDCDCFCFCFFFFFFFFFFFFFB8B8B8B3B3B3B3B3B3B3B3
        B39494949898989D9D9DA4A4A4ACACACB3B3B3A6A6A69C9C9C9E9E9EA1A1A1A1
        A1A19D9D9D999999939393B3B3B3B3B3B3B3B3B3B6B6B6FFFFFFFFFFFF979797
        7070707070706F6F6F5E5E5E5E5D5E5D5D5D5E5E5E5E5E5E5E5E5E5E5E5E605B
        587E6A568A6A4A856F58665F5A5E5E5E5E5E5E6F6F6F7070707070708E8E8EFF
        FFFFFFFFFFB3B3B39D9D9D9D9D9D9C9C9C979797979797979797979797979797
        9797979797979696969A9A9A9A9A9A9B9B9B9797979797979797979C9C9C9D9D
        9D9D9D9DAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090777777CDA882F6
        EDE6F5EEE6F6EDE7F5EEE7F6EEE7F6EDE7F6EEE7F5EEE6F6EDE7F5EEE6CDA782
        777777909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF
        AF9D9D9DA9A9A9BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBA9A9A99D9D9DAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8C8C8C7A7A7ACFAB86F4EDE5F4EDE6F4EDE5F4EDE5F5EDE5F4ED
        E6F4EDE6F5EDE5F4EDE6F5EDE6CFAA867A7A7A8C8C8CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFABABAB9E9E9EAAAAAABBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBAAAAAA9E9E9EABABABFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A7C7B7CD1AD89F4
        ECE5F4ECE4F4ECE5F4ECE5F4ECE5F4ECE4F4ECE5F4ECE4F4ECE4F4ECE4D1AD89
        7C7B7C8A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9
        A99E9E9EABABABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBABABAB9E9E9EA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8888887C7C7CD3B08CF3EBE3F3EBE3F3EBE3F3EBE4F4EBE4F3EC
        E4F4ECE3F3EBE4F3EBE3F4EBE3D3B18C7C7C7C888888FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A89F9F9FABABABBABABABABABABABABA
        BABABABABABABABABABABABABABABABABABABABABAACACAC9F9F9FA8A8A8FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393937C7C7CD4B38FF1
        E9E0F2E9DFF2E9E0F2E9DFF2E8DFF2E9DFF2E9DFF1E9E0F2E9E0F2E9DFD5B38F
        7C7C7C939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
        B09F9F9FACACACBABABABABABABABABABABABABABABABABABABABABABABABABA
        BABABABABAACACAC9F9F9FB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F9F9868686D5B591EFE3D5F0E3D5F0E3D5EFE3D5EFE3D5EFE3
        D5F0E3D6EFE3D5F0E3D6F0E3D5D6B691868686F9F9F9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBA7A7A7ACACACB8B8B8B8B8B8B8B8B8
        B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8ADADADA7A7A7FBFBFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D9BA96EE
        DFCDEEDFCDEEDFCDEEDFCDEEDFCDEEDECEEEDFCDEEDFCDEEDFCEEEDFCED9BB96
        F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF9F9F9AFAFAFB7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7AFAFAFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDBBC99DABA96DABA96DABA96DABA96DABA96DABA
        96DABA96DABA96DABA96DABA96DBBC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0AEAEAEAEAEAEAEAEAE
        AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEB0B0B0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
      OnClick = btnRelatorioClick
    end
    object btnAltera: TBitBtn
      Tag = 1
      Left = 501
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Altera (F3)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCFCFCEAEAEACACACA9B94A98169A7856BACA090BDF2
        F1F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5E5E5E5C2C2C2A8A8
        A8A8A8A8C0C0C0F8F8F8FFFFFF92654492654492664492664492664392654492
        6644926644926543926643926543926644926543926644906442845C3D6F4D33
        918176A2A2A2978FA5AF9CD38D71C5A193C8FFFFFF9A9A9A9A9A9A9A9A9A9A9A
        9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A99
        9999979797939393A0A0A0A8A8A8A6A6A6ADADADA5A5A5C2C2C2FFFFFF946744
        E3CAACE4CAACE3CBACE3CBACE3CBACE4CAADE3CAADE4CAADE4CBACE4CAADE4CA
        ACE4CBACDEC5A8CBB399A595806592AA88A7BF8081828E8E90D2D2D89A8DD180
        70D0FFFFFF9A9A9AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
        B2B2B2B2B2B2B2B2B2B2B2B2B0B0B0ACACACA4A4A4A2A2A2A9A9A9A0A0A0A3A3
        A3B5B5B5AAAAAAABABABFFFFFF956845E5CCAFE4CCAFE4CCAFE5CCAFE5CCAFE4
        CCAEE4CCAFE4CCAFE4CCAFE4CCAFE3CBAEDBC4A8C4B0979B9182368EC02099F0
        2C9BF766AFF3D9DCE38383867272766860CDFFFFFF9A9A9AB2B2B2B2B2B2B2B2
        B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B0B0B0ABABABA3
        A3A3A0A0A0A3A3A3A5A5A5ABABABB7B7B7A1A1A19C9C9CA3A3A3FFFFFF976945
        E5CFB2E5CEB2A8744DA8744DA8744DE5CFB2A8744DA8744DA8744DA7734C9F6E
        498B6040615B53208CCF2099F12D9BF8389FFE47A8FF73BAF06C737735353576
        76A7FFFFFF9B9B9BB3B3B3B3B3B39E9E9E9E9E9E9E9E9EB3B3B39E9E9E9E9E9E
        9E9E9E9D9D9D9C9C9C9898989696969F9F9FA3A3A3A5A5A5A7A7A7A9A9A9ADAD
        AD9C9C9C8D8D8DB1B1B1FFFFFF996A46E6D1B6E6D1B5E6D1B6E6D0B6E6D0B6E6
        D1B6E6D0B6E6D0B6E3CEB3D6C0A9B8A692768A8F1F95DF239AF22E9CF93AA0FE
        48A9FF58B6FB68C4F76294A8454545ECECF0FFFFFF9B9B9BB3B3B3B3B3B3B3B3
        B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3AFAFAFA9A9A9A1A1A1A1A1A1A3
        A3A3A5A5A5A7A7A7A9A9A9ABABABADADADA2A2A2979797F4F4F4FFFFFF9A6C47
        E7D3BAE7D3BAE7D3B9E7D3BAE7D3BAE7D3BAE7D3B9E3D0B7D3C1AAB2A38F5C8B
        A01A97E82499F3309CFA3BA0FE4AABFE5AB8FA6AC7F683D6F98DCDF1DEDEDEFF
        FFFFFFFFFF9B9B9BB4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B3B3B3
        AFAFAFA8A8A8A0A0A0A2A2A2A4A4A4A5A5A5A7A7A7A9A9A9ABABABADADADB1B1
        B1B9B9B9EDEDEDFFFFFFFFFFFF9D6D48E8D6BEE8D6BEA8744DA8744DA8744DA8
        744DA5724B9768457D583A39708C1998EB259AF3319CFB3EA2FF4CACFE5CB9FA
        6CC8F685D7FA86D1FCE2EEF6FEFEFEFFFFFFFFFFFF9C9C9CB5B5B5B5B5B59E9E
        9E9E9E9E9E9E9E9E9E9E9D9D9D9B9B9B969696999999A2A2A2A4A4A4A6A6A6A7
        A7A7A9A9A9ABABABAEAEAEB1B1B1B6B6B6F0F0F0FFFFFFFFFFFFFFFFFF9F6E49
        E9D9C3E9D9C2E9D9C3E9D9C3E9D9C3E8D8C2D6C5B2AC9F9069A9C947B1F132A0
        F5329DFB3FA2FF4FAEFD5DBBF96EC9F687D8FB84CEFADDEBF5FEFEFEFFFFFFFF
        FFFFFFFFFF9C9C9CB5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B1B1B1A7A7A7
        A7A7A7A8A8A8A5A5A5A6A6A6A8A8A8AAAAAAACACACAEAEAEB2B2B2B7B7B7EDED
        EDFFFFFFFFFFFFFFFFFFFFFFFFA1704AEBDBC8EBDCC9EADBC8EADCC8EBDBC9E3
        D5C1C1B4A4919998C1EEFFD2F4FFB7E9FF5DB5FF50AFFD60BDF96FCAF688D9FB
        78C5F7D2E6F5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CB6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B4B4B4ACACACA5A5A5B9B9B9BBBBBBB7B7B7ACACACAAAAAAAC
        ACACAEAEAEB2B2B2AFAFAFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3724A
        EBDECDEBDECDA8744DA8744DA8744D9D6C487C56397A96A0CDF3FFD8F8FFD5F7
        FFBDEDFF73C9FA75CEF689D9FC76C5F8897B71FEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9D9D9DB7B7B7B7B7B79E9E9E9E9E9E9E9E9E9C9C9C969696A4A4A4
        BABABABBBBBBBBBBBBB8B8B8AFAFAFAFAFAFB2B2B2AEAEAE9F9F9FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA6734BEDE1D2EDE1D1ECE1D1EDE1D2EBDFCFD1
        C7B79D958A97D2EDC7F3FFCAF4FFCAF4FFC8F3FFA2E3FE8BD9FD6EC4FEB5CAD4
        A5714AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DB8B8B8B7B7B7B7B7
        B7B8B8B8B7B7B7B1B1B1A5A5A5B1B1B1BABABABABABABABABABABABAB5B5B5B2
        B2B2AEAEAEB1B1B19D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8744C
        EEE5D6EEE4D6EEE4D6EEE4D6E6DCCEBFB8AC84837E8FA2A7AFDCE9BAEFFFBAEF
        FFBAEFFF9FE2FF66BDFAAFC8D8ECE2D4A8754CFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9E9E9EB8B8B8B8B8B8B8B8B8B8B8B8B6B6B6ADADADA0A0A0A7A7A7
        B4B4B4B8B8B8B8B8B8B8B8B8B5B5B5ADADADB1B1B1B8B8B89E9E9EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFAA764DEFE7DAEFE7DAA8744DA8744D9C6C477C
        56396E6A657979796F8084ACEBFFAAEAFFA6E8FF7ECEFA867B74EDE5D8EFE7DA
        AB764DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EB9B9B9B9B9B99E9E
        9E9E9E9E9B9B9B9696969A9A9A9E9E9E9E9E9EB7B7B7B6B6B6B6B6B6B0B0B09F
        9F9FB8B8B8B9B9B99E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD774E
        F0EADEF0EADEF0E9DEF0E9DEE0D9CFBBB7AE4A4947323130515B5C9CC9DBA6C9
        D4BCCED2D6D9D7EEE7DCF0E9DFF0EADEAD774EFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9E9E9EBABABABABABAB9B9B9B9B9B9B6B6B6ADADAD9292928C8C8C
        969696B0B0B0B0B0B0B2B2B2B5B5B5B9B9B9BABABABABABA9E9E9EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFAE794FF1ECE1F1ECE2A8744DA8744DA4714BDF
        DAD1D9D5CCDBD7CFE0DBD2E5E0D6E9E5DBEEE9DEF0EAE1F1ECE2F1ECE2F1EBE2
        AE794FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FBABABABABABA9E9E
        9E9E9E9E9D9D9DB6B6B6B4B4B4B5B5B5B6B6B6B7B7B7B8B8B8B9B9B9BABABABA
        BABABABABABABABA9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB07A50
        F1EEE6F2EEE5A8744DA8744DA8744DF1EEE5F2EEE5A8744DA8744DA8744DA874
        4DA8744DA8744DA8744DF1EEE5F2EEE6B07950FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9F9F9FBBBBBBBBBBBB9E9E9E9E9E9E9E9E9EBBBBBBBBBBBB9E9E9E
        9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EBBBBBBBBBBBB9F9F9FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB17B50F3EFE7F3F0E8F2EFE8F2F0E8F3EFE8F2
        F0E8F2EFE7F3EFE8F3F0E8F2F0E8F2EFE8F2F0E7F2F0E8F3F0E7F3F0E8F3F0E8
        B17A50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBB9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E3C19
        AEA27FAEA27FAEA27FAEA27FAEA27FAEA27FAEA27FAEA27FAEA27FAEA27FAEA2
        7FAEA27FAEA27FAEA27FAEA27FAEA27F7E3B19FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF919191A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6
        A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6919191FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF947960947960967960957960977A5F987B5F99
        7B5F9A7C5F9A7C5E9C7C5E9D7D5D9E7E5D9E7F5C9F7E5CA0805CA1805CA2805B
        A4825BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E9E9E9E9E9E9E9E9E
        9E9E9E9E9E9E9E9E9E9E9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
        9F9F9F9F9F9F9F9FA0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF927861
        DEBFA1DBBC9CD8B897D6B492D3AF8DD0AA88CCA582CAA07CC59C77C29772C093
        6CBD8F67BA8A62B8865EB68359B47F55A2805BFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9E9E9EAFAFAFAEAEAEADADADADADADABABABAAAAAAA9A9A9A8A8A8
        A7A7A7A6A6A6A5A5A5A4A4A4A3A3A3A2A2A2A1A1A1A0A0A09F9F9FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF917761E4CBB1E2C8ADDFC4A9DEC1A5DBBDA0D8
        B99CD7B697D3B192D1AD8ECEA989CBA584C9A080C59D7BC39A77C19674BF9470
        A0805CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EB2B2B2B1B1B1B1B1
        B1B0B0B0AFAFAFAEAEAEADADADACACACABABABAAAAAAA9A9A9A8A8A8A7A7A7A7
        A7A7A6A6A6A5A5A59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF917761
        F7EFE6F6EEE5F5EDE4F5ECE3F4EBE1F3E9E0F2E8DFF1E7DDF0E6DBEFE4DAEFE3
        D8EEE1D7EDE0D5ECDFD4ECDED2EBDDD19F7E5CFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9E9E9EBBBBBBBBBBBBBBBBBBBBBBBBBABABABABABABABABAB9B9B9
        B9B9B9B9B9B9B8B8B8B8B8B8B8B8B8B7B7B7B7B7B7B7B7B79F9F9FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF9D8774A08A78A08A78A18A77A18A77A28B77A3
        8B76A28B76A48B75A58B76A58C75A68D74A68D75A78D75A98D75A98E73AB8F74
        9D7D5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2A2A2A2A2A2A2A2A2
        A2A2A2A2A3A3A3A3A3A3A2A2A2A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3
        A3A3A3A3A3A3A3A39F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
      OnClick = btnAlteraClick
    end
    object btnNovo: TBitBtn
      Tag = 1
      Left = 401
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Novo (F2)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        9366459366459367459367459367449367449366459367459367459366449367
        44936644936745936644936644936745936744936744936744936744FFFFFFFF
        FFFFFFFFFFFFFFFF9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A
        9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A
        9A9A9A9AFFFFFFFFFFFFFFFFFFFFFFFF946745E9D7C1E9D7C1E9D7C1E9D7C1E9
        D7C1E9D7C1E9D7C1E9D7C1E9D7C1E8D7C1E8D7C1E8D7C1E8D7C1E8D7C1E8D7C1
        E8D7C1E8D7C1E8D7C1936745FFFFFFFFFFFFFFFFFFFFFFFF9A9A9AB5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59A9A9AFFFFFFFFFFFFFFFFFFFFFFFF
        956945E8D8C3E8D8C3E8D8C3E8D8C3E8D8C3E8D8C3E8D8C3E8D8C3E8D8C3E9D8
        C3E9D8C3E9D8C3E9D8C3E9D8C3E9D8C3E9D8C3E9D8C3E9D7C3956846FFFFFFFF
        FFFFFFFFFFFFFFFF9A9A9AB5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B59A9A9AFFFFFFFFFFFFFFFFFFFFFFFF976946E9D9C4E9D9C4E9D9C4E9D9C4E9
        D9C4E9D9C4E9D9C4E9D9C4E9D9C4E9D8C5E9D8C5E9D8C5E9D8C5E9D8C5E9D8C5
        E9D8C5E9D8C5E9D9C4976946FFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59B9B9BFFFFFFFFFFFFFFFFFFFFFFFF
        986A46E9DAC6E9DAC6E9DAC6E9DAC6E9DAC6E9DAC6E9DAC6E9DAC6E9DAC6EADA
        C6EADAC6EADAC6EADAC6EADAC6EADAC6EADAC6EADAC6E9D9C6986A46FFFFFFFF
        FFFFFFFFFFFFFFFF9B9B9BB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B69B9B9BFFFFFFFFFFFFFFFFFFFFFFFF9A6B47EADCC8EADCC8EADCC8EADCC8EA
        DCC8EADCC8EADCC8EADCC8EADCC8EBDBC8EBDBC8EBDBC8EBDBC8EBDBC8EBDBC8
        EBDBC8EBDBC8EBDBC89A6B47FFFFFFFFFFFFFFFFFFFFFFFF9B9B9BB6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B69B9B9BFFFFFFFFFFFFFFFFFFFFFFFF
        9A6C48EADCCAEADCCAEADCCAEADCCAEADCCAEADCCAEADCCAEADCCAEADCCAEADD
        CAEADDCAEADDCAEADDCAEADDCAEADDCAEADDCAEADDCAEADCCA9B6C48FFFFFFFF
        FFFFFFFFFFFFFFFF9B9B9BB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
        B69B9B9BFFFFFFFFFFFFFFFFFFFFFFFF9C6E48EBDECCEBDECCEBDECCEBDECCEB
        DECCEBDECCEBDECCEBDECCEBDECCEBDECCEBDECCEBDECCEBDECCEBDECCEBDECC
        EBDECCEBDECCECDECC9D6D49FFFFFFFFFFFFFFFFFFFFFFFF9C9C9CB7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B79C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
        9F6E49ECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECDF
        CFECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECDFCFECE0CF9F6D49FFFFFFFF
        FFFFFFFFFFFFFFFF9C9C9CB7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B79C9C9CFFFFFFFFFFFFFFFFFFFFFFFFA06F4AECE1D1ECE1D1ECE1D1ECE1D1EC
        E1D1ECE1D1ECE1D1ECE1D1ECE1D1EDE1D1EDE1D1EDE1D1EDE1D1EDE1D1EDE1D1
        EDE1D1EDE1D1ECE1D1A06F49FFFFFFFFFFFFFFFFFFFFFFFF9C9C9CB7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B79C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
        A2714BEDE3D4EDE3D4EDE3D4EDE3D4EDE3D4EDE3D4EDE3D4EDE3D4EDE3D4EDE3
        D3EDE3D3EDE3D3EDE3D3EDE3D3EDE3D3EDE3D3EDE3D3EDE3D4A2714AFFFFFFFF
        FFFFFFFFFFFFFFFF9D9D9DB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
        B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
        B89D9D9DFFFFFFFFFFFFFFFFFFFFFFFFA3724BEEE4D6EEE4D6EEE4D6EEE4D6EE
        E4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6EEE4D6
        EEE4D6EEE4D6EEE4D6A4724BFFFFFFFFFFFFFFFFFFFFFFFF9D9D9DB8B8B8B8B8
        B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
        B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B89D9D9DFFFFFFFFFFFFFFFFFFFFFFFF
        A5744BEFE6D8EFE6D8EFE6D8EFE6D8EFE6D8EFE6D8EFE6D8EFE6D8EFE6D8EEE6
        D8EEE6D8EEE6D8EEE6D8EEE6D8EEE6D8EEE6D8EEE6D8EEE6D8A6724BFFFFFFFF
        FFFFFFFFFFFFFFFF9D9D9DB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
        B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
        B99D9D9DFFFFFFFFFFFFFFFFFFFFFFFFA8744CEFE8DCEFE8DCEFE8DCEFE8DCEF
        E8DCEFE8DCEFE8DCEFE8DCEFE8DCEFE7DBEFE7DBEFE7DBEFE7DBEFE7DBEFE7DB
        EFE7DBEFE7DBF0E7DCA7744CFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EB9B9B9B9B9
        B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
        B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B99D9D9DFFFFFFFFFFFFFFFFFFFFFFFF
        A9754DEFE9DDEFE9DDEFE9DDEFE9DDEFE9DDEFE9DDEFE9DDEFE9DDEFE9DDF0E9
        DEDDD1C2D1C1B0CDBBAACCB9A8D0C0AFDACDBEDFD3C5E6DBCDA8764DFFFFFFFF
        FFFFFFFFFFFFFFFF9E9E9EB9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9
        B9B9B9B9B9B9B9B9B9B4B4B4B0B0B0AEAEAEAEAEAEAFAFAFB3B3B3B4B4B4B6B6
        B69E9E9EFFFFFFFFFFFFFFFFFFFFFFFFAA774EF0EBE0F0EBE0F0EBE0F0EBE0F0
        EBE0F0EBE0F0EBE0F0EBE0F0EBE0F1EBE0C5B19EBCA691BCA691BCA691BCA691
        BCA691BCA691BBA591915F37FEFEFEFFFFFFFFFFFFFFFFFF9E9E9EBABABABABA
        BABABABABABABABABABABABABABABABABABABABABABABABABAACACACA9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9989898FFFFFFFFFFFFFFFFFFFFFFFF
        AD784FF1ECE2F1ECE2F1ECE2F1ECE2F1ECE2F1ECE2F1ECE2F1ECE2F1ECE2F1EC
        E2C9B8A7CD9162C98D5EC3875ABC8154B47A4EAC7347A36A409A6238FFFFFFFF
        FFFFFFFFFFFFFFFF9F9F9FBABABABABABABABABABABABABABABABABABABABABA
        BABABABABABABABABAAEAEAEA5A5A5A4A4A4A3A3A3A1A1A19F9F9F9D9D9D9B9B
        9B999999FFFFFFFFFFFFFFFFFFFFFFFFAF794FF1EDE4F1EDE4F1EDE4F1EDE4F1
        EDE4F1EDE4F1EDE4F1EDE4F1EDE4F1EDE4CEBFAFC98D5FE9D7C1E9D7C1EBDBC8
        EDE1D2F0E7DCF1ECE2FBF9F6FFFFFFFFFFFFFFFFFFFFFFFF9F9F9FBABABABABA
        BABABABABABABABABABABABABABABABABABABABABABABABABAAFAFAFA4A4A4B5
        B5B5B5B5B5B6B6B6B8B8B8B9B9B9BABABAE9E9E9FFFFFFFFFFFFFFFFFFFFFFFF
        AF7A50F2EFE5F2EFE5F2EFE5F2EFE5F2EFE5F2EFE5F2EFE5F2EFE5F2EFE5F2EE
        E6D4C6B8C4895BE9D7C1EADBC8EDE1D1EFE7DBF1ECE2FAF8F4FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9F9F9FBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBB1B1B1A3A3A3B5B5B5B6B6B6B7B7B7B9B9B9BABABAE5E5
        E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB17B51F2EFE7F2EFE7F2EFE7F2EFE7F2
        EFE7F2EFE7F2EFE7F2EFE7F2EFE7F2EFE7D8CCBFBF8456EBDBC8EDE2D2EFE8DB
        F1ECE2F9F7F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB2B2B2A2A2A2B6
        B6B6B8B8B8B9B9B9BABABAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B27C51F3F0E8F3F0E8F3F0E8F3F0E8F3F0E8F3F0E8F3F0E8F3F0E8F3F0E8F3F0
        E9DED4C9B87E51EDE1D1EFE8DBF1ECE2F8F6F0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9F9F9FBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBB4B4B4A0A0A0B7B7B7B9B9B9BABABADCDCDCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB37D52F3F1EAF3F1EAF3F1EAF3F1EAF3
        F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAE2DAD0B1774BEFE7DBF1ECE2F7F4EE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0BBBBBBBBBB
        BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB6B6B69E9E9EB9
        B9B9BABABAD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B57D52F3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1EAF3F1
        EAEBE6DDA97145F1ECE2F6F3ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA0A0A0BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBBBB9B9B99D9D9DBABABAD1D1D1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB57D52B57D52B57D52B57D52B57D52B5
        7D52B57E52B57D52B57D52B57D52B57D52B57D52A2693FF8F6F0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0A0A0A0A0A0
        A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09B9B9BDC
        DCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = btnNovoClick
    end
    object btnUltimo: TBitBtn
      Left = 301
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&'#218'ltimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF176B1D176B1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8D8D8D8DFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF196D1FBEF1D95ACD
        99196D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        8D8D8DB6B6B6A6A6A68D8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF1B6F22B8EFD55ED09D5ED09D59CC971B6F22FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8EB5B5B5A6A6A6A6A6A6A5A5A58E8E8EFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E7126AFECD063D19F63D19F63D1
        9F63D19F58C9931E7126FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FB3B3B3
        A6A6A6A6A6A6A6A6A6A6A6A6A4A4A48F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21
        7329A4E9C967D2A267D2A267D2A267D2A267D2A267D2A257C690217329FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8F8F8FB1B1B1A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A3
        A3A38F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF24762D98E6C26DD4A66DD4A66DD4A66DD4A66DD4
        A66DD4A66DD4A66DD4A658C38E24762DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090B0B0B0A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A3A3A3909090FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2779328DE3BB73
        D5A973D5A973D5A973D5A973D5A973D5A973D5A973D5A973D5A973D5A958BF89
        277932FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF919191AEAEAEA9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A2A2A2919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF2B7C3684E0B67AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7
        AD7AD7AD7AD7AD7AD7AD7AD7AD7AD7AD58BA842B7C36FBFCFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF929292ACACACAAAAAAAAAAAAAAAAAAAAAAAA
        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA1A1A1929292FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F803B2F803B2F803B2F
        803B2F803B80D9B180D9B180D9B180D9B180D9B168CD9D2F803B2F803B2F803B
        2F803B2F803BEBEEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393
        93939393939393939393939393ABABABABABABABABABABABABABABABA6A6A693
        9393939393939393939393939393F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF36854388DBB688DBB688DBB688DB
        B688DBB66FCFA1338340FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696ACACAC
        ACACACACACACACACACACACACA7A7A7949494FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF3989488FDDBA8FDDBA8FDDBA8FDDBA8FDDBA75D0A3368745FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF979797ADADADADADADADADADADADADADADADA8A8A895
        9595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E8C4E94DDBD96DEBE96DEBE96DE
        BE96DEBE7AD0A63B8A4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF989898AEAEAE
        AEAEAEAEAEAEAEAEAEAEAEAEA9A9A9969696FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF41905398DEBF9DE0C29DE0C29DE0C29DE0C280D1A93E8E50FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF999999AFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAAAAAA97
        9797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4593579ADFC0A5E2C7A5E2C7A5E2
        C7A5E2C787D1AC429155FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AAFAFAF
        B1B1B1B1B1B1B1B1B1B1B1B1ABABAB989898FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF49975C99DEC0ABE4CBABE4CBABE4CBABE4CB8CD2AE46955AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9B9B9BAFAFAFB2B2B2B2B2B2B2B2B2B2B2B2ABABAB99
        9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D9A6097DDBEB2E6CFB2E6CFB2E6
        CFB2E6CF91D3B14A985EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9CAEAEAE
        B3B3B3B3B3B3B3B3B3B3B3B3ACACAC9A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF509D6592DBBAB8E7D2B8E7D2B8E7D2B8E7D296D3B24D9B63FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9D9D9DADADADB4B4B4B4B4B4B4B4B4B4B4B4ACACAC9B
        9B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53A0698CD8B6BEE9D6BEE9D6BEE9
        D6BEE9D69BD4B5509E67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EACACAC
        B5B5B5B5B5B5B5B5B5B5B5B5ADADAD9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF56A26C84D5B1C2EAD9C2EAD9C2EAD9C2EAD99ED5B753A06AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9F9F9FABABABB5B5B5B5B5B5B5B5B5B5B5B5AEAEAE9D
        9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58A37085BD9D85BD9D85BD9D85BD
        9D85BD9D85BD9D56A26EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9EA7A7A7
        A7A7A7A7A7A7A7A7A7A7A7A7A7A7A79D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF58A47158A47158A47158A47158A47158A47158A47158A471FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E
        9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btnUltimoClick
    end
    object btnSair: TBitBtn
      Left = 1003
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alRight
      Caption = '&Sair'
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00044534386B5457837679
        9C9799B4B9BBCCD8D9E3F5F6F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686
        9F9F9FAEAEAEBEBEBECECECEDEDEDEEDEDEDFBFBFBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C317C0C
        317C0C317C000A4D3B68AC33599D3152962B488C21397D15286C0A185C020C4F
        010D5103125704165D061C6507236B092872FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9090909090909090908787879B9B9B9898989797979595959191918E
        8E8E8A8A8A8787878787878989898A8A8A8B8B8B8D8D8D8E8E8EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0A317D0C0D0F0C0D0F0011564477BB4F82C75A8D
        D26295DA6699DE6598DD679ADF6497DC6295DA5787CC426EB32E55991D3F8400
        1257FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F838383838383888888
        9F9F9FA2A2A2A4A4A4A6A6A6A7A7A7A7A7A7A8A8A8A7A7A7A6A6A6A3A3A39D9D
        9D979797929292888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C35820E
        10120E0F120018613467AB3164A8396CB03F72B6487BBE5184C85A8DD25A8DD2
        5E91D65E91D65689CE4679BD3D70B4001962FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9090908484848383838A8A8A9B9B9B9A9A9A9C9C9C9D9D9DA0A0A0A2
        A2A2A4A4A4A4A4A4A5A5A5A5A5A5A3A3A39F9F9F9D9D9D8A8A8AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0E3986101214111114001F6A3366AA295CA0295C
        A0285B9F275A9E376AAC6295DB315FAB25589C275A9E2A5DA13063A6396CB000
        206BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9191918484848484848B8B8B
        9A9A9A9898989898989898989797979B9B9BA6A6A69A9A9A9797979797979898
        989A9A9A9C9C9C8B8B8BFFFFFFFFFFFFFFFFFFF9FCFAFFFFFFFFFFFF113F8B13
        141713131700226D3467AB2A5DA12B5EA22B5EA22B5EA23363A95F92D7305EA8
        2B5EA22B5EA22B5EA22B5CA03A6CB100236EFFFFFFFFFFFFFFFFFFFCFCFCFFFF
        FFFFFFFF9292928585858585858B8B8B9B9B9B9898989898989898989898989A
        9A9AA6A6A69999999898989898989898989898989C9C9C8C8C8CFFFFFFFFFFFF
        FFFFFF002FE6FFFFFFFFFFFF13429015161A14161A0024703467AB2A5DA12B5E
        A22B5EA22A5DA12E5CA25A8DD22E5CA52B5EA22B5EA22B5EA22655993B6DB200
        2571FFFFFFFFFFFFFFFFFF979797FFFFFFFFFFFF9393938585858585858C8C8C
        9B9B9B989898989898989898989898999999A4A4A49999999898989898989898
        989797979C9C9C8C8C8CFFFFFFFFFFFFFFFFFF002FE60018DAFFFFFF16469417
        181D16191E0026723467AB295CA02B5EA22B5EA2295B9F28569B5588CD2C59A2
        2B5EA22B5EA22B5EA22350943D6FB4012773FFFFFFFFFFFFFFFFFF9797979494
        94FFFFFF9494948686868686868C8C8C9B9B9B98989898989898989898989897
        9797A3A3A39898989898989898989898989595959D9D9D8C8C8CFFFFFFFFFFFF
        FFFFFF002FE61569FF0109CB184A9A191B21191B200028753568AC295CA02B5E
        A22B5EA2245297204A905083C82B579F2B5EA22B5EA22B5DA11E488C3E70B501
        2976FFFFFFFFFFFFFFFFFF9797979F9F9F9191919595958787878787878D8D8D
        9B9B9B989898989898989898969696949494A2A2A29898989898989898989898
        989494949D9D9D8D8D8D0033EE0033EE0033EE002FE61669FF095EFE0400B41B
        1E231B1E23002A783669AD295CA0295B9F245296194085163C844B7EC328549D
        2B5EA22A5CA023509413387B4072B7012B799898989898989898989797979F9F
        9F9D9D9D8F8F8F8787878787878D8D8D9B9B9B98989898989896969692929291
        9191A1A1A19797979898989898989595959090909E9E9E8D8D8D0033EE5DA2FF
        3F87FF2876FF1569FF095EFE0055FE08009D1E2026002C7A2B599F1D478A1B44
        88153B7F0E2C700E2E75487BC026529A1D498D1A438713367A0B286C4274B901
        2D7B989898AAAAAAA5A5A5A2A2A29F9F9F9D9D9D9C9C9C8D8D8D8888888D8D8D
        9898989393939393939191918E8E8E8E8E8EA0A0A09696969494949393939090
        908D8D8D9E9E9E8E8E8E0033EE599FFF4089FF2874FF1568FF095EFE0055FE00
        52FD070081002E7D142669142669477ABF477ABF477ABF477ABF477ABF477ABF
        477ABF477ABF477ABF477ABF4376BB012F7E989898A9A9A9A6A6A6A2A2A29F9F
        9F9D9D9D9C9C9C9B9B9B8B8B8B8E8E8E8D8D8D8D8D8DA0A0A0A0A0A0A0A0A0A0
        A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A09F9F9F8E8E8E0033EE5DA2FF
        3F87FF2876FF1568FF095DFE0055FE0052FD070081002F7F3166B45287D1315E
        AA315FAA305EA93361AC477ABF315FAA305DA8305DA9305EA8305DA94578BD01
        3080989898AAAAAAA5A5A5A2A2A29F9F9F9D9D9D9C9C9C9B9B9B8B8B8B8E8E8E
        9B9B9BA3A3A39A9A9A9A9A9A9999999A9A9AA0A0A09A9A9A9999999999999999
        999999999F9F9F8E8E8E0033EE5DA2FF4089FF2876FF1669FF095DFE0055FE08
        009D25282F0031826EA1E880B3F8285B9F285B9F2A5DA03366A84C7FC426529A
        285B9F285B9F285B9F2B5EA2477ABF013283989898AAAAAAA6A6A6A2A2A29F9F
        9F9D9D9D9C9C9C8D8D8D8A8A8A8E8E8EA9A9A9AEAEAE9898989898989898989A
        9A9AA1A1A1969696989898989898989898989898A0A0A08F8F8F0033EE0033EE
        0033EE002CE61569FF095DFE0400B4282A32272A32003384386BAF24579B275A
        9E275A9E275A9E2F60A45487CC2B57A0275A9E275A9E275A9E245599497CC101
        34859898989898989898989696969F9F9F9D9D9D8F8F8F8B8B8B8A8A8A8F8F8F
        9C9C9C979797979797979797979797999999A3A3A39898989797979797979797
        97969696A0A0A08F8F8FFFFFFFFFFFFFFFFFFF002CE61668FF0109CB2560B12A
        2D35292C35003586386BAF24579B26599D26599D25589C2C5BA05E91D62D5BA4
        26599D25589C24579B204F924A7DC2013687FFFFFFFFFFFFFFFFFF9696969F9F
        9F9191919999998B8B8B8B8B8B8F8F8F9C9C9C97979797979797979797979798
        9898A5A5A5999999979797979797979797959595A0A0A08F8F8FFFFFFFFFFFFF
        FFFFFF002CE60018DAFFFFFF2560B12B2F372B2F37003689386BAF2255992558
        9C25589C24569A28569C699CE1325FAA24579B24579B24579B1B478A4C7FC401
        378AFFFFFFFFFFFFFFFFFF969696949494FFFFFF9999998C8C8C8C8C8C8F8F8F
        9C9C9C969696979797979797979797979797A8A8A89A9A9A9797979797979797
        97939393A1A1A1909090FFFFFFFFFFFFFFFFFF002CE6FFFFFFFFFFFF2560B12D
        313A2D313A00388B386BAF21549824579B24579B20509325509773A6EB3563AF
        23569A23569A215397163D804D80C501398CFFFFFFFFFFFFFFFFFF969696FFFF
        FFFFFFFF9999998C8C8C8C8C8C9090909C9C9C96969697979797979795959596
        9696ABABAB9B9B9B969696969696969696919191A1A1A1909090FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF2560B130323C2F323D00398C386BAF2053972356
        99205194163F811C448B7CAFF43868B42255992152961842850C2B6C4E81C701
        3A8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999998D8D8D8D8D8D909090
        9C9C9C969696969696959595919191939393ADADAD9C9C9C9696969696969292
        928D8D8DA1A1A1909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2560B131
        353E30353E003B8E3668AC194A8E18458811367708225E10307882B5FA3C6DBA
        143D7E153C7F1335791131785386CC013C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9999998D8D8D8D8D8D9090909B9B9B9494949393938F8F8F8B8B8B8F
        8F8FAEAEAE9D9D9D9191919191919090908F8F8FA3A3A3919191FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF2560B132373F32373F003C903564AB255197315F
        A73D6DB7487AC8578AD974A7EC7CAFF484B7FC83B6FB7AADF26A9DE25E91D601
        3D91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999998E8E8E8E8E8E919191
        9B9B9B9696969999999D9D9DA0A0A0A4A4A4ABABABADADADAFAFAFAFAFAFACAC
        ACA8A8A8A5A5A5919191FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2560B134
        3841343841003D916497DC70A3E87BAEF383B6FB88BBFF85B8FD83B6FB83B6FB
        78ACF26398E0497FCA3069B51C57A6013E92FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9999998E8E8E8E8E8E919191A7A7A7AAAAAAADADADAFAFAFB0B0B0AF
        AFAFAFAFAFAFAFAFACACACA7A7A7A1A1A19B9B9B979797919191FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF2560B12560B12560B1003E935388D0437BC53C75
        C1316BB9215DAD124EA10542970341950845990D4A9D134FA21854A71E5AAB23
        5EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999999999999999919191
        A3A3A3A0A0A09E9E9E9C9C9C9898989595959292929292929393939494949595
        95969696989898999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0443963D6DAE5F87BC83A2CBA9BFDBCBD8EAEDF2F8FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF939393ACACACBABABACACACADADADAE9E9E9F8
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      TabOrder = 8
      OnClick = btnSairClick
    end
    object btnExclui: TBitBtn
      Tag = 1
      Left = 601
      Top = 1
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Exclui (F6)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE0E0E0ABABABB8B8B8C6C6C6CECECECECECECACA
        CAC3C3C3BABABAB0B0B0AAAAAAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFC9C9C9BABABAB3B3B3
        B3B3B3B3B3B3B2B2B2B0B0B0B0B0B0B8B8B8C9C9C9EFEFEFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191EB
        EBEBFCFCFCF4F4F4ECECECE2E2E2DADADAD1D1D1CACACAC5C5C5C6C6C68B8B8B
        AEAEAEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFA5A5A5BBBBBBBFBFBFBDBDBDBBBBBBB8B8B8B7B7B7B5B5B5B3B3B3B1
        B1B1B2B2B2A4A4A4CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFCFCC0C0C0B3B3B3A8CEB23DB6633DBB6944C07497CAAC61C7
        8B47C37842BE6F4DB770A2AEA6ACACAC959595B3B3B3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDBDBDBACACACAEAEAE9C9C9C9D9D9D
        9F9F9FABABABA4A4A4A0A0A09E9E9E9F9F9FA9A9A9ABABABA6A6A6D0D0D0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6AEAEAEE0E0E04F
        B4683AB45C39B6613FBC6A91C3A35CC18241BE6E3DBA6740B3635CAE72D9D9D9
        A2A2A29F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1
        F1B7B7B7B8B8B89F9F9F9C9C9C9C9C9C9E9E9EA9A9A9A3A3A39F9F9F9D9D9D9C
        9C9CA0A0A0B6B6B6A8A8A8B6B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBCBCBCCACACAC7D5CA44B15C69C280B0D9BCA6CFB3BACABFA6C3
        B06FBD8883BE954BB1672CA94ABCCBBFCACACA838383F9F9F9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D8B2B2B2B3B3B39C9C9CA3A3A3B0B0B0
        AEAEAEB0B0B0ACACACA4A4A4A7A7A79D9D9D979797B0B0B0B2B2B2A1A1A1FCFC
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A0A0A0D4D4D49CC6A330
        A74736AC50C7E3CDE3E9E4E2E2E2DADADAC9CFCBADC4B22DA94A27A5428ABE93
        D4D4D4858585BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCBEBE
        BEB5B5B5ABABAB9898989A9A9AB4B4B4BABABAB8B8B8B7B7B7B3B3B3AEAEAE98
        9898979797A8A8A8B5B5B5A1A1A1DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDFDFDFA8A8A8D5D5D596C59D2FA4412FA64543AF59E2E8E4E2E2E2DADA
        DAD0D1D051AF6524A23D23A0398ABA91D5D5D59B9B9BA9A9A9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEEEEEEB6B6B6B5B5B5AAAAAA9797979898989B9B9B
        B9B9B9B8B8B8B7B7B7B4B4B49E9E9E959595959595A7A7A7B5B5B5A6A6A6CECE
        CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9B9B9B9D5D5D5C1D6C431
        A13F279F39A1D2A9EBEBEBE2E2E2D9D9D9D0D0D09ABDA038A2482F9F3EBBC3BC
        D5D5D5B3B3B3939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E0B3B3
        B3B5B5B5B2B2B2969696959595ADADADBABABAB8B8B8B6B6B6B4B4B4A9A9A998
        9898969696AFAFAFB5B5B5ACACACBDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFABABABC8C8C8D8D8D8D1DDD2D0E3D2D5EBD8A5D2AA59B164DDE0DEB5CE
        B943A6513BA1488EB292A3BAA6C6C6C6D8D8D8C7C7C77E7E7EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCACACAB2B2B2B6B6B6B5B5B5B6B6B6B8B8B8ADADAD
        9F9F9FB7B7B7B0B0B09A9A9A999999A6A6A6ABABABB2B2B2B6B6B6B1B1B1ADAD
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8A0A0A0D3D3D3DADADAE6E6E6F0
        F0F064B569108F1A11911D89BF8E8ABD8F12911E11901C309737BEC0BEC8C8C8
        D9D9D9D3D3D3888888F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFBFBFBB9B9B9B4B4
        B4B6B6B6B9B9B9BCBCBCA0A0A08F8F8F8F8F8FA7A7A7A7A7A79090908F8F8F95
        9595AFAFAFB2B2B2B6B6B6B4B4B4A7A7A7FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
        ECECECA5A5A5D6D6D6DCDCDCE6E6E6F2F2F2ACD6AE08880D0B8A111A90202896
        2E0B8B120A8A1063A365ACBDACCCCCCCDADADAD6D6D69D9D9DECECECFFFFFFFF
        FFFFFFFFFFFFFFFFF0F0F0AFAFAFB5B5B5B7B7B7B9B9B9BDBDBDAFAFAF8D8D8D
        8E8E8E9090909494948E8E8E8E8E8E9E9E9EADADADB3B3B3B6B6B6B5B5B5A8A8
        A8F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFDFDFDFB3B3B3D7D7D7DDDDDDE6E6E6F3
        F3F3FBFCFB4FA64F038304038305188C191A8C1B439A44BCBEBCC4C4C4CECECE
        DADADAD7D7D7B3B3B3DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1ACACACB5B5
        B5B7B7B7B9B9B9BDBDBDBFBFBF9B9B9B8C8C8C8B8B8B909090909090989898AF
        AFAFB1B1B1B4B4B4B6B6B6B5B5B5ACACACE1E1E1FFFFFFFFFFFFFFFFFFFFFFFF
        D3D3D3BCBCBCDADADADDDDDDE5E5E5F4F4F4FCFCFCF0F2F0C9DCC9C6D6C6C3D1
        C3CACECAC8C8C8BFBFBFC5C5C5D1D1D1DBDBDBDADADABCBCBCD3D3D3FFFFFFFF
        FFFFFFFFFFFFFFFFD2D2D2AFAFAFB6B6B6B7B7B7B9B9B9BDBDBDBFBFBFBCBCBC
        B4B4B4B2B2B2B2B2B2B3B3B3B2B2B2AFAFAFB2B2B2B5B5B5B6B6B6B6B6B6AFAF
        AFD2D2D2FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8C2C2C2DEDEDEDBDBDBE8E8E8E2
        EDE3ABD5B181C18D7BBC8959AC6D5AAB6F79B7897EB88C9BC2A4C8D3CAD8D8D8
        DBDBDBDEDEDEC2C2C2C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFC5C5C5B0B0B0B7B7
        B7B6B6B6BABABAB9B9B9AEAEAEA6A6A6A5A5A59E9E9E9F9F9FA4A4A4A5A5A5AA
        AAAAB3B3B3B6B6B6B6B6B6B7B7B7B0B0B0C5C5C5FFFFFFFFFFFFFFFFFFFFFFFF
        C1C1C1C9C9C9E9ECE98BBC9050A85A359D455CAE695EAE6D5DAC6E50A4654EA3
        6459A46C5AA36B57A068459856569D6394BD99E6EAE7C9C9C9C1C1C1FFFFFFFF
        FFFFFFFFFFFFFFFFB9B9B9B2B2B2BABABAA7A7A79C9C9C9797979E9E9E9F9F9F
        9F9F9F9C9C9C9C9C9C9E9E9E9E9E9E9D9D9D9999999C9C9CA8A8A8B9B9B9B2B2
        B2B9B9B9FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8C6D9C62F98364CA9545AAD6447
        A7556FB47A86B89089B3929EB2A395AA9B79A0836F9B7A569665368F49549B5F
        5097582F8236BDCFBEC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFB3B3B3B3B3B39595
        95A2A2A29E9E9E9A9A9AA2A2A2A6A6A6A6A6A6A9A9A9A7A7A7A2A2A2A0A0A09C
        9C9C9696969B9B9B9A9A9A939393B0B0B0B3B3B3FFFFFFFFFFFFFFFFFFFFFFFF
        D0D9D01C8F2151AA5769B66F9FC7A4D5DBD6DDDDDDD5D5D5CBCBCBC1C1C1B6B6
        B6ACACACA1A1A19898988F93906B8D7057975E4B935117731DC8D2C8FFFFFFFF
        FFFFFFFFFFFFFFFFB4B4B49191919C9C9CA6A6A6ABABABB5B5B5B7B7B7B5B5B5
        B2B2B2B0B0B0ADADADABABABA8A8A8A6A6A6A4A4A49E9E9E9B9B9B9999998D8D
        8DB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF76B3792B98318FC392E7E9E7DFDFDFE2
        E2E2E4E4E4DCDCDCD4D4D4CACACABFBFBFB5B5B5AAAAAAA1A1A1999999959595
        93939382A7852F8234649A66FFFFFFFFFFFFFFFFFFFFFFFFA2A2A2949494ACAC
        ACD5D5D5B7B7B7B8B8B8B9B9B9B7B7B7B5B5B5B2B2B2AFAFAFADADADAAAAAAA8
        A8A8A6A6A6A5A5A5A4A4A4A3A3A39393939D9D9DFFFFFFFFFFFFFFFFFFFFFFFF
        439C4638953C5A935EEAEAEAE2E2E2E5E5E5E8E8E8E3E3E3DBDBDBD2D2D2C8C8
        C8BEBEBEB3B3B3A9A9A9A1A1A19B9B9B9797975A835E3E8242307C32FFFFFFFF
        FFFFFFFFFFFFFFFF989898969696A0A0A0D6D6D6B8B8B8B9B9B9BABABAB8B8B8
        B6B6B6B4B4B4B2B2B2AFAFAFACACACAAAAAAA8A8A8A6A6A6A5A5A59A9A9A9595
        95929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF428D450A640F2A7931C2D1C4E6
        E6E6E9E9E9E6E6E6E0E0E0D8D8D8CFCFCFC5C5C5BABABAB0B0B0A7A7A78E9A90
        307139125C19356F37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C8A8A
        8A919191B1B1B1B9B9B9BABABAB9B9B9B8B8B8B6B6B6B3B3B3B1B1B1AEAEAEAC
        ACACA9A9A9A4A4A49292928B8B8B989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF4F8F42B772F0B68130E6E19227D30559B6184B68E99C0A2CFD7D1CCD0
        CC8CB49576A7824C915D267C38166E2614651F286A2EEFF3EFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFAFAFA9A9A9A8B8B8B8C8C8C9191919C9C9CA6A6A6
        AAAAAAB4B4B4B3B3B3A7A7A7A2A2A29A9A9A9292928E8E8E8C8C8C969696F7F7
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66A16B10701B10
        741F127A2515802B1785301988341A8A371B8A371A8635197F3118772C176F27
        5F9667FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB7B7B78D8D8D8D8D8D8E8E8E90909091919191919192929292929291919190
        90908F8F8F8F8F8FB1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4F9F584B88C3F944F278A3B218A391988341A8A
        37248F3F2A8F4343975784B78FEFF5F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAC4C4C4A4A4A4999999
        969696919191929292979797999999A5A5A5C4C4C4F8F8F8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 6
      OnClick = btnExcluiClick
    end
  end
  object dtsOrdemProducao: TDataSource
    AutoEdit = False
    DataSet = cdsOrdemProducao
    Left = 40
    Top = 200
  end
  object cdsOrdemProducao: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    CommandText = 
      'select op.*,p.empre_codigo, p.prod_ref_forn, p.prod_codigo, p.pr' +
      'od_descricao, p.prod_unid_venda, p.prod_unid_compra, p.prod_grup' +
      'o, p.prod_subgrp, p.prod_qtd_compra, p.prod_peso_liquido, p.prod' +
      '_nr_mes_v from geral_produtos p , geral_ordem_producao op where ' +
      'p.prod_codigo = op.prod_codigo'
    Params = <>
    ProviderName = 'dspSisGestao'
    AfterScroll = cdsOrdemProducaoAfterScroll
    Left = 40
    Top = 144
    object cdsOrdemProducaoNR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsOrdemProducaoDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Required = True
    end
    object cdsOrdemProducaoPROD_CODIGO: TIntegerField
      FieldName = 'PROD_CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsOrdemProducaoQTDE_SC: TFMTBCDField
      FieldName = 'QTDE_SC'
      Required = True
      DisplayFormat = '0.00'
      Precision = 14
      Size = 3
    end
    object cdsOrdemProducaoQTDE_KG: TFMTBCDField
      FieldName = 'QTDE_KG'
      Required = True
      DisplayFormat = '0.000'
      Precision = 14
      Size = 3
    end
    object cdsOrdemProducaoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      OnGetText = cdsOrdemProducaoSITUACAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsOrdemProducaoDATA_ATUALIZACAO: TDateField
      FieldName = 'DATA_ATUALIZACAO'
    end
    object cdsOrdemProducaoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0.00'
      Precision = 14
      Size = 3
    end
    object cdsOrdemProducaoNR_LOTE: TStringField
      FieldName = 'NR_LOTE'
    end
    object cdsOrdemProducaoDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
    end
    object cdsOrdemProducaoempre_codigo: TIntegerField
      FieldName = 'empre_codigo'
      Required = True
    end
    object cdsOrdemProducaoprod_ref_forn: TStringField
      FieldName = 'prod_ref_forn'
    end
    object cdsOrdemProducaoprod_codigo_1: TIntegerField
      FieldName = 'prod_codigo_1'
      Required = True
    end
    object cdsOrdemProducaoprod_descricao: TStringField
      FieldName = 'prod_descricao'
      Size = 60
    end
    object cdsOrdemProducaoprod_unid_venda: TStringField
      FieldName = 'prod_unid_venda'
      Size = 2
    end
    object cdsOrdemProducaoprod_unid_compra: TStringField
      FieldName = 'prod_unid_compra'
      Size = 2
    end
    object cdsOrdemProducaoprod_grupo: TIntegerField
      FieldName = 'prod_grupo'
    end
    object cdsOrdemProducaoprod_subgrp: TIntegerField
      FieldName = 'prod_subgrp'
    end
    object cdsOrdemProducaoprod_qtd_compra: TFMTBCDField
      FieldName = 'prod_qtd_compra'
      Precision = 18
      Size = 4
    end
    object cdsOrdemProducaoprod_peso_liquido: TFMTBCDField
      FieldName = 'prod_peso_liquido'
      Precision = 18
      Size = 4
    end
    object cdsOrdemProducaoprod_nr_mes_v: TIntegerField
      FieldName = 'prod_nr_mes_v'
    end
    object cdsOrdemProducaoDATA_ESTORNO: TDateField
      FieldName = 'DATA_ESTORNO'
    end
    object cdsOrdemProducaoQTDE_PC: TFMTBCDField
      FieldName = 'QTDE_PC'
      Precision = 14
      Size = 2
    end
  end
  object cdsItensOrdem: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select pc.*, p.prod_unid_compra, p.prod_descricao from geral_pro' +
      'dutos p, geral_produtos_composicao pc where p.prod_codigo = pc.p' +
      'rod_mat_prima'
    Params = <>
    ProviderName = 'dspSisGestao'
    AfterScroll = cdsItensOrdemAfterScroll
    Left = 216
    Top = 144
    object cdsItensOrdemPROD_MAT_PRIMA: TIntegerField
      FieldName = 'PROD_MAT_PRIMA'
      Required = True
      DisplayFormat = '000000'
    end
    object cdsItensOrdemprod_descricao: TStringField
      FieldName = 'prod_descricao'
      Size = 60
    end
    object cdsItensOrdemCOMP_SEQ: TIntegerField
      FieldName = 'COMP_SEQ'
      Required = True
    end
    object cdsItensOrdemCOMP_CONVERSAO: TStringField
      FieldName = 'COMP_CONVERSAO'
      OnGetText = cdsItensOrdemCOMP_CONVERSAOGetText
      FixedChar = True
      Size = 1
    end
    object cdsItensOrdemATIVO: TStringField
      FieldName = 'ATIVO'
      OnGetText = cdsItensOrdemATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsItensOrdemPROD_CODIGO: TIntegerField
      FieldName = 'PROD_CODIGO'
      Required = True
    end
    object cdsItensOrdemcomp_formulacao: TBlobField
      FieldName = 'comp_formulacao'
      Size = 1
    end
    object cdsItensOrdemprod_unid_compra: TStringField
      Alignment = taCenter
      FieldName = 'prod_unid_compra'
      Size = 2
    end
    object cdsItensOrdemCOMP_QUANTIDADE: TFloatField
      FieldName = 'COMP_QUANTIDADE'
      DisplayFormat = '0.000'
    end
  end
  object dtsItensOrdem: TDataSource
    AutoEdit = False
    DataSet = cdsItensOrdem
    Left = 216
    Top = 200
  end
  object popGridOP: TPopupMenu
    Left = 364
    Top = 195
    object mniAtulizarOP: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183FF00FFFF00FFFF00FFB78183FEEED4D3D8A9DFD9ABF5DBB4ED
        D6A7EED29FF1CF9AF0CF97F0CF98F0CF98F5D49AB78183FF00FFFF00FFFF00FF
        B78183FDEFD9AECE9046AD3889BE6936A72937A7287AB553D6C78AEECC97EECC
        97F3D199B78183FF00FFFF00FFFF00FFB48176FEF3E3CDD9AE20A31C029A0302
        9A03029A03029A0341A82EE6CA95EECC97F3D199B78183FF00FFFF00FFFF00FF
        B48176FFF7EBCCDCB324A51F029A032FA726BBCC8E8CBD680C9C0A90BB63EFCD
        99F3D198B78183FF00FFFF00FFFF00FFBA8E85FFFCF4CBDFBA17A116029A030C
        9D0C9AC57AF4DBBBB8C78887BF69F0D0A1F3D29BB78183FF00FFFF00FFFF00FF
        BA8E85FFFFFDE8EDDBB7D8A6AED399A9CF90AECE90F2DEC0F4DBBAB3D092F0D4
        A9F5D5A3B78183FF00FFFF00FFFF00FFCB9A82FFFFFFBAE2B7FBF3ECF7EEDFB1
        D39CAACF90ACCD8EB3CC8EEFDAB6F2D8B2F6D9ACB78183FF00FFFF00FFFF00FF
        CB9A82FFFFFF8DD28EC1E1BBFBF3EC9CCF8F0D9D0C029A0317A014F6DEC1F4DB
        B9F8DDB4B78183FF00FFFF00FFFF00FFDCA887FFFFFF99D69A0D9D0E93D18EC0
        DEB430AA2C029A0324A41FF6E2C8F7E1C2F0DAB7B78183FF00FFFF00FFFF00FF
        DCA887FFFFFFF6FBF645B546029A03029A03029A03029A0321A41EFCEFD9E6D9
        C4C6BCA9B78183FF00FFFF00FFFF00FFE3B18EFFFFFFFFFFFFE5F5E581CD813B
        B03B38AE378ECD8545AE3DAA8771B8857AB8857AB78183FF00FFFF00FFFF00FF
        E3B18EFFFFFFFFFFFFFFFFFFFFFFFFE8F6E8E7F5E5FFFEF9BEC6A8A2886CE8B2
        70ECA54AC58768FF00FFFF00FFFF00FFEDBD92FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4D4D2B8857AFAC577CD9377FF00FFFF00FFFF00FFFF00FF
        EDBD92FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B
        86FF00FFFF00FFFF00FFFF00FFFF00FFEDBD92DCA887DCA887DCA887DCA887DC
        A887DCA887DCA887DCA887B8857AFF00FFFF00FFFF00FFFF00FF}
      Caption = 'Atualizar  (F10)'
      OnClick = mniAtulizarOPClick
    end
    object mniEstornarOP: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
        03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
        972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
        00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
        4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
        E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
        03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
        9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
        2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
        A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
        01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
        8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
        993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
        02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
        00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = 'Estornar   (F11)'
      OnClick = mniEstornarOPClick
    end
  end
  object pprRelatorioOrdemProducao: TppReport
    AutoStop = False
    DataPipeline = pplRelItensOrdemProd
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 920
    Top = 184
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'pplRelItensOrdemProd'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 53181
      mmPrintPosition = 0
      object ppShape4: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape4'
        mmHeight = 21167
        mmLeft = 1058
        mmTop = 24606
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground
      end
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 7671
        mmLeft = 1058
        mmTop = 45509
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 11635
        mmTop = 47141
        mmWidth = 13494
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 25918
        mmTop = 47141
        mmWidth = 53975
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 80961
        mmTop = 47141
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Seq.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 47141
        mmWidth = 8996
        BandType = 0
        LayerName = Foreground
      end
      object lblCusto: TppLabel
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'lblCusto'
        AutoSize = False
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 95233
        mmTop = 47141
        mmWidth = 13229
        BandType = 0
        LayerName = Foreground
      end
      object lblTotal: TppLabel
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'lblTotal'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 110059
        mmTop = 47141
        mmWidth = 14552
        BandType = 0
        LayerName = Foreground
      end
      object lblFornecedor: TppLabel
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'lblFornecedor'
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 127265
        mmTop = 47141
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground
      end
      object ppProd_Cod: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Prod_Cod'
        Caption = '00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 32809
        mmWidth = 11377
        BandType = 0
        LayerName = Foreground
      end
      object ppDescricao: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblprod_descricao'
        Caption = 'lblprod_descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 37837
        mmTop = 32809
        mmWidth = 66146
        BandType = 0
        LayerName = Foreground
      end
      object ppFator: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblProdKG'
        Caption = '999999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 119859
        mmTop = 26990
        mmWidth = 11112
        BandType = 0
        LayerName = Foreground
      end
      object ppQtde: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblProdSC'
        Caption = '999999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 119859
        mmTop = 32809
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppNrOrdem: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblNrOrdem'
        Caption = '000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 177800
        mmTop = 32810
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
      object ppDtEmissao: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblDtEmissao'
        Caption = '20/10/2020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3968
        mmLeft = 177536
        mmTop = 26990
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppDtValidade: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblDtValidade'
        Caption = '25/12/2020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 26989
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblLote'
        Caption = 'Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 38365
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 9525
        mmTop = 32809
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        Caption = 'Dt. Validade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 26989
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLote: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblProdSC1'
        Caption = '999999999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 38365
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label11'
        Caption = 'Dt. Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3968
        mmLeft = 157163
        mmTop = 26990
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblLote1'
        Caption = 'Nr.Ordem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3968
        mmLeft = 160338
        mmTop = 32810
        mmWidth = 15346
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblLote2'
        Caption = 'KG:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 112713
        mmTop = 26990
        mmWidth = 5027
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Caption = 'SC/CX:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 107686
        mmTop = 32809
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 19845
        mmLeft = 1058
        mmTop = 2647
        mmWidth = 196057
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 6615
        mmWidth = 29898
        BandType = 0
        LayerName = Foreground
      end
      object ppImage1: TppImage
        DesignLayer = ppDesignLayer1
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D6170B60D0000424DB60D00000000000036000000280000003000
          0000180000000100180000000000800D00000000000000000000000000000000
          0000784A137C4E17875922895B248A5C258B5D267E5019784A130F14A51419A9
          2327B7262AB9272BBA272CBA161BAC0F14A50D5E1611621A1B6C241E6F271F70
          281E6F2713641C0D5E1691919192929295959596969696969696969693939391
          91919090909191919696969696969797979797979292929090908A8A8A8B8B8B
          8E8E8E8F8F8F8F8F8F8F8F8F8C8C8C8A8A8A7A4C15875922A1733CA97B44AD7F
          48AA7C458C5E277A4C151015A62529B94649D75054E25458E65154E22D31C010
          15A610611928793148995155A65E5AAB6355A65E31823A106119929292959595
          9C9C9C9E9E9E9F9F9F9E9E9E9696969292929090909595959D9D9DA0A0A0A1A1
          A1A0A0A09797979090908B8B8B9191919999999C9C9C9E9E9E9C9C9C9393938B
          8B8B7D4F18976932B98B54C79962CB9D66C79962A1733C7D4F181318A83135C3
          5457E46265F2676AF76265F23C40CE1318A814651D2E7F374FA0585DAE6662B3
          6B5DAE66398A4214651D939393999999A2A2A2A5A5A5A6A6A6A5A5A59C9C9C93
          9393919191989898A1A1A1A4A4A4A6A6A6A4A4A49B9B9B9191918C8C8C939393
          9B9B9B9E9E9EA0A0A09E9E9E9595958C8C8C81531C996B34BA8C55C89A63CD9F
          68C89A63A3753E81531C161BAB3033C25457E46265F2676AF76265F23A3ECC16
          1BAB1869212F80384FA0585DAE6662B36B5DAE663A8B431869219494949A9A9A
          A2A2A2A5A5A5A7A7A7A5A5A59C9C9C949494929292989898A1A1A1A4A4A4A6A6
          A6A4A4A49B9B9B9292928D8D8D9393939B9B9B9E9E9EA0A0A09E9E9E9696968D
          8D8D84561F996B34BA8C55C89A63CD9F68C89A63A3753E84561F191EAE3135C4
          5557E56365F3676AF76265F23B3FCD191EAE1D6E2631823A4FA0585DAE6662B3
          6B5DAE663C8D451D6E269494949A9A9AA2A2A2A5A5A5A7A7A7A5A5A59C9C9C94
          9494939393989898A1A1A1A4A4A4A6A6A6A4A4A49B9B9B9393938E8E8E939393
          9B9B9B9E9E9EA0A0A09E9E9E9696968E8E8E885A239B6D36BA8C55C89A63CD9F
          68C89A63A57740885A231C21B13236C45457E46365F3676AF66265F23D40CF1C
          21B122732B34853D4FA0585DAE6662B36B5DAE663E8F4722732B9595959A9A9A
          A2A2A2A5A5A5A7A7A7A5A5A59D9D9D959595939393999999A1A1A1A4A4A4A5A5
          A5A4A4A49B9B9B9393939090909494949B9B9B9E9E9EA0A0A09E9E9E97979790
          90908C5E279D6F38BA8C55C89A63CD9F68C89A63A779428C5E272025B43438C6
          5457E46365F2696AF86365F23E42D02025B42879313889414FA0585DAE6662B3
          6B5DAE6641924A2879319696969B9B9BA2A2A2A5A5A5A7A7A7A5A5A59D9D9D96
          9696949494999999A1A1A1A4A4A4A6A6A6A4A4A49C9C9C949494919191959595
          9B9B9B9E9E9EA0A0A09E9E9E97979791919191632CA0723BBA8C55C89A63CD9F
          68C89A63A97B4491632C2429B8363AC75457E36365F1696AF86365F24044D224
          29B82D7E3640914950A1595DAE6662B36B5DAE6643944C2D7E369898989B9B9B
          A2A2A2A5A5A5A7A7A7A5A5A59E9E9E989898959595999999A1A1A1A4A4A4A6A6
          A6A4A4A49C9C9C9595959292929797979B9B9B9E9E9EA0A0A09E9E9E98989892
          9292966831A3753EBA8C55C89A63CD9F68C89A63AB7D46966831282DBC393CC9
          5558E36466F1686AF66265F14246D3282DBC33843C4A9B5352A35B5DAE6662B3
          6B5DAE6645964E33843C9999999C9C9CA2A2A2A5A5A5A7A7A7A5A5A59E9E9E99
          99999696969A9A9AA1A1A1A4A4A4A6A6A6A4A4A49C9C9C9696969494949A9A9A
          9C9C9C9E9E9EA0A0A09E9E9E9898989494949A6C35AA7C45BA8C55C89A63CD9F
          68C89A63AD7F489A6C352C31BF393EC95558E26266F0676BF56266F14448D42C
          31BF38894154A55D56A75F5DAE6662B36B5DAE664798503889419A9A9A9E9E9E
          A2A2A2A5A5A5A7A7A7A5A5A59F9F9F9A9A9A9797979A9A9AA1A1A1A4A4A4A5A5
          A5A4A4A49D9D9D9797979595959C9C9C9D9D9D9E9E9EA0A0A09E9E9E99999995
          95959F713AB4864FBD8F58C89A63CD9F68C89A63B0824B9F713A3035C33C40CC
          5558E36366F1686BF66265F14549D63035C33D8E4660B1695BAC645DAE6662B3
          6B5DAE66499A523D8E469B9B9BA0A0A0A3A3A3A5A5A5A7A7A7A5A5A59F9F9F9B
          9B9B9898989B9B9BA1A1A1A4A4A4A6A6A6A4A4A49D9D9D9898989696969F9F9F
          9E9E9E9E9E9EA0A0A09E9E9E999999969696A4763FBC8E57C0925BC89A63CD9F
          68C89A63B2844DA4763F3439C74144CE5658E36466F1686BF66366F1474BD834
          39C742934B6ABB7362B36B5DAE6662B36B5DAE664B9C5442934B9C9C9CA2A2A2
          A3A3A3A5A5A5A7A7A7A5A5A5A0A0A09C9C9C9999999C9C9CA1A1A1A4A4A4A6A6
          A6A4A4A49E9E9E999999989898A2A2A2A0A0A09E9E9EA0A0A09E9E9E9A9A9A98
          9898A87A43C69861C59760C89A63CD9F68C89A63B3854EA87A43383DCA484CD1
          5759E36466F1686BF66366F1494DD9383DCA46974F75C67E67B8705DAE6662B3
          6B5DAE664C9D5546974F9D9D9DA5A5A5A5A5A5A5A5A5A7A7A7A5A5A5A0A0A09D
          9D9D9A9A9A9D9D9DA1A1A1A4A4A4A6A6A6A4A4A49E9E9E9A9A9A999999A4A4A4
          A1A1A19E9E9EA0A0A09E9E9E9A9A9A999999AC7E47D0A26BC99B64C89A63CD9F
          68C89A63B58750AC7E473C41CE5456D5595BE46466F1686BF66366F14B4FDB3C
          41CE4A9B537FD0886FC0785DAE6662B36B5DAE664E9F574A9B539E9E9EA7A7A7
          A6A6A6A5A5A5A7A7A7A5A5A5A1A1A19E9E9E9B9B9B9F9F9FA2A2A2A4A4A4A6A6
          A6A4A4A49F9F9F9B9B9B9A9A9AA7A7A7A3A3A39E9E9EA0A0A09E9E9E9B9B9B9A
          9A9AAF814ADBAD76CFA16AC89A63CD9F68C89A63B4864FAF814A4045D26063D8
          5F61E36466F0696BF66466F14D50DC4045D24D9E5689DA9281D28A71C27A6FC0
          7863B46C50A1594D9E569F9F9FAAAAAAA7A7A7A5A5A5A7A7A7A5A5A5A0A0A09F
          9F9F9C9C9CA2A2A2A2A2A2A4A4A4A6A6A6A4A4A49F9F9F9C9C9C9A9A9AA9A9A9
          A7A7A7A3A3A3A3A3A3A0A0A09B9B9B9A9A9AB3854EE3B57ED4A66FC89A63CD9F
          68C89A63B88A53B3854E4449D56E70DD6567E56466F0696BF66466F14F52DE44
          49D54F9B624E9A614F9B62529E65539F66529E654F9B624F9B62A0A0A0ACACAC
          A8A8A8A5A5A5A7A7A7A5A5A5A1A1A1A0A0A09D9D9DA4A4A4A4A4A4A4A4A4A6A6
          A6A4A4A49F9F9F9D9D9D9B9B9B9B9B9B9B9B9B9C9C9C9C9C9C9C9C9C9B9B9B9B
          9B9BB68851ECBE87DAAC75C99B64CD9F68C89A63B98B54B68851474CD87A7CE0
          6D6EE66466F0696BF66465F05053DE474CD8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA1A1A1AEAEAEAAAAAAA6A6A6A7A7A7A5A5A5A2A2A2A1
          A1A19E9E9EA7A7A7A5A5A5A4A4A4A6A6A6A4A4A4A0A0A09E9E9EFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB88A53F0C28BE7B982D7A972D6A8
          71CEA069BB8D56B88A534A4FDB8789E47475E76466F0686BF56466F05155E04A
          4FDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A1AFAFAF
          ADADADA9A9A9A9A9A9A7A7A7A2A2A2A1A1A19F9F9FA9A9A9A6A6A6A4A4A4A6A6
          A6A4A4A4A0A0A09F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB3885CAD8256B4885CBD9266C1966ABE9266B4895DB3885C4D52DE9395E7
          7C7DE86466F0686BF56466F05356E14D52DEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA1A1A1A0A0A0A2A2A2A4A4A4A5A5A5A4A4A4A2A2A2A1
          A1A19F9F9FABABABA8A8A8A4A4A4A6A6A6A4A4A4A0A0A09F9F9FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF5055E09FA1EA8A8CEA6D6FF16F71F56769EF5558E150
          55E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0AEAEAEAAAAAAA6A6A6A7A7
          A7A5A5A5A1A1A1A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5257E2A4A6EC
          9899ED878AF18082F47173F0575BE35257E2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA0A0A0AFAFAFADADADAAAAAAA9A9A9A7A7A7A1A1A1A0A0A0FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF5156E14E51DC5558E15E61E96164ED5F62EA5458E252
          57E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A09F9F9FA1A1A1A4A4A4A4A4
          A4A4A4A4A1A1A1A0A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        mmHeight = 16144
        mmLeft = 3704
        mmTop = 4498
        mmWidth = 24873
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 13759
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        Caption = 'BELEM IND. E COM. DE PROD. ALIM. LTDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 6615
        mmWidth = 74083
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        Caption = 'RELAT'#211'RIO DE ORDEM DE PRODU'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 32015
        mmTop = 13758
        mmWidth = 97631
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label21'
        Caption = 'PC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 112713
        mmTop = 38365
        mmWidth = 5027
        BandType = 0
        LayerName = Foreground
      end
      object ppQtdePC: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblProdSC2'
        Caption = '999999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 119859
        mmTop = 38365
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'Cod_Item'
        DataPipeline = pplRelItensOrdemProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 11635
        mmTop = 1322
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'Descricao'
        DataPipeline = pplRelItensOrdemProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 25918
        mmTop = 1322
        mmWidth = 53975
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'Sequencia'
        DataPipeline = pplRelItensOrdemProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 1322
        mmWidth = 8996
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'Qtde'
        DataPipeline = pplRelItensOrdemProd
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 80961
        mmTop = 1322
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground
      end
      object ppCusto: TppDBText
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'Custo'
        DataField = 'Custo'
        DataPipeline = pplRelItensOrdemProd
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 95233
        mmTop = 1322
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground
      end
      object ppTotal: TppDBText
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'Total'
        DataField = 'Total_item'
        DataPipeline = pplRelItensOrdemProd
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 110059
        mmTop = 1322
        mmWidth = 14552
        BandType = 4
        LayerName = Foreground
      end
      object ppFornecedor: TppDBText
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'Fornecedor'
        CharWrap = True
        DataField = 'nome_fornecedor'
        DataPipeline = pplRelItensOrdemProd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplRelItensOrdemProd'
        mmHeight = 4763
        mmLeft = 127265
        mmTop = 1323
        mmWidth = 68264
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 262
        mmLeft = 1058
        mmTop = 7140
        mmWidth = 195792
        BandType = 4
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7145
        mmLeft = 1058
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 192617
        mmTop = 0
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object lblFuncionario: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lblFuncionario'
        Caption = 'lblFuncionario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 13756
        mmTop = 1323
        mmWidth = 73025
        BandType = 8
        LayerName = Foreground
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 262
        mmLeft = 1058
        mmTop = 0
        mmWidth = 195792
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Usu'#225'rio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 1323
        mmWidth = 10054
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 87313
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label18'
        Caption = 'QUANTIDADE ETIQUETAS  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 13494
        mmWidth = 36777
        BandType = 7
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 41275
        mmTop = 21439
        mmWidth = 24871
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label17'
        Caption = 'QUANTIDADE CAIXAS        :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 20638
        mmWidth = 36777
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        Caption = 'MODO DE PREPARO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 53446
        mmTop = 31750
        mmWidth = 26987
        BandType = 7
        LayerName = Foreground
      end
      object ppModoPreparo: TppMemo
        DesignLayer = ppDesignLayer1
        UserName = 'ModoPreparo'
        Caption = 'ModoPreparo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        RemoveEmptyLines = False
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 48154
        mmLeft = 3440
        mmTop = 38365
        mmWidth = 133350
        BandType = 7
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppShape2: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape2'
        mmHeight = 7144
        mmLeft = 101865
        mmTop = 2117
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label19'
        Caption = 'TOTAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 103451
        mmTop = 3705
        mmWidth = 10848
        BandType = 7
        LayerName = Foreground
      end
      object pplblTotalOrdem: TppLabel
        Tag = 1
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = 'lblTotalOrdem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115093
        mmTop = 3705
        mmWidth = 16933
        BandType = 7
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 41275
        mmTop = 14288
        mmWidth = 24871
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pplRelItensOrdemProd: TppDBPipeline
    DataSource = dtsRelItensOrdemProd
    UserName = 'lRelItensOrdemProd'
    Left = 928
    Top = 232
    object pplRelItensOrdemProdppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'Cod_Item'
      FieldName = 'Cod_Item'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object pplRelItensOrdemProdppField2: TppField
      FieldAlias = 'Descricao'
      FieldName = 'Descricao'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object pplRelItensOrdemProdppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Sequencia'
      FieldName = 'Sequencia'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object pplRelItensOrdemProdppField4: TppField
      FieldAlias = 'Custo'
      FieldName = 'Custo'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 3
    end
    object pplRelItensOrdemProdppField5: TppField
      FieldAlias = 'Total_item'
      FieldName = 'Total_item'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 4
    end
    object pplRelItensOrdemProdppField6: TppField
      FieldAlias = 'nome_fornecedor'
      FieldName = 'nome_fornecedor'
      FieldLength = 200
      DisplayWidth = 200
      Position = 5
    end
    object pplRelItensOrdemProdppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'Qtde'
      FieldName = 'Qtde'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object cdsRelItensOrdemProd: TClientDataSet
    PersistDataPacket.Data = {
      E90000009619E0BD010000001800000007000000000003000000E90008436F64
      5F4974656D04000100000000000944657363726963616F010049000000010005
      574944544802000200C8000953657175656E6369610400010000000000045174
      6465080004000000010007535542545950450200490006004D6F6E6579000543
      7573746F080004000000010007535542545950450200490006004D6F6E657900
      0A546F74616C5F6974656D080004000000010007535542545950450200490006
      004D6F6E6579000F6E6F6D655F666F726E656365646F72010049000000010005
      574944544802000200C8000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Cod_Item'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Sequencia'
        DataType = ftInteger
      end
      item
        Name = 'Qtde'
        DataType = ftCurrency
      end
      item
        Name = 'Custo'
        DataType = ftCurrency
      end
      item
        Name = 'Total_item'
        DataType = ftCurrency
      end
      item
        Name = 'nome_fornecedor'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 928
    Top = 280
    object cdsRelItensOrdemProdCod_Item: TIntegerField
      FieldName = 'Cod_Item'
    end
    object cdsRelItensOrdemProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object cdsRelItensOrdemProdSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
    object cdsRelItensOrdemProdCusto: TCurrencyField
      FieldName = 'Custo'
      currency = False
    end
    object cdsRelItensOrdemProdTotal_item: TCurrencyField
      FieldName = 'Total_item'
      currency = False
    end
    object cdsRelItensOrdemProdnome_fornecedor: TStringField
      FieldName = 'nome_fornecedor'
      Size = 200
    end
    object cdsRelItensOrdemProdQtde: TFloatField
      FieldName = 'Qtde'
    end
  end
  object dtsRelItensOrdemProd: TDataSource
    DataSet = cdsRelItensOrdemProd
    Left = 840
    Top = 288
  end
  object cdsAuxPrecoItens: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select preco_preco from geral_produtos_preco where preco_tabela ' +
      '= 5'
    Params = <>
    ProviderName = 'dspSisGestao'
    Left = 824
    Top = 232
    object cdsAuxPrecoItenspreco_preco: TFMTBCDField
      FieldName = 'preco_preco'
      Precision = 18
      Size = 4
    end
  end
  object cdsAtualizacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSisGestao'
    Left = 1028
    Top = 281
  end
end
