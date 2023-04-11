@echo off

:: 获取当前脚本的路径
cd /d %~dp0
:: 自动提交

git add . 
git commit -m "%date:~0,10%,%time:~0,8%" 
::  git commit -m "%commitMessage%" 
git push origin master
@echo down,

SET daoTime=60
:dao
set /a daoTime=daoTime-1
ping -n 2 -w 500 127.1>nul
cls
echo update git is down, out in  %daoTime% s
if %daoTime%==0 (exit) else (goto dao)



