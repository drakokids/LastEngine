//------------------------------------------------------------------------
//
// Author      : Luis Santos
// Email       : drakokids@gmail.com
// Date        : 19 Jan 2023
// Version     : 1.0
// Description : Wavefront OPJ loader
//
// Based in the work of Jan Horn / http://home.global.co.za/~jhorn
//------------------------------------------------------------------------
unit LastEngineObjLib;

interface

Uses OpenGL, Windows, SysUtils, system.classes, OBJLoader;

function LoadObjModel(filename : String) : TModel;
procedure DrawObjModel(Model : TModel);
procedure ReadVertexData(cols: TStrings; Model : TModel);
procedure ReadFaceData(cols: TStrings; Model : TModel);    // Read faces
procedure LoadMaterial(MaterialName : String; var M : TModel);

implementation

uses functions;

procedure InitModel(var M : TModel);
begin
  with M do
  begin
    Name :='';
    MaterialFile :='';
    Vertices  :=0;
    Normals   :=0;
    TexCoords :=0;
    Groups    :=0;
    Materials :=0;
    SetLength(Vertex, 0);
    SetLength(Normal, 0);
    SetLength(TexCoord, 0);
    SetLength(Group, 0);
    SetLength(Material, 0);
  end;
end;

function LoadObjModel(filename : String) : TModel;
var Lines,cols : TStringList;
    s:string;
    M : TModel;
    LineNumber, i: integer;
begin
    InitModel(M);
    if FileExists(filename) then
     begin
      Lines:=TStringList.Create;
      Lines.LOADFROMFILE(filename);
      for LineNumber := 0 to Lines.count-1 do
       begin
        s:=uppercase(Lines[LineNumber]);
        if length(s)=0 then continue;
        if s[1]='#' then continue;

        cols:=TStringList.Create;
        sbreakapart(s, ' ',cols);

        //mtllib soccerball.mtl
        if cols[0]='MTLLIB' then
         begin
          //Load Material
          LoadMaterial(cols[1]);
         end;

        //v 0.000000 3.370759 3.183101  (Vertex Data)
        //vn -0.038855 0.664520 0.746260  (vertex normals)
        //vt 0.186192 0.222718    (texture coordinates)
        if cols[0][1]='V' then
         begin
          ReadVertexData(cols, M); //Reads Vertex (Data, Normals or Texture)
         end;


        //g default     Group Name
        if cols[0]='G' then
         begin
          Inc(M.Groups);
          SetLength(M.Group, M.Groups+1);
          M.Group[M.Groups].Name :=cols[1];
         end;

        //s 1
        if cols[0]='S' then
         begin

         end;

        //usemtl white
        if cols[0]='USEMTL' then
         begin
          For i :=1 to M.Materials do
            if M.Material[i].Name = cols[1] then
             begin
              M.Group[M.Groups].mIndex :=i;
             end;
         end;

        //f 1743//1743 798//798 797//797       FACE with 3 vectors
        //f 241//241 242//242 1262//1262 1258//1258   FACE with 4 vectors
        //f 1/1/1 2/2/2 3/3/3
        //f 2050 2100 2114
        if cols[0]='F' then
         begin
          ReadFaceData(Cols, M);    // Read faces
         end;


        cols.free;

       end;

      Lines.free;

     end;

    result :=M;
end;

procedure DrawObjModel(Model : TModel);
begin

end;

procedure ReadVertexData(cols: TStrings; Model : TModel);
var C : TCoord;
    T : TTexCoord;
begin
  if cols[0]='V' then
   begin                      // Read the vertex coords
            C.X :=StrToFloat(cols[1]);
            C.Y :=StrToFloat(cols[2]);
            C.Z :=StrToFloat(cols[3]);
            Inc(Model.Vertices);
            SetLength(Model.Vertex, Model.Vertices+1);
            Model.Vertex[Model.Vertices] :=C;
   end;
   if cols[0]='VN' then
    begin                      // Read the vertex normals
            C.X :=StrToFloat(cols[1]);
            C.Y :=StrToFloat(cols[2]);
            C.Z :=StrToFloat(cols[3]);
            Inc(Model.Normals);
            SetLength(Model.Normal, Model.Normals+1);
            Model.Normal[Model.Normals] :=C;
    end;
   if cols[0]='VT' then
    begin                      // Read the vertex texture coords
            T.U :=StrToFloat(cols[1]);
            T.V :=StrToFloat(cols[2]);
            Inc(Model.TexCoords);
            SetLength(Model.TexCoord, Model.TexCoords+1);
            Model.TexCoord[Model.TexCoords] :=T;
    end;

end;

procedure ReadFaceData(cols: TStrings; Model : TModel);
begin

end;

procedure LoadMaterial(MaterialName : String; var M : TModel);
begin

end;

end.
