unit OptionsDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin;

type
  TOptionsDialog = class(TForm)
    Label1: TLabel;
    SpinEditFontSize: TSpinEdit;
    BitBtn1: TBitBtn;
    procedure SpinEditFontSizeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDialog: TOptionsDialog;

implementation

{$R *.dfm}

procedure TOptionsDialog.SpinEditFontSizeChange(Sender: TObject);
begin
    self.Font.Size:=SpinEditFontSize.Value;
end;

end.
