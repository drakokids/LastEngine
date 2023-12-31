unit glFunctions;

interface

uses Classes,Windows,dglOpenGL,sdl2, vcl.forms;

procedure glDrawScene;
procedure CloseOpenGL(GLHandle, GLUHandle: HINST);
function glResizeWindow( width : integer; height : integer ) : Boolean;
procedure glHandleKeyPress( keysym : PSDL_keysym );
function glTimer( interval : UInt32; param : Pointer ) : UInt32;
procedure Init_SDL(w,h: integer);
procedure Init_OpenGL;
procedure Quit_App;
procedure glHandleEvents;

const INVALID_MODULEHANDLE = 0;

var done        : Integer;
    WINDOWS_CAPTION: string;
    SCREEN_BPP: integer;
    FPS_INTERVAL: integer;
    surface     : PSDL_Surface;
    videoflags  : Uint32;
    FPSCount    : LongInt;
    GLHandle: HINST;
    GLUHandle: HINST;

    gWindow: PSDL_Window;
    glcontext: TSDL_GLContext;
    e: TSDL_Event;
    windowFullScreen: boolean;
    WindowWidth, WindowHeight: integer;

implementation

procedure glDrawScene;
begin
  // Screen- und Tiefenbuffer bereinigen
  glViewPort(0,0,WindowWidth,WindowHeight);
  glClearColor(0,0,1,0);
  glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );

  glMatrixMode(GL_PROJECTION);      // To operate on Model-View matrix
  glLoadIdentity;
  glTranslatef( -0.5, 0.4, -0.3 );  //Translate left & up
  //glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);   mostra apenas linhas

  // Zeichne Dreieck
  glcolor3f(1,0,0);
  glBegin( GL_TRIANGLES );
    glVertex3f( 0.0, 1.0, 1.0 );
    glVertex3f( 1.0, -1.0, 0.0 );
    glVertex3f( -1.0, -1.0, 0.0 );
  glEnd;

  glTranslatef( 2, 0.0, -0.6 );

  // Zeichne ein Quadrat
  glcolor3f(0,1,0);
  glBegin( GL_QUADS );
    glVertex3f( -1.0, 1.0, 0.0 );
    glVertex3f( 1.0, 1.0, 0.0 );
    glVertex3f( 1.0, -1.0, 0.0 );
    glVertex3f( -1.0, -1.0, 0.0 );
  glEnd;

  // Buffer-Wechseln ==> Anzeigen
  SDL_GL_SwapWindow(gWindow);
end;

procedure CloseOpenGL(GLHandle, GLUHandle: HINST);
  begin
    if GLHandle <> INVALID_MODULEHANDLE then
    begin
      FreeLibrary(Cardinal(GLHandle));
      GLHandle := INVALID_MODULEHANDLE;
    end;

    if GLUHandle <> INVALID_MODULEHANDLE then
    begin
      FreeLibrary(Cardinal(GLUHandle));
      GLUHandle := INVALID_MODULEHANDLE;
    end;

  end;

function glResizeWindow( width : integer; height : integer ) : Boolean;
begin
  // Verhindern von "Division by Zero"
  if ( height = 0 ) then height := 1;

  // Viewport und Projektions-Matrix aktualisieren
  glViewport( 0, 0, width, height );

  glMatrixMode( GL_PROJECTION );
    glLoadIdentity;
    gluPerspective( 45.0, width / height, 0.1, 100.0 );
  glMatrixMode( GL_MODELVIEW );

  // R�cksetzen der World-Matrix
  glLoadIdentity;

  // Vorgang erfolgreich
  result := true;
end;

procedure glHandleKeyPress( keysym : PSDL_keysym );
begin;
  case keysym.sym of
    SDLK_ESCAPE : done := -1;
  end;
end;

function glTimer( interval : UInt32; param : Pointer ) : UInt32;
begin;
   FPSCount := 0;
   Result := interval;
end;


procedure Init_OpenGL;
begin;
    // Laden und Initalisieren von OpenGL
//    LoadOpenGL;


    InitOpenGL;

 //   ActivateRenderingContext(
    ReadExtensions;

    // Ausganswerte f�r die State-Machine setzen
    //glEnable(GL_TEXTURE_2D);	                // Aktiviert Texture Mapping
    //glShadeModel(GL_SMOOTH);	                // Aktiviert weiches Shading
    //glClearColor(0.0, 0.0, 0.0, 0.5);         // Bildschirm l�schen (schwarz)
    //glClearDepth(1.0);		                    // Depth Buffer Setup
    //glEnable(GL_DEPTH_TEST);	                // Aktiviert Depth Testing
    //glDepthFunc(GL_LEQUAL);	                  // Bestimmt den Typ des Depth Testing
    //glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
                                              // Qualitativ bessere Koordinaten Interpolation
end;

procedure Init_SDL(w,h: integer);
var sdlFlags: TSDL_WindowFlags;
begin;
  // Initalisieren vom Simple DirectMedia Layer
  if ( SDL_Init( SDL_INIT_VIDEO ) < 0 ) then
  begin
    Writeln('Initalisierung von SDL schlug fehl: '+SDL_GetError,'SDL_Init');
    Quit_App;
  end;

  sdlFlags:=SDL_WINDOW_OPENGL or SDL_WINDOW_SHOWN;
  if windowFullScreen then
   begin
    sdlFlags:= sdlFlags or SDL_WINDOW_FULLSCREEN_DESKTOP;
    w:=screen.width;
    h:=screen.Height;
    WindowWidth:=w;
    WindowHeight:=h;
   end;

  gWindow := SDL_CreateWindow('LastEngine', SDL_WINDOWPOS_UNDEFINED,
      SDL_WINDOWPOS_UNDEFINED,w, h, sdlFlags);
    glcontext := SDL_GL_CreateContext(gWindow);
    if glcontext = nil then begin
      Writeln('OpenGL context could not be created! SDL Error: ', SDL_GetError);
      Halt(1);
    end;

  if SDL_GL_SetSwapInterval(1) < 0 then begin
      WriteLn('Warning: Unable to set VSync! SDL Error: ', SDL_GetError);
    end;

  // Setzen der OpenGL-Attribute
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 5);
  //SDL_GL_SetAttribute( SDL_GL_RED_SIZE, 5 );
  //SDL_GL_SetAttribute( SDL_GL_GREEN_SIZE, 5 );
  //SDL_GL_SetAttribute( SDL_GL_BLUE_SIZE, 5 );
  //SDL_GL_SetAttribute( SDL_GL_DEPTH_SIZE, 16 );
  //SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 );
  // Initalisierung des Timers
  SDL_Init(SDL_INIT_TIMER);
end;

procedure Quit_App;
begin
  SDL_QUIT;
  CloseOpenGL(GLHandle,GLUHandle);
  Halt(0);
end;

procedure glHandleEvents;
var event       : TSDL_Event;
begin;
    // Verarbeiten der Events
    while ( SDL_PollEvent( @event ) = 1 ) do
    begin
      case event.type_ of

        // Beenden der Applikation
        SDL_QUITEV :
        begin
          Done := -1;
        end;

        // Taste wurde gedr�ckt
        SDL_KEYDOWN :
        begin
          glHandleKeyPress( @event.key.keysym );
        end;


      end;
    end;
end;


end.
