unit SceneUnit;
//The scene will contain all graphics to display such as
//sprites, maps, objects, etc
//One Game can have several scenes, but only one is visible at a time

interface

uses Classes,fmx.graphics, LastEngineTypes, spriteunit, object3Dunit,TilemapUnit,
RoadsUnit,particlesunit;

type
  TGameScene = class(TComponent)

  private
    Findex: integer; //Index of the scene
    FBackgroundColor: LE_Color;
    FBackgroundImage: fmx.graphics.TBitmap;
    FDrawBackgroundMode: LE_ImageDrawMode;
    FSceneType: LE_sceneType;
    FSprites: array of TGameSprite;
    FObjects3D: array of TGameObject3D;
    FTilemap: TGameTilemap; //Only one by scene
    FRoad: TGameRoad; //Only One by scene
    //FWorld2D: TGameWordl2D;//Only one by scene
    //FWorld3D: TGameWorld3D: //Only one by scene
    FParticles: TGameParticles; //Various groups of particles
  public
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    function AddObject3D: integer;
    function Object3D(index: integer):TGameObject3D;
    procedure CreateTileMap(Cols,Rows,Dx,Dy,ViewWidth,ViewHeight,TileW,TileH: integer);
    function AddSprite(ResourceAlias: string; spriteW,spriteH: integer): integer;
    function Sprite(index:integer): TGameSprite;
    procedure Render(Canvas: TCanvas);
  published
    property Index: integer read Findex write Findex;
    property SceneType: LE_sceneType read FSceneType write FSceneType;
    property Tilemap: TGameTilemap read FTilemap write FTilemap;
  end;

implementation

{ TGameScene }

constructor TGameScene.Create;
begin
   FSceneType:=LEScene2D;
   FTilemap:=nil;
end;

destructor TGameScene.Destroy;
var i: integer;
begin
  for i := 0 to length(FObjects3D)-1 do
   FObjects3D[i].free;
  for i := 0 to length(FSprites)-1 do
   FSprites[i].free;

  if FTilemap<>nil then FTilemap.Free;
end;

function TGameScene.AddObject3D: integer;
var index: integer;
begin
    index:=Length(FObjects3D);
    SetLength(FObjects3D,index+1);
    FObjects3D[index]:=TGameObject3D.Create(self);
    FObjects3D[index].Index:=index;

    result:=index;
end;

function TGameScene.Object3D(index: integer):TGameObject3D;
begin
   result:=FObjects3D[index];
end;

procedure TGameScene.CreateTileMap(Cols,Rows,Dx,Dy,ViewWidth,ViewHeight,TileW,TileH: integer);
begin
   FTilemap:=TGameTilemap.Create(Cols,Rows,Dx,Dy,ViewWidth,ViewHeight,TileW,TileH);
end;

procedure TGameScene.Render(Canvas: TCanvas);
var i: integer;
begin
   //The tilemap if any
   if FTilemap<>nil then FTilemap.render(Canvas);
   //Roads if any

   //Sprites if any
   for i := 0 to length(FSprites)-1 do
    FSprites[i].Render(canvas) ;
   //
end;

function TGameScene.AddSprite(ResourceAlias: string; spriteW,spriteH: integer): integer;
var index: integer;
begin
   index:=Length(FSprites);
   SetLength(FSprites,index+1);
   FSprites[index]:=TGameSprite.Create(spriteW,spriteH);
   FSprites[index].Index:=index;

   result:=index;
end;

function TGameScene.Sprite(index:integer): TGameSprite;
begin
   result:=FSprites[index];
end;

end.
