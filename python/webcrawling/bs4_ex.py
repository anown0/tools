import time
from bs4 import BeautifulSoup
import unicodedata
import urllib2
import codecs
import time
import re
import os
import hashlib


def get_url(url):
	
	response = urllib2.urlopen("http://moore24.org/category/moore-24-class/boats-for-sale/")
	soup = BeautifulSoup(response,'html.parser')
	p_soup = soup.prettify()
	p_soup = unicodedata.normalize('NFKD', p_soup).encode('ascii','ignore')

	
p_soup = ''.join([i for i in p_soup if i.isalpha()])

p_soup = hashlib.md5(p_soup).hexdigest()

f = open('moore24.html','r')
data = f.read()
f.close()

os.remove('moore24.html')

print p_soup
print data
print p_soup == data 

f = open('moore24.html','w')
#f.write(p_soup.encode('utf-8'.strip()))
f.write(p_soup)
f.close()

