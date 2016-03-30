#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined298/combined298.exp"
if [ -f $FPATH ]; then
	python experiment.py combined298 exps_set2/combined298
fi