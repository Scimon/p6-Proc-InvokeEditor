SET filepath=%~f1
SET /p filedata=< %filepath%
ECHO %filedata% > %filepath%
ECHO %filedata% >> %filepath%