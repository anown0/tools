#!/usr/bin/env python3

from pathlib import Path
import hashlib

# find files that are duplicates and list them

# Create a hash table of filename, filesize in bytes, md5sum
# Sort the table by md5sum

fs = Path(r'/Users/mwagner/Pictures').rglob('*')

num = 0

def file_size(filename):

	return filesize

def file_md5(filename):
	with open(filename, 'rb') as f:
		# read contents of the file
		data = f.read()
		md5 = hashlib.md5(data).hexdigest()
	return md5

filename_md5_list = []

def list_files():
	# need to tell python to look for the variable in the global scope	
	# but generally it's not good practice to use global variables
	global num
	global filename_md5_list

	for f in fs:
		num = num + 1
		if not Path(f).is_dir():
			md5 = file_md5(f)
			filename_md5_list.append((f,md5))
	the_list = sorted(filename_md5_list)
	print(the_list)	
	print(num)

if __name__ == "__main__":
    list_files()

