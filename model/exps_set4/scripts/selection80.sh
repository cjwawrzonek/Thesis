#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection80/selection80.exp"
if [ -f $FPATH ]; then
	python experiment.py selection80 exps_set4/selection80
fi