#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention2/attention2.exp"
if [ -f $FPATH ]; then
	python experiment.py attention2 exps_set4/attention2
fi