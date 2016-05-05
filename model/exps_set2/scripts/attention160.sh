#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention160/attention160.exp"
if [ -f $FPATH ]; then
	python experiment.py attention160 exps_set2/attention160
fi