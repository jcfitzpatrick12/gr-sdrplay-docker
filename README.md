# gr-sdrplay-docker
## Introduction
Automated install and running of gnuradio with gr-sdrplay3 plugin through Docker. Works with API v3.07.1. Current support is for :inux. Build has been tested on [Operating System: Ubuntu 22.04.3 LTS, Kernel: Linux 6.2.0-34-generic].

## Requirements
Install Docker for Ubunutu at https://docs.docker.com/engine/install/ubuntu/

## Installation
_change to your preferred directory_ \
cd [your_preferred_path] \
_Clone the gr-sdrplay-docker repository:_ \
git clone https://github.com/jcfitzpatrick12/gr-sdrplay-docker.git \
_Navigate to the cloned directory where the files are stored:_ \
cd gr-sdrplay-docker \
_build a docker image tagged as gnuradio:0_ \
docker build -t gnuradio:0 . \
_run the container_ \
bash run_gnuradio \

## Changes coming
Support for Windows and Mac.


