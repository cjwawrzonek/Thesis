#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined27/combined27.exp"
if [ -f $FPATH ]; then
	python experiment.py combined27 exps_set2/combined27
fi