@echo off

set SRC_CFG=%~dp0dosbox.tmpl.conf
set DST_CFG=%~dp0tlink.dosbox.conf

del %DST_CFG% 2>nul
copy %SRC_CFG% %DST_CFG% >nul

(
  echo [autoexec]
  echo MOUNT S S:\
  echo S:
  echo SET PATH=%%PATH%%;s:\tools\bin
  echo cd %CD%
  echo tlink %* ^>tlinkbox.out
  echo pause
  echo if ERRORLEVEL 0 goto noerror
  echo type tlinkbox.out
  echo pause
  echo :noerror
  echo exit
) >> %DST_CFG%

dosbox -conf %DST_CFG%

rem set SDL_VIDEODRIVER=dummy
rem dosbox -conf %DST_CFG% -noconsole

del %DST_CFG% 2>nul
type tlinkbox.out
del tlinkbox.out 2>nul