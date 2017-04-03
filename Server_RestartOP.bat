@echo off
echo.
echo KILL arma2oaserveroverpoch.exe
set serverkill="C:\Users\Administrator\Desktop\Overpoch"
cd /d %serverkill%
taskkill /im arma2oaserveroverpoch.exe
echo.
echo Kill BecOP.exe
set beckill="C:\Users\Administrator\Desktop\Overpoch\instance_11_Chernarus\BattlEye\Bec"
cd /d %beckill%
taskkill /im becOP.exe

timeout 5

echo.
echo Rotate Logs
start "start" "C:\Users\Administrator\Desktop\Overpoch\instance_11_Chernarus\rotate_logs.bat" 

timeout 5


echo.
echo Starting Dayz Server
:: start the server..
set dayzpath="C:\Users\Administrator\Desktop\Overpoch\"
cd /d %dayzpath%
start "start" "Server_Start_NewOP.bat"
echo.
echo Starting Bec
timeout 20
:: start bec
set becpath="C:\Users\Administrator\Desktop\Overpoch\instance_11_Chernarus\BattlEye\Bec"
cd /d %becpath%
start "start" "becOP.exe" -f Config.cfg
echo.
echo Server Started 100%

cls
@exit