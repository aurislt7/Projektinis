#!/usr/bin/env python
# coding: utf-8

# In[1]:


import tensorflow as tf
from tensorflow import keras
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import cv2

print(len(tf.config.experimental.list_physical_devices("GPU")))


# In[2]:


class_names = [ 'Lapuociai/Vasara', 'Lapuociai/Ruduo', 'Lapuociai/Ziema', 'Lapuociai/Pavasaris', 'Spygliuociai/Vasara', 'Spygliuociai/Ruduo',
               'Spygliuociai/Ziema', 'Spygliuociai/Pavasaris']
dir = 'C:/Users/auris/Desktop/Informatics/7_semestras/Projektinis/Generated_Forests'


# In[3]:


training_data = []

def create_training_data():
  for category in class_names:
    print(category)
    class_num = class_names.index(category)
    path = os.path.join(dir, category)
    for img in os.listdir(path):
      print(img)
      imgArray = cv2.imread(os.path.join(path, img))
      # finalArray = cv2.resize(imgArray, (80, 60))
      training_data.append([imgArray, class_num])

create_training_data()

print(len(training_data))


# In[4]:


testing_data = []
testDir = os.path.join(dir, "Test")

def create_testing_data():
  for category in class_names:
    print(category)
    class_num = class_names.index(category)
    path = os.path.join(testDir, category)
    for img in os.listdir(path):
      print(img)
      imgArray = cv2.imread(os.path.join(path, img))
      # finalArray = cv2.resize(imgArray, (80, 60))
      testing_data.append([imgArray, class_num])

create_testing_data()

print(len(testing_data))


# In[5]:


import random

random.shuffle(training_data)
random.shuffle(testing_data)


# In[6]:


X_train = []
y_train = []

for imgs, label in training_data:
  X_train.append(imgs)
  y_train.append(label)

X_train = np.array(X_train).reshape(-1, 60, 80, 3)

X_test = []
y_test = []

for imgs, label in testing_data:
  X_test.append(imgs)
  y_test.append(label)

X_test = np.array(X_test).reshape(-1, 60, 80, 3)


# In[7]:


import pickle

pickle_out = open("X_train.pickle", "wb")
pickle.dump(X_train, pickle_out)
pickle_out.close()

pickle_out = open("Y_train.pickle", "wb")
pickle.dump(y_train, pickle_out)
pickle_out.close()

pickle_out = open("X_test.pickle", "wb")
pickle.dump(X_test, pickle_out)
pickle_out.close()

pickle_out = open("Y_test.pickle", "wb")
pickle.dump(y_test, pickle_out)
pickle_out.close()

