#!/bin/bash

CURRENT_PATH=$(pwd)
IMAGE_NAME="denden047/deeplabcut"

docker build -f "$CURRENT_PATH"/docker/Dockerfile -t ${IMAGE_NAME} . && \
docker run -it --rm \
    --gpus 0 \
    -v ${CURRENT_PATH}:/root/workdir \
    -v "$CURRENT_PATH"/data:/data \
    -p 2351:8888 \
    -p 6080:80 \
    ${IMAGE_NAME} \
    /bin/bash
    # /bin/bash -c " \
    #     conda init /bin/bash && \
    #     conda activate acinoset && \
    #     jupyter lab --allow-root --NotebookApp.token='bakaga36' --ip=* --no-browser \
    # "