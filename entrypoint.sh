#!/bin/bash

set -x

echo "/usr/local/nvidia/lib64" > /etc/ld.so.conf.d/nvidia.conf
ldconfig
loop=true
# check for an Nvidia GPU
if vulkaninfo | grep NVIDIA 2>&1 > /dev/null; then
    echo "Headless Vulkan: Found Nvidia GPU"
else
    echo "Headless Vulkan: GPU not found"
    loop=false
fi
if xvfb-run vulkaninfo | grep NVIDIA 2>&1 > /dev/null; then
    echo "Headed Vulkan: Found Nvidia GPU"
else
    echo "Headed Vulkan: GPU not found"
    loop=false
fi
set +x
while [[ "$loop" == true ]]; do sleep 10; done