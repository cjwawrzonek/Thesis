#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection189/selection189.exp"
if [ -f $FPATH ]; then
	python experiment.py selection189 exps_set2/selection189
fi