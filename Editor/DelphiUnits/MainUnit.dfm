object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Last Engine v0.2'
  ClientHeight = 766
  ClientWidth = 1323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  Scaled = False
  TextHeight = 15
  object Panel1: TPanel
    Left = 255
    Top = 8
    Width = 714
    Height = 657
    Caption = 'Panel1'
    TabOrder = 0
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 766
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 1041
    object PanelLevels: TPanel
      Left = 8
      Top = 16
      Width = 225
      Height = 281
      Caption = 'PanelLevels'
      TabOrder = 0
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 223
        Height = 24
        Align = alTop
        Caption = 'Levels'
        TabOrder = 0
      end
      object TreeView1: TTreeView
        Left = 1
        Top = 25
        Width = 223
        Height = 223
        Align = alClient
        AutoExpand = True
        Indent = 19
        PopupMenu = PopupMenuLevels
        TabOrder = 1
        Items.NodeData = {
          0303000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          000000000001044D0065006E0075002C0000000000000000000000FFFFFFFFFF
          FFFFFF00000000000000000300000001074C006500760065006C002000310030
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          0945007000690073006F006400650020003100300000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000010945007000690073006F0064
          00650020003200300000000000000000000000FFFFFFFFFFFFFFFF0000000000
          00000000000000010945007000690073006F0064006500200033002C00000000
          00000000000000FFFFFFFFFFFFFFFF00000000000000000000000001074C0065
          00760065006C0020003200}
      end
      object Panel3: TPanel
        Left = 1
        Top = 248
        Width = 223
        Height = 32
        Align = alBottom
        TabOrder = 2
        object Button1: TButton
          Left = 5
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Edit'
          TabOrder = 0
        end
        object Button2: TButton
          Left = 82
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Delete'
          TabOrder = 1
        end
      end
    end
    object PanelObjects: TPanel
      Left = 9
      Top = 303
      Width = 224
      Height = 538
      Caption = 'PanelObjects'
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 222
        Height = 24
        Align = alTop
        Caption = 'Objects for Level .....'
        TabOrder = 0
      end
      object TreeView2: TTreeView
        Left = 5
        Top = 31
        Width = 212
        Height = 498
        Indent = 19
        PopupMenu = PopupMenuObjects
        TabOrder = 1
      end
    end
    object PanelObjectProperties: TPanel
      Left = 3
      Top = 856
      Width = 246
      Height = 545
      TabOrder = 2
      object Label1: TLabel
        Left = 5
        Top = 31
        Width = 32
        Height = 15
        Caption = 'Name'
      end
      object Label2: TLabel
        Left = 5
        Top = 60
        Width = 49
        Height = 15
        Caption = 'Pos X,Y,Z'
      end
      object Label3: TLabel
        Left = 5
        Top = 89
        Width = 44
        Height = 15
        Caption = 'Rot r,p,y'
      end
      object Label4: TLabel
        Left = 5
        Top = 167
        Width = 42
        Height = 15
        Caption = 'BkColor'
      end
      object Label5: TLabel
        Left = 5
        Top = 118
        Width = 44
        Height = 15
        Caption = 'Dim w,h'
      end
      object Shape1: TShape
        Left = 64
        Top = 170
        Width = 135
        Height = 15
      end
      object Label6: TLabel
        Left = 5
        Top = 188
        Width = 29
        Height = 15
        Caption = 'Color'
      end
      object Shape2: TShape
        Left = 64
        Top = 191
        Width = 135
        Height = 15
      end
      object Label7: TLabel
        Left = 5
        Top = 212
        Width = 24
        Height = 15
        Caption = 'Font'
      end
      object Label8: TLabel
        Left = 5
        Top = 244
        Width = 46
        Height = 15
        Caption = 'Font size'
      end
      object Label9: TLabel
        Left = 5
        Top = 267
        Width = 56
        Height = 15
        Caption = 'Font Color'
      end
      object Shape3: TShape
        Left = 64
        Top = 270
        Width = 135
        Height = 15
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 244
        Height = 24
        Align = alTop
        Caption = 'Object Properties'
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 64
        Top = 31
        Width = 145
        Height = 23
        TabOrder = 1
      end
      object FloatEdit1: TFloatEdit
        Left = 64
        Top = 60
        Width = 41
        Height = 23
        TabOrder = 2
        Text = '0.0'
      end
      object FloatEdit2: TFloatEdit
        Left = 111
        Top = 60
        Width = 41
        Height = 23
        TabOrder = 3
        Text = '0.0'
      end
      object FloatEdit3: TFloatEdit
        Left = 158
        Top = 60
        Width = 41
        Height = 23
        TabOrder = 4
        Text = '0.0'
      end
      object FloatEdit4: TFloatEdit
        Left = 64
        Top = 89
        Width = 41
        Height = 23
        TabOrder = 5
        Text = '0.0'
      end
      object FloatEdit5: TFloatEdit
        Left = 111
        Top = 89
        Width = 41
        Height = 23
        TabOrder = 6
        Text = '0.0'
      end
      object FloatEdit6: TFloatEdit
        Left = 158
        Top = 89
        Width = 41
        Height = 23
        TabOrder = 7
        Text = '0.0'
      end
      object CheckBox1: TCheckBox
        Left = 64
        Top = 147
        Width = 97
        Height = 17
        Caption = 'Visible'
        TabOrder = 8
      end
      object FloatEdit7: TFloatEdit
        Left = 64
        Top = 118
        Width = 41
        Height = 23
        TabOrder = 9
        Text = '0.0'
      end
      object FloatEdit8: TFloatEdit
        Left = 111
        Top = 118
        Width = 41
        Height = 23
        TabOrder = 10
        Text = '0.0'
      end
      object Edit2: TEdit
        Left = 64
        Top = 212
        Width = 135
        Height = 23
        TabOrder = 11
        Text = 'Arial'
      end
      object Button3: TButton
        Left = 205
        Top = 60
        Width = 32
        Height = 25
        Caption = 'Px'
        TabOrder = 12
      end
      object Button4: TButton
        Left = 158
        Top = 118
        Width = 32
        Height = 25
        Caption = 'Px'
        TabOrder = 13
      end
      object EditFontSize: TIntEdit
        Left = 64
        Top = 241
        Width = 33
        Height = 23
        TabOrder = 14
        Text = '0'
        Value = 0
      end
      object UpDown1: TUpDown
        Left = 97
        Top = 241
        Width = 23
        Height = 23
        Associate = EditFontSize
        Orientation = udHorizontal
        TabOrder = 15
      end
    end
  end
  object Panel6: TPanel
    Left = 1070
    Top = 0
    Width = 253
    Height = 766
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 1671
    ExplicitHeight = 1041
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 251
      Height = 24
      Align = alTop
      Caption = 'Palette'
      TabOrder = 0
    end
    object TreeView3: TTreeView
      Left = 1
      Top = 25
      Width = 251
      Height = 740
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 1
      Items.NodeData = {
        0306000000340000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000B000000010B47007500690020004F0062006A0065006300740073002A0000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010642
        007500740074006F006E00260000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010445006400690074002A00000000000000000000
        00FFFFFFFFFFFFFFFF0000000000000000000000000106430068006F00690063
        006500280000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        000000010543006800650063006B00280000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000105500061006E0065006C002A00000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000106530063
        0072006F006C006C00260000000000000000000000FFFFFFFFFFFFFFFF000000
        00000000000000000001044C00690073007400260000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000001045400650078007400280000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010549
        006D00610067006500280000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010556006900640065006F002E00000000000000000000
        00FFFFFFFFFFFFFFFF0000000000000000000000000108320044002000530068
        00610070006500320000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000B000000010A3200440020006F0062006A0065006300740073002A0000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010653
        00700072006900740065002E0000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000001084F00620073007400610063006C006500260000
        000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001044C
        0069006E006500280000000000000000000000FFFFFFFFFFFFFFFF0000000000
        000000000000000105530068006100700065002E0000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000001084D006100720069006F006E
        0065007400280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010557006100740065007200280000000000000000000000FFFFFF
        FFFFFFFFFF000000000000000000000000010550006C0061006E0074002A0000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010643
        006C006F00750064007300380000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010D53007000650061006300680020004400690061
        006C006F006700280000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000001054C0069006700680074002E0000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010832004400200049006D0061
        0067006500320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000A000000010A3300440020004F0062006A0065006300740073002A00000000
        00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000106530070
        006800650072006500260000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010443007500620065002C0000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010750006900720061006D0069
        006400260000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        000000010443006F006E006500260000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000000000000010454007500620065002C0000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000000000000001074400690061006D
        006F006E0064002A0000000000000000000000FFFFFFFFFFFFFFFF0000000000
        00000000000000010643007500730074006F006D002C00000000000000000000
        00FFFFFFFFFFFFFFFF0000000000000000070000000107560065006800690063
        006C0065002C0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010757006800650065006C00650064002E00000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000000000000010841006900720070006C
        0061006E006500340000000000000000000000FFFFFFFFFFFFFFFF0000000000
        00000000000000010B43006100740065007200700069006C006C006100720026
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        0442006F00610074002A0000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010652006F0063006B0065007400320000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010A480065006C0069
        0063006F007000740065007200260000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000001044D006F0074006F002A0000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000000A000000010641006E0069006D
        0061006C00280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        00000000000105480075006D0061006E00280000000000000000000000FFFFFF
        FFFFFFFFFF000000000000000000000000010548006F00720073006500260000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010442
        00690072006400260000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000001044600690073006800360000000000000000000000FFFFFF
        FFFFFFFFFF000000000000000000000000010C4D006100720069006E00650020
        004D0061006D0061006C00300000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010953006500610020005300680065006C006C0024
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        0344006F006700240000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000001034300610074002A0000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000106530070006900640065007200240000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010346
        006C0079002A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000800000001064E0061007400750072006500260000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000001045400720065006500280000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000000000000010550
        006C0061006E007400260000000000000000000000FFFFFFFFFFFFFFFF000000
        000000000000000000010452006F0063006B00280000000000000000000000FF
        FFFFFFFFFFFFFF000000000000000000000000010543006C006F007500640028
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        054F006300650061006E00280000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010552006900760065007200320000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010A57006100740065
        0072002000460061006C006C00260000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000001044C006100760061003C0000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000003000000010F53007000650063
        00690061006C0020004F0062006A006500630074007300340000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010B52006F00610064
        00200045006400690074006F0072002C0000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000107540069006C0065006D006100700032
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        0A48006500690067006800740020004D00610070003600000000000000000000
        00FFFFFFFFFFFFFFFF000000000000000007000000010C52006F006100640020
        004F0062006A006500630074007300380000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000000000010D530074007200610069006700680074
        00200052006F0061006400320000000000000000000000FFFFFFFFFFFFFFFF00
        0000000000000000000000010A43007500720076006500200052006F00610064
        00340000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        00010B4200690066007500720063006100740069006F006E0030000000000000
        0000000000FFFFFFFFFFFFFFFF000000000000000000000000010945006C0065
        0076006100740069006F006E002E0000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000000000000010844006F0077006E00480069006C006C0034
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        0B540069006C00740065006400200052006F00610064002A0000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010642007200690064
        00670065003E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000B00000001105000610072007400690063006C00650020004F0062006A0065
        00630074007300300000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000001094500780070006C006F00730069006F006E002800000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000000000000010553006D
        006F006B006500260000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000000000001045200610069006E00300000000000000000000000FFFFFF
        FFFFFFFFFF0000000000000000000000000109460069007200650077006F0072
        006B007300280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000010554007200610069006C002A0000000000000000000000FFFFFF
        FFFFFFFFFF00000000000000000000000001064200750062006C00650073002A
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
        064C0065006100760065007300260000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000001044400750073007400280000000000000000
        000000FFFFFFFFFFFFFFFF00000000000000000000000001055300700065006C
        006C00300000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        0000000109570069006E00640077006800690072006C00260000000000000000
        000000FFFFFFFFFFFFFFFF000000000000000000000000010446006900720065
        00}
      ExplicitHeight = 1015
    end
  end
  object MainMenu1: TMainMenu
    Left = 752
    Top = 24
    object Project1: TMenuItem
      Caption = 'Project'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = 'Open'
        OnClick = Open1Click
      end
      object Reopen1: TMenuItem
        Caption = 'Reopen'
        object none1: TMenuItem
          Caption = 'none'
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object Saveas1: TMenuItem
        Caption = 'Save as'
        OnClick = Saveas1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Properties1: TMenuItem
        Caption = 'Properties'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
    object Run1: TMenuItem
      Caption = 'Run'
      object Compile1: TMenuItem
        Caption = 'Compile'
      end
      object Preview1: TMenuItem
        Caption = 'Preview'
      end
      object Export1: TMenuItem
        Caption = 'Export'
      end
    end
    object Tools1: TMenuItem
      Caption = 'Tools'
      object Options1: TMenuItem
        Caption = 'Options'
        OnClick = Options1Click
      end
      object SpriteEditor1: TMenuItem
        Caption = 'Sprite Editor'
      end
      object errainEditor1: TMenuItem
        Caption = 'Terrain Editor'
      end
      object ilemapEditor1: TMenuItem
        Caption = 'Tilemap Editor'
      end
      object RoadsEditor1: TMenuItem
        Caption = 'Roads Editor'
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object GameEditor1: TMenuItem
        Caption = 'Game Editor'
      end
      object CodeEditor1: TMenuItem
        Caption = 'Code Editor'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
      end
    end
    object test31: TMenuItem
      Caption = 'test3D'
      OnClick = test31Click
    end
  end
  object PopupMenuLevels: TPopupMenu
    Left = 160
    Top = 128
    object EditProperties1: TMenuItem
      Caption = 'Edit Properties'
    end
    object NewLevel1: TMenuItem
      Caption = 'New Level'
    end
    object DeleteLevel1: TMenuItem
      Caption = 'Delete Level'
    end
    object DuplicateLevel1: TMenuItem
      Caption = 'Duplicate Level'
    end
  end
  object PopupMenuObjects: TPopupMenu
    Left = 161
    Top = 439
    object ObjectProperties1: TMenuItem
      Caption = 'Object Properties'
    end
    object NewObject1: TMenuItem
      Caption = 'New'
      object Gui1: TMenuItem
        Caption = 'Gui'
      end
      object Map1: TMenuItem
        Caption = 'Map'
      end
      object Sprite1: TMenuItem
        Caption = 'Sprite'
      end
      object ParticleSystem1: TMenuItem
        Caption = 'Particle System'
      end
      object RoadSystem1: TMenuItem
        Caption = 'Road System'
      end
      object N3DObject1: TMenuItem
        Caption = '3D Object'
      end
    end
    object DeleteObject1: TMenuItem
      Caption = 'Delete Object'
    end
    object CloneObject1: TMenuItem
      Caption = 'Clone Object'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 1024
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 1152
    Top = 24
  end
end
