#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection181/selection181.exp"
if [ -f $FPATH ]; then
	python experiment.py selection181 exps_set2/selection181
fi