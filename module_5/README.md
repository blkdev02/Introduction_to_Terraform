# Getting Started with Terraform 
Module 5 is the next level up from Module 4. 
It will help you to improve your understanding of terraform 

# Keypairs
You will need to create a key pair for this execrises. You can create one by using the command 

```
ssh-keygen -t rsa 

```
For this tutorial, it is better to not have a passphrase. 
Make sure you place the pub key in the module 3 directory.  
 
# Security 
it is not ideal for you to have the ingress cidr block of 0.0.0.0/0. If possible configure it for your own IP address. 


# Instructions
You run these commands to build the infrastructure:
```
terraform init
terraform validate
terraform plan -out m5.tfplan
terraform apply "m5.tfplan"
terraform destroy
```
