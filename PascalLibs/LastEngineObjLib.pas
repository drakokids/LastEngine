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
procedure DrawObjModel(Model : TModel; useOurMaterials: boolean;
              MyMaterial: Tmaterial; UseBindedTexture: boolean; RenderMode: integer);
procedure ReadVertexData(cols: TStrings; var Model : TModel);
procedure ReadFaceData(cols: TStrings; var Model : TModel);    // Read faces
procedure LoadMaterial(MaterialName : String; var M : TModel);
procedure GetShininess(Shininess:string; var Model : TModel);
procedure CreateMaterial(MaterialName:string; var Model : TModel);
procedure GetMaterial(cols: TStrings; var Model : TModel);
procedure GetTexture(maptype,texturefile:string; var Model : TModel);
function LogOurModel(M : TModel):string;

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
    SetLength(Vertex, 1);
    SetLength(Normal, 1);
    SetLength(TexCoord, 1);
    SetLength(Group, 1);
    SetLength(Material, 0);
  end;
end;

function LoadObjModel(filename : String) : TModel;
var Lines,cols : TStringList;
    s:string;
    M : TModel;
    LineNumber, i: integer;
    P : Integer;
begin
    InitModel(M);

    if FileExists(filename) then
     begin
      P :=Pos('.', filename)-1;
      if P < 1 then P :=Length(filename);
      M.Name :=Copy(filename, 1, P);

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
          LoadMaterial(cols[1],M);
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

//With useModelmaterials, it will use the materials/textures loaded with the object
//with useOurMaterials, it will use the given Diffuse,Specular,Ambient and Shininess
//with both False, it can use the previous binded texture
//DrawMode=0 Draw Object, 1=Draw Normal Map, 2=Draw Height Map
procedure DrawObjModel(Model : TModel; useOurMaterials: boolean; MyMaterial: Tmaterial;
       UseBindedTexture: boolean; RenderMode: integer);
var I, J, K : Integer;
    defaultAmbient,defaultDiffuse,defaultSpecular,defaultShininess: TColor;
    defaultColor,colorRED: TColor;
    colorzeroone, colorzerotwo,colorone,colorzerosix: TColor;
begin
  colorRED.R:=1; colorRED.G:=0; colorRED.B:=0;
  colorzeroone.R:=0.1; colorzeroone.G:=0.1; colorzeroone.B:=0.1;
  colorzerotwo.R:=0.2; colorzerotwo.G:=0.2; colorzerotwo.B:=0.2;
  colorone.R:=1; colorone.G:=1; colorone.B:=1;
  colorzerosix.R:=0.6; colorzerosix.G:=0.6; colorzerosix.B:=0.6;
  defaultAmbient:=colorzerosix;
  defaultDiffuse:=colorone;
  defaultSpecular:=colorzerosix;
  defaultShininess:=colorzerosix;

  defaultColor:=colorRED;

  For I :=0 to Model.Groups do
  begin
    if RenderMode=1 then
      begin
        glMaterialfv(GL_FRONT_AND_BACK, GL_COLOR, @defaultColor);
        glEnable(GL_COLOR_MATERIAL);
      end
    else
    if (not useOurMaterials) and (Length(Model.Material)>Model.Group[I].mIndex) then
     begin
      glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @Model.Material[Model.Group[I].mIndex].Diffuse);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, @Model.Material[Model.Group[I].mIndex].Specular);
      glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, @Model.Material[Model.Group[I].mIndex].Ambient);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, @Model.Material[Model.Group[I].mIndex].Shininess);
     end
    else
    if useOurMaterials then
     begin
      glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @MyMaterial.Diffuse);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, @MyMaterial.Specular);
      glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, @MyMaterial.Ambient);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, @MyMaterial.Shininess);
     end
    else
    if (not useOurMaterials) and (not UseBindedTexture) then
     begin
      glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, @defaultDiffuse);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, @defaultSpecular);
      glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, @defaultAmbient);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, @defaultShininess);
      glMaterialfv(GL_FRONT_AND_BACK, GL_COLOR, @defaultColor);
     end;

     if UseBindedTexture then
       glEnable(GL_TEXTURE_2D)
     else
      glDisable(GL_TEXTURE_2D);
