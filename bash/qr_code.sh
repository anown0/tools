#!/bin/bash
set -e
URL = $1
qr "$URL" > $1.png
