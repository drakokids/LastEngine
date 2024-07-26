unit ParticlesUnit;

interface

uses Classes,fmx.graphics,system.types, LastEngineTypes;

type
  TGameParticles = class(TComponent)
  private
    Findex: integer; //Index of the particles
    FResourceID:integer;
    FBuffer: TBitmap;
    FparticleType: LEparticleType;
    FOpacity:single;
    FRotation: single;
    FPos: Tpointf;
    FZoom: single;
    FAnimations: TGameAnimations;
  public
    constructor Create(sizeW,sizeH: integer); reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure AssignResource(alias:string);
  published
    property Index: integer read Findex write Findex;
    property ResourceID: integer read FResourceID write FResourceID;
    property particleType: LEparticleType read FparticleType write FparticleType;
  end;

implementation


{ TGameParticles }

procedure TGameParticles.AssignResource(alias: string);
begin

end;

constructor TGameParticles.Create(sizeW,sizeH: integer);
var size: integer;
begin
   FOpacity:=1;
   FRotation:=0;
   FPos:=Pointf(0,0);
   FZoom:=1;
   if sizeW>sizeH then size:=sizeW else size:=sizeH;
   FBuffer:=TBitmap.create(size,size);

end;

destructor TGameParticles.Destroy;
begin

end;

end.
