#!/bin/sh

ROOT=$PWD
source $ROOT/miniconda3/bin/activate
conda create -n biovae-conda-env python=3.6

echo "Created conda environment: biovae-conda-env"