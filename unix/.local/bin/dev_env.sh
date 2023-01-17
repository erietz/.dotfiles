#!/usr/bin/env bash

set -x # echo on

ENV_NAME="dev"

# update conda
conda update -y -n base -c defaults conda

# create dev environment
conda create -y -n "$ENV_NAME" -c conda-forge python nodejs

# required to activate conda envs
source "${HOME}/miniconda/etc/profile.d/conda.sh"

# activate dev env
conda activate "$ENV_NAME"

# dev tools {{{

conda install -y ipython jupyterlab httpie

# }}}
# nvim lsp {{{

# python language server
conda install -y python-lsp-server

# typescript language server
npm i -g typescript-language-server typescript

# bash language server
npm i -g bash-language-server
conda install -y shellcheck

# }}}
