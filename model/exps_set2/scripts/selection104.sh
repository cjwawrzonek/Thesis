#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection104/selection104.exp"
if [ -f $FPATH ]; then
	python experiment.py selection104 exps_set2/selection104
fi