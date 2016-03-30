#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention255/attention255.exp"
if [ -f $FPATH ]; then
	python experiment.py attention255 exps_set2/attention255
fi