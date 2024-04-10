# Raspberry Pi Beginner Notebook

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

## Install Other Services

- Check [Systemd Service](admin/Systemd%20services.ipynb) 
- Check [Setup Wifi (Bulleye)](admin/Setup%20Wifi%20-%20Bulleye.ipynb) 
- Check [Setup Wifi (BookWorm)](admin/Setup%20Wifi%20-%20Bookworm.ipynb) 


## Developer

Before you release a new image, check the following files
- [Clean up](./admin/Cleanup.ipynb)
- [Install libraries](./admin/Install%20libraries.ipynb)
- [Release a new image](./admin/Release%20a%20new%20image.ipynb)

