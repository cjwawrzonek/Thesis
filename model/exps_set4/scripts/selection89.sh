#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection89/selection89.exp"
if [ -f $FPATH ]; then
	python experiment.py selection89 exps_set4/selection89
fi