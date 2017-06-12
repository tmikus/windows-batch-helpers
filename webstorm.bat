@echo off

SET WebstormVersionsDir=%UserProfile%\AppData\Local\JetBrains\Toolbox\apps\WebStorm\ch-0

FOR /F "eol=" %%i IN ('DIR %WebstormVersionsDir% /O:D /b /A:D') DO (
    SET WebstormVersion=%%i
    GOTO :versionFound
)

:versionFound
SET LatestWebstorm=%WebstormVersionsDir%\%WebstormVersion%\bin\webstorm64.exe

START %LatestWebstorm% %*
EXIT