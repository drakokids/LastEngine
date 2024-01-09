unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.Direct2D, Winapi.D2D1,
  D2DRenderer,LastEngineVCL;

type
  TMainForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
    procedure CreateWnd; override;
  end;

var
  MainForm: TMainForm;
  D2DRenderer: TD2DRenderer;
  MyEngine:TLastEngineVCL;

implementation

{$R *.dfm}

procedure TMainForm.CreateWnd;
begin
   inherited;
   MyEngine:=TLastEngineVCL.Create(self,self.Width,self.Height,'Demo1',false);
   //D2DRenderer:=TD2DRenderer.Create(self);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //D2DRenderer.StopEngine;
   //D2DRenderer.Destroy;
   MyEngine.StopEngine;
   MyEngine.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    //D2DRenderer.StartEngine;
    MyEngine.StartEngine;
end;

end.
