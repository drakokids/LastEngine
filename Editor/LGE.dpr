program LGE;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ProjectProperties in 'ProjectProperties.pas' {FormProjectProperties},
  TreeViewNode in 'TreeViewNode.pas',
  MenuOperations in 'MenuOperations.pas',
  DKAnimation2 in '..\..\MyObjectsX10\bin\DKAnimation2.pas',
  DKGuiObject2 in '..\..\MyObjectsX10\bin\DKGuiObject2.pas',
  DKGui2 in '..\..\MyObjectsX10\bin\DKGui2.pas',
  DKResource2 in '..\..\MyObjectsX10\bin\DKResource2.pas',
  DKObject2 in '..\..\MyObjectsX10\bin\DKObject2.pas',
  DkTypes2 in '..\..\MyObjectsX10\bin\DkTypes2.pas',
  DkShape2 in '..\..\MyObjectsX10\bin\DkShape2.pas',
  DkSprite2 in '..\..\MyObjectsX10\bin\DkSprite2.pas',
  DKParticle2 in '..\..\MyObjectsX10\bin\DKParticle2.pas',
  DKScene2 in '..\..\MyObjectsX10\bin\DKScene2.pas',
  DKEngine2 in '..\..\MyObjectsX10\bin\DKEngine2.pas',
  DKLayer2 in '..\..\MyObjectsX10\bin\DKLayer2.pas',
  DKMap2 in '..\..\MyObjectsX10\bin\DKMap2.pas',
  Test3DOpenGL in 'Test3DOpenGL.pas' {FormTestOpenGL};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormProjectProperties, FormProjectProperties);
  Application.CreateForm(TFormTestOpenGL, FormTestOpenGL);
  Application.Run;
end.
