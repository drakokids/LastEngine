unit SpriteUnit;

interface

uses Classes, FMX.types, System.Types, FMX.graphics, System.Math,
  System.Math.Vectors;

type
  TGameSprite = class(TComponent)

  private
    Findex: integer; //Index of the sprite
    FResourceid: integer;
    FResourceRect: TRectf;
    FPos: Tpointf;
    FSize: TPointF;
    FRotation: single;
    FOpacity: single;
    FZoom: single;
    FBuffer: TBitmap;
  public
    constructor Create(sizeW,sizeH: integer); reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure AssignResource(alias:string);
    procedure SetPosition(x,y: single);
    procedure Rotate(angle: single);
    procedure Render(canvas: TCanvas);
    procedure Prepare;
  published
    property Index: integer read Findex write Findex;
    property ResourceID: integer read FResourceID write FResourceID;
  end;

implementation

{ TGameSprite }

uses ResourcesContainer;

constructor TGameSprite.Create(sizeW,sizeH: integer);
var size: integer;
begin
   FOpacity:=1;
   FRotation:=0;
   FPos:=Pointf(0,0);
   FZoom:=1;
   if sizeW>sizeH then size:=sizeW else size:=sizeH;
   FBuffer:=TBitmap.create(size,size);
end;

destructor TGameSprite.Destroy;
begin
  FBuffer.free;
end;

procedure TGameSprite.AssignResource(alias: string);
var res_id:integer;
begin
   res_id:=FGameResourcesContainer.GetResourceID(alias);
   FResourceid:=res_id;
   FSize.X:=FGameResourcesContainer.ResourceBitmap(res_id).width;
   FSize.Y:=FGameResourcesContainer.ResourceBitmap(res_id).height;
   FResourceRect:=Rectf(0,0,FSize.X,FSize.Y);
   Prepare;
end;

procedure TGameSprite.Prepare;
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

procedure TGameSprite.Render(canvas: TCanvas);
var dRect: TRectf;
    originalMatrix, newMatrix: TMatrix;
begin
//  originalMatrix := canvas.Matrix;
//  newMatrix := originalMatrix * TMatrix.CreateTranslation(-Fpos.X,- FPos.Y);
//  newMatrix := newMatrix * TMatrix.CreateRotation(FRotation);
//  //newMatrix := newMatrix * TMatrix.CreateTranslation(Fpos.X, FPos.Y);
//  canvas.SetMatrix(newMatrix);
//
//  dRect:=Rectf(Fpos.X,FPos.Y,Fpos.X+FSize.X,Fpos.Y+Fsize.Y);
//  dRect:=Rectf(0,0,FSize.X,FSize.Y);
//  canvas.DrawBitmap(FGameResourcesContainer.ResourceBitmap(index),
//      FResourceRect,dRect,FOpacity,false);
//
//
//  canvas.SetMatrix(originalmatrix);

// DrawRotatedBitmap(Canvas, FGameResourcesContainer.ResourceBitmap(index),
//  Fpos, 1,FRotation,true);

  dRect:=Rectf(FPos.X-FBuffer.Width/2, Fpos.y-FBuffer.Height/2,FPos.X+FBuffer.Width/2, Fpos.y+ FBuffer.Height/2);

  canvas.DrawBitmap(FBuffer,rectf(0,0,FBuffer.Width,FBuffer.Height),dRect,FOpacity,false);


end;

procedure TGameSprite.Rotate(angle: single);
begin
  FRotation:=FRotation+angle;
  Prepare;
end;

procedure TGameSprite.SetPosition(x, y: single);
begin
   FPos:=Pointf(x,y);
end;

end.
