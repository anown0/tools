#!/opt/local/bin/python2.7 -tt

import sys
import string 

og = float(sys.argv[1])
fg = float(sys.argv[2])
co2 = 1.05  #[g] represents the amount of CO2 produced for every gram of ethanol produced
den_alc = 0.79 #[g/mL] density of ethanol


def main():
  ''' calculate abv as seen here: http://www.brewmorebeer.com/calculate-percent-alcohol-in-beer/ '''
  abv = (( co2 * (og - fg))/fg)/den_alc * 100.
  print "ABV is "+str(abv)+"%"
  return
#  print "ABV is " ,str(abv)

if __name__ == "__main__":
  main()

