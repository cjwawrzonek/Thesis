#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention247/attention247.exp"
if [ -f $FPATH ]; then
	python experiment.py attention247 exps_set2/attention247
fi