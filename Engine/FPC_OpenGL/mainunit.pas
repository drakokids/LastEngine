unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, OpenGLContext,
  dglOpenGL;

type

  { TMainForm }

  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    ogc: TOpenGLControl;
    procedure InitScene;
    procedure DrawScene(Sender: TObject);
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Width := 340;
  Height := 240;
  ogc := TOpenGLControl.Create(Self); // Den Zeichen-Context erzeugen.
  with ogc do begin
    Parent := Self;
    Align := alClient;
    OpenGLMajorVersion := 3;          // Dies ist wichtig, dass der Context 3.3 verwendet wird.
    OpenGLMinorVersion := 3;
    OnPaint := @DrawScene;
    InitOpenGL;
    MakeCurrent;
    ReadExtensions;
    ReadImplementationProperties;
  end;
  InitScene;
end;

procedure TMainForm.InitScene;
begin
  glClearColor(0.6, 0.6, 0.4, 1.0);  // Hintergrundfarbe
end;

procedure TMainForm.DrawScene(Sender: TObject);
begin
  glClear(GL_COLOR_BUFFER_BIT);  // Frame-Buffer löschen und einfärben.

  ogc.SwapBuffers;               // Frame-Buffer auf den Bildschirm kopieren.
end;

end.

