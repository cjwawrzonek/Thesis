#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection106/selection106.exp"
if [ -f $FPATH ]; then
	python experiment.py selection106 exps_set2/selection106
fi