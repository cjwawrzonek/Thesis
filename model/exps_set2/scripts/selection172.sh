#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection172/selection172.exp"
if [ -f $FPATH ]; then
	python experiment.py selection172 exps_set2/selection172
fi