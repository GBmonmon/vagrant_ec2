#!/bin/bash

# Create a ec2 instance
vagrant up

# Status
vagrant status
echo "Instance is running."
id=$(aws ec2 describe-instances --filters "Name=instance-state-code,Values=16" --query "Reservations[*].Instances[*].InstanceId" --output text)
echo "InstanceId > $id"
ip4=$(aws ec2 describe-instances --instance-ids "${id}" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
echo "Ip4 > ${ip4}"
url=$(echo "http://${ip4}:8080")

echo "Open the page by this url: ${url}"
