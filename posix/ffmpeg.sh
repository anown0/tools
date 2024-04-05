#!/bin/bash

# Convert from .avi to .mkv

INFILE=$1
OUTFILE=$2

ffmpeg -fflags +genpts -i $INFILE -c:v copy -c:a copy $OUTFILE
