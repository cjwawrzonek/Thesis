#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection298/selection298.exp"
if [ -f $FPATH ]; then
	python experiment.py selection298 exps_set2/selection298
fi