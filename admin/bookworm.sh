#!/bin/bash

python3 -m venv env --system-site-packages

echo "source ~/env/bin/activate" >> ~/.bashrc
source ~/.bashrc

pip3 install --upgrade pip setuptools wheel

# install jupyter lab
pip3 install jupyterlab

mkdir -p /home/pi/.jupyter/
ln -s /home/pi/learn-python3/resources/jupyter_server_config.py /home/pi/.jupyter/jupyter_server_config.py
sudo ln -sf /home/pi/learn-python3/resources/jupyter-lab.service /etc/systemd/system/jupyter-lab.service

sudo systemctl daemon-reload
sudo systemctl enable jupyter-lab.service


# install luma.oled for oled display
pip3 install netifaces
pip install luma.oled
