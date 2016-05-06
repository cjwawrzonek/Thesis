#!/bin/bash
# ------------------------------------------------------------------
# [CJ Wawrzonek] Title
#          Script to submit experiment
# ------------------------------------------------------------------
cd ../..
FPATH="exps_set4/attention9/attention9.exp"
if [ -f $FPATH ]; then
	python experiment.py attention9 exps_set4/attention9
fi