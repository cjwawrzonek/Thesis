#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/combined56/combined56.exp"
if [ -f $FPATH ]; then
	python experiment.py combined56 experiments/combined56
fi