#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection163/selection163.exp"
if [ -f $FPATH ]; then
	python experiment.py selection163 exps_set2/selection163
fi