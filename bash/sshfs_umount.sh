#!/bin/bash

USERNAME=mwagner
SSH_HOSTNAME=noether

MOVIES=/Users/mwagner/Movies/jellyfin_movies
MUSIC=/Users/mwagner/Music/jellyfin_music
DRIVE=/Users/mwagner/Movies/noether_drive
SHORTS=/Users/mwagner/Movies/jellyfin_shorts

umount ${MOVIES}
umount ${MUSIC}
umount ${DRIVE}
umount ${SHORTS}
