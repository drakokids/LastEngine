program LGEditor;

uses
  Vcl.Forms,
  MainUnit in '..\..\2023\LastEngine_VCL\MainUnit.pas' {MainForm},
  test3Dfrm in '..\..\2023\LastEngine_VCL\test3Dfrm.pas' {FormTest3D},
  OpenGLRenderer in '..\..\2023\LastEngineLibrary\OpenGLRenderer.pas',
  OpenGLColorsHelper in '..\..\2023\LastEngineLibrary\OpenGLColorsHelper.pas',
  OpenGLShapersHelper in '..\..\2023\LastEngineLibrary\OpenGLShapersHelper.pas',
  LastEngine in '..\..\2023\LastEngineLibrary\LastEngine.pas',
  GLSLshader in '..\..\2023\LastEngineLibrary\GLSLshader.pas',
  GuiUnit in '..\..\2023\LastEngineLibrary\GuiUnit.pas',
  GuiObjectUnit in '..\..\2023\LastEngineLibrary\GuiObjectUnit.pas',
  SceneUnit in '..\..\2023\LastEngineLibrary\SceneUnit.pas',
  World2DUnit in '..\..\2023\LastEngineLibrary\World2DUnit.pas',
  World3DUnit in '..\..\2023\LastEngineLibrary\World3DUnit.pas',
  Terrain3DUnit in '..\..\2023\LastEngineLibrary\Terrain3DUnit.pas',
  Object3DUnit in '..\..\2023\LastEngineLibrary\Object3DUnit.pas',
  SpriteUnit in '..\..\2023\LastEngineLibrary\SpriteUnit.pas',
  ParticlesUnit in '..\..\2023\LastEngineLibrary\ParticlesUnit.pas',
  RoadsUnit in '..\..\2023\LastEngineLibrary\RoadsUnit.pas',
  TilemapUnit in '..\..\2023\LastEngineLibrary\TilemapUnit.pas',
  LastEngineTypes in '..\..\2023\LastEngineLibrary\LastEngineTypes.pas',
  ProjectPropertiesDlg in '..\..\2023\LastEngine_VCL\ProjectPropertiesDlg.pas' {ProjectProperties},
  OptionsDlg in '..\..\2023\LastEngine_VCL\OptionsDlg.pas' {OptionsDialog},
  D2DRenderer in '..\..\2023\LastEngineLibrary\D2DRenderer.pas',
  GDIPRenderer in '..\..\2023\LastEngineLibrary\GDIPRenderer.pas',
  EngineFileManager in '..\..\2023\LastEngineLibrary\EngineFileManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TProjectProperties, ProjectProperties);
  Application.CreateForm(TOptionsDialog, OptionsDialog);
  Application.Run;
end.
