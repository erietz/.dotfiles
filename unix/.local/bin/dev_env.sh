#!/usr/bin/env bash

set -x # echo on

# update conda
conda update -y -n base -c defaults conda

# create dev environment
conda create -y -n dev -c conda-forge python-lsp-server nodejs ipython jupyterlab httpie

# required to activate conda envs
source $HOME/miniconda/etc/profile.d/conda.sh

# activate dev env
conda activate dev

# install npm package
npm i -g typescript-language-server typescript
