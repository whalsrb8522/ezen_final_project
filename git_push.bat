@echo off
<<<<<<< HEAD
set /p str1=branch ���� : 
set /p str2=commit �޽��� �Է� : 

git add .
git commit -m "%str2%"
git push -u origin %str1%

pause
