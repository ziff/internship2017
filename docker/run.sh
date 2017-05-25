#!/usr/bin/env sh

set -e

if [ -f "my-environment.yml" ]
then
    echo "Installing your conda dependencies"
    conda update env --file=my-environment.yml
fi

if [ -f "my-requirements.txt" ]
then
    echo "Installing your pip dependencies"
    pip install --no-cache-dir -r my-requirements.txt
fi

jupyter notebook --port=8888 --ip=0.0.0.0
