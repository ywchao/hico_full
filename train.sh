#!/bin/bash

INIT_WEIGHTS="./external/caffe/models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel"
HICO_SOLVER="./models/hico_solver.prototxt"

./external/caffe/build/tools/caffe train --weights=$INIT_WEIGHTS --solver=$HICO_SOLVER 2>&1 | tee logs/train.log
