program lastengineEditor;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  test3Dfrm in 'test3Dfrm.pas' {FormTest3D},
  OpenGLRenderer in '..\LastEngineLibrary\OpenGLRenderer.pas',
  OpenGLColorsHelper in '..\LastEngineLibrary\OpenGLColorsHelper.pas',
  OpenGLShapersHelper in '..\LastEngineLibrary\OpenGLShapersHelper.pas',
  LastEngine in '..\LastEngineLibrary\LastEngine.pas',
  GLSLshader in '..\LastEngineLibrary\GLSLshader.pas',
  GuiUnit in '..\LastEngineLibrary\GuiUnit.pas',
  GuiObjectUnit in '..\LastEngineLibrary\GuiObjectUnit.pas',
  SceneUnit in '..\LastEngineLibrary\SceneUnit.pas',
  World2DUnit in '..\LastEngineLibrary\World2DUnit.pas',
  World3DUnit in '..\LastEngineLibrary\World3DUnit.pas',
  Terrain3DUnit in '..\LastEngineLibrary\Terrain3DUnit.pas',
  Object3DUnit in '..\LastEngineLibrary\Object3DUnit.pas',
  SpriteUnit in '..\LastEngineLibrary\SpriteUnit.pas',
  ParticlesUnit in '..\LastEngineLibrary\ParticlesUnit.pas',
  RoadsUnit in '..\LastEngineLibrary\RoadsUnit.pas',
  TilemapUnit in '..\LastEngineLibrary\TilemapUnit.pas',
  LastEngineTypes in '..\LastEngineLibrary\LastEngineTypes.pas',
  ProjectPropertiesDlg in 'ProjectPropertiesDlg.pas' {ProjectProperties},
  OptionsDlg in 'OptionsDlg.pas' {OptionsDialog},
  D2DRenderer in '..\LastEngineLibrary\D2DRenderer.pas',
  GDIPRenderer in '..\LastEngineLibrary\GDIPRenderer.pas',
  EngineFileManager in '..\LastEngineLibrary\EngineFileManager.pas',
  gamefiles in '..\LastEngineLibrary\gamefiles.md';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TProjectProperties, ProjectProperties);
  Application.CreateForm(TOptionsDialog, OptionsDialog);
  Application.Run;
end.
