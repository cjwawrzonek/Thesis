#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined280/combined280.exp"
if [ -f $FPATH ]; then
	python experiment.py combined280 exps_set2/combined280
fi