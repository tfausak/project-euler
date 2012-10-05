#!/usr/bin/env python
# http://projecteuler.net/problem=13
from operator import add
import sys

print str(reduce(add, map(int, open(sys.argv[1]).readlines())))[:10]
