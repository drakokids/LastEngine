unit TreeViewNode;

interface

uses system.classes,FMX.TreeView;

type
  TTreeViewNode = class(TTreeViewItem)
  strict private
    //FImage: TImage;
  private
    //procedure SetImage(const aValue: TImage);
  public
    constructor Create(Owner: TComponent; const aText: String); reintroduce;
    destructor Destroy; override;
  published
    //property Image: TImage Read FImage Write SetImage;
  end;

implementation

constructor TTreeViewNode.Create(Owner: TComponent; const aText: String);
begin
  inherited Create(Owner);
  Self.Text := aText;
  //FImage := TImage.Create(Owner);
  //Self.AddObject(FImage);
  //FImage.Align := TAlignLayout.Right;
  //FImage.Bitmap.LoadFromFile(aImageFileName);
  //FImage.SendToBack;
end;

destructor TTreeViewNode.Destroy;
begin
  //Image.FreeOnRelease;
  inherited;
end;

//procedure TTreeViewNode.SetImage(const aValue: TImage);
//begin
//  FImage := aValue;
//end;

end.
