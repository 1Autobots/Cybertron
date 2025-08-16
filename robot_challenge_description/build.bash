#!/bin/bash
source /opt/ros/humble/setup.bash
xacro -o src/description/robot_challenge_description.urdf src/description/robot_challenge_description.xacro
ign sdf -p src/description/robot_challenge_description.urdf > src/description/robot_challenge_description.sdf
colcon build