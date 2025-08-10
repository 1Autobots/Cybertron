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
export GAZEBO_MODEL_PATH="/workspaces/Cybertron/robot_challenge_description/gazebo/maps/"
ros2 launch robot_challenge_description display.launch.py
gazebo test.sdf
```


To convert the urdf (with xacro macros) to a urdf that can be used in other locations.
This is required for the joint_state_publisher
```bash
xacro -o src/description/robot_challenge_description.urdf src/description/robot_challenge_description.xacro 
```

To convert the urdf (without xacro macro) to an sdf for gazebo
```bash
gz sdf -p src/description/robot_challenge_description.urdf > src/description/robot_challenge_description.sdf
```