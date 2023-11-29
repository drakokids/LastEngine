object OptionsDialog: TOptionsDialog
  Left = 0
  Top = 0
  Caption = 'Options Dialog'
  ClientHeight = 405
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 47
    Height = 15
    Caption = 'Font Size'
  end
  object SpinEditFontSize: TSpinEdit
    Left = 88
    Top = 13
    Width = 57
    Height = 24
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 6
    OnChange = SpinEditFontSizeChange
  end
  object BitBtn1: TBitBtn
    Left = 248
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Save'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
end
