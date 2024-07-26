program LGEditor;

uses
  Vcl.Forms,
  MainUnit in 'DelphiUnits\MainUnit.pas' {MainForm},
  test3Dfrm in 'DelphiUnits\test3Dfrm.pas' {FormTest3D},
  OptionsDlg in 'DelphiUnits\OptionsDlg.pas' {OptionsDialog},
  ProjectPropertiesDlg in 'DelphiUnits\ProjectPropertiesDlg.pas' {ProjectProperties};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TProjectProperties, ProjectProperties);
  Application.CreateForm(TOptionsDialog, OptionsDialog);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormTest3D, FormTest3D);
  Application.CreateForm(TOptionsDialog, OptionsDialog);
  Application.CreateForm(TProjectProperties, ProjectProperties);
  Application.Run;
end.
