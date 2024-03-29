!#/bin/bash

set -eu

# Sets the album artists
DIR=.

ARTIST=$1

# Need a check here to make sure I'm only editing MP3 files
find ${DIR} -type f -print0 | xargs -0 id3v2 -a ${ARTIST}
