unit MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  System.Rtti, FMX.Grid.Style, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Grid, FMX.ScrollBox, FMX.StdCtrls, FMX.TreeView, FMX.Layouts,
  FMX.TabControl, FMX.Controls.Presentation, FMX.ListBox, FMX.Platform,
  FMX.DialogService,system.IOUtils,
  //DKEngine Units ( 2D Game Engine )
  DKEngine2,DKScene2,
  //DK3DEngine Units ( 3D Game Engine OpenGL )

  //**********************
  system.Math.Vectors,system.Math, FMX.Memo.Types, FMX.Memo;

type //Information about the one node in the treeView
 TNodeInfo=record
   NodeText:string;
   NodeType: integer; //0-Scene, 1-Layer, 2-Map, 3-Gui, 4-Sprite, 5-ParticleSystem, 6-Sound
 end;

 TGameInfo=record
   GameName: string;
   Saved:boolean; //Se j� foi gravado alguma vez
   uptodate: boolean; //All changes are saved to file
   ProjectFileName: string;
   ProjectType: integer; //0-Game, 1-Presentation, 2-DigitalSignage
   GameType: integer; //0-2D, 1-2.5D, 3-3D
   MonitorsCount: integer; //1, 2 or 3
   MobilePlatforms: boolean; //Android or iOS(future)
   WindowsPlatform,LinuxPlatform,MacPlatform: boolean;
 end;

