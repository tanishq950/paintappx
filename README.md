# PaintAppX — C++ / OpenGL Paint Application

A basic **MS Paint-like desktop application** for a Computer Graphics micro project. It is written in C++17, uses OpenGL for rendering and SDL2 for window/input handling.

## Features

- Pencil / freehand drawing
- Eraser
- Straight line
- Rectangle
- Ellipse
- Filled or outline shapes
- Text tool with built-in 5x7 bitmap font
- 20-color palette
- Undo / redo
- Clear / New canvas
- Save drawing as 24-bit BMP
- Keyboard shortcuts
- OpenGL texture-based canvas

## Keyboard shortcuts

| Action | Key |
|---|---|
| Pencil | `1` |
| Line | `2` |
| Rectangle | `3` |
| Ellipse | `4` |
| Eraser | `5` |
| Text | `6` |
| Undo | `Ctrl+Z` |
| Redo | `Ctrl+Y` |
| New/Clear | `Ctrl+N` |
| Save | `Ctrl+S` |
| Finish text | `Enter` |
| Cancel text | `Esc` |

## Build on Windows

Install Visual Studio 2022 with **Desktop development with C++**, CMake and vcpkg.

```bat
vcpkg install sdl2:x64-windows
cmake -S . -B build -A x64 -DCMAKE_TOOLCHAIN_FILE=C:\path\to\vcpkg\scripts\buildsystems\vcpkg.cmake
cmake --build build --config Release
```

Then place `SDL2.dll` beside `PaintOpenGL.exe` from the vcpkg `bin` directory.

You can also run `build_windows.bat` after setting `VCPKG_ROOT`.

## GitHub Actions

The repository includes `.github/workflows/windows.yml`. Every push starts a Windows x64 build and packages `PaintOpenGL.exe` with `SDL2.dll` as a downloadable Actions artifact.

## Computer Graphics concepts

- Bresenham-style raster line drawing
- Ellipse scanline rasterization
- Window-to-canvas coordinate mapping
- OpenGL texture mapping
- 2D OpenGL primitives for the UI
- Event-driven interactive graphics
- Undo/redo state management
- BMP raster image encoding

## Project report

See [`PROJECT_REPORT.md`](PROJECT_REPORT.md) for the micro-project documentation.
