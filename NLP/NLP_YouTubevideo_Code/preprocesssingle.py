# -*- coding: utf-8 -*-
"""
Created on Wed Apr 24 23:59:05 2019

@author: Ambika
"""
# Preprocessing
# remove Punctuation
import re # Regular expression library
import string
my_text = "Hi Mr. Smith! I’m going to buy some vegetables (tomatoes and cucumbers) from the store. Should I pick up some black-eyed peas as well?"
# Replace punctuations with a white space
clean_text = re.sub('[%s]' % re.escape(string.punctuation), ' ', my_text)
clean_text
# Text lower
clean_text = clean_text.lower()
clean_text
#Remove numbers
# Removes all words containing digits
clean_text = re.sub('\w*\d\w*', ' ', clean_text)
clean_text

#To show the stop words
from nltk.corpus import stopwords
set(stopwords.words('english'))

#Removal of Stop words and ventorization
from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd
my_text = ["Hi Mr. Smith! I’m going to buy some vegetables some(tomatoes and some cucumbers) from the store cucumbers. Should I pick up cucumbers, some black-eyed peas as well?"]
# Incorporate stop words when creating the count vectorizer
cv = CountVectorizer(stop_words='english')
X = cv.fit_transform(my_text) # fit_transform to transform the vocabulary in tovectors
pd.DataFrame(X.toarray(), columns=cv.get_feature_names())

#Stemming
from nltk.stem import LancasterStemmer
stemmer = LancasterStemmer()
# Try some stems
print('drive: {}'.format(stemmer.stem('drive')))
print('drives: {}'.format(stemmer.stem('drives')))
print('driver: {}'.format(stemmer.stem('driver')))
print('driven: {}'.format(stemmer.stem('driven')))

from nltk.stem import PorterStemmer
stemmer = PorterStemmer()
# Try some stems
print('drive: {}'.format(stemmer.stem('drive')))
print('drives: {}'.format(stemmer.stem('drives')))
print('driver: {}'.format(stemmer.stem('driver')))
print('driven: {}'.format(stemmer.stem('driven')))

#POS Tagging
from nltk.tokenize import word_tokenize
from nltk.tag import pos_tag
my_text = "James Smith lives in the United States."
tokens = pos_tag(word_tokenize(my_text))
print(tokens)

#Named entity Recognition
from nltk.chunk import ne_chunk
my_text = "James Smith lives in the United States."
tokens = pos_tag(word_tokenize(my_text)) # this labels each word as a part of speech
entities = ne_chunk(tokens) # this extracts entities from the list of words
entities.draw()

# Compound term extraction
from nltk.tokenize import MWETokenizer # multi-word expression
my_text = "You all are the greatest students of all time."
mwe_tokenizer = MWETokenizer([('You','all'), ('of', 'all', 'time')])
mwe_tokens = mwe_tokenizer.tokenize(word_tokenize(my_text))
mwe_tokens

