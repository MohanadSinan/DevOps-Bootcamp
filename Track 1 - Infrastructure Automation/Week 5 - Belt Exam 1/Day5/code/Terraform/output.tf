output "instance_id_DojoJump" {
  description = "Instance ID"
  value       = aws_instance.DojoJump.id
}

output "instance_public_ip_DojoJump" {
  description = "Instance Public IP"
  value       = aws_instance.DojoJump.public_ip
}

output "instance_AZ_name_DojoJump" {
  description = "availability zone"
  value       = aws_instance.DojoJump.availability_zone
}

output "instance_public_dns_DojoJump" {
  description = "Instance public dns for class main"
  value       = aws_instance.DojoJump.public_dns
}
