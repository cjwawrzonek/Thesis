#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection266/selection266.exp"
if [ -f $FPATH ]; then
	python experiment.py selection266 exps_set2/selection266
fi