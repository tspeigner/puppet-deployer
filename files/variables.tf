variable "aws_ami" {
  description = "Which AWS AMI should you use"
  default     = "ami-6f68cf0f"
  ## RHEL-7.3_HVM_GA-20161026-x86_64-1-Hourly2-GP2 (ami-6f68cf0f)
}
variable "assoc_pub_ip" {
  description = "Associate Public IP?"
  default     = "false"
}
variable "aws_key_name" {
  description = "AWS key name"
  default     = "tommy"
}
variable "count" {
  description = "How many instances to provision"
  default     = "1"
}
variable "instance_type" {
  description = "What type of AWS instnace do you want to use? This will be a list eventually."
  default     = "t2.small"
}
variable "security_groups" {
  description = "Array of security groups"
  default     = "["sg-388fdf43"]"
}
#####################
# Variables for SSH #
#####################
variable "ssh_user" {
  description = "SSH User name"
  default     = "ec2-user"
}
variable "ssh_pass" {
  description = "SSH Password"
  default     = ""
}
variable "connection_timeout" {
  description = "SSH connection timeout"
  default     = ""
}
variable "connection_type" {
  description = "Currently, SSH is the only type allowed"
  default     = "ssh"
}
variable "key_file" {
  description = "Local key file (e.g., user.pem)"
  default     = "tommy.pem"
}
variable "tag1" {
  description = "Instance Tag 1"
  default     = ""
}
variable "tag2" {
  description = "Instance Tag 2"
  default     = ""
}
variable "tag3" {
  description = "Instance Tag 3"
  default     = ""
}
variable "tag4" {
  description = "Instance Tag 5"
  default     = ""
}
variable "tag5" {
  description = "Instance Tag 5"
  default     = ""
}