cmake_minimum_required(VERSION 2.8.3)
project(fawkes_msgs)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  message_generation
  actionlib
  actionlib_msgs
  geometry_msgs
)

################################################
## Declare ROS messages, services and actions ##
################################################

add_action_files(
  DIRECTORY action
  FILES
    ExecSkill.action
)
    

add_message_files(
  DIRECTORY msg
  FILES
    Position3D.msg
    SkillStatus.msg
)

# add_service_files(
#   DIRECTORY srv
#   FILES
#     Service1.srv
#     Service2.srv
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
    actionlib_msgs
    geometry_msgs
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  CATKIN_DEPENDS message_runtime actionlib actionlib_msgs geometry_msgs
)