//    if Length(Model.Material)>Model.Group[I].mIndex then
//    if Model.Material[Model.Group[I].mIndex].Texture <> 0 then  // its a physical texture
//    begin
//      glEnable(GL_TEXTURE_2D);                     // Enable Texture Mapping
//      glBindTexture(GL_TEXTURE_2D, Model.Material[Model.Group[I].mIndex].Texture);
//    end
//    else

    For J :=1 to Model.Group[I].Faces do
    begin
      with Model.Group[I].Face[J] do
      begin
        case Count of
          3 : glBegin(GL_TRIANGLES);
          4 : glBegin(GL_QUADS);
        else
          glBegin(GL_POLYGON);
        end;

        for K :=0 to Count-1 do
        begin

          if RenderMode=1 then
          if Model.Normals > 0 then
           begin
            defaultColor.B:=1;
            defaultColor.R:=((Model.Normal[nIndex[K]].X)*180+90)/180;
            defaultColor.G:=((Model.Normal[nIndex[K]].Y)*180+90)/180;
            glColor4fv(@defaultColor);
            //glMaterialfv(GL_FRONT_AND_BACK, GL_COLOR, @defaultColor);
           end;


          if Model.Normals > 0 then
            glNormal3fv( @Model.Normal[nIndex[K]] );
          if Model.TexCoords > 0 then
            glTexCoord2fv( @Model.TexCoord[tIndex[K]] );
          glVertex3fv( @Model.Vertex[vIndex[K]] );
        end;
        glEnd();
      end;
    end;
  end;


end;

procedure ReadVertexData(cols: TStrings;var  Model : TModel);
var C : TCoord;
    T : TTexCoord;
begin
  if cols[0]='V' then
   begin                      // Read the vertex coords
            C.X :=ExtractFloat(cols[1]);
            C.Y :=ExtractFloat(cols[2]);
            C.Z :=ExtractFloat(cols[3]);
            Inc(Model.Vertices);
            SetLength(Model.Vertex, Model.Vertices+1);
            Model.Vertex[Model.Vertices] :=C;
   end;
   if cols[0]='VN' then
    begin                      // Read the vertex normals
            C.X :=ExtractFloat(cols[1]);
            C.Y :=ExtractFloat(cols[2]);
            C.Z :=ExtractFloat(cols[3]);
            Inc(Model.Normals);
            SetLength(Model.Normal, Model.Normals+1);
            Model.Normal[Model.Normals] :=C;
    end;
   if cols[0]='VT' then
    begin                      // Read the vertex texture coords
            T.U :=ExtractFloat(cols[1]);
            T.V :=ExtractFloat(cols[2]);
            Inc(Model.TexCoords);
            SetLength(Model.TexCoord, Model.TexCoords+1);
            Model.TexCoord[Model.TexCoords] :=T;
    end;

end;

//f 1743//1743 798//798 797//797       FACE with 3 vectors
//f 241//241 242//242 1262//1262 1258//1258   FACE with 4 vectors
//f 1/1/1 2/2/2 3/3/3
//f 2050 2100 2114
procedure ReadFaceData(cols: TStrings;var  Model : TModel);
var P, P2, P3, i : Integer;
    F : TFace;
    words: TStringList;
begin
    Inc(Model.Group[Model.Groups].Faces);
    SetLength(Model.Group[Model.Groups].Face, Model.Group[Model.Groups].Faces+1);

    F.Count :=0;
    for i := 1 to cols.Count-1 do
     begin

      words:=TStringList.Create;
      sbreakapart(cols[i],'/',words);

      if words.Count>0 then    // there are normals or texture coords
       begin
        Inc(F.Count);
        SetLength(F.vIndex, F.Count);
        F.vIndex[F.Count-1] :=StrToInt(words[0]);

        if words.Count>1 then
         begin
          SetLength(F.tIndex, F.Count);
          SetLength(F.nIndex, F.Count);
          if trim(words[1])<>'' then
            F.tIndex[F.Count-1] :=StrToInt(words[1]);
          if words.Count>2 then
           F.nIndex[F.Count-1] :=StrToInt(words[2]);
         end
        else
         begin
          SetLength(F.nIndex, F.Count);
          F.nIndex[F.Count-1] :=StrToInt(words[0]);
         end;


       end
      else
       begin
        Inc(F.Count);
        SetLength(F.vIndex, F.Count);
        F.vIndex[F.Count-1] :=StrToInt(words[0]);
       end;

      words.Free;

     end;

     Model.Group[Model.Groups].Face[Model.Group[Model.Groups].Faces] :=F;

end;

procedure LoadMaterial(MaterialName : String; var M : TModel);
var P, i : Integer;
    filename : String;
    F : TextFile;
    linhas,words: TStringList;
