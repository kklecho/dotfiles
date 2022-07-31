
#ec2
alias ec2down="aws ec2 stop-instances --instance-ids $1"
alias ec2up="aws ec2 start-instances --instance-ids $1"
alias creds="code ~/.aws/credentials"
