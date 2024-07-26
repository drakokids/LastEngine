unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, test3Dfrm,
  Vcl.ComCtrls, NumEdit, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Project1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Reopen1: TMenuItem;
    none1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Run1: TMenuItem;
    Compile1: TMenuItem;
    Preview1: TMenuItem;
    Export1: TMenuItem;
    Tools1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    SpriteEditor1: TMenuItem;
    errainEditor1: TMenuItem;
    ilemapEditor1: TMenuItem;
    RoadsEditor1: TMenuItem;
    test31: TMenuItem;
    View1: TMenuItem;
    GameEditor1: TMenuItem;
    CodeEditor1: TMenuItem;
    LeftPanel: TPanel;
    PanelLevels: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    PanelObjects: TPanel;
    Panel4: TPanel;
    TreeView2: TTreeView;
    PopupMenuLevels: TPopupMenu;
    EditProperties1: TMenuItem;
    NewLevel1: TMenuItem;
    DeleteLevel1: TMenuItem;
    DuplicateLevel1: TMenuItem;
    PopupMenuObjects: TPopupMenu;
    ObjectProperties1: TMenuItem;
    NewObject1: TMenuItem;
    DeleteObject1: TMenuItem;
    CloneObject1: TMenuItem;
    Gui1: TMenuItem;
    Map1: TMenuItem;
    Sprite1: TMenuItem;
    ParticleSystem1: TMenuItem;
    RoadSystem1: TMenuItem;
    N3DObject1: TMenuItem;
    PanelObjectProperties: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    FloatEdit1: TFloatEdit;
    FloatEdit2: TFloatEdit;
    FloatEdit3: TFloatEdit;
    Label3: TLabel;
    FloatEdit4: TFloatEdit;
    FloatEdit5: TFloatEdit;
    FloatEdit6: TFloatEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    FloatEdit7: TFloatEdit;
    FloatEdit8: TFloatEdit;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label8: TLabel;
    EditFontSize: TIntEdit;
    UpDown1: TUpDown;
    Label9: TLabel;
    Shape3: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    TreeView3: TTreeView;
    Options1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N3: TMenuItem;
    Properties1: TMenuItem;
    procedure test31Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  My3DTest: TFormTest3D;

const
  VERSION='0.3.0';

implementation

{$R *.dfm}

uses OptionsDlg, ProjectPropertiesDlg, inifiles;

procedure TMainForm.New1Click(Sender: TObject);
var myini: TInifile;
begin
    if ProjectProperties.execute then
     begin
      myini:=TInifile.Create(ProjectProperties.dir+'\'+ProjectProperties.EditProjectName.text+'.lastengine');
      myini.WriteString('PROJECT','NAME',ProjectProperties.EditProjectName.text);
      myini.WriteString('PROJECT','TYPE',ProjectProperties.EditProjectType.text);
      myini.Free;
     end;
end;

procedure TMainForm.Open1Click(Sender: TObject);
begin
   if OpenDialog1.Execute then
    begin

    end;
end;

procedure TMainForm.Options1Click(Sender: TObject);
begin
    OptionsDialog.ShowModal;
    if OptionsDialog.ModalResult=mrOk then
     begin

     end;

end;

procedure TMainForm.Saveas1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
   begin

   end;
end;

procedure TMainForm.test31Click(Sender: TObject);
begin
  My3DTest:=TFormTest3D.Create(self);
  My3DTest.Show;
end;

end.
