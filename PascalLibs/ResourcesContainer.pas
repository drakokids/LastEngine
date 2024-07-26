unit ResourcesContainer;

interface

uses Classes,fmx.Graphics,system.SysUtils,strutils,
LastEngineTypes;

type
  TResourcesContainer = class(TComponent)

  private
    FItems: ArrayOfResourceContainerItem;
  public
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure AddFromFile(aliasname,filename: string);
    procedure AddFromZipContainer(aliasname: string);
    procedure Delete(aliasname: string);
    function ItemAsStream(aliasname: string): TStream;
    function ResourceBitmap(aliasname: string): TBitmap; overload;
    function ResourceBitmap(resindex: integer): TBitmap; overload;
    function GetResourceID(aliasname: string): integer;
  published
  end;

var FGameResourcesContainer: TResourcesContainer;

implementation

{ TResourcesContainer }

procedure TResourcesContainer.AddFromFile(aliasname, filename: string);
var index:integer;
    ext: string;
const AllowedFiles  : array  [1..4] of string = ('.PNG','.JPEG','.MP3','.WAV');
begin

    ext:=uppercase(ExtractFileExt(filename));

    if not MatchStr(ext,AllowedFiles) then
     begin
       exit;
     end;

    index:=length(FItems);
    setlength(FItems,index+1);
    FItems[index].index:=index;
    FItems[index].alias:=aliasname;

    ext:=uppercase(ExtractFileExt(filename));

    if ext='.PNG' then
     begin
       FItems[index].resourceType:=LE_Image;
       FItems[index].Bitmap:=TBitmap.CreateFromFile(FMediaFolder+filename);
     end;



end;

procedure TResourcesContainer.AddFromZipContainer(aliasname: string);
begin

end;

constructor TResourcesContainer.Create;
begin

end;

procedure TResourcesContainer.Delete(aliasname: string);
begin

end;

destructor TResourcesContainer.Destroy;
var i: integer;
begin
    for i := 0 to Length(FItems)-1 do
     begin
       if Fitems[i].Bitmap<>nil then FItems[i].Bitmap.free;

     end;
    SetLength(Fitems,0);
end;

function TResourcesContainer.ItemAsStream(aliasname: string): TStream;
begin

end;

function TResourcesContainer.ResourceBitmap(aliasname: string): TBitmap;
begin

end;

function TResourcesContainer.ResourceBitmap(resindex: integer): TBitmap;
begin
  result:=FItems[resindex].Bitmap;
end;

function TResourcesContainer.GetResourceID(aliasname: string): integer;
var i,id:integer;
begin
  id:=-1;
  for i := 0 to length(Fitems)-1 do
   if FItems[i].alias=aliasname then
    begin
      id:=i;
      break;
    end;
  result:=i;
end;

end.
