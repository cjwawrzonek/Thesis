#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention75/attention75.exp"
if [ -f $FPATH ]; then
	python experiment.py attention75 exps_set4/attention75
fi