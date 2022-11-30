#!/usr/bin/env python3
"""map.py"""

import sys
from nltk.stem.snowball import SnowballStemmer
from nltk.stem import WordNetLemmatizer
import re

# Setting up stemmer and lemmatizer
stemmer = SnowballStemmer("english")
lemmatizer = WordNetLemmatizer()

# Mapping
output = []
# Skipping the header
lines = iter(sys.stdin)
next(lines)

for line in lines:
    fields = line.split(",")
    text = re.sub(r'[\W]', ' ', fields[2])
    words = text.split(" ")
    words = list(filter(lambda a: a != '', words))

    for word in words:
        print(f'S,{stemmer.stem(word)},1')
        print(f'L,{lemmatizer.lemmatize(word)},1') # TODO: Not working
# print("rocks :", lemmatizer.lemmatize("rocks"))