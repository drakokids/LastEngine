unit LastEngineFMX;

interface

uses System.types,System.UIConsts, System.UITypes, system.SysUtils,system.Classes,
 FMX.Forms, FMX.Types, FMX.Graphics, System.DateUtils,
 GameUnit;

type
  TLastEngineFMX = class(TComponent)
  procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
  private
    isrunning: boolean;
    framecount,fps: integer;
    framestimer: TTimer;
    FLastIdle: TTime;
    procedure CustomFramesTimer(Sender: TObject);
  public
    GameRenderMode: integer;
    fEditorMode: boolean; //Para usarmos o motor no Editor de jogos
    fShowGuidelines: boolean; //Em modo editor podemos mostrar as linhas/contornos/grids dos sprites/colisões/cenários
    fShowFps: boolean;
    Parent: TForm; //Pointer to the parent form
    FGame: TGame; //The Game will contain everything
    constructor Create( AOwner: TForm; GameWidth, GameHeight: integer; GameTitle: string; vFullScreen: boolean); reintroduce; overload;
    destructor  Destroy; override;
    procedure StartEngine;
    procedure StopEngine;
    procedure FullScreen(form: TForm);
    procedure ScreenResize(width, height: integer);
    procedure CanvasPaint(Sender: TObject; Canvas: TCanvas;const ARect: TRectF);
  published
    property ShowGuidelines: boolean read fShowGuidelines write fShowGuidelines;
    property EditorMode: boolean read fEditorMode write fEditorMode;
    property ShowFps: boolean read fShowFps write fShowFps;
  end;

implementation

{ TLastEngine }
uses LastEngineTypes, FMXRenderer;

constructor TLastEngineFMX.Create(AOwner: TForm; GameWidth, GameHeight: integer;
  GameTitle: string; vFullScreen: boolean);
begin
  isrunning:=false;
  fEditorMode:=false;
  fShowGuidelines:=false;
  fShowFps:=false;
  Parent:=AOwner;

  framecount:=0;
  framestimer:=TTimer.Create(self);
  framestimer.Interval:=1000; //Once every second
  framestimer.OnTimer:=CustomFramesTimer;

  CreateFMXRenderer(AOwner);
  AOwner.OnPaint:=CanvasPaint;

  Application.OnIdle := ApplicationEventsIdle;
  if vFullScreen then FullScreen(AOwner);

  framestimer.Enabled:=true;


end;

destructor TLastEngineFMX.Destroy;
begin
   DestroyFMXRenderer;
   inherited;
end;

procedure TLastEngineFMX.StartEngine;
begin

    isrunning:=true;
end;

procedure TLastEngineFMX.StopEngine;
begin
    isrunning:=false;
end;

//Vai desenhar aqui
procedure TLastEngineFMX.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
    if not isrunning then exit;

   // if MilliSecondsBetween(FLastIdle, Now()) > 5 then
     begin
      Parent.Invalidate;
      FLastIdle := Now();
     end;

    Done := False;
end;

procedure TLastEngineFMX.CanvasPaint(Sender: TObject; Canvas: TCanvas;const ARect: TRectF);
begin
   RenderFMX(Canvas,fps);
   framecount:=framecount+1;
end;

procedure TLastEngineFMX.FullScreen(form: TForm);
begin
  form.BorderStyle := FMX.Forms.TFmxFormBorderStyle.None;
  form.WindowState := System.UITypes.TWindowState.wsMaximized;
  form.Formstyle:= FMX.Types.TFormStyle.StayOnTop;
  ResizeView(form.width,form.height);
end;

procedure TLastEngineFMX.ScreenResize(width, height: integer);
begin
   ResizeView(width,height);
end;

procedure TLastEngineFMX.CustomFramesTimer(Sender: TObject);
begin
   fps:=framecount;
   framecount:=0;
end;

end.
