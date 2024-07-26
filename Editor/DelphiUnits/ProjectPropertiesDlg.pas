unit ProjectPropertiesDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst;

type
  TProjectProperties = class(TForm)
    Label1: TLabel;
    EditProjectName: TEdit;
    Label2: TLabel;
    EditFolder: TEdit;
    Label3: TLabel;
    EditProjectType: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    CheckListBox1: TCheckListBox;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Label9: TLabel;
    Label8: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Dir: string;
    function Execute: boolean;
  end;

var
  ProjectProperties: TProjectProperties;

const
  SELDIRHELP = 1000;

implementation

{$R *.dfm}

uses FileCtrl;

{ TProjectProperties }

procedure TProjectProperties.Button3Click(Sender: TObject);
begin
    if FileCtrl.SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP)
     then EditFolder.text:=dir;

end;

function TProjectProperties.Execute: boolean;
begin
    Dir := 'C:\';
    EditFolder.text:=dir;
    showmodal;
    result:=modalresult=mrok;

end;

end.
