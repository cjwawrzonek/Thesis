#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection224/selection224.exp"
if [ -f $FPATH ]; then
	python experiment.py selection224 exps_set2/selection224
fi