@echo off
set /p str=commit 메시지 입력 : 

git add .
git commit -m "%str%"
git push -u origin kka

pause