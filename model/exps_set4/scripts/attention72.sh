#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention72/attention72.exp"
if [ -f $FPATH ]; then
	python experiment.py attention72 exps_set4/attention72
fi