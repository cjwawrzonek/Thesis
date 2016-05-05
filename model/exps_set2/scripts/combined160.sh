#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined160/combined160.exp"
if [ -f $FPATH ]; then
	python experiment.py combined160 exps_set2/combined160
fi