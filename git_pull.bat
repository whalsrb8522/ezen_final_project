@echo off

set /p str1=branch ���� : 

git remote update
git pull origin %str1%

pause
