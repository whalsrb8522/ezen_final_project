@echo off

set /p str1=branch 선택 : 

git remote update
git pull origin %str1%

pause
