#!/bin/bash

if [ $# -eq 0 ]; then
  gpu_id=0
else
  gpu_id=$1
fi

INIT_WEIGHTS="./external/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel"
HICO_SOLVER="./models/hico_solver.prototxt"

./external/caffe/build/tools/caffe train --weights=$INIT_WEIGHTS --solver=$HICO_SOLVER --gpu=$gpu_id 2>&1 | tee logs/train.log
