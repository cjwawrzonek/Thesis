#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention258/attention258.exp"
if [ -f $FPATH ]; then
	python experiment.py attention258 exps_set2/attention258
fi