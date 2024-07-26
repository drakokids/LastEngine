unit RoadsUnit;

interface

uses Classes;

type
  TGameRoad = class(TComponent)

  private
    Findex: integer; //Index of the scene
  public
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
  published
    property Index: integer read Findex write Findex;
  end;

implementation

{ TGameRoad }

constructor TGameRoad.Create;
begin

end;

destructor TGameRoad.Destroy;
begin

end;

end.
