#!/bin/bash

# Definir URLs de los scripts que se descargarán
INSTALL_OMXPLAYER_URL="https://github.com/intermediosdigitales2020/Install_WallMirror/install_omxplayer.sh"
SETUP_REPO_SERVICES_URL="https://github.com/intermediosdigitales2020/Install_WallMirror/setup_repo_and_services.sh"
SET_VERTICAL_DISPLAY_URL="https://github.com/intermediosdigitales2020/Install_WallMirror/set_vertical_display.sh"

# Función para descargar y ejecutar un script
execute_script() {
    curl -sL $1 | sudo bash
}

# Descargar y ejecutar install_omxplayer.sh
execute_script $INSTALL_OMXPLAYER_URL

# Descargar y ejecutar setup_repo_and_services.sh
execute_script $SETUP_REPO_SERVICES_URL

# Descargar y ejecutar set_vertical_display.sh
execute_script $SET_VERTICAL_DISPLAY_URL

# Pedir al usuario reiniciar al final
echo "Todos los scripts se han ejecutado correctamente. ¿Desea reiniciar ahora? (s/n)"
read respuesta
if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
    sudo reboot
else
    echo "Reinicio cancelado. Por favor, reinicie manualmente cuando esté listo."
fi
