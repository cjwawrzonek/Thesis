#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention250/attention250.exp"
if [ -f $FPATH ]; then
	python experiment.py attention250 exps_set2/attention250
fi