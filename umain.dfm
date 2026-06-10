object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 637
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lb1: TLabel
    Left = 12
    Top = 48
    Width = 43
    Height = 15
    Caption = 'Port List'
  end
  object lb2: TLabel
    Left = 186
    Top = 48
    Width = 20
    Height = 15
    Caption = 'Log'
  end
  object chklst1: TCheckListBox
    Left = 8
    Top = 67
    Width = 169
    Height = 225
    ItemHeight = 15
    Items.Strings = (
      '3000'
      '3001'
      '3002'
      '3003'
      '3004'
      '3005'
      '3006'
      '50000'
      '50001'
      '50002'
      '50003'
      '50004'
      '50005'
      '50006')
    TabOrder = 0
  end
  object btnInstallWebServer: TAdvGlassButton
    Left = 623
    Top = 8
    Width = 169
    Height = 50
    BackColor = clTeal
    Caption = 'Occupy Selected Ports !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ForeColor = clWhite
    GlowColor = 16760205
    ImageIndex = -1
    InnerBorderColor = clBlack
    OuterBorderColor = clWhite
    ParentFont = False
    ShineColor = clWhite
    TabOrder = 1
    Version = '1.3.3.0'
    OnClick = btnInstallWebServerClick
  end
  object mmoLog: TMemo
    Left = 183
    Top = 67
    Width = 751
    Height = 562
    Lines.Strings = (
      'mmoLog')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btnCA: TAdvGlassButton
    Left = 8
    Top = 301
    Width = 73
    Height = 28
    BackColor = clTeal
    Caption = 'Check All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ForeColor = clWhite
    GlowColor = 16760205
    ImageIndex = -1
    InnerBorderColor = clBlack
    OuterBorderColor = clWhite
    ParentFont = False
    ShineColor = clWhite
    TabOrder = 3
    Version = '1.3.3.0'
    OnClick = btnCAClick
  end
  object btnUCA: TAdvGlassButton
    Left = 87
    Top = 301
    Width = 89
    Height = 28
    BackColor = clTeal
    Caption = 'unCheck All'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ForeColor = clWhite
    GlowColor = 16760205
    ImageIndex = -1
    InnerBorderColor = clBlack
    OuterBorderColor = clWhite
    ParentFont = False
    ShineColor = clWhite
    TabOrder = 4
    Version = '1.3.3.0'
    OnClick = btnUCAClick
  end
  object btnRelease: TAdvGlassButton
    Left = 799
    Top = 8
    Width = 134
    Height = 50
    BackColor = clTeal
    Caption = 'Release All Ports !'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ForeColor = clWhite
    GlowColor = 16760205
    ImageIndex = -1
    InnerBorderColor = clBlack
    OuterBorderColor = clWhite
    ParentFont = False
    ShineColor = clWhite
    TabOrder = 5
    Version = '1.3.3.0'
    OnClick = btnReleaseClick
  end
end
