#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention270/attention270.exp"
if [ -f $FPATH ]; then
	python experiment.py attention270 exps_set2/attention270
fi