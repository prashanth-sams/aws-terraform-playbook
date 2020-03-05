module "my_ec2" {
  source            = "../modules/ec2"
  aws_region        = "us-east-1"
  private_key_path  = "~/.aws/credentials"
  profile           = "prashanth"
  key_name          = "kubernetes"
}
