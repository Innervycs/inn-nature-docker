#!/bin/bash
set -e

echo "[INFO] Configurando entorno ROS 2 Humble..."
source /opt/ros/humble/setup.bash

echo "[INFO] Cambiando al workspace: /root/ros2-ws"
cd /root/ros2-ws

echo "[INFO] Activando entorno del workspace..."
source install/setup.bash

echo "[INFO] Instalando Dependencias de geografia"
source /opt/ros/humble/lib/mavros/install_geographiclib_datasets.sh

if [ "$#" -eq 0 ]; then
  if ros2 pkg list | grep -q "^nature$"; then
    if [ -f "src/nature-stack/launch/example.launch.py" ]; then
      echo "[INFO] Lanzando nature/example.launch.py..."
      exec ros2 launch nature example.launch.py
      # exec ros2 launch mavros px4.launch fcu_url:=/dev/ttyACM0:115200
    else
      echo "[ERROR] No se encontró el launch file: src/nature-stack/launch/example.launch.py"
      exit 1
    fi
  else
    echo "[ERROR] El paquete 'nature' no está disponible. Verifica que se haya clonado y compilado correctamente."
    exit 1
  fi
else
  echo "[INFO] Ejecutando comando personalizado: $@"
  exec "$@"
fi