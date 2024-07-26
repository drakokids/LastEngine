unit ZipContainer;

interface

uses Classes,System.Zip, LastEngineTypes, System.SysUtils;

type
  TZipContainer = class(TComponent)

  private
    FFilesCount: integer;
    FZipFilename: string;
    FItems: ArrayOfFileContainerItem;
    FPrivateKey:string;
  public
    constructor Create; reintroduce; overload;
    destructor  Destroy; reintroduce; overload;
    procedure LoadFromFile(filename: string);
    procedure UpdateFile;
    procedure AddFile(alias,filename: string);
    procedure ReadFile(Index: Integer; out Bytes: TBytes);
  published
    property FilesCount: integer read FFilesCount write FFilesCount;
    property ZipFilename: string read FZipFilename write FZipFilename;
    property PrivateKey:string read FPrivateKey write FPrivateKey;
  end;

var FGameZipContainer: TZipContainer;

implementation

{ TZipContainer }

constructor TZipContainer.Create;
begin

end;

destructor TZipContainer.Destroy;
begin

end;

procedure TZipContainer.LoadFromFile(filename: string);
begin
end;

procedure TZipContainer.UpdateFile;
begin

end;

procedure TZipContainer.AddFile(alias,filename: string);
begin

end;

procedure TZipContainer.ReadFile(Index: Integer; out Bytes: TBytes);
begin

end;



end.
