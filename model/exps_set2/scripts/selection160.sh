#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection160/selection160.exp"
if [ -f $FPATH ]; then
	python experiment.py selection160 exps_set2/selection160
fi