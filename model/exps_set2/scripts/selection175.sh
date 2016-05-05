#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection175/selection175.exp"
if [ -f $FPATH ]; then
	python experiment.py selection175 exps_set2/selection175
fi