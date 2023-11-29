program lastengine;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  test3Dfrm in 'test3Dfrm.pas' {FormTest3D},
  LastEngine in '..\..\MyObjectsX10\bin\LastEngine.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormTest3D, FormTest3D);
  Application.Run;
end.
