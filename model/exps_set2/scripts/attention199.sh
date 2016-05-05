#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention199/attention199.exp"
if [ -f $FPATH ]; then
	python experiment.py attention199 exps_set2/attention199
fi