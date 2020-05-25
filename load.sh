#!/bin/bash
LoadUtilization=$(free -m | awk 'NR==2{printf "%.2f\t", $3*100/$2 }')

aws cloudwatch put-metric-data --metric-name memory-usage --dimensions instance=i-08743f8ab3c8ca497 -- Name=AutoScalingGroupName,Value=ASG --namespace "LoadUtilization" --value $LoadUtilization
