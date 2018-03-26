
@ECHO off
@SET arg1=%1
shift

@ECHO Build is %arg1% 
git.exe fetch --no-tags --progress https://github.com/taljmars/StandaloneDroneGCS +refs/heads/*:refs/remotes/origin/* --depth=19

echo --------------- Windows 64 --------------
del Windows64\*.zip
echo f | xcopy /f /y ..\DroneGCS\ClientInstallation\Windows\Console-*-win-x64.zip Windows64\Console-1.%arg1%-win-x64.zip
echo f | xcopy /f /y ..\DroneServer\ServerInstallation\Windows64\ServerCore-*-win-x64.zip Windows64\ServerCore-1.%arg1%-win-x64.zip

C:\Users\taljmars\Workspace\

echo --------------- Linux --------------


echo --------------- Pushing --------------

@ECHO Build-%arg1% > version

git status
git add *
git commit -m "Building standalone package for Build-%arg1%"
git status

@ECHO Done