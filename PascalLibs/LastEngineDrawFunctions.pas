unit LastEngineDrawFunctions;

interface

uses FMX.graphics, system.types, Math,System.Math.Vectors, system.UITypes;

procedure DrawRotatedBitmap(const Canvas : TCanvas; const Bitmap : TBitmap;
  const Center : TPointF; const Scale : Single; const angle:single;
  const Helpers: boolean);

implementation

procedure DrawRotatedBitmap(const Canvas : TCanvas; const Bitmap : TBitmap;
  const Center : TPointF; const Scale : Single; const angle:single;
  const Helpers: boolean);
var
  OldMatrix, TranslationAlongLineMatrix, RotationMatrix, TranslationMatrix,
    ScaleMatrix, FinalMatrix: TMatrix;
  W, H : Single;
  SrcRect, DestRect: TRectF;
  Corner: TPointF;
  LineLength : Single;
  LineAngleDeg : Integer;
  OrientedPoint: TPointf;
  aBrush: TStrokeBrush;

begin
  OldMatrix := Canvas.Matrix; // Original, to restore
  try
    w:=bitmap.Width;
    h:=bitmap.Height;


    // Account for scale (if the FMX control is scaled / zoomed); translation
    // (the control may not be located at (0, 0) in its parent form, so its canvas
    // is offset) and rotation
    ScaleMatrix := TMatrix.CreateScaling(Scale, Scale);
    TranslationMatrix := TMatrix.CreateTranslation(Center.x-w,Center.y-h);
    RotationMatrix := TMatrix.CreateRotation(degtorad(angle));
    //TranslationAlongLineMatrix := TMatrix.CreateTranslation(w/2,h/2);
    //FinalMatrix := ((RotationMatrix* ScaleMatrix) * TranslationMatrix) * TranslationAlongLineMatrix;
    FinalMatrix := (RotationMatrix* ScaleMatrix)*TranslationMatrix;


    // If in the top left or top right quadrants, the image will appear
    // upside down. So, rotate the image 180 degrees
    // This is useful when the image contains text, ie is an annotation or similar,
    // or needs to always appear "under" the line
//    LineAngleDeg := Round(RadToDeg(angle));
//    case LineAngleDeg of
//      -180..-90,
//      90..180 : FinalMatrix := TMatrix.CreateRotation(DegToRad(180)) * TMatrix.CreateTranslation(Bitmap.Width, 0) * FinalMatrix;
//    end;

    Canvas.SetMatrix(FinalMatrix);

    // And finally draw the bitmap
    DestRect := TRectF.Create(Center, Bitmap.Width, Bitmap.Height);
    SrcRect := TRectF.Create(0, 0, Bitmap.Width, Bitmap.Height);
    Canvas.DrawBitmap(Bitmap, SrcRect, DestRect, 1);

  finally
    // Restore the original matrix
    Canvas.SetMatrix(OldMatrix);
  end;

      if Helpers then
     begin

      aBrush:=TStrokeBrush.Create(TbrushKind.Solid,TAlphaColors.white);
      aBrush.Thickness:=2;

      OrientedPoint.X:=Center.x+(w/2)*cos(degtorad(angle));
      OrientedPoint.Y:=Center.y+(w/2)*sin(degtorad(angle));
      Canvas.DrawLine(Center, OrientedPoint, 1,aBrush);

      canvas.DrawEllipse(rectf(Center.x-w/2, Center.y-h/2, center.x+w/2, center.y+h/2),1,abrush);

     end;

end;

end.
