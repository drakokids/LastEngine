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
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

end.

