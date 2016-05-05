#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention132/attention132.exp"
if [ -f $FPATH ]; then
	python experiment.py attention132 exps_set2/attention132
fi