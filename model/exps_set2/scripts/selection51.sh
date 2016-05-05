#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection51/selection51.exp"
if [ -f $FPATH ]; then
	python experiment.py selection51 exps_set2/selection51
fi