#!/usr/bin/python3
import sys
import re

if __name__=='__main__':
    argument = sys.argv

    if len(argument) != 3:
        sys.exit("인자 개수가 틀립니다.")

wordlist = []
f = open(argument[1], 'r')

x = f.readlines()

for i in x:
    testlist = (re.split(r'[\W]', i))
    for j in testlist:
        wordlist.append(j)

print(wordlist)

f.close()
