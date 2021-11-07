cmake_minimum_required(VERSION 3.5)
project(fawkes_msgs)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(action_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)


rosidl_generate_interfaces(fawkes_msgs
  "action/ExecSkill.action"
  "action/NavGraphGoto.action"
  "msg/NavGraph.msg"
  "msg/NavGraphEdge.msg"
  "msg/NavGraphNode.msg"
  "msg/NavGraphPathCost.msg"
  "msg/NavGraphProperty.msg"
  "msg/Position3D.msg"
  "msg/SkillStatus.msg"
  "srv/MergePointClouds.srv"
  "srv/NavGraphGetPairwiseCosts.srv"
  "srv/NavGraphSearchPath.srv"
  "srv/RecordData.srv"
  "srv/StorePointCloud.srv"
  "srv/WebviewNavRegistration.srv"
  "srv/WebviewProcessRequest.srv"
  "srv/WebviewUrlRegistration.srv"
  DEPENDENCIES builtin_interfaces action_msgs geometry_msgs std_msgs sensor_msgs
)


ament_package()