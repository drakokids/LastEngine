unit menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,menus;

procedure NewMenuItem(ParentItem: TMenuItem; text,operationName,param1,param2: string);
procedure BuildMenu(menuObject: TMainMenu);
procedure MenuClicked(sender: TObject);

implementation

uses mainunit_laz;

procedure NewMenuItem(ParentItem: TMenuItem; text,operationName,param1,param2: string);
var menuItem: TMenuItem;
    len:integer;
begin
   menuItem:=TMenuItem.Create(self);
   MenuItem.Caption:=text;
   len:=MenuOperations.
   MenuOperations.Add('MENU_'+'='+operationName+','+param1+','+param2);
   ParentItem.Add(menuItem);
end;

procedure BuildMenu(menuObject: TMainMenu);
begin
   menuObject.Items.Add();
end;

procedure MenuClicked(sender: TObject);
begin

end;

end.

