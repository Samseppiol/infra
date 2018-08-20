#!/bin/bash 
yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https perl-Digest-SHA.x86_64
mkdir /Cloudwatch && cd /CloudWatch 
curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O
unzip CloudWatchMonitoringScripts-1.2.2.zip && 
rm CloudWatchMonitoringScripts-1.2.2.zip && 
cd aws-scripts-mon
#Create cronjob to run script and output metrics every 5 mins
echo "*/5 * * * * root /CloudWatch/aws-scripts-mon/mon-put-instance-data.pl --mem-used-incl-cache-buff --mem-util --mem-used --mem-avail" > /etc/cron.d/memoryscripts

