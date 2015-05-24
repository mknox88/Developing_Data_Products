---
title: "Stopping Distance Prediction"
author: "Mark Knox"
date: "May 22, 2015"
output: html_document
---

## Stopping Distance Prediction

### Overview
This application uses a linear model based on the '*cars*' data set included with RStudio to predict stopping distance based on speed of car at time of braking.

### Instructions
1. Select Speed of Car (mph) using slider control on the '**Main**' tab
2. Click '**Predict**' button
3. Predicted Stopping Distance (ft) will be shown

### Data
The '*cars*' data set included in RStudio consists of 50 observations of speed of cars and the distances taken to stop.  The data were recorded in the 1920s.

### Prediction Algorithm
The prediciton algorithm uses a linear model fit of the '*cars*' data set to predict the stopping distance for the input speed.
