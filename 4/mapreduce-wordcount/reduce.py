#!/usr/bin/env python3
"""reduce.py"""

import sys

# Mapping
prev_word = None
prev_count = 0

for line in sys.stdin:
    line = line.strip()
    token, word, count = line.split(',')

    count = int(count)

    if prev_word == word:
        prev_count += count
    else:
        if prev_word:
            print(f"{token},{prev_word},{prev_count}")
        
        prev_count = count
        prev_word = word

# Printing the last word
if prev_word == word:
    print(f"{token},{prev_word},{prev_count}")