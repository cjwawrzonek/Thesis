#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention149/attention149.exp"
if [ -f $FPATH ]; then
	python experiment.py attention149 exps_set2/attention149
fi