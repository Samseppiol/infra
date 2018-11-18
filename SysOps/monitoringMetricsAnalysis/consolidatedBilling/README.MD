## AWS Organisations and consolidated billing 

> Consolidate multiple AWS accounts into an organisation which you centrally manage.

* One root/paying account. 
* 20 linked accounts by default, can be increased 

* Cloudtrail is per AWS account and per region, but can be consolidated with one s3 bucket by creating a bucket in the paying account and using a bucket policy for other accounts to access. 

* Consolidated billing allows you to get volume discounts on all your accounts (S3)
* Unused reserved instanced for EC2 are applied accross all your accounts.