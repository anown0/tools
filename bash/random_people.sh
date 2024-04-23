#!/bin/bash

START=$1
END=$2

[[ -z $START ]] && echo "Please enter a start value as the first argument." && exit 1
[[ -z $END ]] && echo "Please enter an end value as the first argument." && exit 1

idx=($(seq $START $END))

for i in ${idx[@]}; do
	id=$i
	first=$(rig | sed -n 1p | awk -F' ' '{print $1}')
	last=$(rig | sed -n 1p | awk -F' ' '{print $2}')
	address=$(rig | sed -n 2p)
	city=$(rig | sed -n 3p | awk -F',' '{print $1}')
	state=$(rig | sed -n 3p | grep -Eo '[A-Z][A-Z]')
	zip=$(rig | sed -n 3p | grep -Eo '[0-9]{5}')
	echo $id,$first,$last,$address,$city,$state,$zip
done
