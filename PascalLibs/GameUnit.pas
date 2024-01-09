unit GameUnit;

interface

uses Classes,SceneUnit, GuiUnit,LastEngineTypes;

type
  TGame = class(TComponent)

  private
    Findex: integer;
    FCurrentScene: integer;
    FBackgroundColor: LE_Color;
    FScenes: array of TGameScene;
  public
    //FGuis: array of Tgui; //It's possible to have several Gui's at the same time
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
  published
    property Index: integer read Findex write Findex;
  end;

implementation

{ TGame }

constructor TGame.Create;
begin


end;

destructor TGame.Destroy;
begin

  inherited;
end;

end.
