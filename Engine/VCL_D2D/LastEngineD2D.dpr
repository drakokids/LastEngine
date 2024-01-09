program LastEngineD2D;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  LastEngineVCL in '..\..\PascalLibs\LastEngineVCL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
