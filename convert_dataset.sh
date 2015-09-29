#!/bin/bash

HICO_TRAIN_DIR="/scratch/jiadeng_fluxg/shared/hico_20150920/images/train2015/"
HICO_TEST_DIR="/scratch/jiadeng_fluxg/shared/hico_20150920/images/test2015/"

HICO_TRAIN_LMDB="./data/hico_train"
HICO_TEST_LMDB="./data/hico_test"

if [ -d $HICO_TRAIN_LMDB ]; then
    rm -rf $HICO_TRAIN_LMDB
fi

if [ -d $HICO_TEST_LMDB ]; then
    rm -rf $HICO_TEST_LMDB
fi

./external/caffe/build/tools/convert_imageset --resize_width=256 --resize_height=256 --encoded=true $HICO_TRAIN_DIR ./data/hico_file_list_train.txt $HICO_TRAIN_LMDB

./external/caffe/build/tools/convert_imageset --resize_width=256 --resize_height=256 --encoded=true $HICO_TEST_DIR ./data/hico_file_list_test.txt $HICO_TRAIN_LMDB
