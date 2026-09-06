@echo off
setlocal
if "%VCPKG_ROOT%"=="" (
  echo Set VCPKG_ROOT to your vcpkg folder first.
  exit /b 1
)
call "%VCPKG_ROOT%\vcpkg.exe" install sdl2:x64-windows
if errorlevel 1 exit /b %errorlevel%
cmake -S . -B build -A x64 -DCMAKE_TOOLCHAIN_FILE="%VCPKG_ROOT%\scripts\buildsystems\vcpkg.cmake"
if errorlevel 1 exit /b %errorlevel%
cmake --build build --config Release
if errorlevel 1 exit /b %errorlevel%
copy /Y "%VCPKG_ROOT%\installed\x64-windows\bin\SDL2.dll" "build\Release\SDL2.dll" >nul
echo Build complete: build\Release\PaintOpenGL.exe
