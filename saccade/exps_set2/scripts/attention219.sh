#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention219/attention219.exp"
if [ -f $FPATH ]; then
	python experiment.py attention219 exps_set2/attention219
fi