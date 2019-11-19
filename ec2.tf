provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  //https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/1.19.0
  source                 = "github.com/xsatishx/terraform/Modules/EC2"
  ami 					 = "ami-02c27cec4ad9d38ca"
  user_data	             = "cd /home/ubuntu/ && git clone https://github.com/xsatishx/CICD.git"
}
  