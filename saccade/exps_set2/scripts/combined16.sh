#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined16/combined16.exp"
if [ -f $FPATH ]; then
	python experiment.py combined16 exps_set2/combined16
fi