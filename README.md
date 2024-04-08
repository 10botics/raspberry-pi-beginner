## Download Pre-built image
| Date       | Platform                 | Download                                                                                |
| ---------- | ------------------------ | ---------------------------------------------------------------------------------------- |
| 2024-04-08 | Raspberry Pi 4B / Bulleye | [Download](https://www.dropbox.com/scl/fi/en765r64dasqcp212sus2/pi4_beginner_20240408.zip?rlkey=f6k8jpn8sb34lpwlaio2mll8c&dl=0) |

## Installing Jupyter Lab

```
sudo apt-get install python3-virtualenv
python3 -m virtualenv -p python3 env --system-site-packages
echo "source ~/env/bin/activate" >> ~/.bashrc
```

### Installing as a service

1. Put [juptyer-lab.services](jupyter-lab.service) under /etc/systemd/system
2. Execute the following command

```
sudo curl -L https://github.com/sctse999/raspberry-pi-beginner/raw/main/jupyter-lab.service --output /etc/systemd/system/jupyter-lab.service
sudo systemctl daemon-reload
sudo systemctl enable jupyter-lab.service
sudo systemctl start jupyter-lab.service
```

## Installing OLED hostname display

### Installing luma.oled

```
sudo apt-get install python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 libtiff5 -y 
pip3 install luma.oled
pip3 install netifaces # for displaying ip
```

### Installing as a service
```
sudo ln -s /home/pi/raspberry-pi-beginner/oled-hostname.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable oled-hostname.service
```



### TODO
