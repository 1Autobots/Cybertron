# 1Autobots
code for autonomous driving challenge

```bash
source /opt/ros/humble/setup.bash
export TURTLEBOT3_MODEL=waffle
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/humble/share/turtlebot3_gazebo/models
```

```bash
source /opt/ros/humble/setup.bash
cd robot_challenge_description
colcon build
. install/local_setup.sh
ros2 launch robot_challenge_description display.launch.py
export GAZEBO_MODEL_PATH="/workspaces/Cybertron/robot_challenge_description/gazebo/maps/"
gazebo test.sdf
```