#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention164/attention164.exp"
if [ -f $FPATH ]; then
	python experiment.py attention164 exps_set2/attention164
fi