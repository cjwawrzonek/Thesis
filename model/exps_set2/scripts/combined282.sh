#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined282/combined282.exp"
if [ -f $FPATH ]; then
	python experiment.py combined282 exps_set2/combined282
fi