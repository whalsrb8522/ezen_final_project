@echo off

set /p str1=branch ���� : 
set /p str2=commit �޽��� �Է� : 

git checkout %str1%
<<<<<<< HEAD
git add *
=======
git add .
>>>>>>> master
git commit -m "%str2%"
git push -u origin %str1%

pause
