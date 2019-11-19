provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  //https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/1.19.0
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "1.19.0"
  instance_count         = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  name                   = "${var.name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  key_name               = "${var.key_name}"
  subnet_ids             = "${var.subnet_ids}"
  user_data              = "{$var.user_data}"
  associate_public_ip_address  = true
  tags = {
    "tag_name"      = "${var.tag_name}"
    "tag_function"  = "${var.tag_function}"
    "tag_adminname" = "${var.tag_adminname}"
  }

  root_block_device = [
    {
      volume_size = "${var.root_volume_size}"
      volume_type = "${var.root_volume_type}"
    },
  ]
}

resource "aws_ebs_volume" "volumes" {
  count             = "${var.ebs_count * var.instance_count}"
  availability_zone = "${element(module.ec2-instance.availability_zone, count.index)}"
  type              = "${var.ebs_type}"
  size              = "${var.ebs_size}"
  encrypted         = true
}

resource "aws_volume_attachment" "volumes-attachment" {
  count = "${var.ebs_count * var.instance_count}"

  device_name = "${var.block_device_names}"

  #device_name = "${var.ebs_device_name['i' + (count.index % var.instance_count])}"
  volume_id   = "${element(aws_ebs_volume.volumes.*.id, count.index)}"
  instance_id = "${element(module.ec2-instance.id, count.index)}"
}

resource "null_resource" "example_provisioner" {
  provisioner "remote-exec" {
    inline = [
      "cd /tmp && git clone https://github.com/xsatishx/terraform.git",
    ]
   }
      connection {
        type     = "ssh"
        user     = "ubuntu"
        password = ""
        private_key = "${file("/home/ubuntu/satish-aws-hpe.pem")}"
      }
}