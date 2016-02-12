#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
rm 24_series_train/TrainingSet.txt.results
for(( i = 0; i < 100; i++ )); 
do python model.py 24_series_train;
done
