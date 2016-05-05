#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention291/attention291.exp"
if [ -f $FPATH ]; then
	python experiment.py attention291 exps_set2/attention291
fi