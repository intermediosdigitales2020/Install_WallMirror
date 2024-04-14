#!/bin/bash

# Actualizar la lista de paquetes y los paquetes del sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar omxplayer
sudo apt-get install omxplayer -y

# Instalar dependencias para omxplayer-sync
sudo apt-get install libpcre3 fonts-freefont-ttf fbset libssh-4 python3-dbus -y

# Descargar omxplayer-sync
cd /opt
sudo git clone https://github.com/turingmachine/omxplayer-sync.git

# Agregar omxplayer-sync al PATH
echo 'export PATH=$PATH:/opt/omxplayer-sync' >> ~/.profile
source ~/.profile