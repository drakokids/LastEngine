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
   menuItem:=TMenuItem.Create(nil);
   MenuItem.Caption:=text;
   len:=MenuOperations.Count;
   MenuItem.tag:=len;
   MenuOperations.Add('MENU_'+'='+operationName+','+param1+','+param2);
   ParentItem.Add(menuItem);
end;

procedure BuildMenu(menuObject: TMainMenu);
var item: TMenuItem;
begin
   MenuObject.items.clear;
   NewMenuItem(menuObject.Items,'Project','','','');
   item:=MenuObject.items[menuObject.items.Count-1];

   NewMenuItem(Item,'New Project','','','');


end;

procedure MenuClicked(sender: TObject);
begin

end;

end.

