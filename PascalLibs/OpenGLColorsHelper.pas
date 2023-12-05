unit OpenGLColorsHelper;

interface

uses dglOpenGL;

procedure SetColor(color: integer; alpha: single);

const
    COLOR_BLACK=0;
    COLOR_WHITE=1;
    COLOR_RED=2;
    COLOR_BLUE=3;
    COLOR_GREEN=4;
    COLOR_YELLOW=5;
    COLOR_PINK=6;

implementation

procedure SetColor(color: integer; alpha: single);
begin
  case color of
   COLOR_RED: glColor4f(1.0,0.0,0.0,alpha);
   COLOR_BLUE: glColor4f(0.0,0.0,1.0,alpha);
   COLOR_GREEN: glColor4f(0.0,1.0,0.0,alpha);
   COLOR_BLACK: glColor4f(0.0,0.0,0.0,alpha);
   COLOR_WHITE: glColor4f(1.0,1.0,1.0,alpha);
   COLOR_PINK: glColor4f(1.0,0.0,1.0,alpha);
  end;
end;

end.
