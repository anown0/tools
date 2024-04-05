!#/usr/bin/bash
#  https://superuser.com/questions/982342/in-ffmpeg-how-to-delay-only-the-audio-of-a-mp4-video-without-converting-the-au
#
#
# delay video by 3.84
ffmpeg -i "movie.mp4" -itsoffset 3.84 -i "movie.mp4" -map 1:v -map 0:a -c copy "movie-video-delayed.mp4"

# delay audio by 3.84
ffmpeg -i "movie.mp4" -itsoffset 3.84 -i "movie.mp4" -map 0:v -map 1:a -c copy "movie-audio-delayed.mp4"

