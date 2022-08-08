# Creating a Variable for ami of type map


variable "ec2_ami" {
  type = map

  default = {
    eu-west-3 = "ami-02d0b1ffa5f16402d"
    # us-west-1 = "ami-006fce872b320923e"
  }
}

# Creating a Variable for region

variable "region" {
  default = "eu-west-3"
}


# Creating a Variable for instance_type
variable "instance_type" {    
  type = string
}