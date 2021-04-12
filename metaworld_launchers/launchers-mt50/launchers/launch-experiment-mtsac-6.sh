#!/bin/bash
cd /home/avnishnarayan
runuser -l avnishnarayan -c ""
rm -rf garage; rm -rf metaworld-runs-v2
runuser -l avnishnarayan -c "git clone https://github.com/rlworkgroup/garage && cd garage/ && git checkout avnish-new-metaworld-results-mt1 && mkdir data/"
runuser -l avnishnarayan -c "mkdir -p metaworld-runs-v2/local/experiment/"
runuser -l avnishnarayan -c "make run-nvidia-headless -C ~/garage/ PARENT_IMAGE='nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04' "
runuser -l avnishnarayan -c "cd garage && python docker_metaworld_run_gpu.py 'metaworld_launchers/mt50/mtsac_metaworld_mt50.py'"
runuser -l avnishnarayan -c "cd garage/metaworld_launchers && python upload_folders.py mt50/round1/mtsac/v2 1200"