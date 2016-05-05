#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention26/attention26.exp"
if [ -f $FPATH ]; then
	python experiment.py attention26 exps_set2/attention26
fi