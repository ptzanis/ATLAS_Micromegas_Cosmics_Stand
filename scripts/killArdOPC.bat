@ECHO OFF
ECHO.
ECHO Kill Arduino OPC Server
ECHO.
AT 00:00:every:M,T,W,Th,F,S,Su taskkill /f /im ArduinoOPCServer.exe
ECHO.
@PAUSE
CLS
EXIT