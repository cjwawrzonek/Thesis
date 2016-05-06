#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection46/selection46.exp"
if [ -f $FPATH ]; then
	python experiment.py selection46 exps_set4/selection46
fi