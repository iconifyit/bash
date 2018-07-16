find ~/Library/Logs/ -name "*.log" -type f -mtime +1 -exec rm -f {} \;


* * * * 7 cd ~/github/iconify/bash/ ./log-garbage-collect.sh