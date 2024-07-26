unit mainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  SFML;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Mode: sfVideoMode;
  Window: PsfRenderWindow;
  Event: sfEvent;
  Music: PsfMusic;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
    Mode.Width := 800;
    Mode.Height := 600;
    Mode.BitsPerPixel := 32;

    Window := sfRenderWindow_create(Mode, 'Hello SFML', sfResize or sfClose, nil);

    while sfRenderWindow_isOpen(Window) = sfTrue do
      begin
        while sfRenderWindow_pollEvent(Window, @Event) = sfTrue do
        begin
          if Event.kind = sfEvtClosed then
            sfRenderWindow_close(Window);
        end;

        sfRenderWindow_clear(Window, DARKSLATEBROWN);
        sfRenderWindow_display(Window);
      end;

  sfRenderWindow_destroy(Window);
end;

end.
