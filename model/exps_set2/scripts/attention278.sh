#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention278/attention278.exp"
if [ -f $FPATH ]; then
	python experiment.py attention278 exps_set2/attention278
fi