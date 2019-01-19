#!/bin/bash

while [ true ] ; do
  arecord --device=plughw:1,0 --format S16_LE -c2 -r48000 /tmp/snapfifo
  sleep 1
done

