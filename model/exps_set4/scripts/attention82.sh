#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention82/attention82.exp"
if [ -f $FPATH ]; then
	python experiment.py attention82 exps_set4/attention82
fi