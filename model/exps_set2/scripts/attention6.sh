#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention6/attention6.exp"
if [ -f $FPATH ]; then
	python experiment.py attention6 exps_set2/attention6
fi