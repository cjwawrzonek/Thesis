#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set2/combined56/combined56.exp"
if [ -f $FPATH ]; then
	python experiment.py combined56 exps_set2/combined56
fi