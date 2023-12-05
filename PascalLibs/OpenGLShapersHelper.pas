unit OpenGLShapersHelper;

interface

uses dglOpenGL;

Procedure InitShapers;
procedure DrawSphere(radius:double; slices: integer);
procedure DrawCilinder(bottomradius,topradius, height:double; slices: integer);

var // Quadric for sphere ( Dont worry too much about this now we'll handle this later)
    SphereQuadratic : PGLUQuadricObj;
    CilinderQuadratic: PGLUQuadricObj;

implementation

Procedure InitShapers;
begin
  // Generate a sphere using the OpenGL utility Library
      SphereQuadratic := gluNewQuadric();		       // Create A Pointer To The Quadric Object (Return 0 If No Memory) (NEW)
      gluQuadricNormals(SphereQuadratic, GLU_SMOOTH);	       // Create Smooth Normals (NEW)
      CilinderQuadratic := gluNewQuadric();		 		       // Create A Pointer To The Quadric Object (Return 0 If No Memory) (NEW)
      gluQuadricNormals(CilinderQuadratic, GLU_SMOOTH);	       // Create Smooth Normals (NEW)
end;

procedure DrawSphere(radius:double; slices: integer);
begin
  gluSphere(SphereQuadratic, radius, slices, slices);
end;

procedure DrawCilinder(bottomradius,topradius, height:double; slices: integer);
begin
  gluCylinder (CilinderQuadratic,bottomradius,topradius,height,slices,slices);
end;

end.
