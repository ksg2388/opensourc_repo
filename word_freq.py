#!/usr/bin/python3
import sys
import re
from collections import Counter

if __name__=='__main__':
    argument = sys.argv

    if len(argument) != 3:
        sys.exit("인자 개수가 틀립니다.")

filename = argument[1]
n = int(argument[2])
wordlist = []
f = open(filename, 'r')

x = f.readlines()

for i in x:
    testlist = (re.split(r'[\W]', i))
    for j in testlist:
        wordlist.append(j)

for i in wordlist:
    if i == '':
        wordlist.remove('')

worddic = Counter(wordlist)

for i in range(n):
    print(worddic.most_common(n))

f.close()
