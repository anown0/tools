#!/usr/bin/bash
# THis 

#yt-dlp https://www.youtube.com/watch?v=40sOivjw2ec
##yt-dlp https://www.youtube.com/watch?v=dy8ESKLjASc
ffmpeg -fflags +genpts -i 'epic_warmup.webm' -r 24 EpicHeat-warmup.mp4
