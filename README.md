# hico_full

## Setup
0. Add symbolic link for caffe (multi_label branch).
  <pre>
  ln -sf /PATH/TO/CAFFE ./external/caffe
  </pre>

0. Add symbolic link for hico_20150920.
  <pre>
  ln -sf /PATH/TO/HICO_20150920 ./external/hico_20150920
  </pre>

0. Download bvlc_reference_caffenet.caffemodel and imagenet_mean.binaryproto.
  <pre>
  ./external/caffe/scripts/download_model_binary.py \
      ./external/caffe/models/bvlc_reference_caffenet/
  ./external/caffe/data/ilsvrc12/get_ilsvrc_aux.sh
  </pre>

## Run experiment
  <pre>
  matlab -r "get_hico_file_list"
  ./convert_dataset.sh
  ./train.sh
  python eval_scripts/HICOeval_getmat.py
  matlab -r "HICOeval"
  </pre>

