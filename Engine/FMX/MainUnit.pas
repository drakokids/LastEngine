unit MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,LastEngineFMX;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  MYEngine: TLastEngineFMX;

implementation

{$R *.fmx}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MYEngine.StopEngine;
  MYEngine.destroy;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MYEngine:=TLastEngineFMX.Create(self,800,600, 'Demo', false);
  MYEngine.StartEngine;
end;

end.
