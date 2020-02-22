# -*- coding: utf-8 -*-
"""
Created on Thu Apr 25 01:13:44 2019

@author: Ambika
"""

##Similarity Measures

#to install textblob - conda install -c nbsantos textblob
from textblob import TextBlob
blob = TextBlob("I'm graat at speling.")
print(blob.correct()) # print function requires Python 3


# Text format
#vectorization
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
corpus = ['This is the first document.', 'This is the second document.', 'And the third one. One is fun.']
cv = CountVectorizer()
X = cv.fit_transform(corpus)
pd.DataFrame(X.toarray(),columns=cv.get_feature_names())

#Cosine Siilarity

from numpy import dot
from numpy.linalg import norm
cosine = lambda v1, v2: dot(v1, v2) / (norm(v1) * norm(v2))
cosine([1, 1, 1, 0], [1, 1, 0, 1])

#Document Similarity Example(Count Vectorizer, TF-IDF)
# 1. Count Ventorizer 
import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer
corpus = ['The weather is hot under the sun', 'I make my hot chocolate with milk', 'One hot encoding', 'I will have a chai latte with milk', 'There is a hot sale today']
# create the document-term matrix with count vectorizer
cv = CountVectorizer(stop_words="english")
X = cv.fit_transform(corpus).toarray()
dt = pd.DataFrame(X, columns=cv.get_feature_names())
dt

from itertools import combinations
from sklearn.metrics.pairwise import cosine_similarity
# list all of the combinations of 5 take 2 as well as the pairs of phrases
pairs = list(combinations(range(len(corpus)),2))
combos = [(corpus[a_index], corpus[b_index]) for (a_index, b_index) in pairs]
# calculate the cosine similarity for all pairs of phrases and sort by most similar
results = [cosine_similarity([X[a_index]], [X[b_index]]) for (a_index, b_index) in
pairs]

results
sorted(zip(results, combos), reverse=True)
#2.TF-IDF
import pandas as pd
corpus = ['This is the first document.', 'This is the second document.', 'And the third one. One is fun.']
# original Count Vectorizer
from sklearn.feature_extraction.text import CountVectorizer
cv = CountVectorizer()
X = cv.fit_transform(corpus).toarray()
pd.DataFrame(X, columns=cv.get_feature_names())
# new TF-IDF Vectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
cv_tfidf = TfidfVectorizer()
X_tfidf = cv_tfidf.fit_transform(corpus).toarray()
pd.DataFrame(X_tfidf, columns=cv_tfidf.get_feature_names())