type
  TMainForm = class(TForm)
    MenuBar1: TMenuBar;
    ImageList1: TImageList;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    TabControl2: TTabControl;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Editor1: TPaintBox;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Panel5: TPanel;
    Label1: TLabel;
    ComboSelectLevel: TComboBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TreeViewObjects: TTreeView;
    TreeViewItem1: TTreeViewItem;
    Panel4: TPanel;
    Button1: TButton;
    TabItem2: TTabItem;
    Panel3: TPanel;
    Grid1: TGrid;
    Column1: TColumn;
    Column2: TColumn;
    Panel6: TPanel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    TimerRender: TTimer;
    PopupMenuTreeObjects: TPopupMenu;
    MenuItem34: TMenuItem;
    Button11: TButton;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    ListBox1: TListBox;
    ImageListResources: TImageList;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel7: TPanel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Panel8: TPanel;
    Label4: TLabel;
    ComboBox3: TComboBox;
    PaintBox1: TPaintBox;
    Panel9: TPanel;
    Button15: TButton;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    TabItem10: TTabItem;
    TabControl3: TTabControl;
    TabItem11: TTabItem;
    TabItem12: TTabItem;
    Panel10: TPanel;
    Button16: TButton;
    Memo1: TMemo;
    Button17: TButton;
    Panel11: TPanel;
    Button18: TButton;
    Panel12: TPanel;
    Label5: TLabel;
    ComboBox4: TComboBox;
    Panel13: TPanel;
    Label6: TLabel;
    ComboBox5: TComboBox;
    Panel14: TPanel;
    Label7: TLabel;
    ComboBox6: TComboBox;
    Panel15: TPanel;
    Label8: TLabel;
    ComboBox7: TComboBox;
    Panel16: TPanel;
    Label9: TLabel;
    ComboBox8: TComboBox;
    Panel17: TPanel;
    Button19: TButton;
    Panel18: TPanel;
    Button20: TButton;
    Panel19: TPanel;
    Button21: TButton;
    Panel20: TPanel;
    Button22: TButton;
    Panel21: TPanel;
    Button23: TButton;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    PaintBox5: TPaintBox;
    PaintBox6: TPaintBox;
    PaintBox7: TPaintBox;
    Splitter1: TSplitter;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    TabItem13: TTabItem;
    Panel22: TPanel;
    Label10: TLabel;
    ComboBox9: TComboBox;
    ProjMapPaintBox: TPaintBox;
    procedure MenuItem2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerRenderTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Editor1Paint(Sender: TObject; Canvas: TCanvas);
    procedure FormShow(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure ComboSelectLevelChange(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GameInfo: TGameInfo;
    procedure SaveGame(filename: string);
    procedure LoadGame(filename: string);
    procedure NewGame;
  end;

var
  MainForm: TMainForm;
  MyTreeNodes: array of TNodeInfo;
  SelectedNode,selectedLayer: integer;

implementation

{$R *.fmx}

uses TreeViewNode, MenuOperations, Test3DOpenGL, projectProperties,inifiles,
    functions;

procedure TMainForm.ComboSelectLevelChange(Sender: TObject);
var sceneid: integer;
begin
    //Changed the scene, so we are going to show it
    sceneid:=ComboSelectLevel.ItemIndex;
    if(sceneid>=0)then
      TreeViewObjects.Items[0].Text:=ComboSelectLevel.Items[ComboSelectLevel.ItemIndex];
    Engine.GotoScene(sceneid);

end;

procedure TMainForm.Editor1Paint(Sender: TObject; Canvas: TCanvas);
begin
    Canvas.BeginScene;

    Engine.Render(0,0,Canvas);

    Canvas.EndScene;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
    Engine.Paused:=false;
    TimerRender.Enabled:=true;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Engine.StopEngine;
  Engine.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    Engine:=TDKEngine.Create(Editor1,1920,1080,'New Game',false);
    Engine.SetBackgroundColor(TAlphaColors.Aliceblue);
    Quality:=TCanvasQuality.HighQuality;
    Setlength(MyTreeNodes,0);
end;

procedure TMainForm.FormDeactivate(Sender: TObject);
begin
    TimerRender.Enabled:=false;
    Engine.Paused:=true;
end;

procedure TMainForm.FormShow(Sender: TObject);
var firstscene,i: integer;
    Node : TTreeViewNode;
begin
    //************************ SCENE START *****************************************************
    firstscene:=Engine.AddScene('SCENE_1',false,trunc(Engine.Width), trunc(Engine.Height));       //Scene1

    TreeViewObjects.Items[0].Text:='Scene 1'; //The parent Node is the current scene

    //Node := TTreeViewNode.Create(TreeViewObjects,'Scene 1');
    //TreeViewObjects.Items[0].AddObject(Node);

    ComboSelectLevel.Items.Clear;
    ComboSelectLevel.Items.Add('Scene 1');
    ComboSelectLevel.ItemIndex:=0;


    Engine.GotoScene(firstscene);
    Engine.RunEngine;

end;

procedure TMainForm.MenuItem12Click(Sender: TObject);
begin
  //Save
  if not GameInfo.Saved then
   begin
     if SaveDialog1.Execute then
       begin
         SaveGame(saveDialog1.FileName);
       end;
   end
  else
   SaveGame(GameInfo.ProjectFileName);

end;

procedure TMainForm.MenuItem13Click(Sender: TObject);
begin
  //Save as
  if SaveDialog1.Execute then
   begin
     SaveGame(saveDialog1.FileName);
   end;
end;

procedure TMainForm.MenuItem15Click(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.MenuItem25Click(Sender: TObject);
begin
    //Nova scene
    //Node := TTreeViewNode.Create(TreeViewObjects,'Scene 2');
    //TreeViewObjects.Items[0].AddObject(Node);

    NewScene;

end;

procedure TMainForm.MenuItem26Click(Sender: TObject);
begin
      NewSceneLayer;
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.MenuItem34Click(Sender: TObject);
begin
      NewSceneLayer;
end;

procedure TMainForm.MenuItem40Click(Sender: TObject);
begin
  FormTestOpenGL.show;
end;

procedure TMainForm.MenuItem8Click(Sender: TObject);
var
  ASyncService : IFMXDialogServiceASync;
begin
    //New Project
    if GameInfo.Saved and (not GameInfo.uptodate) then
     begin
      ASyncService.MessageDialogAsync( 'Game is not saved. Discard changes ?', TMsgDlgType.mtConfirmation,
                                                   [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
     procedure(const AResult: TModalResult)
     begin
       case AResult of
         mrYES : newGame;
       end;
     end
     );

     end
    else
     newGame;
end;

procedure TMainForm.MenuItem9Click(Sender: TObject);
begin
    if OpenDialog1.Execute then
     begin
      LoadGame(OpenDialog1.FileName);
     end;
end;

procedure TMainForm.TimerRenderTimer(Sender: TObject);
begin
    Invalidate;
end;

procedure TMainForm.SaveGame(filename: string);
var myini: TInifile;
    folder:string;
begin
    myini:=TInifile.Create(filename);
    myini.WriteString('PROJECT','NAME',GameInfo.GameName);
    myini.WriteString('PROJECT','TYPE',inttostr(GameInfo.ProjectType));
    myini.WriteString('PROJECT','GAMETYPE',inttostr(GameInfo.GameType));
    myini.WriteString('PROJECT','MONITORS',inttostr(GameInfo.MonitorsCount));
    myini.WriteString('PROJECT','MOBILEPLATFORMS',BooltoChar(GameInfo.MobilePlatforms));
    myini.WriteString('PROJECT','WINDOWSPLATFORM',BooltoChar(GameInfo.WindowsPlatform));
    myini.WriteString('PROJECT','LINUXPLATFORM',BooltoChar(GameInfo.LinuxPlatform));
    myini.WriteString('PROJECT','MACPLATFORM',BooltoChar(GameInfo.MacPlatform));

    myini.UpdateFile;
    myini.Free;

    //Now some folders for the game
    folder:=ExtractFilePath(filename);   //inclui a barra /

    forcedirectories(TPath.Combine(folder,'images')); //Images
    forcedirectories(TPath.Combine(folder,'data'));  //To save games and scores
    forcedirectories(TPath.Combine(folder,'sounds')); //music and sounds
    forcedirectories(TPath.Combine(folder,'scripts')); //scripts for the game


end;

procedure TMainForm.LoadGame(filename: string);
var myini: TInifile;
begin
    myini:=TInifile.Create(filename);
    GameInfo.GameName:=myini.ReadString('PROJECT','NAME','');



end;

procedure TMainForm.NewGame;
begin
  GameInfo.GameName:='New Game';
  GameInfo.Saved:=false;
  GameInfo.uptodate:=false;
  GameInfo.ProjectFileName:='';
  GameInfo.ProjectType:=0;
  GameInfo.GameType:=0;
  GameInfo.MonitorsCount:=1;
  GameInfo.MobilePlatforms:=false;
  GameInfo.WindowsPlatform:=true;
  GameInfo.LinuxPlatform:=false;
  GameInfo.MacPlatform:=false;

  FormProjectProperties.Show;

end;

end.