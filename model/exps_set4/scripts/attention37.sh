#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention37/attention37.exp"
if [ -f $FPATH ]; then
	python experiment.py attention37 exps_set4/attention37
fi