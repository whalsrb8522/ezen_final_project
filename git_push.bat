@echo off


set /p str1=branch ¼±ÅÃ : 
set /p str2=commit ¸Þ½ÃÁö ÀÔ·Â : 

git checkout %str1%
git add *
git commit -m "%str2%"
git push -u origin %str1%

pause
