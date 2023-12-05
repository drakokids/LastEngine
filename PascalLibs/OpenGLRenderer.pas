unit OpenGLRenderer;

interface

// detecting Windows
{$IFDEF Win32}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

{$IFDEF Win64}          // Delphi and fpc of 32 Bit Windows
  {$DEFINE DGL_WIN}
{$ENDIF}

// detecting Linux
{$IFDEF linux}          // Linux
  {$DEFINE DGL_LINUX}
{$ENDIF}

// 64 BIT architecture
// Free pascal
{$IFDEF CPU64}
  {$DEFINE DGL_64BIT}
{$ENDIF}
// Delphi
{$IFDEF WIN64}
  {$DEFINE DGL_64BIT}
{$ENDIF}

// generell options
{$H+,O+,X+}

uses
  {$IFDEF FPC}{$MODE Delphi}
   sysutils,forms,
    {$IFDEF DGL_WIN}windows,{$ENDIF}
  {$ELSE}
  Winapi.Windows, system.SysUtils, vcl.forms,
  {$ENDIF}
  dglOpenGL, OpenGLColorsHelper;


procedure glInit();
procedure CreateRenderer(Form: TForm; Use3DMode: boolean);
procedure DestroyRenderer;
procedure BuildFont(pFontName : String);
procedure PrintText(pX,pY : Integer; const pText : String);
procedure ShowGUI;
procedure DrawOnIdle;
procedure DrawOpenGL;
procedure GoToFullScreen(pWidth, pHeight, pBPP, pFrequency : Word);
procedure ResizeView(newWidth,NewHeight: integer);
procedure glEnter2D;
procedure glLeave2D;

var
    ViewWidth, ViewHeight: integer;
    {$IFDEF DGL_WIN}
    FormHandle: HWND;
    RC        : HGLRC;
    DC        : HDC;
    {$ENDIF}
    ShowFPS   : Boolean;
    FontBase  : GLUInt;
    StartTick : Cardinal;
    Frames    : Integer;
    FPS       : Single;

     // Lights
    LightAmbient  : Array [0..3] Of GLfloat = (0.1, 0.1, 0.1, 1.0);
    LightDiffuse  : Array [0..3] Of GLfloat = (0.7, 0.7, 0.7, 1.0);
    LightSpecular : Array [0..3] Of GLfloat = (0.0, 0.0, 0.0, 1.0);
    LightPosition : Array [0..3] Of GLfloat = (0.0, 0.0, 2.0, 1.0);

const
  LIST_OBJECT = 1;

  mat_specular : array [0..3] of GLfloat = ( 1.0, 1.0, 1.0, 1.0 );
  mat_shininess : GLfloat = 50.0;
  light_position : array [0..3] of GLfloat = ( 1.0, 1.0, 1.0, 0.0 );

implementation

uses OpenGLShapersHelper;


procedure glInit();
begin

      glViewPort(0, 0, ViewWidth, ViewHeight);
      glMatrixMode(GL_PROJECTION);        // Change Matrix Mode to Projection
      glLoadIdentity();                   // Reset View
      gluPerspective(45.0, ViewWidth/ViewHeight, 1.0, 200.0);  // Do the perspective calculations. Last value = max clipping depth

      glMatrixMode(GL_MODELVIEW);         // Return to the modelview matrix
      glLoadIdentity();                   // Reset View

      glClearColor(0.0, 0.0, 0.0, 0.0); 	   // Black Background
      glClearAccum(0.0, 0.0, 0.0, 0.0);                     // Initialize the Accumulation buffer to black
      glShadeModel(GL_SMOOTH);          // Use Smooth shading ( This is the Default so we dont actually have to set it)


      InitShapers; //To enable the use of simple GL shapes


      glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
      glMaterialfv(GL_FRONT, GL_SHININESS, @mat_shininess);

      //Light 1
      glLightfv(GL_LIGHT0, GL_POSITION, @light_position);
      glEnable(GL_LIGHTING);
      glEnable(GL_LIGHT0);

      //Light 2
      glLightfv (GL_LIGHT1, GL_AMBIENT, @LightAmbient);       // Create light
      glLightfv (GL_LIGHT1, GL_DIFFUSE, @LightDiffuse);
      glLightfv (GL_LIGHT1, GL_SPECULAR, @LightSpecular);
      glLightfv (GL_LIGHT1, GL_POSITION, @LightPosition);     // Light position
      glEnable(GL_LIGHT1);

      glDepthFunc(GL_LEQUAL);
      glEnable(GL_DEPTH_TEST);

      glEnable(GL_COLOR_MATERIAL); //Necessary to give color the materials

      glEnable(GL_POLYGON_SMOOTH);
      glEnable(GL_BLEND);
      //glBlendFunc(GL_SRC_ALPHA_SATURATE, GL_ONE);
