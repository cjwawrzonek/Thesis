#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention60/attention60.exp"
if [ -f $FPATH ]; then
	python experiment.py attention60 exps_set4/attention60
fi