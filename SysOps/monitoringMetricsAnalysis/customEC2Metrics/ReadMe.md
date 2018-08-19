 This lab is about implementing custom memory metrics for EC2 linux instances and exporting them to cloudwatch to be viewed/graphed.

The lab basically follows this: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html

## Requirements for stack:
 * Role with full access to cloudwatch 
 * EC2 linux instance 
 * Security group to allow SSH from my IP 
 * Setup custom metrics using perl scripts.
 * Create cronjob to run script every 5 minutes

## Issues
Issues I ran into while provisioning this stack 
 * Hadn't outputted my VPC id from the VPC stack - required for creating a security group, as security groups are VPC bound.
 * Hadn't outputted my Subnet IDs from the VPC stack - required as I specified an availability zone, but it put the instance in the default subnet for that AZ, which was the default vpc, which meant my security group couldn't be applied to the instance.

## Steps: 
 * Provision Stack 
 * SSH on and run command: 
    > sudo yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64
 * cd to a desired directory to download the scripts and run:
    > curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
* Once download is done run: 
    > unzip CloudWatchMonitoringScripts-1.2.2.zip && \
rm CloudWatchMonitoringScripts-1.2.2.zip && \
cd aws-scripts-mon

* To perform a test run to ensure everything is okay e.g permissions 
> ./mon-put-instance-data.pl --mem-util --verify --verbose
* To output all memory metrics to cloudwatch, run command: 
> ./mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail
* Set a cron job to run it every 5 minutes, can run every 1 minute if detailed monitoring is enabled for the instance, but default is 5 mins. Cd to /etc and run command: 
> nano crontab
* Navigate to the bottom of the file and add the expression: 
> */5 * * * * root /PATHTOSCRIPTS/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail

## To do: 
* Write bash script to automate the process.
* Write some alarms to be triggered based on custom metrics we now have