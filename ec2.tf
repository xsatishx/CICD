provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  //https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/1.19.0
  source                 = "github.com/xsatishx/terraform/Modules/EC2"

  }

 output "id" {
  description = "List of IDs of instances"
  value       = "${module.ec2-instance.id}"
}