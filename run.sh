#!/bin/bash

CURRENT_PATH=$(pwd)
IMAGE_NAME="denden047/deeplabcut"

docker build -q -f "$CURRENT_PATH"/docker/Dockerfile -t ${IMAGE_NAME} . && \
docker run -it --rm \
    --gpus all \
    -p 2351:8888 \
    -e USER_HOME=$HOME/DeepLabCut \
    ${IMAGE_NAME} \
    /bin/bash
    # /bin/bash -c " \
    #     conda init /bin/bash && \
    #     conda activate acinoset && \
    #     jupyter lab --allow-root --NotebookApp.token='bakaga36' --ip=* --no-browser \
    # "