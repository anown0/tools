#!/bin/bash

USERNAME=mwagner
SSH_HOSTNAME=noether

MOVIES=/Users/mwagner/Movies/jellyfin_movies
MUSIC=/Users/mwagner/Music/jellyfin_music
DRIVE=/Users/mwagner/Movies/noether_drive
SHORTS=/Users/mwagner/Movies/jellyfin_shorts


sshfs ${USERNAME}@${SSH_HOSTNAME}:/srv/media ${MOVIES}
sshfs ${USERNAME}@${SSH_HOSTNAME}:/srv/Music ${MUSIC}
sshfs ${USERNAME}@${SSH_HOSTNAME}:/mnt ${DRIVE}
sshfs ${USERNAME}@${SSH_HOSTNAME}:/srv/Shorts ${SHORTS}