end;

procedure CreateRenderer(Form: TForm; Use3DMode: boolean);
begin
    FormHandle:=Form.Handle;
    ViewWidth:=Form.Width;
    ViewHeight:=Form.Height;
    InitOpenGL;
    // Gerätekontext holen
    DC := GetDC(FormHandle);
    // Renderkontext erstellen (32 Bit Farbtiefe, 24 Bit Tiefenpuffer, Doublebuffering)
    RC := CreateRenderingContext(DC, [opDoubleBuffered], 32, 24, 0, 0, 0, 0);
    // Erstellten Renderkontext aktivieren
    ActivateRenderingContext(DC, RC);
    // Tiefenpuffer aktivieren
    glEnable(GL_DEPTH_TEST);
    // Nur Fragmente mit niedrigerem Z-Wert (näher an Betrachter) "durchlassen"
    glDepthFunc(GL_LESS);
    // Löschfarbe für Farbpuffer setzen
    glClearColor(0,0,0,0);
    // Displayfont erstellen
    // Displayfont erstellen
    BuildFont('MS Sans Serif');
    // Idleevent für Rendervorgang zuweisen
    //Application.OnIdle := ApplicationEventsIdle;
    // Zeitpunkt des Programmstarts für FPS-Messung speichern
    StartTick := GetTickCount;
end;

procedure DestroyRenderer;
begin
     // Renderkontext deaktiveren
  DeactivateRenderingContext;
  // Renderkontext "befreien"
  wglDeleteContext(RC);
  // Erhaltenen Gerätekontext auch wieder freigeben
  ReleaseDC(FormHandle, DC);
  // Falls wir im Vollbild sind, Bildschirmmodus wieder zurücksetzen
  ChangeDisplaySettings(devmode(nil^), 0);
end;

procedure BuildFont(pFontName : String);
var
 Font : HFONT;
begin
    // Displaylisten für 256 Zeichen erstellen
    FontBase := glGenLists(96);
    // Fontobjekt erstellen
    Font     := CreateFont(16, 0, 0, 0, FW_MEDIUM, 0, 0, 0, ANSI_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS,
                           ANTIALIASED_QUALITY, FF_DONTCARE or DEFAULT_PITCH, PChar(pFontName));
    // Fontobjekt als aktuell setzen
    SelectObject(DC, Font);
    // Displaylisten erstellen
    wglUseFontBitmaps(DC, 0, 256, FontBase);
    // Fontobjekt wieder freigeben
    DeleteObject(Font)
end;


procedure PrintText(pX,pY : Integer; const pText : String);
begin
    if (pText = '') then
     exit;
    glPushAttrib(GL_LIST_BIT);
     glRasterPos2i(pX, pY);
     glListBase(FontBase);
     glCallLists(Length(pText), GL_UNSIGNED_BYTE, PChar(pText));
    glPopAttrib;
end;

procedure ShowGUI;
begin
    // Disables Depth Test and Texture to enable text draw
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_TEXTURE_2D);
    // Sets 2D Mode
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity;
    glOrtho(0,ViewWidth,ViewHeight,0, -1,1);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity;
    PrintText(5,15, FloatToStr(FPS)+' fps');
    //Puts back Depth Test and Texture
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_TEXTURE_2D);
end;

procedure DrawOpenGL;
var
  viewport : array [0..3] of GLint;
begin
  //glViewPort(0, 0, trunc(Width), trunc(Height));
  //glLoadIdentity();

  //glClearColor(0.0, 0.0, 0.0, 1.0);     // Black Background
  //glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);        // Clear the colour buffer
  //glLoadIdentity();                     // Load a "clean" model matrix on the stack

  glTranslatef(0.0,0.0,-100.0);          // Move the scene back 10 units so we can see the spheres properly

  SetColor(COLOR_RED,1);                   // Set our current rendering colour to red

  DrawSphere( 4.0, 48); // Render the sphere to the scene

  glTranslatef(20.0,0.0,0.0);
  SetColor(COLOR_BLUE,1);            // Set our current rendering colour to blue
  DrawSphere( 2.0, 32); // Render the sphere to the scene

  glTranslatef(0.0,20.0,0.0);
  SetColor(COLOR_GREEN,1);             // Set our current rendering colour to green
  DrawSphere(  3.0, 32); // Render the sphere to the scene

  glTranslatef(-20.0,0.0,0.0);
  SetColor(COLOR_PINK,1);           // Set our current rendering colour to pink
  DrawSphere(  4.0, 32); // Render the sphere to the scene

  glColor4f(0.0,1.0,1.0,0.1);
  glRotatef(90, 0, 1, 0);
  DrawCilinder (1,1,20,32);
  glRotatef(-90, 0, 1, 0);

