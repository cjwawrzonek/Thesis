#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection68/selection68.exp"
if [ -f $FPATH ]; then
	python experiment.py selection68 exps_set3/selection68
fi