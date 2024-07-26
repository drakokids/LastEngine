unit GuiUnit;

interface

uses Classes;

type
  TGameGui = class(TComponent)

  private
    Findex: integer; //Index of the scene
  public
    //FGuis: array of Tgui; //It's possible to have several Gui's at the same time
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
  published
    property Index: integer read Findex write Findex;
  end;

implementation

{ TGameGui }

constructor TGameGui.Create;
begin

end;

destructor TGameGui.Destroy;
begin

end;

end.
