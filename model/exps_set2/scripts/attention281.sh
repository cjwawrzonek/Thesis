#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention281/attention281.exp"
if [ -f $FPATH ]; then
	python experiment.py attention281 exps_set2/attention281
fi