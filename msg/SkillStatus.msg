# Standalone skill status message.
# This message is send on skiller status changes by ros-skiller.
# It can be used to easily monitor skills from non-callers.
int32 S_INACTIVE = 0
int32 S_FINAL    = 1
int32 S_RUNNING  = 2
int32 S_FAILED   = 3

time   stamp
string skill_string
string error
int32  status
