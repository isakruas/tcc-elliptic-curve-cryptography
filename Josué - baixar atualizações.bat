git checkout mjad

git reset --hard

del /f /s /q ".git/rebase-merge" 1>nul

rmdir /s /q ".git/rebase-merge"

git pull --rebase origin master

pause
