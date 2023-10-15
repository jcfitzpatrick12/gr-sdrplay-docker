# gr-sdrplay-docker
## Introduction
Automated install and running of gnuradio with gr-sdrplay3 plugin through Docker. Works with API v3.07.1. Current support is for Ubuntu. 

## Requirements
Install Docker for Ubunutu at https://docs.docker.com/engine/install/ubuntu/

## Installation
cd [your_preferred_path]
git clone https://github.com/jcfitzpatrick12/gr-sdrplay-docker.git
docker build -t gnuradio:0 .
bash run_gnuradio


