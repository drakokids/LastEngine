unit MenuOperations;

interface

uses FMX.TreeView, System.sysutils, system.UItypes,
    DKEngine2,DKScene2;

procedure NewScene;
procedure DeleteCurrentScene;
procedure NewSceneLayer;
procedure DeleteSelectedLayer;
procedure LoadSceneTree(tree: TTreeView);
procedure NewSceneMap;
procedure DeleteSelectedMap;

implementation

uses MainUnit,TreeViewNode;

procedure NewScene;
var Node : TTreeViewNode;
    newscene, index: integer;
    scenename: string;
begin
    scenename:='Scene '+inttostr(Engine.SceneCount+1);
    MainForm.ComboSelectLevel.Items.Add(scenename);

    newscene:=Engine.AddScene('SCENE_'+inttostr(Engine.SceneCount+1),false,trunc(Engine.Width), trunc(Engine.Height));       //Scene2
    (Engine.Scene(newscene) as TDKScene).SetBackgroundColor(TAlphacolors.Beige);
    MainForm.ComboSelectLevel.ItemIndex:=MainForm.ComboSelectLevel.Items.Count-1;

    //Now in the treenodes
    index:=length(MyTreeNodes);
    Setlength(MyTreeNodes,index+1);
    MyTreeNodes[index].NodeText:=scenename;
    MyTreeNodes[index].NodeType:= 0; //Scene
end;

procedure DeleteCurrentScene;
begin

end;

//Layers can be created inside a scene
procedure NewSceneLayer;
var newLayer: integer;
    CurrentScene: TDKScene;
    Node : TTreeViewNode;
    index,layercount: integer;
    layername: string;
begin

    CurrentScene:=TDKScene(Engine.Scene(MainForm.ComboSelectLevel.ItemIndex));
    layercount:=CurrentScene.LayerCount;
    layername:='Layer'+inttostr(layercount+1);

    newLayer:=CurrentScene.AddLayer(layername,CurrentScene.Width, CurrentScene.Height);

    Node := TTreeViewNode.Create(Mainform.TreeViewObjects,layername);
    //Node.tag:=newLayer;

    Mainform.TreeViewObjects.Items[0].AddObject(Node);

    //Now in the treenodes
    index:=length(MyTreeNodes);
    Setlength(MyTreeNodes,index+1);
    MyTreeNodes[index].NodeText:=layername;
    MyTreeNodes[index].NodeType:= 1; //Layer

end;

procedure DeleteSelectedLayer;
begin

end;

procedure LoadSceneTree(tree: TTreeView);
begin

end;

procedure NewSceneMap;
begin

end;

procedure DeleteSelectedMap;
begin

end;


end.