# Micro Project Report
## Basic MS Paint-Like Application using C++ and OpenGL

### Aim
To design and implement a basic interactive paint application demonstrating fundamental computer graphics concepts using C++ and OpenGL.

### Objectives
- Create a 2D drawing canvas.
- Implement freehand drawing, erasing and geometric primitives.
- Provide color selection through a palette.
- Support text placement.
- Implement undo/redo state management.
- Save drawings as BMP images.
- Use OpenGL for texture-based rendering.

### Technologies
- C++17
- OpenGL fixed-function pipeline
- SDL2 for window/input
- CMake
- 24-bit BMP output

### Features
1. Pencil/freehand drawing.
2. Eraser.
3. Straight line.
4. Rectangle.
5. Ellipse.
6. Filled/outline shapes.
7. Text tool with an embedded 5x7 bitmap font.
8. 20-color palette.
9. Undo and redo.
10. Clear/New canvas.
11. Save as `paint_output.bmp`.
12. Keyboard shortcuts.

### Computer Graphics Concepts
**Coordinate mapping:** mouse window coordinates are converted to canvas coordinates using the canvas origin.

**Raster line drawing:** freehand and line tools use an integer Bresenham-style rasterization routine.

**Ellipse rasterization:** the ellipse equation is evaluated row-by-row and scanlines are filled when fill mode is enabled.

**Texture mapping:** the CPU RGBA canvas is uploaded to an OpenGL `GL_TEXTURE_2D` and displayed in the drawing area.

**2D UI rendering:** OpenGL quads and line loops render the toolbar, palette and status area.

### Undo/Redo
Before editing, the canvas byte array is copied into the undo stack. Undo moves the current state to the redo stack and restores the latest saved state; redo performs the reverse operation. History is limited to 30 states.

### Save Algorithm
Pixels are converted from RGBA memory to BGR rows and written bottom-to-top into a standard uncompressed 24-bit BMP file.

### Controls
| Action | Shortcut |
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

### Conclusion
The project demonstrates how an interactive paint application can be implemented from raster algorithms, event handling and OpenGL rendering while remaining small enough for a computer graphics micro-project.
