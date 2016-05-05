#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention298/attention298.exp"
if [ -f $FPATH ]; then
	python experiment.py attention298 exps_set2/attention298
fi