#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection22/selection22.exp"
if [ -f $FPATH ]; then
	python experiment.py selection22 exps_set3/selection22
fi