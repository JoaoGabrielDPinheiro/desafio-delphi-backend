object frmPrincipalView: TfrmPrincipalView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Principal'
  ClientHeight = 410
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object lblCEP: TLabel
    Left = 198
    Top = 161
    Width = 27
    Height = 21
    Caption = 'CEP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    ParentFont = False
  end
  object edtCEP: TMaskEdit
    Left = 198
    Top = 187
    Width = 91
    Height = 29
    EditMask = '99999-999;0;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    MaxLength = 9
    ParentFont = False
    TabOrder = 0
    Text = ''
    OnKeyPress = edtCEPKeyPress
  end
  object btnPesquisar: TButton
    Left = 198
    Top = 222
    Width = 91
    Height = 37
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btnPesquisarClick
  end
end
