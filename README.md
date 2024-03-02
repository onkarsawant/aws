# Terraform AWS EC2 Instance and Hello World Lambda Deployment
This Terraform script deploys an AWS EC2 instance and a simple "Hello World" Lambda function.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- Terraform ([Installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli))
- AWS CLI ([Installation guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-install.html))


## AWS Credentials Configuration

1. **Create AWS IAM User**: If you haven't already, create an IAM user with programmatic access in your AWS account. Ensure the user has necessary permissions to create EC2 instances and Lambda functions.

2. **Configure AWS CLI Locally**: Run `aws configure` and enter the IAM user's Access Key ID, Secret Access Key, default region, and output format. This configures the AWS CLI locally with your credentials.


## Terraform Configuration

1. **Clone Repository**: Clone this repository to your local machine.

2. **Navigate to Directory**: Change your current directory to the cloned repository.

3. **Initialize Terraform**: Run `terraform init` to initialize the working directory containing Terraform configuration files.
```bash
terraform init
```

4. **Modify Variables (Optional)**: If needed, modify the `variables.tf` file to adjust variables such as instance type, instance count, Lambda function name, etc.

5. **Review Terraform Plan**: Run `terraform plan` to see the execution plan. Review the proposed changes to ensure they align with your expectations.
```bash
terraform plan -var-file variables.tf
```

6. **Apply Terraform Changes**: If the plan looks good, apply the Terraform changes to create the resources in AWS.
```bash
terraform apply -f variables.tf
```

7. **Access Resources**: Once the deployment is complete, you can access the deployed EC2 instance and invoke the Lambda function.


## Cleanup

To avoid incurring unnecessary costs, it's recommended to destroy the resources once you're done with them.
Run `terraform destroy` to remove all resources created by Terraform.
