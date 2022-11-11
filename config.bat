@echo off

echo Read build config:
set PACKAGE_NAME=Unnamed
set PACKAGE_AMXMODX_FOLDER=amxmodx
set PACKAGE_README_USE=0

set PACKAGE_ASSETS_USE=0
set PACKAGE_ASSETS_FOLDER=assets

set PACKAGE_COMPILED_PLUGINS_USE=1
set PACKAGE_COMPILED_PLUGINS_SAVE=1

set PACKAGE_PLUINGS_LIST_USE=0
set PACKAGE_PLUINGS_LIST_POSTFIX=unnamed
set PACKAGE_PLUINGS_LIST_SAVE=0

if not defined AMXX_COMPILER_DIR (
    set AMXX_COMPILER_DIR=C:\AmxModX\1.9.0
)
if not defined AMXX_COMPILER_EXECUTABLE (
    set AMXX_COMPILER_EXECUTABLE=amxx190
)
if not defined PACKAGE_DEBUG (
    set PACKAGE_DEBUG=0
)

for /f "delims== tokens=1,2" %%G in (.build-config) do set %%G=%%H
if exist (local.build-config) (
    for /f "delims== tokens=1,2" %%G in (local.build-config) do set %%G=%%H
)

if "%PACKAGE_DEBUG%" == "1" (
    set PACKAGE_NAME=%PACKAGE_NAME%-debug
)
set AMXX_COMPILER_EXECUTABLE_PATH=%AMXX_COMPILER_DIR%\%AMXX_COMPILER_EXECUTABLE%


set ROOT_PATH=%CD%
set AMXMODX_PATH=%ROOT_PATH%\%PACKAGE_AMXMODX_FOLDER%
set INCLUDES_PATH=%AMXMODX_PATH%\scripting\include
set README_FILE=%ROOT_PATH%\README.md
set ASSETS_PATH=%ROOT_PATH%\%PACKAGE_ASSETS_FOLDER%

set BUILD_ROOT_PATH=%ROOT_PATH%\.build
set BUILD_PACKAGE_PATH=%BUILD_ROOT_PATH%\%PACKAGE_NAME%
set BUILD_AMXMODX_PATH=%BUILD_PACKAGE_PATH%\addons\amxmodx
set BUILD_ASSETS_PATH=%BUILD_PACKAGE_PATH%

set AMXX_COMPILER_INCLUDES_PATH=%AMXX_COMPILER_DIR%\include

set PLUGINS_LIST_PATH=%BUILD_AMXMODX_PATH%\configs
if "%PACKAGE_PLUINGS_LIST_SAVE%" == "1" (
    set PLUGINS_LIST_PATH=%AMXMODX_PATH%\configs
)
set PLUGINS_LIST=%PLUGINS_LIST_PATH%\plugins-%PACKAGE_PLUINGS_LIST_POSTFIX%.ini

set COMPILER_OUTPUT_PATH=%BUILD_AMXMODX_PATH%\plugins
if "%PACKAGE_COMPILED_PLUGINS_SAVE%" == "1" (
    set COMPILER_OUTPUT_PATH=%AMXMODX_PATH%\plugins
)

set ZIP_FILE=%ROOT_PATH%\%PACKAGE_NAME%.zip


echo - PACKAGE_NAME = %PACKAGE_NAME%
echo - PACKAGE_README_USE = %PACKAGE_PLUINGS_LIST_USE%

echo - PACKAGE_COMPILED_PLUGINS_USE = %PACKAGE_COMPILED_PLUGINS_USE%
echo - PACKAGE_COMPILED_PLUGINS_SAVE = %PACKAGE_COMPILED_PLUGINS_SAVE%

echo - PACKAGE_PLUINGS_LIST_USE = %PACKAGE_PLUINGS_LIST_USE%
echo - PACKAGE_PLUINGS_LIST_POSTFIX = %PACKAGE_PLUINGS_LIST_POSTFIX%
echo - PACKAGE_PLUINGS_LIST_SAVE = %PACKAGE_PLUINGS_LIST_SAVE%

echo - AMXX_COMPILER_DIR = %AMXX_COMPILER_DIR%
echo - AMXX_COMPILER_EXECUTABLE = %AMXX_COMPILER_EXECUTABLE%
echo.
echo - PACKAGE_DEBUG = %PACKAGE_DEBUG%
echo.
