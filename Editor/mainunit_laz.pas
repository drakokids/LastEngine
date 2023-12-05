unit mainunit_laz;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  ComCtrls;

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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Separator1: TMenuItem;
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

uses menu;

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

procedure TMainForm.FormShow(Sender: TObject);
begin
    BuildMenu(MainMenu1);
end;

end.

