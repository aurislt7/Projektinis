#!/usr/bin/env python
# coding: utf-8

# In[1]:


import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.callbacks import TensorBoard
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import cv2
import time
import pickle


# In[2]:


dense_layers = [1]
layer_sizes = [128]
conv_layers = [3]

class_names = [ 'Lapuociai/Vasara', 'Lapuociai/Ruduo', 'Lapuociai/Ziema', 'Lapuociai/Pavasaris', 'Spygliuociai/Vasara', 'Spygliuociai/Ruduo',
               'Spygliuociai/Ziema', 'Spygliuociai/Pavasaris']
dir = 'C:/Users/auris/Desktop/Informatics/7_semestras/Projektinis/Generated_Forests'


# In[3]:


pickle_in = open("X_train.pickle", "rb")
X_train = pickle.load(pickle_in)

pickle_in = open("Y_train.pickle", "rb")
y_train = pickle.load(pickle_in)

pickle_in = open("X_test.pickle", "rb")
X_test = pickle.load(pickle_in)

pickle_in = open("Y_test.pickle", "rb")
y_test = pickle.load(pickle_in)

for i in range(0,8):
    print(y_train.count(i))
    
for i in range(0,8):
    print(y_test.count(i))


# In[4]:


plt.figure(figsize=(80,60))
for i in range(25):
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(X_train[i])
    plt.xlabel(class_names[y_train[i]])
plt.show()

X_train, X_test = X_train / 255.0, X_test / 255.0


# In[5]:


def prepare(filepath):
  imgArray = cv2.imread(filepath)
  newArray = cv2.resize(imgArray, (80, 60))
  plt.imshow(newArray)
  return newArray.reshape(-1, 60, 80, 3)

overall = 0;

sizes = [(1,1), (3,3), (5,5), (7,7), (9,9)]
layers = [128]


#     for dense_layer in dense_layers:
# for layer_size in layers:
#     for size1 in sizes:
#         for size2 in sizes:
#             for size3 in sizes:
NAME = "test"
tensorboard = TensorBoard(log_dir='logs/{}'.format(NAME))

model = keras.models.Sequential()        

model.add(keras.layers.Conv2D(128, (1,1), activation='relu', input_shape=(60, 80, 3)))
model.add(keras.layers.MaxPooling2D((2, 2)))

#                 for l in range(conv_layer-1):
#                     model.add(keras.layers.Conv2D(layer_size, (3, 3), activation='relu'))
#                     model.add(keras.layers.MaxPooling2D((2, 2)))

model.add(keras.layers.Conv2D(128, (3,3), activation='relu'))
model.add(keras.layers.MaxPooling2D((2, 2)))

model.add(keras.layers.Conv2D(128, (1,1), activation='relu'))
model.add(keras.layers.MaxPooling2D((2, 2)))

model.add(keras.layers.Flatten())

model.add(keras.layers.Dense(128, activation='relu'))

model.add(keras.layers.Dense(8, activation ='softmax'))

model.compile(loss = keras.losses.SparseCategoricalCrossentropy(from_logits=True),
optimizer = "adam",
metrics = ["accuracy"])

X_train = np.array(X_train)
y_train = np.array(y_train)
X_test = np.array(X_test)
y_test = np.array(y_test)

history = model.fit(np.concatenate([X_train, X_test]),
                    np.concatenate([y_train, y_test]),
                    batch_size = 16,
                    epochs = 10,
                    validation_split = 0.3,
                    callbacks = [tensorboard])


# In[6]:


pd.DataFrame(history.history).plot(figsize = (16, 10))
plt.grid(True)
plt.gca().set_ylim(0, 1)
plt.show()


# In[11]:


model.save('The_One_And_Only')


# In[8]:


# model = tf.keras.models.load_model('my_model')


# In[10]:


all_missedSeason = 0;
all_missedForest = 0;
all_missedAll = 0;
all_correct = 0;

targetDir = os.path.join(dir, "Target")
resArr = []
for category in class_names:
    class_num = class_names.index(category)
    path = os.path.join(targetDir, category)
    splitCategory = category.split('/')
    missedSeason = 0
    missedForest = 0
    missedAll = 0
    correct = 0
    for img in os.listdir(path):
        prediction = class_names[tf.argmax(model.predict([prepare(os.path.join(path, img))]), 1)[0]]
        print(category + " - " + img + " - " + prediction)
        splitPrediction = prediction.split('/')
        if(splitCategory[0] != splitPrediction[0] and splitCategory[1] != splitPrediction[1]):
            all_missedAll+=1
            missedAll+=1
        elif(splitCategory[0] != splitPrediction[0]):
            all_missedForest+=1
            missedForest +=1
        elif(splitCategory[1] != splitPrediction[1]):
            all_missedSeason+=1
            missedSeason +=1
        else:
            all_correct+=1
            correct+=1
#     print(category)
    imgCount = missedForest + missedSeason + missedAll + correct
    result = ["{:.2f}".format(missedForest/imgCount * 100) + '(' + str(missedForest) + '/' + str(imgCount) + ')',
              "{:.2f}".format(missedSeason/imgCount * 100) + '(' + str(missedSeason) + '/' + str(imgCount) + ')',
              "{:.2f}".format(missedAll/imgCount * 100) + '(' + str(missedAll) + '/' + str(imgCount) + ')',
              "{:.2f}".format(correct/imgCount * 100) + '(' + str(correct) + '/' + str(imgCount) + ')']
    resArr.append(result)

df = pd.DataFrame(np.array(resArr), columns=['Missed Forest %', 'Missed Season %', 'Missed All %', 'Correct %'], index = class_names)
print(df)
print("------------------------")
all_imgCount = all_missedForest + all_missedSeason + all_missedAll + all_correct
df = pd.DataFrame(np.array([["{:.2f}".format(all_missedForest/all_imgCount * 100) + '(' + str(all_missedForest) + '/' + str(all_imgCount) + ')',
                            "{:.2f}".format(all_missedSeason/all_imgCount * 100) + '(' + str(all_missedSeason) + '/' + str(all_imgCount) + ')',
                            "{:.2f}".format(all_missedAll/all_imgCount * 100) + '(' + str(all_missedAll) + '/' + str(all_imgCount) + ')',
                            "{:.2f}".format(all_correct/all_imgCount * 100) + '(' + str(all_correct) + '/' + str(all_imgCount) + ')',
                            "{:.2f}".format(((all_correct+all_missedForest*0.5+all_missedSeason*0.5)/all_imgCount) * 100) + '(' + str(all_correct+all_missedForest*0.5+all_missedSeason*0.5) + '/' + str(all_imgCount) + ')']]),
                   columns=['Missed Forest %', 'Missed Season %', 'Missed All %', 'Correct %', 'overallCorrect %'], index = ["Overall"])
print(df)
overall = all_correct/all_imgCount*100


# In[ ]:




