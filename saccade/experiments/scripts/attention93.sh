#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention93/attention93.exp"
if [ -f $FPATH ]; then
	python experiment.py attention93 experiments/attention93
fi