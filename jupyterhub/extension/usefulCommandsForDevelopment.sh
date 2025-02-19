#!/bin/bash
# TO SETUP THE ENVIRONMENT
wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
chmod +x Anaconda3-2019.03-Linux-x86_64.sh
./Anaconda3-2019.03-Linux-x86_64.sh


conda install -c conda-forge jupyterlab
conda install -c conda-forge nodejs 

conda create --name extension

conda activate extension

# TO REBUILD WHEN DEVELOPING
jupyter serverextension enable --py jupyterlab --user
# Install package in development mode
pip install -e .
# Link your development version of the extension with JupyterLab
jupyter labextension develop . --overwrite
# Rebuild extension Typescript source after making changes
jlpm run build

# FOR PUBLISHING
pip install build
python -m build -s
python -m build

cp dist/thesis_extension-0.1.0-py3-none-any.whl ../../jupyterhub/thesis_extension-0.1.0-py3-none-any.whl
# pip install jupyterlab_apod/dist/thesis_extension-0.1.0-py3-none-any.whl