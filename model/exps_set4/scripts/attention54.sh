#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention54/attention54.exp"
if [ -f $FPATH ]; then
	python experiment.py attention54 exps_set4/attention54
fi