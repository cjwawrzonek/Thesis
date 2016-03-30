#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection239/selection239.exp"
if [ -f $FPATH ]; then
	python experiment.py selection239 exps_set2/selection239
fi