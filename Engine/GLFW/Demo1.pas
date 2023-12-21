unit Demo1;

interface

uses
  {$IF Defined(MSWINDOWS)}
  Winapi.OpenGL,
  Winapi.OpenGLExt,
  {$ELSEIF Defined(MACOS) and not Defined(IOS)}
  Macapi.CocoaTypes,
  Macapi.OpenGL,
  {$ENDIF }
  System.Math.Vectors,
  Neslib.Glfw3,
  glfwFunctions;

const
  VERTICES: array [0..2] of TVertex = (
    (X: -0.6; Y: -0.4; R: 1.0; G: 0.0; B: 0.0),
    (X:  0.6; Y: -0.4; R: 0.0; G: 1.0; B: 0.0),
    (X:  0.0; Y:  0.6; R: 0.0; G: 0.0; B: 1.0));

procedure KeyCallback(window: TGLFWwindow; key, scancode, action, mods: Integer); cdecl;
procedure DrawDemo1;

implementation


procedure KeyCallback(window: TGLFWwindow; key, scancode, action, mods: Integer); cdecl;
begin
  if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then
    glfwSetWindowShouldClose(window, GLFW_TRUE);
end;

procedure DrawDemo1;
begin
    glfwGetFramebufferSize(Window, @Width, @Height);
    Ratio := Width / Height;

    glViewport(0, 0, Width, Height);
    glClear(GL_COLOR_BUFFER_BIT);

    M := TMatrix3D.CreateRotationZ(glfwGetTime);
    P := TMatrix3D.CreateOrthoOffCenterLH(-Ratio, 1, Ratio, -1, 1, 1000);
    MVP := M * P;

    glUseProgram(ShaderProgram);
    glUniformMatrix4fv(MVPLocation, 1, GL_FALSE, @MVP);
    glDrawArrays(GL_TRIANGLES, 0, 3);

    glfwSwapBuffers(Window);
    glfwPollEvents;
end;

end.
