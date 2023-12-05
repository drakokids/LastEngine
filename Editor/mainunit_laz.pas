unit mainunit_laz;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Separator1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  MenuOperations: TStrings;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MenuOperations:=TStringList.Create;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  MenuOperations.free;
end;

end.

