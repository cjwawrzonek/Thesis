#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention164/attention164.exp"
if [ -f $FPATH ]; then
	python experiment.py attention164 experiments/attention164
fi