@echo off

set /p str1=branch ���� : 

git checkout %str1%
git pull origin %str1%

pause
