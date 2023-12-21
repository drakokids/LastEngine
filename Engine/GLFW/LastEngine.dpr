program LastEngine;

uses
  System.SysUtils,
  glfwFunctions,
  Neslib.Glfw3 in 'Glfw\Neslib.Glfw3.pas',
  Demo1 in 'Demo1.pas',
  Shaders1 in 'Shaders1.pas';

begin
  InitGlfw(800,600,'Demo1',KeyCallback);

  while (glfwWindowShouldClose(Window) = 0) do
  begin
    DrawDemo1;
  end;

  StopGlfw;

end.
