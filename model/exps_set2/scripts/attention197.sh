#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention197/attention197.exp"
if [ -f $FPATH ]; then
	python experiment.py attention197 exps_set2/attention197
fi