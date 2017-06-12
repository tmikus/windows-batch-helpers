@echo off

SET JBToolboxDir=%UserProfile%\AppData\Local\JetBrains\Toolbox
IF NOT EXIST %JBToolboxDir% (
    ECHO JetBrains Toolbox could not be found.
    EXIT 1
)

SET WebstormVersionsDir=%JBToolboxDir%\apps\WebStorm\ch-0
IF NOT EXIST %WebstormVersionsDir% (
    ECHO Could not find WebStorm installation. This tool only works with JetBrains Toolbox installations of WebStorm.
    Exit 1
)

FOR /F "eol=" %%i IN ('DIR %WebstormVersionsDir% /O:D /b /A:D') DO (
    SET WebstormVersion=%%i
    GOTO :versionFound
)

:versionFound
SET LatestWebstorm=%WebstormVersionsDir%\%WebstormVersion%\bin\webstorm64.exe
IF NOT EXIST %LatestWebstorm% (
    ECHO Could not find WebStorm installation. This tool only works with JetBrains Toolbox installations of WebStorm.
    Exit 1
)

START %LatestWebstorm% %*
EXIT