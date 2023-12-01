unit Test3DOpenGL;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  //Libraries for windows
  {$IFDEF MSWINDOWS}
  FMX.Platform.Win,Winapi.Windows, OpenGL,
  {$ENDIF}

  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormTestOpenGL = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FDC: HDC;
    FRC: HGLRC;
  protected
    procedure HandleInit;
    procedure HandleRelease;
    procedure SetupPixelFormat;
    procedure glInit();
  public
    { Public declarations }
    procedure DrawOpenGL;
  end;

var
  FormTestOpenGL: TFormTestOpenGL;

  // Quadric for sphere ( Dont worry too much about this now we'll handle this later)
  SphereQuadratic : gluQuadricObj;
  CilinderQuadratic: gluQuadricObj;
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

{$R *.fmx}

procedure TFormTestOpenGL.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Timer1.Enabled:=false;

  HandleRelease;
end;

procedure TFormTestOpenGL.FormShow(Sender: TObject);
begin
  //Vai criar as coisas no show
  HandleInit;

  GLInit();

  Timer1.Enabled:=true;
end;

procedure TFormTestOpenGL.HandleInit;
begin

  FDC := GetDC(FormToHWND(self));
  if FDC = 0 then Exit;

  SetupPixelFormat;

  FRC := wglCreateContext(FDC);
  if FRC = 0 then Exit;

  if not wglMakeCurrent(FDC, FRC) then
    raise Exception.Create('Unable to initialize.');
end;

procedure TFormTestOpenGL.HandleRelease;
begin
  wglMakeCurrent(FDC, 0);
  wglDeleteContext(FRC);
  ReleaseDC(TWinWindowHandle (Panel1).Wnd, FDC);
end;

procedure TFormTestOpenGL.SetupPixelFormat;
var
  PixelFormatDescriptor: TPixelFormatDescriptor;
  pfIndex: Integer;
begin
  with PixelFormatDescriptor do
  begin
    nSize := SizeOf(TPixelFormatDescriptor);
    nVersion := 1;
    dwFlags := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
    iPixelType := PFD_TYPE_RGBA;
    cColorBits := 32;
    cRedBits := 0;
    cRedShift := 0;
    cGreenBits := 0;
    cGreenShift := 0;
    cBlueBits := 0;
    cBlueShift := 0;
    cAlphaBits := 0;
    cAlphaShift := 0;
    cAccumBits := 8; //Estava em 0
    cAccumRedBits := 0;     //Estava em 0
    cAccumGreenBits := 0;   //Estava em 0
    cAccumBlueBits := 0;  //Estava em 0
    cAccumAlphaBits := 8;
    cDepthBits := 4;
    cStencilBits := 0;
    cAuxBuffers := 0;
    iLayerType := PFD_MAIN_PLANE;
    bReserved := 0;
    dwLayerMask := 0;
    dwVisibleMask := 0;
    dwDamageMask := 0;
  end;

  pfIndex := ChoosePixelFormat(FDC, @PixelFormatDescriptor);
  if pfIndex = 0 then Exit;

  if not SetPixelFormat(FDC, pfIndex, @PixelFormatDescriptor) then
    raise Exception.Create('Unable to set pixel format.');
end;

