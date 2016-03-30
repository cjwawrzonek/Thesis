#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention87/attention87.exp"
if [ -f $FPATH ]; then
	python experiment.py attention87 exps_set2/attention87
fi