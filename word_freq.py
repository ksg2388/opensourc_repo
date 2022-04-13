#!/usr/bin/python3
import sys
if __name__=='__main__':
    argument = sys.argv

    if len(argument) == 3:
        print(argument[1], argument[2])
    else:
        sys.exit("인자 개수가 틀립니다.")

f = open(argument[1], 'r')
