unit SceneUnit;
//The scene will contain ass graphics to display such as
//sprites, maps, objects, etc
//One Game can have several scenes, but only one is visible at a time

interface

uses Classes,LastEngineTypes;

type
  TGameScene = class(TComponent)

  private
    Findex: integer; //Index of the scene
    FBackgroundColor: LE_Color;
    //FScenes: array of TScene;
  public
    //FGuis: array of Tgui; //It's possible to have several Gui's at the same time
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
  published
    property Index: integer read Findex write Findex;
  end;

implementation

{ TGameScene }

constructor TGameScene.Create;
begin

end;

destructor TGameScene.Destroy;
begin

end;

end.
