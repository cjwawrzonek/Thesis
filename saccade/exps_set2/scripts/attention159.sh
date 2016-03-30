#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention159/attention159.exp"
if [ -f $FPATH ]; then
	python experiment.py attention159 exps_set2/attention159
fi