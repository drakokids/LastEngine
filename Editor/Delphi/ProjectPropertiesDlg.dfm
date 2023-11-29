object ProjectProperties: TProjectProperties
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Project Properties'
  ClientHeight = 227
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 72
    Height = 15
    Caption = 'Project Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 50
    Width = 73
    Height = 15
    Caption = 'Project Folder'
  end
  object Label3: TLabel
    Left = 8
    Top = 82
    Width = 64
    Height = 15
    Caption = 'Project Type'
  end
  object Edit1: TEdit
    Left = 96
    Top = 16
    Width = 273
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 50
    Width = 577
    Height = 23
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 82
    Width = 273
    Height = 23
    TabOrder = 2
    Items.Strings = (
      'Game'
      'Simulation'
      'Digital Signage'
      'Interactive Menu')
  end
  object Button1: TButton
    Left = 224
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Save'
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 352
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
