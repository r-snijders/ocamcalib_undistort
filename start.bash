#!/usr/bin/env bash

# Run script, adjust to your local requirements:
# (QT_X11_NO_MITSHM neededto prevent "attempt to access private resource denied")
docker run \
    --name ocam_undistort \
    -e DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    -v /home/ron/anon/rectification/:/rectification \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -it ocam_undistort bash

