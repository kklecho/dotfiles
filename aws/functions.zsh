#!/bin/bash

function labiallow() {

    aws ec2 authorize-security-group-ingress \
        --group-id $LAB_EC2_INSTANCE_SEC_GROUP_INBOUND \
        --protocol tcp \
        --port 22 \
        --cidr $(curl -s https://checkip.amazonaws.com/)/32
}
