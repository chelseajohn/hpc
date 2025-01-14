#!/bin/bash

conda activate ocp-models
export NCCL_SOCKET_IFNAME=eth
id=cgpu-005-n64

set -x
python main.py --config-yml configs/mlperf_hpc.yml \
    --mode train --distributed --submit --amp \
    --identifier $id \
    --num-gpus 4 \
    --num-workers 8 \
    --num-nodes 2 \
    --slurm-timeout 8
