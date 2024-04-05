#!/bin/sh

#---------------------------------------------
# FUNCTIONS
#---------------------------------------------

enter_dir_func() {
	SDIR=
	CDIR=`pwd`
	echo ""
	echo -n "Enter directory to search [$CDIR]: "
	read SDIR
	if [ ! -n "$SDIR" ]
	then
		SDIR=$CDIR
	else
		if [ ! -d $SDIR ]
		then
			echo "Directory $SDIR does not exist!"
			echo 1
		fi
	fi
}

#---------------------------------------------

enter_find_string_func() {
	FINDSTR=
	echo -n "Enter search string: "
	read FINDSTR
	if [ ! -n "$FINDSTR" ]
	then
		echo "Search string cannot be null!"
		exit 1
	fi
}

#---------------------------------------------

enter_replace_string_func() {
	REPLSTR=
	echo -n "Enter replace string: "
	read REPLSTR
}

#---------------------------------------------

enter_filename_string_func() {
	FILESTR=
	echo -n "Enter filename string: "
	read FILESTR
}

#---------------------------------------------

search_replace_func() {
	echo "Performing find-and-replace..."
	DATE=`date +'%Y%m%d%H%M%S'`
	find $SDIR -type f -name "*${FILESTR}*" | while read FILENAME
	do
		if [ `file "$FILENAME" | awk '{print $NF}'` == "text" ]
		then
			if [ `grep -c "$FINDSTR" "$FILENAME"` -gt 0 ]
			then
				echo "-----------------------------------------------"
				echo "Replacing in $FILENAME"
				cp -p "$FILENAME" "${FILENAME}_${DATE}_BACKUP"
				gzip "${FILENAME}_${DATE}_BACKUP"
				sed "s+${FINDSTR}+${REPLSTR}+g" "$FILENAME" > "${FILENAME}_${DATE}"
				mv -f "${FILENAME}_${DATE}" "$FILENAME"
				echo "Backup file saved as ${FILENAME}_${DATE}.gz"
			fi
		fi
	done
}

#---------------------------------------------

confirm_func() {
	clear
	RESP=
	echo "Will search $SDIR for filenames mathing '*${FILESTR}*' pattern."
	echo "And will replace all occurences of '${FINDSTR}' with '${REPLSTR}'."
	echo -n "Do you wish to continue? (y/n): "
	read RESP
	case $RESP in
		[yY] | [yY][eE][sS] )	search_replace_func ;;
		* )			exit 0
	esac
}

#---------------------------------------------
# RUNTIME
#---------------------------------------------

enter_dir_func
enter_filename_string_func
enter_find_string_func
enter_replace_string_func
confirm_func