procedure TFormTestOpenGL.glInit();
begin


  glViewPort(0, 0, trunc(Panel1.Width), trunc(Panel1.Height));
  glMatrixMode(GL_PROJECTION);        // Change Matrix Mode to Projection
  glLoadIdentity();                   // Reset View
  gluPerspective(45.0, Width/Height, 1.0, 200.0);  // Do the perspective calculations. Last value = max clipping depth

  glMatrixMode(GL_MODELVIEW);         // Return to the modelview matrix
  glLoadIdentity();                   // Reset View

  glClearColor(0.0, 0.0, 0.0, 0.0); 	   // Black Background
  glClearAccum(0.0, 0.0, 0.0, 0.0);                     // Initialize the Accumulation buffer to black
  glShadeModel(GL_SMOOTH);          // Use Smooth shading ( This is the Default so we dont actually have to set it)

  // Generate a sphere using the OpenGL utility Library
  SphereQuadratic := gluNewQuadric;		       // Create A Pointer To The Quadric Object (Return 0 If No Memory) (NEW)
  gluQuadricNormals(SphereQuadratic, GLU_SMOOTH);	       // Create Smooth Normals (NEW)
  CilinderQuadratic := gluNewQuadric();		       // Create A Pointer To The Quadric Object (Return 0 If No Memory) (NEW)
  gluQuadricNormals(CilinderQuadratic, GLU_SMOOTH);	       // Create Smooth Normals (NEW)

  glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  glMaterialfv(GL_FRONT, GL_SHININESS, @mat_shininess);

  //Luz 1
  glLightfv(GL_LIGHT0, GL_POSITION, @light_position);
  glEnable(GL_LIGHTING);
  glEnable(GL_LIGHT0);
//
  //Luz 2
  glLightfv (GL_LIGHT1, GL_AMBIENT, @LightAmbient);       // Create light
  glLightfv (GL_LIGHT1, GL_DIFFUSE, @LightDiffuse);
  glLightfv (GL_LIGHT1, GL_SPECULAR, @LightSpecular);
  glLightfv (GL_LIGHT1, GL_POSITION, @LightPosition);     // Light position
  glEnable(GL_LIGHT1);

  glDepthFunc(GL_LEQUAL);
  glEnable(GL_DEPTH_TEST);

  glEnable(GL_COLOR_MATERIAL); //Sem isto a esfera não fica a cores

  glEnable(GL_POLYGON_SMOOTH);
  glEnable(GL_BLEND);
  //glBlendFunc(GL_SRC_ALPHA_SATURATE, GL_ONE);

end;

procedure TFormTestOpenGL.Timer1Timer(Sender: TObject);
begin
    //Vai desenhar
    DrawOpenGL;
end;

procedure TFormTestOpenGL.DrawOpenGL;
var
  viewport : array [0..3] of GLint;
begin
  glViewPort(0, 0, trunc(Panel1.Width), trunc(Panel1.Height));
  glLoadIdentity();

  glClearColor(0.0, 0.0, 0.0, 1.0);     // Black Background
  glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);        // Clear the colour buffer
  glLoadIdentity();                     // Load a "clean" model matrix on the stack


  glTranslatef(0.0,0.0,-100.0);          // Move the scene back 10 units so we can see the spheres properly

  glColor4f(1.0,0.0,0.0,1);               // Set our current rendering colour to red
  gluSphere(SphereQuadratic, 4.0, 48, 48); // Render the sphere to the scene

  glTranslatef(20.0,0.0,0.0);
  glColor4f(0.0,0.0,1.0,1);               // Set our current rendering colour to blue
  gluSphere(SphereQuadratic, 2.0, 32, 32); // Render the sphere to the scene

  glTranslatef(0.0,20.0,0.0);
  glColor4f(0.0,1.0,0.0,1);               // Set our current rendering colour to green
  gluSphere(SphereQuadratic, 3.0, 32, 32); // Render the sphere to the scene

  glTranslatef(-20.0,0.0,0.0);
  glColor4f(1.0,0.0,1.0,0.1);               // Set our current rendering colour to pink
  gluSphere(SphereQuadratic, 4.0, 32, 32); // Render the sphere to the scene

  glColor4f(0.0,1.0,1.0,0.1);
  glRotatef(90, 0, 1, 0);
  gluCylinder (CilinderQuadratic,1,1,20,32,32);

  glColor4f(1.0,1.0,1.0,1);
  glRotatef(90, 0, 0, 1);
  glTranslatef(0.0,-50.0,10.0);
  glBegin(GL_QUADS);
    glVertex3f(25, 0, 25);
    glVertex3f(-25, 0, 25);
    glVertex3f(-25, 0, -25);
    glVertex3f(25, 0, -25);
  glEnd();


  SwapBuffers(wglGetCurrentDC);
end;

end.
