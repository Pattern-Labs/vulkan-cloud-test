FROM nvidia/cudagl:11.4.2-base-ubuntu20.04 as vkdbg

ENV NVIDIA_VISIBLE_DEVICES all
# Include "utility" to get nvidia-smi
ENV NVIDIA_DRIVER_CAPABILITIES graphics,display,utility,compute,video
# For local testing
RUN mkdir -p /etc/vulkan/icd.d/ \
  && printf '%s\n' \
'{' \
'    "file_format_version" : "1.0.0",' \
'    "ICD": {' \
'        "library_path": "libGLX_nvidia.so.0",' \
'        "api_version" : "1.3.99"' \
'    }' \
'}' > /etc/vulkan/icd.d/nvidia_icd.json

RUN apt-get update && apt-get install -y vulkan-tools mesa-utils xvfb && apt-get clean
COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]