#!/bin/bash

if [ $# -ne 2 ]
then
    echo " Usage : sh $0 <Region> <AWS Resource> "
    echo "Example :: sh 15-awsresources_list.sh us-east-1 ec2 "
    exit 1
fi

AWS_REGION=$1
AWS_RESOURCE=$2

if ! command -v aws >/dev/null 2>&1;
then
    echo " AWS Cli is not installed .... Installing "
    dnf install awscli -y
else
    echo " AWS Cli is already installed "
fi

if [ ! -d ~/.aws ] 
then
    echo " AWS Cli is not configured . Please configurethe AWS Cli and try again... "
    exit 1
fi


# List the resources based on the service
case $AWS_RESOURCE in
    ec2)
        echo "Listing EC2 Instances in $AWS_REGION"
        aws ec2 describe-instances --region $AWS_REGION
        ;;
    rds)
        echo "Listing RDS Instances in $AWS_REGION"
        aws rds describe-db-instances --region $AWS_REGION
        ;;
    s3)
        echo "Listing S3 Buckets in $AWS_REGION"
        aws s3api list-buckets --region $AWS_REGION
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $AWS_REGION"
        aws cloudfront list-distributions --region $AWS_REGION
        ;;
    vpc)
        echo "Listing VPCs in $AWS_REGION"
        aws ec2 describe-vpcs --region $AWS_REGION
        ;;
    iam)
        echo "Listing IAM Users in $AWS_REGION"
        aws iam list-users --region $AWS_REGION
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $AWS_REGION"
        aws route53 list-hosted-zones --region $AWS_REGION
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $AWS_REGION"
        aws cloudwatch describe-alarms --region $AWS_REGION
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $AWS_REGION"
        aws cloudformation describe-stacks --region $AWS_REGION
        ;;
    lambda)
        echo "Listing Lambda Functions in $AWS_REGION"
        aws lambda list-functions --region $AWS_REGION
        ;;
    sns)
        echo "Listing SNS Topics in $AWS_REGION"
        aws sns list-topics --region $AWS_REGION
        ;;
    sqs)
        echo "Listing SQS Queues in $AWS_REGION"
        aws sqs list-queues --region $AWS_REGION
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $AWS_REGION"
        aws dynamodb list-tables --region $AWS_REGION
        ;;
    ebs)
        echo "Listing EBS Volumes in $AWS_REGION"
        aws ec2 describe-volumes --region $AWS_REGION
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac