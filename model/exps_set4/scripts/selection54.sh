#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection54/selection54.exp"
if [ -f $FPATH ]; then
	python experiment.py selection54 exps_set4/selection54
fi