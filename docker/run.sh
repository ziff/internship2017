#!/usr/bin/env sh

set -e

REQS_DIR=/tmp/${REQS_DIR}

if [ -f "${REQS_DIR}/my-environment.yml" ]
then
    echo "Installing your conda dependencies"
    conda env update --file=${REQS_DIR}/my-environment.yml
fi

if [ -f "${REQS_DIR}/my-requirements.txt" ]
then
    echo "Installing your pip dependencies"
    pip install --no-cache-dir -r ${REQS_DIR}/my-requirements.txt
fi

jupyter notebook --port=8888 --ip=0.0.0.0
