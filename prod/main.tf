module "my_ec2" {
  source            = "../modules/ec2"
  aws_region        = module.my_ec2.aws_region
  private_key_path  = module.my_ec2.private_key_path
  profile           = module.my_ec2.profile
  key_name          = module.my_ec2.key_name
}