//  SetColor(COLOR_WHITE,1);
//  glRotatef(90, 0, 0, 1);
//  glTranslatef(0.0,-50.0,10.0);
//  glBegin(GL_QUADS);
//    glVertex3f(25, 0, 25);
//    glVertex3f(-25, 0, 25);
//    glVertex3f(-25, 0, -25);
//    glVertex3f(25, 0, -25);
//  glEnd();

  SetColor(COLOR_GREEN,1);
  glLoadIdentity;
  //glRotatef(20, 0, 0, 1);
  //glTranslatef(-5.0,-5.0,-5.0);
  glBegin(GL_QUADS);
    glVertex3f(-128, 76, -125);
    glVertex3f(128, 76, -125);
    glVertex3f(128, -76, -125);
    glVertex3f(-128, -76, -125);
  glEnd();


  //SwapBuffers(wglGetCurrentDC);
end;

procedure DrawOnIdle;
begin
      // Projection Mode
      glMatrixMode(GL_PROJECTION);
      // Loads Identity Matrix
      glLoadIdentity;
      // Dimension of viewport
      glViewPort(0, 0, ViewWidth, ViewHeight);
      // Sets perpective mode
      gluPerspective(60, ViewWidth/ViewHeight, 1, 128);

      // Model Mode
      glMatrixMode(GL_MODELVIEW);
      // Loads Identity Matrix
      glLoadIdentity;
      // Clears the screen
      glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

      //Calls the Draw 3D Mode
      DrawOpenGL;

      //Now shows the GUI in 2D Mode
      ShowGUI;


      // Swap the drawing buffers
      SwapBuffers(DC);


      // Increments the number of frames drawed
      inc(Frames);
      // Atualizes FPS
      if GetTickCount - StartTick >= 500 then
       begin
       FPS       := Frames/(GetTickCount-StartTick)*1000;
       Frames    := 0;
       StartTick := GetTickCount
       end;
end;

procedure GoToFullScreen(pWidth, pHeight, pBPP, pFrequency : Word);
var
 dmScreenSettings : DevMode;
begin
  // Changes the display to go for fullscreen
  ZeroMemory(@dmScreenSettings, SizeOf(dmScreenSettings));
  with dmScreenSettings do
   begin
   dmSize              := SizeOf(dmScreenSettings);
   dmPelsWidth         := pWidth;
   dmPelsHeight        := pHeight;
   dmBitsPerPel        := pBPP;
   dmDisplayFrequency  := pFrequency;
   dmFields            := DM_PELSWIDTH or DM_PELSHEIGHT or DM_BITSPERPEL or DM_DISPLAYFREQUENCY;
   end;
  ViewWidth:=trunc(pWidth);
  ViewHeight:=trunc(pHeight);
  glViewPort(0, 0, ViewWidth, ViewHeight);
  if (ChangeDisplaySettings(dmScreenSettings, CDS_FULLSCREEN) = DISP_CHANGE_FAILED) then
   begin
   MessageBox(0, 'Error going fullscreen!', 'Error', MB_OK or MB_ICONERROR);
   exit
   end;
end;

procedure ResizeView(newWidth,NewHeight: integer);
begin
  ViewWidth:=trunc(newWidth);
  ViewHeight:=trunc(NewHeight);
  glViewPort(0, 0, ViewWidth, ViewHeight);
end;

procedure glEnter2D;
begin
  glMatrixMode(GL_PROJECTION);
  glPushMatrix;
  glLoadIdentity;
  gluOrtho2D(0, ViewWidth, 0, ViewHeight);

  glMatrixMode(GL_MODELVIEW);
  glPushMatrix;
  glLoadIdentity;

  glDisable(GL_DEPTH_TEST);
end;

procedure glLeave2D;
begin
  glMatrixMode(GL_PROJECTION);
  glPopMatrix;
  glMatrixMode(GL_MODELVIEW);
  glPopMatrix;

  glEnable(GL_DEPTH_TEST);
end;

end.
