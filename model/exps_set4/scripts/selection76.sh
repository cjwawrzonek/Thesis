#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/selection76/selection76.exp"
if [ -f $FPATH ]; then
	python experiment.py selection76 exps_set4/selection76
fi