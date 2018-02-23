# Declare the instance resource here
resource "aws_instance" "deployer" {
  count                       = "${var.count}"
  associate_public_ip_address = "true"
  key_name                    = "tommy"
  instance_type               = "t2.medium"
  security_groups             = ["sg-388fdf43"]
  subnet_id                   = "subnet-fdbb3198" 
  ami                         = "${var.aws_ami}"

provisioner "file" {
    source      = "conf/pe.conf"
    destination = "/home/ec2-user/pe.conf"
   
   connection {
    type        = "${var.connection_type}"
    user        = "ec2-user"
    private_key = "${file("${path.module}/${var.key_file}")}"
    agent       = "false"
    timeout     = "5m"
   }
 

provisioner "remote-exec" {
    inline = [
    ]
   connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "${file("${path.module}/${var.key_file}")}"
    agent       = "false"
    timeout     = "5m"
   }
  }

tags {
    Name    = "${format("web-%02d.inf.puppet.vm", count.index+1,)}"
    Owner   = "Tommy"
    Purpose = "TSE Test"
    Tech    = "Terraform"
  }
}
