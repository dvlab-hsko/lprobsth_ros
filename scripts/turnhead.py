#!/usr/bin/env python

import roslib
import rospy, math, time

from std_msgs.msg import Header
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

def jointTrajectoryCommand():
    # Initialize the node
    rospy.init_node('joint_control')

    print rospy.get_rostime().to_sec()
    while rospy.get_rostime().to_sec() == 0.0:
        time.sleep(0.1)
        print rospy.get_rostime().to_sec()

    #pub = rospy.Publisher('/nao_dcm/Head_controller/command', JointTrajectory, queue_size=10)
    pub = rospy.Publisher('/testtop', JointTrajectory, queue_size=10)

    # prepare transfrom

    jt = JointTrajectory()

    jt.header = Header()
    jt.header.stamp = rospy.Time.now()
    jt.header.frame_id = "base_link"

    jt.joint_names = ["HeadYaw", "HeadPitch"]

    # apply first point

    p = JointTrajectoryPoint()
    #theta = 2.0*math.pi*45.0/180.0
    x1 = -45.0
    #x2 =  0.5*math.sin(1*theta)

    #p.positions = [x1]
    p.velocities = [8.26797]
#    p.time_from_start = rospy.Duration(2)
    jt.points.append(p)
    #jt.points[0].time_from_start = rospy.Duration.from_sec(2)

    print "now publishing transform"
    pub.publish(jt)
    print jt
    rospy.spin()

if __name__ == '__main__':
    try:
        jointTrajectoryCommand()
    except rospy.ROSInterruptException: pass
