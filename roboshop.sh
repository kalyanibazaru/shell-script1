#!/bin/bash

AMI=ami-03265a0778a880afb
SG_ID=sg-04c9524f47a17e885
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"

do
    echo "Instance is: $i"

    if [ $i=="mongodb" ] || [ $i=="mysql" ] || [ $i=="shipping" ]
    then
        INSTANCE_TYPE="t3.medium"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type t2.micro --security-group-ids sg-04c9524f47a17e885 --tag-specifications "ResourceType=instance, Tags=[{Key=Name, Value=$i}]"
done

