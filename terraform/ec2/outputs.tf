# output "public_dns" {
#   value = module.jenkins.public_dns
# }

# output "public_ip" {
#   value = module.jenkins.public_ip
# }

# output "private_dns" {
#   value = module.bastion-host.private_dns
# }

# output "arn" {
#   value = module.jenkins.arn
# }

# output "instance-inputs" {
#   value = module.jenkins.instance-inputs
# }

# output "ec2-instances" {
#   value = module.jenkins.ec2-instances
# }

output "all" {
  value = module.jenkins
}