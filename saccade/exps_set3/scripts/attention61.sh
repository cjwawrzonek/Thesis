#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/attention61/attention61.exp"
if [ -f $FPATH ]; then
	python experiment.py attention61 exps_set3/attention61
fi