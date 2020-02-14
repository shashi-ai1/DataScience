# -*- coding: utf-8 -*-
"""
Created on Tue Apr 16 01:15:57 2019

@author: Ambika
"""

# Word tokenization
import nltk
nltk.download('punkt')
from nltk.tokenize import word_tokenize
my_text = "Hi Mr. Smith! I’m going to buy some vegetables (tomatoes and cucumbers) from the store. Should I pick up some black-eyed peas as well?"
print(word_tokenize(my_text))
 
#Sentence Tokeniation
from nltk.tokenize import sent_tokenize
my_text = "Hi Mr. Smith! I’m going to buy some vegetables (tomatoes and cucumbers) from the store. Should I pick up some black-eyed peas as well?"
print(sent_tokenize(my_text))

#Tokenization - Ngrams
from nltk.util import ngrams
my_words = word_tokenize(my_text) # This is the list of all words
twograms = list(ngrams(my_words,2)) # This is for two-word combos, but can pick any n
print(twograms)

#Tokenization - Regex
from nltk.tokenize import RegexpTokenizer
my_text = "Hi Mr. Smith! I’m going to buy some vegetables (tomatoes" / " and cucumbers) from the store. Should I pick up some black-eyed " /  " peas as well?"
whitespace_tokenizer = RegexpTokenizer("\s+", gaps=True)
print(whitespace_tokenizer.tokenize(my_text))

# Tokenization - Regex - Only Capitalized words
from nltk.tokenize import RegexpTokenizer
# RegexpTokenizer to match only capitalized words
cap_tokenizer = RegexpTokenizer("[A-Z]['\w]+")
print(cap_tokenizer.tokenize(my_text))