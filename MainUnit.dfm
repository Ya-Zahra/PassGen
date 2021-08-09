object MainForm: TMainForm
  Left = 379
  Top = 251
  BorderStyle = bsSingle
  Caption = 'Password Generator'
  ClientHeight = 196
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 19
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 48
    Height = 19
    Caption = '&Length'
    FocusControl = PLen
  end
  object Label6: TLabel
    Left = 8
    Top = 128
    Width = 60
    Height = 19
    Caption = 'S&ymbols'
    FocusControl = SymbCh
  end
  object Label7: TLabel
    Left = 264
    Top = 128
    Width = 54
    Height = 19
    Caption = 'E&xclude'
    FocusControl = ExcCh
  end
  object Label8: TLabel
    Left = 136
    Top = 93
    Width = 25
    Height = 19
    Caption = 'Min'
    FocusControl = PLen
  end
  object Label9: TLabel
    Left = 264
    Top = 93
    Width = 25
    Height = 19
    Caption = 'Min'
    FocusControl = PLen
  end
  object Label10: TLabel
    Left = 392
    Top = 93
    Width = 25
    Height = 19
    Caption = 'Min'
    FocusControl = PLen
  end
  object Label11: TLabel
    Left = 520
    Top = 93
    Width = 25
    Height = 19
    Caption = 'Min'
    FocusControl = PLen
  end
  object GenBtn: TButton
    Left = 520
    Top = 16
    Width = 75
    Height = 25
    Caption = '&Generate'
    TabOrder = 0
    OnClick = GenBtnClick
  end
  object PassEd: TEdit
    Left = 8
    Top = 16
    Width = 505
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object PLen: TSpinEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 16
  end
  object MinU: TSpinEdit
    Left = 168
    Top = 88
    Width = 89
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 1
  end
  object MinL: TSpinEdit
    Left = 296
    Top = 88
    Width = 89
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 1
  end
  object MinN: TSpinEdit
    Left = 424
    Top = 88
    Width = 89
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 1
  end
  object MinS: TSpinEdit
    Left = 552
    Top = 88
    Width = 89
    Height = 29
    MaxValue = 0
    MinValue = 0
    TabOrder = 6
    Value = 1
  end
  object SymbCh: TComboBox
    Left = 8
    Top = 152
    Width = 249
    Height = 27
    ItemHeight = 19
    ItemIndex = 0
    TabOrder = 7
    Text = '!#$%&*+-=?@^_'
    Items.Strings = (
      '!#$%&*+-=?@^_'
      '!#$%&*+-=?@^_{}[]()/\\'#39#39'"`~,;:.<>')
  end
  object ExcCh: TComboBox
    Left = 264
    Top = 152
    Width = 249
    Height = 27
    ItemHeight = 19
    ItemIndex = 1
    TabOrder = 8
    Text = 'il1Lo0O'
    Items.Strings = (
      ''
      'il1Lo0O')
  end
  object AutoCpyChB: TCheckBox
    Left = 528
    Top = 128
    Width = 105
    Height = 25
    Caption = '&AutoCopy'
    TabOrder = 9
  end
  object VisibChB: TCheckBox
    Left = 528
    Top = 160
    Width = 105
    Height = 25
    Caption = '&Visible'
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = VisibChBClick
  end
  object Button1: TButton
    Left = 600
    Top = 16
    Width = 49
    Height = 25
    Caption = '&Copy'
    TabOrder = 11
    OnClick = Button1Click
  end
  object UUc: TCheckBox
    Left = 136
    Top = 64
    Width = 121
    Height = 19
    Caption = 'Use Upper'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object ULc: TCheckBox
    Left = 264
    Top = 64
    Width = 121
    Height = 19
    Caption = 'Use Lower'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object UNc: TCheckBox
    Left = 392
    Top = 64
    Width = 121
    Height = 19
    Caption = 'Use Numbers'
    Checked = True
    State = cbChecked
    TabOrder = 14
  end
  object USc: TCheckBox
    Left = 520
    Top = 64
    Width = 121
    Height = 19
    Caption = 'Use Symbols'
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
end
