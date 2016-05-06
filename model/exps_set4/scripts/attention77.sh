#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention77/attention77.exp"
if [ -f $FPATH ]; then
	python experiment.py attention77 exps_set4/attention77
fi