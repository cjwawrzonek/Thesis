#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection20/selection20.exp"
if [ -f $FPATH ]; then
	python experiment.py selection20 exps_set2/selection20
fi