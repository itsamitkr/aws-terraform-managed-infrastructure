# AWS Managed Infrastructure via Terraform


## Prerequisites
Create a `~/.bash_profile` and setup `accesskey` and  `secretkey` as environment variables.
~~~
export AWS_ACCESS_KEY_ID="accesskey"
export AWS_SECRET_ACCESS_KEY="secretkey"
export AWS_DEFAULT_REGION="us-west-2"
~~~

Go to the `/terraform` directory and source the bash profile

~~~
source ~/.bash_profile
~~~

Create an S3 Bucket named `managed-infrastructure-tfstate` to store the tfstate. you can create the bucket 
via the AWS Management Console or via the CLI. 

~~~
aws s3 mb s3://managed-infrastructure-tfstate
~~~


## Terraform Commands
Initialize terraform working directory.
~~~
terraform init
~~~
List the resources to be created via the script. Allows users to review, before applying the plan. The command will 
prompt you for an `environment` name. Example environment names: `test`, `prod`, `dev`
~~~
terrafomm plan
~~~
Apply the plan to create resources in AWS 
~~~
terraform apply
~~~
Destroy all the infrastructure managed via the terraform. 
~~~
terraform destroy
~~~