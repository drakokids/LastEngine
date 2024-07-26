unit FMXRenderer;

interface

uses FMX.Types, FMX.Forms, FMX.Graphics, System.UITypes, System.Types,
  System.SysUtils;

procedure CreateFMXRenderer;
procedure DestroyFMXRenderer;
procedure ResizeView(width,height:integer);
procedure RenderFPS(Canvas: TCanvas; fps: integer);

var somevar: integer;

implementation

procedure CreateFMXRenderer;
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

procedure RenderFPS(Canvas: TCanvas; fps: integer);
begin



  Canvas.Font.Style := [];
  Canvas.Font.Size := 12;
  Canvas.Fill.Color := TAlphaColors.Red;
  Canvas.FillText(TRectF.Create(0, 0, 300, 295), 'fps:'+inttostr(fps), false,
           100, [], TTextAlign.Center, TTextAlign.Center);

end;

end.
