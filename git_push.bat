@echo off
set /p str=commit �޽��� �Է� : 

git add .
git commit -m "%str%"
git push -u origin kka

pause