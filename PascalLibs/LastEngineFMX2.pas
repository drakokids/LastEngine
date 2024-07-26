unit LastEngineFMX2;

interface

uses System.types,System.UIConsts, System.UITypes, system.SysUtils,system.Classes,
 FMX.Forms, FMX.Types, FMX.Graphics, System.DateUtils,gameunit2, LastEngineTypes,
 ResourcesContainer, ZipContainer;

type
  TLastEngineFMX = class(TComponent)
  procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
  private
    FGame: TGame; //The Game will contain everything
    FParent: TForm; //Pointer to the parent form
    isrunning: boolean;
    framecount,fps: integer;
    framestimer: TTimer;
    FLastIdle: TTime;
    fShowFps,fShowGuidelines: boolean;
    procedure CustomFramesTimer(Sender: TObject);
  public
    constructor Create( AOwner: TForm; GameWidth, GameHeight: integer; GameTitle: string; vFullScreen: boolean); reintroduce; overload;
    destructor  Destroy; override;
    procedure StartEngine;
    procedure StopEngine;
    procedure FullScreen(form: TForm);
    procedure ScreenResize(width, height: integer);
    procedure CanvasPaint(Sender: TObject; Canvas: FMX.Graphics.TCanvas;const ARect: TRectF);
    procedure SetMediaFolder(path:string);
    procedure AddResourceFromFile(aliasName, Filename: string);
  published
    property Game: TGame read FGame write FGame;
    property ShowFps: boolean read fShowFps write fShowFps;
    property ShowGuidelines: boolean read fShowGuidelines write fShowGuidelines;
  end;

implementation

{ TLastEngine }

uses FMXRenderer;

constructor TLastEngineFMX.Create(AOwner: TForm; GameWidth, GameHeight: integer;
  GameTitle: string; vFullScreen: boolean);
begin

  isrunning:=false;
  fShowGuidelines:=false;
  fShowFps:=false;
  FParent:=AOwner;

  framecount:=0;
  framestimer:=TTimer.Create(self);
  framestimer.Interval:=1000; //Once every second
  framestimer.OnTimer:=CustomFramesTimer;

  Game:=TGame.Create(GameWidth, GameHeight);
  FGameZipContainer:=TZipContainer.Create;
  FGameResourcesContainer:=TResourcesContainer.Create;

  AOwner.OnPaint:=CanvasPaint;

  Application.OnIdle := ApplicationEventsIdle;
  if vFullScreen then FullScreen(AOwner);

  framestimer.Enabled:=true;

end;

destructor TLastEngineFMX.Destroy;
begin
  FGame.free;
  FGameZipContainer.Free;
  FGameResourcesContainer.Free;
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
      FParent.Invalidate;
      FLastIdle := Now();
     end;

    Done := False;
end;

procedure TLastEngineFMX.CanvasPaint(Sender: TObject; Canvas: FMX.Graphics.TCanvas;const ARect: TRectF);
begin
   FGame.Render(Canvas,fps);
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

procedure TLastEngineFMX.SetMediaFolder(path:string);
begin
    FMediaFolder:=path;
end;

procedure TLastEngineFMX.AddResourceFromFile(aliasName, Filename: string);
begin
   FGameResourcesContainer.AddFromFile(aliasName,filename);
end;


end.
