# Getting Started with Terraform 
Module 3 is an easy start for you to familise yourself with Terraform

# Keypairs
You will need to create a key pair for this execrises. You can create one by using the command 

```
ssh-keygen -t rsa 

```
For this tutorial, it is better to not have a passphrase. 
Make sure you place the pub key in the module 3 directory.  
 
# Security 
it is not ideal for you to have the ingress cidr block of 0.0.0.0/0. If possible configure it for your own IP address. 


# Terraform 
The command to run to build the infrastructure:
```
terraform init
terraform validate
terraform plan -out m3.tfplan
terraform apply "m3.tfplan"
terraform destroy
```
