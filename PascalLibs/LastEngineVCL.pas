unit LastEngineVCL;

interface

uses system.Classes,System.types,System.UIConsts, System.UITypes, system.SysUtils,
 VCL.Forms, VCL.Graphics, System.DateUtils,Vcl.ExtCtrls,
 GameUnit,D2DRenderer;

type
  TLastEngineVCL = class(TComponent)
  private
    isrunning: boolean;
    Renderer: TD2DRenderer;
  public
    GameRenderMode: integer; //0=Direct2D
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
  published
    property Game: TGame read FGame;
    property ShowGuidelines: boolean read fShowGuidelines write fShowGuidelines;
    property EditorMode: boolean read fEditorMode write fEditorMode;
    property ShowFps: boolean read fShowFps write fShowFps;
  end;

implementation

uses LastEngineTypes;

constructor TLastEngineVCL.Create(AOwner: TForm; GameWidth, GameHeight: integer;
  GameTitle: string; vFullScreen: boolean);
begin
  isrunning:=false;
  fEditorMode:=false;
  fShowGuidelines:=false;
  fShowFps:=false;
  Parent:=AOwner;

  Renderer:=TD2DRenderer.Create(AOwner);

  if vFullScreen then FullScreen(AOwner);
end;

destructor TLastEngineVCL.Destroy;
begin
   Renderer.free;
   inherited;
end;

procedure TLastEngineVCL.StartEngine;
begin
    isrunning:=true;
    Renderer.StartEngine;
end;

procedure TLastEngineVCL.StopEngine;
begin
    isrunning:=false;
    Renderer.StopEngine;
end;

procedure TLastEngineVCL.FullScreen(form: TForm);
begin
  form.BorderStyle := bsNone;
  form.WindowState := wsMaximized;
  form.Formstyle:= fsStayOnTop;
  Renderer.Resize(form.Width, form.Height);
end;

procedure TLastEngineVCL.ScreenResize(width, height: integer);
begin
  Renderer.Resize(width, height);
end;

end.
