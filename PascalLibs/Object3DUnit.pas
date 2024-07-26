unit Object3DUnit;

interface

uses classes,fmx.graphics,lastenginetypes;

type
  TGameObject3D = class(TComponent)

  private
    Findex: integer; //Index of the scene
    FObjectType: LE_3DObjectType;
    FPosition3D: LE_Vector3d;
    FRotation3D: LE_Vector3d;
    FImageBuffer: fmx.graphics.TBitmap;
    FPrecision: integer; //Precision para sphere, numero de vertices
    FSpriteSize: LE_Vector2d;
    FColor: LE_ColorRGB;
  public
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure Render;
    procedure RenderasShadow(FromPoint:LE_Vector3d);
    procedure SetMeshType(MeshType: LE_MeshType);
    procedure LoadMeshfromFile(filename:string);
    procedure LoadTexturefromFile(filename:string);
    procedure SetMaterial(Ambient: LE_ColorRGB; Diffuse: LE_ColorRGB;
                  Specular: LE_ColorRGB; Shininess:single);
    procedure SetColor( newColor: LE_ColorRGB);
  published
    property Index: integer read Findex write Findex;
    property ObjectType:LE_3DObjectType read FObjectType write FObjectType;
  end;

implementation

{ TGame3DObject }

constructor TGameObject3D.Create;
begin
  FImageBuffer:=fmx.graphics.TBitmap.Create(256,256);
end;

destructor TGameObject3D.Destroy;
begin
  FImageBuffer.free;
end;

procedure TGameObject3D.LoadMeshfromFile(filename: string);
begin

end;

procedure TGameObject3D.LoadTexturefromFile(filename: string);
begin

end;

procedure TGameObject3D.Render;
begin

end;

procedure TGameObject3D.RenderasShadow(FromPoint: LE_Vector3d);
begin

end;

procedure TGameObject3D.SetColor(newColor: LE_ColorRGB);
begin

end;

procedure TGameObject3D.SetMaterial(Ambient, Diffuse, Specular: LE_ColorRGB;
  Shininess: single);
begin

end;

procedure TGameObject3D.SetMeshType(MeshType: LE_MeshType);
begin

end;

end.
