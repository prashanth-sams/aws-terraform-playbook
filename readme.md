# AWS Terraform playbook
> AWS terraform playbook bundle for exercise

Create EC2 instance with free-tier 
```
cd ./dev/
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

**Note:** Update variables in `.tf` file