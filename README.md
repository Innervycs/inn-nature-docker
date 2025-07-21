# NATURE Stack - Docker Setup (ROS 2 Humble)

Este entorno está diseñado para levantar automáticamente el stack `nature` sobre ROS 2 Humble usando Docker y docker-compose.

## Requisitos

- Docker
- Docker Compose
- XQuartz (en macOS) si deseas visualizar RViz

## Uso

1. Clona el repositorio y ubícate en esta carpeta:

   ```bash
   cd nature-docker
   ```

2. Construye la imagen:

   ```bash
   docker-compose build
   ```

3. Lanza el contenedor con el stack:

   ```bash
   docker-compose up
   ```

Esto ejecutará automáticamente `ros2 launch nature base.launch.py`.

## Notas

- Para interactuar con el contenedor:

  ```bash
  docker exec -it nature_ros2 bash
  ```

- El dispositivo `/dev/ttyUSB0` está mapeado para conectar un Pixhawk o CubePilot.

- RViz está instalado pero **no se lanza automáticamente**.

- Asegúrate de que XQuartz esté corriendo y configurado con:

  - `Allow connections from network clients`
  - Ejecuta `xhost +localhost` en tu terminal local antes de iniciar Docker

