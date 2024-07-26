unit LastEngineTypes;

interface

uses FMX.Graphics, system.types;

const
  GDIPLUS_RENDER = 9;
  OPENGL3D_RENDER = 10;
  OPENGL2D_RENDER = 11;
  D2D_RENDER = 12;

type
  LE_Color=record
    red,green,blue,alpha: byte;
  end;

  LE_Vector3d=record
    x,y,z: single;
  end;

  LE_Vector2d=record
    x,y: single;
  end;

  LE_ColorRGB=record
    red,green,blue: single;
  end;

  LE_3DObjectType=(LELight3D,LESimpleMesh3D,LEAdvancedMesh3D);
  LE_ImageDrawMode=(LEDrawNone,LEDrawColor,LEDrawCenter,LEDrawStretched,LEDrawTiled);
  LE_MeshType=(LE3DLine,LECube,LESphere,LECylinder,LECone,LEPyramid,LEDonut,LECustom);
  LE_sceneType=(LEScene2D, LEScene3D);
  LEresType=(LE_Image, LE_Sound, LE_String);
  LEparticleType=(LEparticleSprite,LEparticlePixels,LEparticleLines,LEparticleCircles,LEparticleTriangles,LEparticleStars);
  LEanimationType=(LEanimationNone,LEanimationFade,LEanimationRotate,LEanimationZoomin,LEanimationZoomout);

  FileContainerItem=record
   index: integer;
   alias: string;
   filename: string;
  end;
  ArrayOfFileContainerItem = array of FileContainerItem;

  ResourceContainerItem=record
   index: integer;
   alias: string;
   resourceType: LEresType;
   Bitmap: TBitmap;
  end;
  ArrayOfResourceContainerItem = array of ResourceContainerItem;

  TGameAnimation=record
    animationType: LEanimationType;
    animationStart: integer; //ms
    animationEnd: integer; //ms
    animationChange: integer; //ms
    animationValue1: integer; //ex: angle
  end;

  TGameAnimations=record
    animationItems: TGameAnimation;
  end;

 TTile=record
   bitmapindex: integer;  //for single image, this is the source
   FrameRect: TRectf;
   isAnimation: boolean;
   Animationindex: integer;   //wich animation assigned to this tile?
   FramesCount: integer;
   CurrentFrame: integer;
   isReady: boolean;
   delayms: integer;
   FNextAnimationTick: integer;
 end;

 TTilesAnimation=record
   Animationindex: integer;
   Frames: array of integer; //Aponta para os bitmaps
   isReady: boolean;
 end;

var
  FMediaFolder:string;


implementation

end.
