#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection193/selection193.exp"
if [ -f $FPATH ]; then
	python experiment.py selection193 exps_set2/selection193
fi