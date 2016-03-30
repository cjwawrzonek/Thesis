#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention147/attention147.exp"
if [ -f $FPATH ]; then
	python experiment.py attention147 exps_set2/attention147
fi