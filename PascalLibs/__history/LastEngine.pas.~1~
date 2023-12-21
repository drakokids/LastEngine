unit LastEngine;

//OpenGL baseado em https://learnopengl.com/
//Outro bom tutorial http://www.opengl-tutorial.org/

interface

// detecting Windows
{$IFDEF Win32}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

{$IFDEF Win64}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

// detecting Linux
{$IFDEF linux}          // Linux
  {$DEFINE DGL_LINUX}
{$ENDIF}

// 64 BIT architecture
// Free pascal
{$IFDEF CPU64}
  {$DEFINE DGL_64BIT}
{$ENDIF}
// Delphi
{$IFDEF WIN64}
  {$DEFINE DGL_64BIT}
{$ENDIF}

// generell options
{$H+,O+,X+}

uses
{$IFDEF FPC}  {$MODE Delphi}
Classes, Types, SysUtils, Forms, controls,{$IFDEF DGL_WIN}windows, {$ENDIF}
{$ELSE}
System.Classes, System.types,System.UIConsts, System.UITypes, system.SysUtils,
Vcl.Forms,
{$ENDIF}
LastEngineTypes;

type
  TLastEngine = class(TComponent)
  procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
  private
    isrunning: boolean;
  public
    GameRenderMode: integer;
    fEditorMode: boolean; //Para usarmos o motor no Editor de jogos
    fShowGuidelines: boolean; //Em modo editor podemos mostrar as linhas/contornos/grids dos sprites/colisões/cenários
    fShowFps: boolean;
    constructor Create( AOwner: TForm; GameWidth, GameHeight: integer; GameTitle: string; vFullScreen: boolean; RenderMode: integer); reintroduce; overload;
    destructor  Destroy; override;
    procedure StartEngine;
    procedure StopEngine;
    procedure FullScreen(form: TForm);
    procedure ScreenResize(width, height: integer);
  published
    property ShowGuidelines: boolean read fShowGuidelines write fShowGuidelines;
    property EditorMode: boolean read fEditorMode write fEditorMode;
    property ShowFps: boolean read fShowFps write fShowFps;
  end;

implementation

{ TLastEngine }

uses OpenGLRenderer, D2DRenderer, GDIPRenderer;

constructor TLastEngine.Create(AOwner: TForm; GameWidth, GameHeight: integer;
  GameTitle: string; vFullScreen: boolean; RenderMode: integer);
begin
   isrunning:=false;
   GameRenderMode:=RenderMode;
   fEditorMode:=false;
   fShowGuidelines:=false;
   fShowFps:=false;

   case RenderMode of
     OpenGL3D_render: CreateRenderer(AOwner,true);
     OPENGL2D_RENDER: CreateRenderer(AOwner,false);
     D2D_RENDER: CreateD2DRenderer(AOwner);
   else
     CreateGDIPRenderer(AOwner);
   end;

   Application.OnIdle := {$IFDEF FPC}@{$ENDIF}ApplicationEventsIdle;
   if vFullScreen then FullScreen(AOwner);

end;


destructor TLastEngine.Destroy;
begin
  if GameRenderMode=D2D_RENDER then DestroyD2DRenderer
  else if GameRenderMode=GDIPLUS_RENDER then DestroyGDIPRenderer
  else DestroyRenderer;
  inherited;
end;

procedure TLastEngine.StartEngine;
begin
    if GameRenderMode<>D2D_RENDER then glInit();
    isrunning:=true;
end;

procedure TLastEngine.StopEngine;
begin
    isrunning:=false;
end;

//Vai desenhar aqui
procedure TLastEngine.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin

      if not isrunning then exit;

      if (GameRenderMode=OPENGL3D_RENDER) or (GameRenderMode=OPENGL2D_RENDER) then DrawOnIdle;
            // Windows denken lassen, das wir noch nicht fertig wären
      Done := False;
end;

procedure TLastEngine.FullScreen(form: TForm);
begin
  form.BorderStyle := bsNone;
  form.WindowState := wsMaximized;
  form.Formstyle:=fsStayontop;
  //GoToFullScreen(screen.Width,screen.Height,24,60);
end;

procedure TLastEngine.ScreenResize(width, height: integer);
begin
   if (GameRenderMode=OPENGL3D_RENDER) or (GameRenderMode=OPENGL2D_RENDER) then ResizeView(width,height);
end;

end.
