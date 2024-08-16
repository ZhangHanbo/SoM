#!/usr/bin/env bash
# ------------------------------------------------------------------------------------------------
# Deformable DETR
# Copyright (c) 2020 SenseTime. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 [see LICENSE for details]
# ------------------------------------------------------------------------------------------------
# Modified from https://github.com/chengdazhi/Deformable-Convolution-V2-PyTorch/tree/pytorch_1.0.0
# ------------------------------------------------------------------------------------------------

# Copyright (c) Facebook, Inc. and its affiliates.
# Modified by Bowen Cheng from https://github.com/fundamentalvision/Deformable-DETR
# Modified by Richard Abrich from https://github.com/OpenAdaptAI/OpenAdapt

# from https://github.com/pytorch/extension-cpp/issues/71#issuecomment-1778326052
CUDA_VERSION=$(/usr/local/cuda/bin/nvcc --version | sed -n 's/^.*release \([0-9]\+\.[0-9]\+\).*$/\1/p')
echo "CUDA_VERSION: $CUDA_VERSION"

case "${CUDA_VERSION}" in
    9.0*)
        export TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;7.0+PTX"
        ;;
    9.2*)
        export TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0+PTX"
        ;;
    10.*)
        export TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5+PTX"
        ;;
    11.0*)
        export TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5;8.0+PTX"
        ;;
    11.*)
        export TORCH_CUDA_ARCH_LIST="3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6+PTX"
        ;;
    12.*)
        export TORCH_CUDA_ARCH_LIST="5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.7;8.9;9.0+PTX"
        ;;
    *)
        echo "unsupported cuda version."
        exit 1
        ;;
esac

echo "TORCH_CUDA_ARCH_LIST: $TORCH_CUDA_ARCH_LIST"

python -m pip install git+https://github.com/facebookresearch/detectron2.git

python setup.py build install
