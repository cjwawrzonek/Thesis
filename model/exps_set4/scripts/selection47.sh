#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection47/selection47.exp"
if [ -f $FPATH ]; then
	python experiment.py selection47 exps_set4/selection47
fi