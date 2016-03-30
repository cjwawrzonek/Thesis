#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention289/attention289.exp"
if [ -f $FPATH ]; then
	python experiment.py attention289 exps_set2/attention289
fi