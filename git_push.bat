@echo off

set /p str1=branch 선택 : 
set /p str2=commit 메시지 입력 : 

git checkout %str1%
git add .
git commit -m "%str2%"
git push -u origin %str1%

pause
