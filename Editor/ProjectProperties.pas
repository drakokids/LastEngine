unit ProjectProperties;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.EditBox, FMX.NumberBox, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation;

type
  TFormProjectProperties = class(TForm)
    Label1: TLabel;
    EditProjectName: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    NumberBox1: TNumberBox;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    Label5: TLabel;
    NumberBox2: TNumberBox;
    NumberBox3: TNumberBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Label9: TLabel;
    ListBox2: TListBox;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProjectProperties: TFormProjectProperties;

implementation

{$R *.fmx}

uses mainunit;

procedure TFormProjectProperties.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormProjectProperties.ButtonSaveClick(Sender: TObject);
begin
  //It will save project
  mainform.GameInfo.GameName:=EditProjectName.Text;



  Close;
end;

procedure TFormProjectProperties.FormShow(Sender: TObject);
begin
    EditProjectName.Text:=mainform.GameInfo.GameName;
end;

end.
