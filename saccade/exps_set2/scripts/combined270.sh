#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined270/combined270.exp"
if [ -f $FPATH ]; then
	python experiment.py combined270 exps_set2/combined270
fi