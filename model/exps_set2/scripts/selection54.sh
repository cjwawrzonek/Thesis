#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection54/selection54.exp"
if [ -f $FPATH ]; then
	python experiment.py selection54 exps_set2/selection54
fi