#!/bin/bash

# Ruta al archivo de configuración de la Raspberry Pi
CONFIG_FILE="/boot/config.txt"

# Copia de seguridad del archivo de configuración actual
sudo cp $CONFIG_FILE "${CONFIG_FILE}.bak"

# Configurar HDMI a 1080x1920 px, 9:16
sudo sed -i '/^hdmi_group=/d' $CONFIG_FILE
sudo sed -i '/^hdmi_mode=/d' $CONFIG_FILE
echo "hdmi_group=2" | sudo tee -a $CONFIG_FILE
echo "hdmi_mode=16" | sudo tee -a $CONFIG_FILE

# Configurar la rotación de la pantalla
sudo sed -i '/^display_rotate=/d' $CONFIG_FILE
echo "display_rotate=1" | sudo tee -a $CONFIG_FILE

# Opcional: Descomentar si necesitas deshabilitar el overscan
#sudo sed -i '/^disable_overscan=/d' $CONFIG_FILE
#echo "disable_overscan=1" | sudo tee -a $CONFIG_FILE

# Reiniciar para aplicar cambios
echo "Configuración aplicada. El sistema necesita reiniciarse. ¿Desea reiniciar ahora? (s/n)"
read respuesta
if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    sudo reboot
fi