begin
    filename:=MaterialName;
    if FileExists(filename) then
     begin
      linhas:=TStringList.Create;
      linhas.LoadFromFile(filename);

      for i := 0 to linhas.Count-1 do
      if (linhas[i] <> '') AND (linhas[i][1] <> '#') then
       begin
        words:=TStringList.Create;
        sbreakapart(uppercase(linhas[i]),' ',words);

        Case words[0][1] of
         'N' : begin
                if words[0]='NS' then GetShininess(words[1], M);  // Get specular highlight amount
                if words[0]='NEWMTL' then CreateMaterial(words[1], M);  // create new material
               end;
         'K':  GetMaterial(words, M);     // Material properties
         'M' : GetTexture(words[0],words[1], M);      // Map material to texture
        End;


        words.Free;
       end;

      linhas.Free;
     end
    else
    MessageBox(0, PChar('Cannot find the material file : ' + filename), 'Load Model Material', MB_OK);
end;

procedure GetShininess(Shininess:string; var Model : TModel);
begin
  if Model.Materials<length(Model.Material) then
    Model.Material[Model.Materials].Shininess :=ExtractFloat(Shininess)
  else
   logwrite('Error GetShininess '+Shininess+' Model.Material='+inttostr(Model.Materials));
end;

procedure CreateMaterial(MaterialName:string; var Model : TModel);
begin
  Inc(Model.Materials);
  SetLength(Model.Material, Model.Materials+1);
  FillChar(Model.Material[Model.Materials].Ambient, 0, Sizeof(Model.Material[Model.Materials].Ambient));
  FillChar(Model.Material[Model.Materials].Diffuse, 0, Sizeof(Model.Material[Model.Materials].Diffuse));
  FillChar(Model.Material[Model.Materials].Specular, 0, Sizeof(Model.Material[Model.Materials].Specular));
  Model.Material[Model.Materials].Shininess :=60;
  Model.Material[Model.Materials].Texture :=0;
  Model.Material[Model.Materials].Name :=MaterialName;
end;

//Ka 1.000 1.000 1.000    ambient color
//Kd 1.000 1.000 1.000    difuse color
//Ks 0.000 0.000 0.000    specular color
procedure GetMaterial(cols: TStrings; var Model : TModel);
var C : TColor;
    P, P2 : Integer;
    Ch : Char;
begin
    Ch :=uppercase(cols[0])[2];   //Ks, Ka ou Kd
    C.R :=ExtractFloat(cols[1]);
    C.G :=ExtractFloat(cols[2]);
    C.B :=ExtractFloat(cols[3]);
    if Model.Materials<length(Model.Material) then
    case ch of
    'A' : Model.Material[Model.Materials].Ambient :=C;
    'D' : Model.Material[Model.Materials].Diffuse :=C;
    'S' : Model.Material[Model.Materials].Specular :=C;
    end
    else
   logwrite('Error GetMaterial '+cols[0]+' Model.Material='+inttostr(Model.Materials));
end;

procedure GetTexture(maptype,texturefile:string; var Model : TModel);
begin

end;

//For debugging purposes
function LogOurModel(M : TModel):string;
var i: integer;
    outlines: string;
begin
   outlines:='Model Name: '+m.Name+#13;
   outlines:=outlines+'Material File: '+m.MaterialFile+#13;
   outlines:=outlines+'Vertices: '+inttostr(m.Vertices)+#13;
   For I :=1 to M.Vertices do
    begin
     outlines:=outlines+floattostr(m.Vertex[i].X)+' '+floattostr(m.Vertex[i].Y)+' '+floattostr(m.Vertex[i].Z)+#13;
    end;
   outlines:=outlines+'Normals: '+inttostr(m.Normals)+#13;
   For I :=1 to M.Normals do
    begin
     outlines:=outlines+floattostr(m.normal[i].X)+' '+floattostr(m.normal[i].Y)+' '+floattostr(m.normal[i].Z)+#13;
    end;
   outlines:=outlines+'TexCoords: '+inttostr(m.TexCoords)+#13;
   For I :=1 to M.TexCoords do
    begin
     outlines:=outlines+floattostr(m.TexCoord[i].U)+' '+floattostr(m.TexCoord[i].V)+#13;
    end;
   outlines:=outlines+'Groups: '+inttostr(m.Groups)+#13;
   For I :=1 to M.Groups do
    begin
     outlines:=outlines+m.Group[i].Name+#13;
    end;
   outlines:=outlines+'Materials: '+inttostr(m.Materials)+#13;
   For I :=1 to M.Materials do
    begin
     outlines:=outlines+m.Material[i].Name+#13;
    end;
   result:=outlines;
end;

end.
