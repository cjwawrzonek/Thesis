#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection10/selection10.exp"
if [ -f $FPATH ]; then
	python experiment.py selection10 exps_set2/selection10
fi