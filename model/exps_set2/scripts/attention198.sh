#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention198/attention198.exp"
if [ -f $FPATH ]; then
	python experiment.py attention198 exps_set2/attention198
fi