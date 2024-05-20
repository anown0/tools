#!/bin/bash

set -eu

NUMBER=$1
TEXT=$2

curl -X POST https://textbelt.com/text \
       --data-urlencode phone='4158237050' \
       --data-urlencode message='$TEXT' \
       -d key=textbelt

