#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention271/attention271.exp"
if [ -f $FPATH ]; then
	python experiment.py attention271 exps_set2/attention271
fi