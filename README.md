# LastEngine
## _The Last Game Engine_

Last Engine is not just another game engine. 

## Why Another game engine?
Just because in the market there is nothing easy to use with the most possible abstraction, with functionalityes that would allow to go beyond making games.

## Why splitting 2D from 3D?
The game will have 2D and 3D modes, and the 3D mode will be mostly ortographic.
2D mode will use pixel perfect for all resolutions, so for windows the best would be Direct2D, and for the other platforms we need to use what they have the most.
For the 2D I decided to go for low level operations in order to have no limitations. It will be a slow process.

For 3D, the advance will be a even slower. Starting from base shapes to advanced shading processes.

## Why Pascal?
After many trials and so many options, this is an attempt to create a very nice engine, but not future proof.

It will be funny to create a game engine from the beggining and Pascal is one of my old languages, where I have more experience.

Of course that the Editor will be done in Pascal because of the RAD environment. I can do the same 10x faster than other languages.
Probably the Lazarus version could be replaced in the future with a c++ version, but for now the code is the same. Using C++ we can use existing game libraries and focus in speed and portability.

## What applications can I do with it?
- All Kind of 2D, 2.5D and 3D Games.
- Multimedia Presentations.
- Simulations.
- Projections with multiple projectors and world transformations.

## What platforms will it support?
Windows for development platform (Mac could be used using parallels Desktop).
The engine will compile for windows, MacOs, Linux, Raspberry Pi, Android and iOS. Web platform only planned for now.

It it also possible to create a game without compiling, just by adding the necessary scrits and media files.

## Main Functionalities
- High Quality 2D and 3D.
- Large Maps for 2D and 3D.
- Fake 3D mode, using only 2D.
- 2D drawing functions ( Lines, Rectangles, Circles, Triangles, Text, and many others )
- Realistic Fake Rendering in 3D.
- Automatic Effects in 3D ( Shadows, Glows, Lights )
- 3D Sounds.
- 2D and 3D Physics
- Animations and Videos.
- Multimonitor ( up to 6 monitors ).
- Resolutions per monitor up to 4K.
- Smart Blending and Bending for projetions in shaped locals.
- Realistic but faked Water, Ocean, Sky, Vegetation.
- Particles 2D and 3D
- Interface with Gamepads, Joysticks.
- Touch Screen support.
- Interface with Arcade joysticks, Buttons, Gun's, Spinners, and Led controllers.
- Windows Game Engine Editor with Multiple Editors ( Sprites, Tile Maps, Vector Roads, 3D world editor, Sound )
- Execution Script Language for simple demos and games
- Encripted Media Files


## License

MIT
