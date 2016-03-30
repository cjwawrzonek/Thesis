#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection215/selection215.exp"
if [ -f $FPATH ]; then
	python experiment.py selection215 exps_set2/selection215
fi