#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention36/attention36.exp"
if [ -f $FPATH ]; then
	python experiment.py attention36 exps_set4/attention36
fi