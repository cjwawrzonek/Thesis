#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
rm trial_11x11_rand_trial/TrainingSet.txt.results
for(( i = 0; i < 100; i++ )); 
do python model.py trial_11x11_rand_trial;
done
