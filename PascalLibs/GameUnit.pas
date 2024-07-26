unit GameUnit;

interface

uses Classes,GuiUnit,SceneUnit,LastEngineTypes, LastEngineZipContainer;

type
  TGame = class(TComponent)

  private
    Findex: integer;
    FCurrentScene: integer;
    FBackgroundColor: LE_Color;
    FScenes: array of TGameScene;
    FGuis: array of TGameGui;
    FActiveScene: integer;
    FActiveGui: integer;
    FGameContainer: TZipContainer;
  public
    //FGuis: array of Tgui; //It's possible to have several Gui's at the same time
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    function AddScene: integer;
    function AddGui: integer;
    function Scene(index: integer):TGameScene;
    function Gui(index:integer): TGameGui;
  published
    property Index: integer read Findex write Findex;
    property ActiveScene: integer read FActiveScene write FActiveScene;
    property ActiveGui: integer read FActiveGui write FActiveGui;
    property Container:TZipContainer read FGameContainer;
  end;

implementation

{ TGame }

constructor TGame.Create;
begin
  FActiveScene:=-1;
end;

destructor TGame.Destroy;
var i: integer;
begin
  for i := 0 to length(FScenes)-1 do
   FScenes[i].Destroy;
  inherited;
end;

function TGame.AddGui: integer;
var index: integer;
begin
    index:=Length(FGuis);
    SetLength(FGuis,index+1);
    FGuis[index]:=TGameGui.Create(self);
    FGuis[index].Index:=index;

    result:=index;
end;

function TGame.AddScene: integer;
var index: integer;
begin
    index:=Length(FScenes);
    SetLength(FScenes,index+1);
    FScenes[index]:=TGameScene.Create(self);
    FScenes[index].Index:=index;

    result:=index;
end;

function TGame.Scene(index: integer):TGameScene;
begin
   result:=FScenes[index];
end;

function TGame.Gui(index:integer): TGameGui;
begin
   result:=FGuis[index];
end;


end.
