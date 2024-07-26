unit TilemapUnit;

interface

uses Classes,system.Types,system.SysUtils,fmx.Graphics, fmx.types;

type
  TGameTilemap = class(TComponent)

  private
    FCols,FRows: integer;
    FTilemapRect:TrectF;
    FTileWidth,FTileHeight: integer;
    FTilesAnimation: array of TTilesAnimation;
    FAnimationTime: TTimer;  //One timer for animations, 50ms delay
    FTiles: array of TTile;   // row0 + row1 + row2.... position=y*cols+x
    FBitmaps: array of TBitmap;
    FReady:boolean;
    FBufferImage: TBitmap;
    FMapPosition: TPointf;
    FAnimationTicks: integer; // 1 to 1000 and restarts
    procedure DoTimerAnimation(Sender: TObject);
  public
    constructor Create(nCols,nRows,Dx,Dy,ViewWidth,ViewHeight,TileW,TileH: integer); reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    function LoadAnimationTiles(formatedFileName: string; FirstFrame,LastFrame: integer): integer;
    procedure SetAnimatedTile(x,y,TileAnimationid,delayms: integer);
    procedure Render(Canvas: TCanvas);
    procedure Refresh;
  published
    property cols: integer read FCols write FCols;
    property rows: integer read FRows write FRows;
    property TilemapRect: TRectF read FTilemapRect write FTilemapRect;
  end;

implementation

{ TGameTilemap }

uses LastEngineTypes;

constructor TGameTilemap.Create(nCols,nRows,Dx,Dy,ViewWidth,ViewHeight,TileW,TileH: integer);
begin
  FCols:=ncols;
  FRows:=nrows;
  FTileWidth:=TileW;
  FTileHeight:=TileH;
  FTilemapRect:=rectf(0,0,ViewWidth,ViewHeight);
  SetLength(FTiles,FCols*FRows);  // row0 + row1 + row2.... position=y*cols+x
  FReady:=false;
  FBufferImage:=TBitmap.Create(ViewWidth,ViewHeight); //Small for now
  FMapPosition:=Tpointf.Create(DX,DY);
  FAnimationTime:=TTimer.Create(self);
  FAnimationTime.Interval:=50;
  FAnimationTime.OnTimer:=DoTimerAnimation;
  FAnimationTicks:=0;

end;

destructor TGameTilemap.Destroy;
var i: integer;
begin
  FAnimationTime.Free;
  for i := 0 to length(FBitmaps)-1 do FBitmaps[i].Free;
  FBufferImage.Free;
end;

procedure TGameTilemap.DoTimerAnimation(Sender: TObject);
var x,y: integer;
    tempTile: TTile;
    tempAnimation, nexttick: integer;
begin
  FAnimationTicks:=FAnimationTicks+1;
  if FAnimationTicks>1000 then FAnimationTicks:=0;

  for y := 0 to FRows-1 do
    for x := 0 to FCols-1 do
      begin
       tempTile:=FTiles[y*cols+x];
       if tempTile.isAnimation then
        begin

         tempAnimation:=tempTile.Animationindex;
         nexttick:=temptile.FNextAnimationTick;

         if nexttick<FAnimationTicks then
          begin
           FTiles[y*cols+x].isReady:=false;
           nexttick:=FAnimationTicks+(temptile.delayms div 50);
           if nexttick>1000 then nexttick:=nexttick-1000;
           FTiles[y*cols+x].FNextAnimationTick:=nexttick;
           FReady:=false;
          end;


        end;
      end;

end;

//Load Animation Tiles from from folder
function TGameTilemap.LoadAnimationTiles(formatedFileName: string; FirstFrame,LastFrame: integer): integer;
var s: string;
    i,b,index: integer;
begin
    index:=length(FTilesAnimation);
    setlength(FTilesAnimation,index+1);
    FTilesAnimation[index].Animationindex:=index;

    for i := 0 to (LastFrame-FirstFrame)-1 do
     begin
      SetLength(FTilesAnimation[index].Frames,i+1);

      //Load a new image
      b:=length(FBitmaps);
      SetLength(FBitmaps,b+1);
      s:=FMediaFolder+format(formatedFileName,[FirstFrame+i]);

      FBitmaps[b]:=TBitmap.CreateFromFile(s);

      FTilesAnimation[index].Frames[i]:=b;

     end;

    result:=index;
end;

//Makes one tile animated
procedure TGameTilemap.SetAnimatedTile(x,y,TileAnimationid,delayms: integer);
begin
  FTiles[y*FCols+x].isAnimation:=true;
  FTiles[y*FCols+x].Animationindex:=TileAnimationid;
  FTiles[y*FCols+x].delayms:=delayms;
  FTiles[y*FCols+x].isReady:=false;
  FTiles[y*FCols+x].FramesCount:=length(FTilesAnimation[TileAnimationid].Frames);
  FTiles[y*FCols+x].FNextAnimationTick:=0; //Do as soon as possible
  FTiles[y*FCols+x].CurrentFrame:=-1;
end;

procedure TGameTilemap.Render(Canvas: TCanvas);
begin
  if not Fready then Refresh;

  canvas.DrawBitmap(FBufferImage,
    rectf(0,0,FBufferImage.Width, FBufferImage.Height),
    rectf(FMapPosition.X,FMapPosition.y,FMapPosition.X+FBufferImage.Width,FMapPosition.y+FBufferImage.Height),
    1,false);




end;

procedure TGameTilemap.Refresh;
var x,y: integer;
    tempTile: TTile;
    tempAnimation: integer;
    w,h: integer;
begin

   for y := 0 to FRows-1 do
    for x := 0 to FCols-1 do
      begin
       tempTile:=FTiles[y*cols+x];
       if tempTile.isAnimation and (not tempTile.isReady) then
        begin
         tempTile.CurrentFrame:=tempTile.CurrentFrame+1;
         if tempTile.CurrentFrame>=tempTile.FramesCount then tempTile.CurrentFrame:=0;

         tempAnimation:=tempTile.Animationindex;
         FBufferImage.Canvas.BeginScene;

         w:=FBitmaps[FTilesAnimation[tempAnimation].Frames[tempTile.CurrentFrame]].Width;
         h:=FBitmaps[FTilesAnimation[tempAnimation].Frames[tempTile.CurrentFrame]].Height;
         FBufferImage.Canvas.DrawBitmap(
          FBitmaps[FTilesAnimation[tempAnimation].Frames[tempTile.CurrentFrame]],
          rectf(0,0,w,h),
          rectf(x*FTileWidth,y*FTileHeight,x*FTileWidth+FTileWidth,y*FTileHeight+FTileHeight),
          1,false);

         FBufferImage.Canvas.EndScene;
         FTiles[y*cols+x].isReady:=true;
         FTiles[y*cols+x].CurrentFrame:=tempTile.CurrentFrame;
        end;
      end;
end;

end.
