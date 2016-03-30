#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention297/attention297.exp"
if [ -f $FPATH ]; then
	python experiment.py attention297 exps_set2/attention297
fi