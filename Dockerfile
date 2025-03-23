# Use the official ROS Humble image based on Ubuntu 22.04 (Jammy)
FROM ros:humble-ros-base-jammy

# Set the working directory
WORKDIR /home

# Install dependencies for RealSense SDK, ROS packages, and build tools
RUN apt-get update && apt-get install -y \
    software-properties-common \
    libssl-dev \
    libusb-1.0-0-dev \
    cmake \
    git \
    build-essential \
    wget \
    lsb-release \
    sudo \
    curl \
    ros-humble-ros-base \
    ros-humble-rqt-image-view \
    ros-humble-image-transport \
    ros-humble-cv-bridge \
    && rm -rf /var/lib/apt/lists/*


# Install Intel RealSense SDK and utilities - should be able to run intelrealsense inside docker
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
    && sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u \
    && sudo apt-get install librealsense2-utils \
    && sudo apt-get install librealsense2-dev

# Install dependencies for AprilTag ROS package
RUN apt-get update && apt-get install -y \
    ros-humble-ros-base \
    ros-humble-rqt-image-view \

# Initialize rosdep and update
RUN rosdep init && rosdep update

# Clone the latest ROS2 Intel RealSense wrapper into the workspace
RUN mkdir -p ~/ros2_ws/src && \
    cd ~/ros2_ws/src && \
    git clone https://github.com/IntelRealSense/realsense-ros.git -b ros2-master

# Install dependencies using rosdep
RUN source /opt/ros/humble/setup.bash && \
    rosdep install -i --from-path src --rosdistro humble --skip-keys=librealsense2 -y

# Build the workspace
RUN cd ~/ros2_ws && \
    source /opt/ros/humble/setup.bash && \
    colcon build --symlink-install

# Source the ROS2 setup files when starting the container
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source ~/ros2_ws/install/local_setup.bash" >> ~/.bashrc
