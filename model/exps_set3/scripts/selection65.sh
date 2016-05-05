#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set3/selection65/selection65.exp"
if [ -f $FPATH ]; then
	python experiment.py selection65 exps_set3/selection65
fi