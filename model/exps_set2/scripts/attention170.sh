#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention170/attention170.exp"
if [ -f $FPATH ]; then
	python experiment.py attention170 exps_set2/attention170
fi