#!/bin/bash

log_file=$1;
log_name="${log_file##*/}"
log_path="${log_file%/*}"
echo "log name: $log_name"
echo "log path: $log_path"
vis_script=$0
vis_path="${vis_script%/*}"
python ${vis_path}/plot_training_log.py -2 ${log_path}/${log_name}_plot/ ${log_file}
