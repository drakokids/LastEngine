package main

import (
	"fmt"
	rl "github.com/gen2brain/raylib-go/raylib"
	"os"
)

const FLAG_MSAA_4X_HINT = 32

func main() {

	cmdArgs := os.Args[1:]
	fmt.Println(cmdArgs)

	rl.SetTraceLogLevel(rl.LogError) //Only Errors are logged out

	rl.SetConfigFlags(FLAG_MSAA_4X_HINT)
	rl.InitWindow(1920, 1080, "raylib [core] example - 3d mode")

	camera := rl.Camera3D{}
	camera.Position = rl.NewVector3(0.0, 3.0, 5.0)
	camera.Target = rl.NewVector3(0.0, 0.0, 0.0)
	camera.Up = rl.NewVector3(0.0, 0.8, 0.0)
	camera.Fovy = 45.0
	camera.Projection = rl.CameraPerspective

	cubePosition := rl.NewVector3(0.0, 1.0, 0.0)

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()

		rl.ClearBackground(rl.RayWhite)

		rl.BeginMode3D(camera)

		rl.DrawGrid(10, 1.0)
		rl.DrawCube(cubePosition, 2.0, 2.0, 2.0, rl.Gold)
		rl.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, rl.Maroon)

		rl.EndMode3D()

		rl.DrawText("Welcome to the third dimension!", 10, 40, 20, rl.DarkGray)

		rl.DrawFPS(10, 10)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
