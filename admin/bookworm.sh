#!/bin/bash

python3 -m venv env --system-site-packages

echo "source ~/env/bin/activate" >> ~/.bashrc
source ~/.bashrc

pip3 install --upgrade pip setuptools wheel

# install jupyter lab
pip3 install jupyterlab

mkdir -p /home/pi/.jupyter/
ln -s /home/pi/raspberry-pi-beginner/admin/jupyter_server_config.py /home/pi/.jupyter/jupyter_server_config.py

# To start jupyter lab , execute 
# jupyter lab

# install luma.oled for oled display
pip3 install netifaces
pip3 install luma.oled


# for vcgencmd
sudo apt-get install libraspberrypi-bin