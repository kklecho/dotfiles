#!/bin/bash

function labiallow() {

    aws ec2 authorize-security-group-ingress \
        --group-id $LAB_EC2_INSTANCE_SEC_GROUP_INBOUND \
        --protocol tcp \
        --port 22 \
        --cidr $(curl -s https://checkip.amazonaws.com/)/32
}


function ec2-list-amis-ubuntu() {

    aws ec2 describe-images \
        --region eu-west-1 \
        --filters Name=name,Values=ubuntu \
        --output json \
        --query 'Images[*].[ImageId,CreationDate,Name,Description]'
}

function ec2-list-amis-debian-bookworm() {
    aws ec2 describe-images \
        --region eu-west-1 \
        --owners "136693071363" \
        --image-ids ami-0715d656023fe21b4 \
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

fn_aws_get_ec2_instance_id() {
    local instance_name="$1"
    aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=$instance_name" \
        --query "Reservations[].Instances[].InstanceId" \
        --output text
}

fn_aws_get_ec2_public_ip() {
    local instance_name="$1"
    aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=$instance_name" \
        --query "Reservations[].Instances[].PublicIpAddress" \
        --output text
}

fn_aws_start_and_add_ec2_to_hosts() {
    local instance_name="$1"
    local host_name="$2"
    
    local instance_id=$(fn_aws_get_ec2_instance_id "$instance_name")
    if [[ -z "$instance_id" ]]; then
        echo "Error: Instance with name '$instance_name' not found."
        return 1
    fi
    echo "Instance ID: $instance_id"
    
    (aws ec2 start-instances --instance-ids "$instance_id") &

    echo "Waiting for instance to be in 'running' state..."
    aws ec2 wait instance-running --instance-ids "$instance_id"
    echo "Instance is now running."
    
    local public_ip=$(fn_aws_get_ec2_public_ip "$instance_name")
    if [[ -z "$public_ip" ]]; then
        echo "Error: Public IP for instance '$instance_name' not found."
        return 1
    fi
    echo "Public IP: $public_ip"
    
    echo ""
    echo "Now run:"
    echo 'sudo sed -i "s/^.*'"${host_name}"'\\s*$/'"${public_ip}"'\    '"${host_name}"'/" /etc/hosts'
}



fn_aws_stop_ec2() {
    local instance_name="$1"
    
    local instance_id=$(fn_aws_get_ec2_instance_id "$instance_name")
    if [[ -z "$instance_id" ]]; then
        echo "Error: Instance with name '$instance_name' not found."
        return 1
    fi
    echo "Instance ID: $instance_id"
    
    (aws ec2 stop-instances --instance-ids "$instance_id") &

    echo "Waiting for instance to be in 'stopped' state..."
    aws ec2 wait instance-stopped --instance-ids "$instance_id"
    echo "Instance is now stopped."
}
