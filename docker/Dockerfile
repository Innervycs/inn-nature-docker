FROM ros:humble

ENV DEBIAN_FRONTEND=noninteractive

# Instalación de dependencias ROS2
RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    python3-pyserial \
    build-essential \
    ros-humble-rviz2 \
    ros-humble-mavros* \
    ros-humble-tf2-tools \
    ros-humble-navigation2 \
    ros-humble-xacro \
    usbutils \
    netcat \
    socat \
    telnet \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep update

# Crear workspace y copiar entrypoint
WORKDIR /root/ros2-ws
COPY ./entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

# Clonar el repositorio en src/
RUN mkdir -p src
WORKDIR /root/ros2-ws/src
RUN git clone https://github.com/CGoodin/nature-stack.git

# Copiar archivos ROS2 al formato esperado
RUN cp nature-stack/CMakeLists_ros2.cmake nature-stack/CMakeLists.txt && \
    cp nature-stack/package_ros2.xml nature-stack/package.xml

# Construir solo el paquete nature
WORKDIR /root/ros2-ws
RUN . /opt/ros/humble/setup.sh && \
    rosdep install --from-paths src --ignore-src -r -y && \
    colcon build --packages-select nature --symlink-install

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc    

ENTRYPOINT ["/ros_entrypoint.sh"]