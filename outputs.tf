output "ids" {
  description = "List of IDs of instances"
  value       = "${module.ec2-instance.id}"
}

output "public_ip" {
  description = "Public ip of the instance"
  value = "${module.ec2-instance.public_ip}"
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2-instance.id[0]}"
}
