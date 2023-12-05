unit test3Dfrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LastEngine, LastEngineTypes;

type
  TFormTest3D = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTest3D: TFormTest3D;
  myEngine: TLastEngine;

implementation

{$R *.dfm}

procedure TFormTest3D.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  myengine.Free;

  action:=caFree;
end;

procedure TFormTest3D.FormCreate(Sender: TObject);
begin
  myEngine:=TLastEngine.Create(self,width, height, 'MyGame', false, OPENGL3D_RENDER);
end;

procedure TFormTest3D.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : Close;
    #48: myEngine.FullScreen(self);
  end;
end;

procedure TFormTest3D.FormResize(Sender: TObject);
begin
  myEngine.ScreenResize(width, height);
end;

procedure TFormTest3D.FormShow(Sender: TObject);
begin

  //showmessage(inttostr(screen.PixelsPerInch));

  myEngine.StartEngine;
end;

end.
