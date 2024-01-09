unit FMXRenderer;

interface

uses FMX.Types, FMX.Forms, FMX.Graphics, System.UITypes, System.Types,
  System.SysUtils;

procedure CreateFMXRenderer(Form: TForm);
procedure DestroyFMXRenderer;
procedure ResizeView(width,height:integer);
procedure RenderFMX(Canvas: TCanvas; fps: integer);

var somevar: integer;

implementation

procedure CreateFMXRenderer(Form: TForm);
begin
  GlobalUseGPUCanvas:=true;
end;

procedure DestroyFMXRenderer;
begin
//
end;

procedure ResizeView(width,height:integer);
begin
//
end;

procedure RenderFMX(Canvas: TCanvas; fps: integer);
begin
  Canvas.BeginScene;

  Canvas.Fill.Color:= TAlphaColors.Red;
  Canvas.Stroke.Color :=  TAlphaColors.Blue;
  Canvas.FillRect(Rectf(10,10,100,100),1);

  Canvas.Font.Style := [];
  Canvas.Font.Size := 12;
  Canvas.Fill.Color := TAlphaColors.Red;
  Canvas.FillText(TRectF.Create(0, 0, 300, 295), 'fps:'+inttostr(fps), false,
           100, [], TTextAlign.Center, TTextAlign.Center);

  Canvas.EndScene;
end;

end.
