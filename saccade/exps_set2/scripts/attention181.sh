#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention181/attention181.exp"
if [ -f $FPATH ]; then
	python experiment.py attention181 exps_set2/attention181
fi