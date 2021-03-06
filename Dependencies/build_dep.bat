@echo off

echo Building dependencies...

REM extact mysql libs
echo Extract mysql libs
"..\\Tool\\7z.exe" x mysql_libs.zip -Y

echo "Extract mysql++ libs"
"..\\Tool\\7z.exe" x mysqlpp_libs.zip -Y

echo Copy mysql libs to Debug directory
copy lib\\Release\\libmysql.dll lib\\Debug\\ /Y
copy lib\\Release\\libmysql.lib lib\\Debug\\ /Y
copy lib\\Release\\libmysqlclient.a lib\\Debug\\ /Y
copy lib\\Release\\libmysqlclient.so lib\\Debug\\ /Y
copy lib\\Release\\mysqlclient.lib lib\\Debug\\ /Y

REM extract libevent libs
echo Compiling libevent
"..\\Tool\\7z.exe" x libevent-2.0.22-stable.tar.gz -Y
"..\\Tool\\7z.exe" x libevent-2.0.22-stable.tar -Y
del libevent-2.0.22-stable.tar

if exist libevent rd /S /Q libevent
rename libevent-2.0.22-stable libevent
rd /S /Q libevent-2.0.22-stable

"..\\Tool\\7z.exe" x libevent_libs.zip -Y
copy lib\\Release\\libevent.a lib\\Debug\\ /Y
copy lib\\Release\\libevent.lib lib\\Debug\\ /Y
copy lib\\Release\\libevent_core.a lib\\Debug\\ /Y
copy lib\\Release\\libevent_core.lib lib\\Debug\\ /Y

REM extract curl libs
if exist curl rd /S /Q curl
"..\\Tool\\7z.exe" x curl-7.37.1.zip -Y
rename curl-7.37.1 curl
rd /S /Q curl-7.37.1

"..\\Tool\\7z.exe" x curl_libs.zip -Y

copy lib\\Debug\\libmysql.dll ..\\_Out\\Server\\Debug\\NFGameServer1\\ /Y
copy lib\\Debug\\libmysql.dll ..\\_Out\\Server\\Debug\\NFLoginServer\\ /Y
copy lib\\Debug\\libmysql.dll ..\\_Out\\Server\\Debug\\NFMasterServer\\ /Y
copy lib\\Debug\\libmysql.dll ..\\_Out\\Server\\Debug\\NFProxyServer1\\ /Y
copy lib\\Debug\\libmysql.dll ..\\_Out\\Server\\Debug\\NFWorldServer\\ /Y

copy lib\\Debug\\mysqlpp_d.dll ..\\_Out\\Server\\Debug\\NFGameServer1\\ /Y
copy lib\\Debug\\mysqlpp_d.dll ..\\_Out\\Server\\Debug\\NFLoginServer\\ /Y
copy lib\\Debug\\mysqlpp_d.dll ..\\_Out\\Server\\Debug\\NFMasterServer\\ /Y
copy lib\\Debug\\mysqlpp_d.dll ..\\_Out\\Server\\Debug\\NFProxyServer1\\ /Y
copy lib\\Debug\\mysqlpp_d.dll ..\\_Out\\Server\\Debug\\NFWorldServer\\ /Y

copy lib\\Release\\libmysql.dll ..\\_Out\\Server\\Release\\NFGameServer1\\ /Y
copy lib\\Release\\libmysql.dll ..\\_Out\\Server\\Release\\NFLoginServer\\ /Y
copy lib\\Release\\libmysql.dll ..\\_Out\\Server\\Release\\NFMasterServer\\ /Y
copy lib\\Release\\libmysql.dll ..\\_Out\\Server\\Release\\NFProxyServer1\\ /Y
copy lib\\Release\\libmysql.dll ..\\_Out\\Server\\Release\\NFWorldServer\\ /Y

copy lib\\Release\\mysqlpp.dll ..\\_Out\\Server\\Release\\NFGameServer1\\ /Y
copy lib\\Release\\mysqlpp.dll ..\\_Out\\Server\\Release\\NFLoginServer\\ /Y
copy lib\\Release\\mysqlpp.dll ..\\_Out\\Server\\Release\\NFMasterServer\\ /Y
copy lib\\Release\\mysqlpp.dll ..\\_Out\\Server\\Release\\NFProxyServer1\\ /Y
copy lib\\Release\\mysqlpp.dll ..\\_Out\\Server\\Release\\NFWorldServer\\ /Y

REM back to main dir
cd ..\\
