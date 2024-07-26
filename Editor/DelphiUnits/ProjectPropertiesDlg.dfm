object ProjectProperties: TProjectProperties
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Project Properties'
  ClientHeight = 601
  ClientWidth = 675
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
  object Label4: TLabel
    Left = 8
    Top = 114
    Width = 57
    Height = 15
    Caption = 'OS Destiny'
  end
  object Label5: TLabel
    Left = 96
    Top = 202
    Width = 73
    Height = 15
    Caption = 'Main Monitor'
  end
  object Label6: TLabel
    Left = 255
    Top = 202
    Width = 85
    Height = 15
    Caption = 'Second Monitor'
  end
  object Label7: TLabel
    Left = 8
    Top = 258
    Width = 25
    Height = 15
    Caption = 'View'
  end
  object Label9: TLabel
    Left = 8
    Top = 226
    Width = 56
    Height = 15
    Caption = 'Resolution'
  end
  object Label8: TLabel
    Left = 414
    Top = 202
    Width = 73
    Height = 15
    Caption = 'Third Monitor'
  end
  object EditProjectName: TEdit
    Left = 96
    Top = 16
    Width = 273
    Height = 23
    TabOrder = 0
  end
  object EditFolder: TEdit
    Left = 96
    Top = 50
    Width = 537
    Height = 23
    TabOrder = 1
  end
  object EditProjectType: TComboBox
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
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Save'
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 352
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object Button3: TButton
    Left = 639
    Top = 49
    Width = 28
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = Button3Click
  end
  object CheckListBox1: TCheckListBox
    Left = 96
    Top = 114
    Width = 121
    Height = 71
    ItemHeight = 15
    Items.Strings = (
      'Windows'
      'Linux'
      'Android'
      'MacOS')
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 114
    Width = 97
    Height = 17
    Caption = 'Full Screen'
    TabOrder = 7
  end
  object ComboBox1: TComboBox
    Left = 96
    Top = 223
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 8
    Text = 'Auto'
    Items.Strings = (
      'Auto'
      'HD 1280x720'
      'FULLHD 1920x1080'
      '4K 3840x1920')
  end
  object ComboBox3: TComboBox
    Left = 96
    Top = 252
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 9
    Text = '2D'
    Items.Strings = (
      '2D'
      '3D'
      'Isometric 2.5')
  end
  object CheckBox2: TCheckBox
    Left = 96
    Top = 330
    Width = 97
    Height = 17
    Caption = 'Enable Touch'
    TabOrder = 10
  end
  object CheckBox3: TCheckBox
    Left = 96
    Top = 307
    Width = 153
    Height = 17
    Caption = 'Enable Split Views'
    TabOrder = 11
  end
  object CheckBox4: TCheckBox
    Left = 96
    Top = 378
    Width = 137
    Height = 17
    Caption = 'Enable Gamepads'
    TabOrder = 12
  end
  object CheckBox5: TCheckBox
    Left = 96
    Top = 355
    Width = 153
    Height = 17
    Caption = 'Enable Mouse'
    TabOrder = 13
  end
  object CheckBox6: TCheckBox
    Left = 96
    Top = 401
    Width = 137
    Height = 17
    Caption = 'Enable Joysticks'
    TabOrder = 14
  end
  object CheckBox7: TCheckBox
    Left = 96
    Top = 424
    Width = 137
    Height = 17
    Caption = 'Enable Light Guns'
    TabOrder = 15
  end
  object ComboBox2: TComboBox
    Left = 255
    Top = 223
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 16
    Text = 'Auto'
    Items.Strings = (
      'Auto'
      'HD 1280x720'
      'FULLHD 1920x1080'
      '4K 3840x1920')
  end
  object ComboBox4: TComboBox
    Left = 255
    Top = 252
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 17
    Text = '2D'
    Items.Strings = (
      '2D'
      '3D'
      'Isometric 2.5')
  end
  object ComboBox5: TComboBox
    Left = 414
    Top = 223
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 18
    Text = 'Auto'
    Items.Strings = (
      'Auto'
      'HD 1280x720'
      'FULLHD 1920x1080'
      '4K 3840x1920')
  end
  object ComboBox6: TComboBox
    Left = 414
    Top = 252
    Width = 153
    Height = 23
    ItemIndex = 0
    TabOrder = 19
    Text = '2D'
    Items.Strings = (
      '2D'
      '3D'
      'Isometric 2.5')
  end
end
