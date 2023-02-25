SET deploydir=D:\Dokumente\Promotion\code\modelica-deploy\MoGuide
if exist %deploydir% del /s /q %deploydir%
xcopy /E /Y ..\MoGuide %deploydir%
