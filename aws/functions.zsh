#!/bin/bash

function labiallow() {

    aws ec2 authorize-security-group-ingress \
        --group-id $LAB_EC2_INSTANCE_SEC_GROUP_INBOUND \
        --protocol tcp \
        --port 22 \
        --cidr $(curl -s https://checkip.amazonaws.com/)/32
}


function ec2-list-amis-ubuntu() {

    # --filters=Name=name,Values=ubuntu*22.04*amd*202402*
    aws ec2 describe-images \
        --region eu-west-1 \
        --filters Name=name,Values=ubuntu \
        --output json \
        --query 'Images[*].[ImageId,CreationDate,Name,Description]'
}

function ec2-list-amis-debian() {

    # --filters=Name=name,Values=ubuntu*22.04*amd*202402*
    aws ec2 describe-images \
        --region eu-west-1 \
        --filters Name=name,Values=debian \
        --output json \
        --query 'Images[*].[ImageId,CreationDate,Name,Description]'
}

function ec2-create-dev-instance() {
    
    vpcid="vpc-bc785fda"
    snetid="subnet-f17616b9"
    #ami="ami-07e712e7bf719ef62"
    #ami="ami-0ba660230d1bb4e66"
    ami="ami-08031206a0ff5a6ac"
    sgid="sg-022030755305e1a57"
    keypairname="aws-kkl-spinner1"
    instance_type="m6i.large"
    #instance_type="t2.nano"

    aws ec2 run-instances \
    --image-id $ami \
    --count 1 \
    --instance-type $instance_type \
    --key-name $keypairname \
    --security-group-ids $sgid \
    --subnet-id $snetid \
    --block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":true}}]" \
    --tag-specifications \
        'ResourceType=instance,Tags=[{Key=Name,Value=devl}]' \
        'ResourceType=volume,Tags=[{Key=Name,Value=devl-disk}]'

}