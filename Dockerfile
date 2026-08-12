FROM osrf/ros:jazzy-desktop

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    swig \
    python3-dev \ 
    python3-numpy \
    python3-vcstool \
    python3-rosdep \
    python3-colcon-common-extensions \
    git \
    build-essential \
    clang-format-18 \
    ros-jazzy-pinocchio \
    ros-jazzy-ament-cmake-gtest \
    ccache \
    qt6-base-dev \
    ros-jazzy-plotjuggler-ros

WORKDIR /base_ws
COPY . src/

RUN source /opt/ros/jazzy/setup.bash && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release