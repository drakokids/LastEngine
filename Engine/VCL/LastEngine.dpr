program LastEngine;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classes,
  Windows,
  dglOpenGL,
  glFunctions in 'glFunctions.pas';



begin

  WINDOWS_CAPTION:=  'Last Engine';
  SCREEN_BPP:= 32;
  FPS_INTERVAL:= 1000;
  windowFullScreen:=true;

  Init_SDL(800,600);
  Init_OpenGL;
  while ( Done <> -1 ) do
  begin
    glHandleEvents;
    glDrawScene;
    Inc(FPSCount);
  end;

  Quit_App;
end.
