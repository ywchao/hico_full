#!/bin/bash

INIT_WEIGHTS="./external/caffe/models/bvlc_alexnet/bvlc_alexnet.caffemodel"
HICO_SOLVER="./models/hico_solver.prototxt"

./external/caffe/build/tools/caffe train --weights=$INIT_WEIGHTS --solver=$HICO_SOLVER
