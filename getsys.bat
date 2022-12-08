@echo off

echo Processor:
wmic cpu get name

echo.
echo Installed RAM:
wmic memorychip get capacity

echo.
echo Hard disk space:
wmic logicaldisk where drivetype=3 get deviceid, freespace, size

echo.
echo Windows version:
systeminfo | find "OS Name"

echo.
echo Screen resolution:
wmic desktopmonitor get screenwidth, screenheight

echo.
echo Ping to www.google.com:
ping -n 1 www.google.com

pause

set /p save=Quiere guardar la informacion del Sistema? (Y/N)

if /i "%save%" == "Y" (


    echo Processor: > systeminfo.txt
    wmic cpu get name >> systeminfo.txt

    echo. >> systeminfo.txt
    echo Installed RAM: >> systeminfo.txt
    wmic memorychip get capacity >> systeminfo.txt

    echo. >> systeminfo.txt
    echo Hard disk space: >> systeminfo.txt
    wmic logicaldisk where drivetype=3 get deviceid, freespace, size >> systeminfo.txt

    echo. >> systeminfo.txt
    echo Windows version: >> systeminfo.txt
    systeminfo | find "OS Name" >> systeminfo.txt

    echo. >> systeminfo.txt
    echo Screen resolution: >> systeminfo.txt
    wmic desktopmonitor get screenwidth, screenheight >> systeminfo.txt

    echo. >> systeminfo.txt
    echo Ping to www.google.com: >> systeminfo.txt
    ping -n 1 www.google.com >> systeminfo.txt

) else if /i "%save%" == "N" (

    echo The system information was not saved
) else (

    echo Invalid response. Please enter Y or N.
    goto :eof
)

pause

