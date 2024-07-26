unit GameUnit2;

interface

uses Classes, fmx.Graphics, System.UITypes,System.Types,
LastEngineTypes, SceneUnit, guiunit,LastEngineZipContainer;

type
  TGame = class(TComponent)

  private
    Findex: integer;
    FCurrentScene: integer;
    FBackgroundColor: TAlphacolor;
    FScenes: array of TGameScene;
    FGuis: array of TGameGui;
    FActiveScene: integer;
    FActiveGui: integer;
    FGameContainer: TZipContainer;
    FWidth, FHeight: integer;
  public
    constructor Create(GameWidth, GameHeight: integer); reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    function AddScene: integer;
    function AddGui: integer;
    function Scene(index: integer):TGameScene;
    function Gui(index:integer): TGameGui;
    procedure Render(Canvas: TCanvas; fps: integer);
  published
    property Index: integer read Findex write Findex;
    property ActiveScene: integer read FActiveScene write FActiveScene;
    property ActiveGui: integer read FActiveGui write FActiveGui;
    property Container:TZipContainer read FGameContainer;
    property Width: integer read FWidth write FWidth;
    property Height: integer read FHeight write FHeight;
  end;

implementation

{ TGame }

uses FMXRenderer;

constructor TGame.Create(GameWidth, GameHeight:integer);
begin
  FActiveScene:=-1;
  FBackgroundColor:=TAlphaColors.Aliceblue;
  FWidth:=GameWidth;
  FHeight:=GameHeight;
  CreateFMXRenderer;
end;

destructor TGame.Destroy;
var i: integer;
begin
  for i := 0 to length(FScenes)-1 do
   FScenes[i].Destroy;
  DestroyFMXRenderer;
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

    FActiveScene:=index;
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

procedure TGame.Render(Canvas: TCanvas; fps: integer);
begin
   Canvas.BeginScene;
   Canvas.Fill.Color:= FBackgroundColor;
   Canvas.Stroke.Color :=  TAlphaColors.Red;
   Canvas.FillRect(Rectf(0,0,canvas.width,canvas.height),1);

   if FActiveScene>=0 then FScenes[FActiveScene].Render(Canvas);


   RenderFPS(Canvas,fps);

   Canvas.EndScene;
end;

end.
