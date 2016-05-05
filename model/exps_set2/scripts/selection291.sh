#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/selection291/selection291.exp"
if [ -f $FPATH ]; then
	python experiment.py selection291 exps_set2/selection291
fi