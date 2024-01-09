unit D2DRenderer;
//https://docwiki.embarcadero.com/RADStudio/Sydney/en/Using_the_Direct2D_Canvas

interface

uses System.Classes,FOrms,Vcl.Direct2D, Winapi.D2D1,Winapi.Windows,
    Winapi.Messages,vcl.Graphics, Vcl.ExtCtrls, System.SysUtils;

type
  TD2DRenderer = class(TComponent)
  private
    isrunning: boolean;
    framecount, fps: integer;
    FD2DCanvas : TDirect2DCanvas;
    ParentForm: TForm;
    HandletoForm: HWND;
    WindowWidth,WindowHeight: integer;
    framestimer: TTimer;
    FLastIdle: TTime;
    procedure CustomFramesTimer(Sender: TObject);
    procedure WindowResize(Sender: TObject);
  public
    constructor Create( AOwner: TForm); reintroduce; overload;
    destructor  Destroy; override;
    function CreateD2DCanvas(Handle: HWND): Boolean;
    procedure Resize(w,h: integer);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure Render(Sender: TObject);
    procedure StartEngine;
    procedure StopEngine;

  end;


implementation

//Vai criar um render com Direct 2D
constructor TD2DRenderer.Create( AOwner: TForm);
begin
   isrunning:=False;
   framecount:=0;
   fps:=0;
   framestimer:=TTimer.Create(self);
   framestimer.Interval:=1000; //Once every second
   framestimer.OnTimer:=CustomFramesTimer;
   ParentForm:=AOwner;
   HandletoForm:=AOwner.Handle;
   AOwner.OnResize:=WindowResize;
   AOwner.OnPaint:=Render;
   WindowWidth:=AOwner.Width;
   WindowHeight:=AOwner.Height;
   CreateD2DCanvas(HandletoForm);
   Application.OnIdle := ApplicationEventsIdle;

   framestimer.Enabled:=true;
end;

destructor TD2DRenderer.Destroy;
begin

end;

function TD2DRenderer.CreateD2DCanvas(Handle: HWND): Boolean;
begin
   try
      FD2DCanvas.Free;
      FD2DCanvas    := TDirect2DCanvas.Create(HandletoForm);
      Result        := TRUE;
   except
      Result        := FALSE;
   end;
end;

procedure TD2DRenderer.WindowResize(Sender: TObject);
begin

  Resize((Sender as TForm).ClientWidth,(Sender as TForm).ClientHeight);
  (Sender as TForm).Invalidate;

end;

procedure TD2DRenderer.Resize(w,h: integer);
var
 Size: D2D1_SIZE_U;
begin
   WindowWidth:=w;
   WindowHeight:=h;
   // When the windows is resized, we needs to resize RenderTarget as well
 Size := D2D1SizeU(WindowWidth, WindowHeight);
 ID2D1HwndRenderTarget(FD2DCanvas.RenderTarget).Resize(Size);

end;

//Vai desenhar aqui
procedure TD2DRenderer.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin

      if not isrunning then exit;

      framecount:=framecount+1;
      Render(ParentForm);
      FLastIdle := Now();

      Done := False;
end;

procedure TD2DRenderer.StartEngine;
begin

    isrunning:=true;
end;

procedure TD2DRenderer.StopEngine;
begin
    isrunning:=false;
end;

procedure TD2DRenderer.CustomFramesTimer(Sender: TObject);
begin
   fps:=framecount;
   framecount:=0;
end;

procedure TD2DRenderer.Render(Sender: TObject);
var
   Rect1 : D2D1_RECT_F;
   Angle : Single;
   I     : Integer;
const
   RECT_SIZE  = 50;
   ANGLE_STEP = 15.0;
begin
 FD2DCanvas.BeginDraw;
 try
   // Erase background
   FD2DCanvas.RenderTarget.Clear(D2D1ColorF(clDkGray));

   // Set pen color to draw rectangle outline
   FD2DCanvas.Pen.Color   := clYellow;

   // Clear all transformations
   FD2DCanvas.RenderTarget.SetTransform(TD2DMatrix3x2F.Identity);

   FD2DCanvas.TextOut(0,0,'fps '+inttostr(fps));

   // Define rectangle to be drawn. Top left corner in center of window
   Rect1:= Rect((WindowWidth  div 2),
                (WindowHeight div 2),
                (WindowWidth  div 2) + RECT_SIZE,
                (WindowHeight div 2) + RECT_SIZE);

   // Loop drawing the same rectangle but rotated step by step
   for I := 0 to Round(360.0 / ANGLE_STEP) do
    begin
     Angle := ANGLE_STEP * I;
     FD2DCanvas.RenderTarget.SetTransform(
                  TD2DMatrix3x2F.Rotation(Angle,Rect1.Left,Rect1.Top));
     FD2DCanvas.DrawRectangle(Rect1);
    end;


 finally
   FD2DCanvas.EndDraw;
 end;

end;

end.
