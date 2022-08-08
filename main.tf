

resource "aws_instance" "my-machines" {
  # Creates x identical aws ec2 instances
  count = 8
  
  # All x instances will have the same ami and instance_type
  ami = lookup(var.ec2_ami,var.region) 
  instance_type = var.instance_type # 

  #subnet_id = "subnet-027ddfd1ac9b5daa1"
  key_name = "KPLR"

  #user_data = "${file("startup.sh")}"
  #root_block_device {
    #volume_size = 30 # in GB <<----- I increased this!
    #volume_type = "gp3"
  #}

  connection {
    type = "ssh"
    user = "ec2-user"
    host = "${self.public_ip}"
    private_key = "${file("KPLR.pem")}"
  }

  provisioner "file" {
  source      = "startup.sh"
  destination = "/tmp/startup.sh"
  }

  #provisioners - remote-exec 
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/startup.sh",
      "sudo /tmp/startup.sh"
    ]
    } 
  
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "TRAINING-machine-${count.index}"
  }

}

resource "aws_eip" "elastic_ip" {
  count    = length(aws_instance.my-machines)
  #name = "eip-${var.my-machines}"
  instance = aws_instance.my-machines[count.index].id
  vpc = true
  }