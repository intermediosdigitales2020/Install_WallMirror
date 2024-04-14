#!/bin/bash

# Variables
REPO_URL="https://github.com/intermediosdigitales2020/Mirror_Install" # Cambia esto por la URL de tu repositorio

# Descargar el repositorio y colocarlo en Documents
cd ~/Documents
git clone $REPO_URL

# Crear scripts de servicio para systemd
cd /etc/systemd/system

# Crear el servicio wmm1.service
echo "[Unit]
Description=WMM1 Service

[Service]
ExecStart=/home/pi/Documents/Mirror_Install/mirror_s1.sh

[Install]
WantedBy=multi-user.target" | sudo tee wmm1.service

# Crear el servicio wmm2.service
echo "[Unit]
Description=WMM2 Service

[Service]
ExecStart=/usr/bin/python3 /home/pi/Documents/Mirror_Install/master.py

[Install]
WantedBy=multi-user.target" | sudo tee wmm2.service

# Recargar los servicios de systemd y habilitar los servicios creados
sudo systemctl daemon-reload
sudo systemctl enable wmm1.service
sudo systemctl enable wmm2.service
