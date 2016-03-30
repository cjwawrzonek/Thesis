#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined294/combined294.exp"
if [ -f $FPATH ]; then
	python experiment.py combined294 exps_set2/combined294
fi