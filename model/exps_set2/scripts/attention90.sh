#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention90/attention90.exp"
if [ -f $FPATH ]; then
	python experiment.py attention90 exps_set2/attention90
fi