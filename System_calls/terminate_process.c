#!/bin/bash
echo "Enter PID to terminate:"
read pid
kill -9 $pid
echo "Process $pid terminated."

