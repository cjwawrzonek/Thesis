#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------
cd ..
FPATH="experiments/attention9/attention9.exp"
if [ -f $FPATH ]; then
	python experiment.py attention9 experiments/attention9
fi