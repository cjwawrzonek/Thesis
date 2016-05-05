#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/attention299/attention299.exp"
if [ -f $FPATH ]; then
	python experiment.py attention299 exps_set2/attention299
fi