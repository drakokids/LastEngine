unit ParticlesUnit;

interface

uses Classes,fmx.graphics,system.types, LastEngineTypes,System.Math,
  System.Math.Vectors;

type
  TGameParticles = class(TComponent)
  private
    Findex: integer; //Index of the particles
    FResourceID:integer;
    FBuffer: TBitmap;
    FSize: TPointF;
    FResourceRect: TRectf;
    FparticleType: LEparticleType;
    FOpacity:single;
    FRotation: single;
    FPos: Tpointf;
    FZoom: single;
    FAnimations: TGameAnimations;
    FBitmaps: array of TBitmap;
    FFrames: array of TRect;   // row0 + row1 + row2.... position=y*cols+x
  public
    constructor Create(sizeW,sizeH: integer); reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure AssignResource(alias:string);
    procedure Prepare;
    procedure Render(canvas: TCanvas);
    procedure SetPosition(x,y: single);
    procedure Rotate(angle: single);
    procedure LoadSpriteSheet(cols,rows: integer);
    function LoadAnimationTiles(formatedFileName: string; FirstFrame,LastFrame: integer): integer;
  published
    property Index: integer read Findex write Findex;
    property ResourceID: integer read FResourceID write FResourceID;
    property particleType: LEparticleType read FparticleType write FparticleType;
  end;

implementation

uses ResourcesContainer;

{ TGameParticles }

procedure TGameParticles.AssignResource(alias: string);
var res_id:integer;
begin
   res_id:=FGameResourcesContainer.GetResourceID(alias);
   FResourceid:=res_id;
   FSize.X:=FGameResourcesContainer.ResourceBitmap(res_id).width;
   FSize.Y:=FGameResourcesContainer.ResourceBitmap(res_id).height;
   FResourceRect:=Rectf(0,0,FSize.X,FSize.Y);
   Prepare;
end;

constructor TGameParticles.Create(sizeW,sizeH: integer);
var size: integer;
begin
   FOpacity:=1;
   FRotation:=0;
   FPos:=Pointf(0,0);
   FZoom:=1;
   if sizeW>sizeH then size:=sizeW else size:=sizeH;
   FBuffer:=TBitmap.create(size,size);

end;

destructor TGameParticles.Destroy;
begin
     FBuffer.free;
end;

procedure TGameParticles.Prepare;
var tempBmp: TBitmap;
    marginx,marginy: single;
begin
  marginx:=(FBuffer.Width - FResourceRect.Width)/2;
  marginy:=(FBuffer.Height - FResourceRect.Height)/2;
  FBuffer.Canvas.BeginScene;

  tempBmp:=Tbitmap.Create(trunc(FSize.x),trunc(FSize.y));
  tempBmp.Clear($00000000);
  tempBMP.Canvas.BeginScene;
  tempBMP.Canvas.DrawBitmap(FGameResourcesContainer.ResourceBitmap(FResourceid),
      FResourceRect,rectf(marginx,marginy,marginx+FResourceRect.Width, marginy+FResourceRect.Height),1,false);
  tempbmp.Canvas.EndScene;
  //tempBmp.Assign(FGameResourcesContainer.ResourceBitmap(FResourceid));
  tempBmp.Rotate(FRotation);


  FBuffer.Clear($00000000);
  marginx:=(tempBmp.Width - FBuffer.Width)/2;
  marginy:=(tempBmp.Height - FBuffer.Height)/2;
  FBuffer.Canvas.DrawBitmap(tempBmp,rectf(marginx,marginy,marginx+FBuffer.Width, marginy+FBuffer.Height),
      rectf(0,0,FBuffer.Width,FBuffer.Height ),1,false);
  tempBmp.free;

  FBuffer.Canvas.EndScene;
end;

procedure TGameParticles.Render(canvas: TCanvas);
var dRect: TRectf;
    originalMatrix, newMatrix: TMatrix;
begin

  dRect:=Rectf(FPos.X-FBuffer.Width/2, Fpos.y-FBuffer.Height/2,FPos.X+FBuffer.Width/2, Fpos.y+ FBuffer.Height/2);

  canvas.DrawBitmap(FBuffer,rectf(0,0,FBuffer.Width,FBuffer.Height),dRect,FOpacity,false);

end;

procedure TGameParticles.Rotate(angle: single);
begin
  FRotation:=FRotation+angle;
  Prepare;
end;

procedure TGameParticles.SetPosition(x, y: single);
begin
   FPos:=Pointf(x,y);
end;

procedure TGameParticles.LoadSpriteSheet(cols,rows: integer);
begin

end;

function TGameParticles.LoadAnimationTiles(formatedFileName: string; FirstFrame,LastFrame: integer): integer;
begin

end;

end.
