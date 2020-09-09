# Getting Started with Terraform 
Module 4 is the next level up from Module 3. 
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
For the first part of the exercise you have to configure the file main_a.tf. 
Then you run these commands to build the infrastructure:
```
terraform init
terraform validate
terraform plan -out m4.tfplan
terraform apply "m4.tfplan"
terraform destroy
```
Then you have to rename the main_a.tf to main_a.0.tf.rename
Afterwards, change the name of main_b.0.tf.rename to  main_b.tf
You will need to change the name in order for terraform plan to use that file for the update. 

then you run the commands to build the infrastructure:

```
terraform plan -out m4.tfplan
terraform apply "m4.tfplan"
terraform destroy
```
