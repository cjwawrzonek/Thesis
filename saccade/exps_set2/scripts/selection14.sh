#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection14/selection14.exp"
if [ -f $FPATH ]; then
	python experiment.py selection14 exps_set2/selection14
fi