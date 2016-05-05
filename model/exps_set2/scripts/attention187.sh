#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention187/attention187.exp"
if [ -f $FPATH ]; then
	python experiment.py attention187 exps_set2/attention187
fi