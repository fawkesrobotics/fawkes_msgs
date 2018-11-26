# Fawkes ROS Message Types

This repository contains ROS message, service, and action specifications to
access some Fawkes features from ROS directly.

## NavGraph
The [navgraph](https://trac.fawkesrobotics.org/wiki/NavGraph) is a topological
graph used for path planning as well as storing location-specific semantic
information related to the ground map. The following message types are relevant.
- [NavGraph message](msg/NavGraph.msg):
  Overall navgraph specification-
  - [NavGraphEdge sub-message](msg/NavGraphEdge.msg):
    Edge representation for navgraph.
  - [NavGraphNode sub-message](msg/NavGraphNode.msg):
    Node representation for navgraph.
  - [NavGraphProperty sub-message](msg/NavGraphProperty.msg):
    Key-value pair to represent properties in nodes and edges.
- [NavGraphGetPairwiseCosts service](srv/NavGraphGetPairwiseCosts.srv)
  Calculates the costs between all pairs of nodes in a graph. Note that this is
  a costly operation. However, it can be used to provide a full cost
  specification, for example, for planning problems.
  - [NavGraphPathCost sub-message](msg/NavGraphPathCost.msg):
    Denote costs for a path between two nodes.
- [NavGraphSearchPath service](srv/NavGraphSearchPath.srv]:
  Search for a path between two nodes on the navgraph. If a path can be found,
  returns the path as a sequence of nodes and the total cost.
- [NavGraphGoto action](action/NavGraphGoto.action):
  ROS action to move to a specific node in the graph.

The messages are processed by the
[navgraph-breakout](https://github.com/fawkesrobotics/fawkes/blob/master/src/plugins/ros/navgraph_breakout_thread.cpp)
plugin or the
[fawkes_navgraph](https://github.com/timn/ros-rcll_fawkes_sim/blob/master/src/fawkes_navgraph_node.cpp)
node, which reads and monitors the navgraph YAML file to provide the API.

For examples how to use them confer the
[rcll_fawkes_sim](http://wiki.ros.org/rcll_fawkes_sim) or the
[rosplan_interface_behaviorengine](https://github.com/timn/rosplan_interface_behaviorengine) packages.

## Position exchange
As object positions are of universal reference, there is a generic Fawkes to ROS
object transfer plugin
[ros-position-3d](https://github.com/timn/rosplan_interface_behaviorengine).
- [Position3D message](msg/Position3D.msg)
  Position in 3D space given as a pose along with a name and the visibility
  history. The history is zero on initialization, positive for the number of
  consecutive positive sightings of an object, and negative for the number of
  consecutive sensor data frames where the object was not visible. The history
  will flip between any negative number and 1, and any positive number and -1
  when the visibility toggles. The node may implement to tolerate a number of
  frames before toggling for stability.

## Behavior Engine Integration
The interface of the [Lua-based Behavior
Engine](http://wiki.ros.org/behavior_engine)
([project](https://www.fawkesrobotics.org/projects/behavior-engine/)) is also
provided to ROS to execute basic actions.

- [SkillStatus message](msg/SkillStatus.msg):
  Describes the current status of skill execution.
- [ExecSkill action](action/ExecSkill.action):
  ROS action to execute a given skill string.

## PCL Database
Fawkes provides functionality to store, retrieve, and merge pointclouds to and
from a MongoDB database. This functionality is provided to and used from ROS
([paper and
video](https://www.fawkesrobotics.org/publications/2013/hybris-c1-baseline-iros2013/)).
- [StorePointCloud service](srv/StorePointCloud.srv):
  Store a given point cloud to a given database and collection.
- [RetrievePointCloud service](srv/RetrievePointCloud.srv):
  Retrieve a point cloud from a given database and collection at a given time.
  Result is provided through a topic where point clouds are stored (enables to
  trigger some external processing pipeline by simply invoking to restore a
  point cloud).
- [MergePointClouds service](srv/MergePointClouds.srv):
  Merge point clouds from a number of given timestamps. The algorithm is
  described in the
  [paper](https://www.fawkesrobotics.org/publications/2013/hybris-c1-baseline-iros2013/). The
  result is provided through a topic. Note that this requires that transform
  information has also been recorded, typically through the use of [mongodb_log
  on ROS](http://wiki.ros.org/mongodb_log) or [mongodb-log on
  Fawkes](https://trac.fawkesrobotics.org/wiki/Plugins/mongodb-log).
