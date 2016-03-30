#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention51/attention51.exp"
if [ -f $FPATH ]; then
	python experiment.py attention51 experiments/attention51
fi