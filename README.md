# Raspberry Pi Beginner Notebook

## Download Pre-built image
| Date       | Platform                 | Download                                                                                |
| ---------- | ------------------------ | ---------------------------------------------------------------------------------------- |
| 2025-07-09 | Raspberry Pi 4B / Bulleye | [Download](https://www.dropbox.com/scl/fi/u8zggi8cyonz3j058aenf/pi4_beginner_20250709_pi_beginner.zip?rlkey=12hg6wy8oowiuvu8jdva7fd55&st=t66grjtr&dl=0) |
| 2024-06-24 | Raspberry Pi 4B / Bulleye | [Download](https://www.dropbox.com/scl/fi/5ebv5qxwrvnwqjlk5e8ni/pi4_beginner_20240624_pi_beginner.zip?rlkey=1hswg6iybdlnf77801vf8wewz&st=h051w8ys&dl=0) |
| 2024-04-08 | Raspberry Pi 4B / Bulleye | [Download](https://www.dropbox.com/scl/fi/en765r64dasqcp212sus2/pi4_beginner_20240408.zip?rlkey=f6k8jpn8sb34lpwlaio2mll8c&dl=0) |

## Installing Jupyter Lab

```
sudo apt-get install python3-virtualenv
python3 -m virtualenv -p python3 env --system-site-packages
echo "source ~/env/bin/activate" >> ~/.bashrc

bash
pip install jupyterlab
```


## Clone this repo

```
git clone https://github.com/10botics/raspberry-pi-beginner
```

## Install required libraries

- Check [Install libraries](admin/Install%20libraries.ipynb) 

## Install Other Services

- Check [Systemd Service](admin/Systemd%20services.ipynb) 
- Check [Setup Wifi (Bulleye)](admin/Setup%20Wifi%20-%20Bulleye.ipynb) 
- Check [Setup Wifi (BookWorm)](admin/Setup%20Wifi%20-%20Bookworm.ipynb) 


## Developer

Before you release a new image, check the following files
- [Clean up](./admin/Cleanup.ipynb)
- [Install libraries](./admin/Install%20libraries.ipynb)
- [Release a new image](./admin/Release%20a%20new%20image.ipynb)


## Change log

202507
- Added pi-led-racer repo
- Fixed git pull 
- Update LED to show LAN IP