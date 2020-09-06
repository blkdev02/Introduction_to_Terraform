# Getting Started with Terraform 
Welcome to Terraform - Getting Started. This is my repository for undertaking the execrise for the [Pluralsight Course Terraform - Getting Started](https://app.pluralsight.com/library/courses/getting-started-terraform/table-of-contents).
I have a few issues when using the repo created so,  I created this one for anyone that encounter the errors I had.
The errors were: 

```
error executing "/tmp/terraform_672781707.sh": Process exited with status 1
timeout - last error: dial tcp 34.255.209.76:22: i/o timeout
```

# Keypairs
You will need to create a key pair for this execrises. You can create one by using the command 

```
ssh-keygen -t rsa 

```
For this tutorial, it is better to not have a passphrase. 
Make sure you place the pub key in the module 3 directory.  
 
# Security 
it is not ideal for you to have the ingress cidr block of 0.0.0.0/0. 


# Terraform 
The command to run to build the infrastructure:
```
terraform init
terraform validate
terraform plan -out m3.tfplan
terraform apply "m3.tfplan"
terraform destroy
```
