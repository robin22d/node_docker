
# unique veriables for jenkins
variable "instance" { default = "Jenkins" }
variable "script" { default = "./Jenkins.sh" }

# Shared veribles by both applications
variable "flavor" { default = "m1.small" }
variable "image" { default = "CentOS 7" }
variable "keypair" { default = "pi_tank_public_key" } 
variable "pool" { default = "cscloud_public_floating" }
variable "security_description" { default = "Terraform security group" }
variable "security_name" { default = "tf_security" }
