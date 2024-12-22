
alias awsprofile="export AWS_PROFILE="
#ec2
alias ec2down="aws ec2 stop-instances --instance-ids $1"
alias ec2up="aws ec2 start-instances --instance-ids $1"
alias creds="code ~/.aws/credentials"
alias s3="aws s3"
alias s3ls="aws s3 ls"
alias syn="cdk synth"
alias dep="cdk deploy"
alias labiup='aws ec2 start-instances --instance-ids $LAB_EC2_INSTANCE'
alias labidown='aws ec2 stop-instances --instance-ids $LAB_EC2_INSTANCE'
