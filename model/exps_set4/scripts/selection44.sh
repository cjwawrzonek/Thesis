#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection44/selection44.exp"
if [ -f $FPATH ]; then
	python experiment.py selection44 exps_set4/selection44
fi