#!/bin/bash

FOLDER="${HOME}/Pictures/Commits"

mkdir -p "${FOLDER}"

ffmpeg -f avfoundation -video_size 1280x720 -framerate 30 -i "0" -vframes 1 "${FOLDER}/$(date +"%s")-$(git rev-parse HEAD).jpg" &> /dev/null


