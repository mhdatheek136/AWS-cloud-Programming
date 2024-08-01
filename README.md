# Cloud Programming Portfolio

Welcome to the Cloud Programming Portfolio for the IU University of Applied Sciences course. This portfolio provides a Terraform codebase to effortlessly host your webpage on highly available, auto-scalable, and low-latency cloud infrastructure. Below are the steps to help you get started:

## Getting Started

Follow the steps below to get started:

1. **Install Terraform:**
   Ensure that Terraform is installed on your machine. You can download it from the [official Terraform website](https://www.terraform.io/downloads.html).

2. **Run Terraform Apply:**
   Execute the following command to deploy the infrastructure. Make sure to create a `variables.tfvars` file with your specific configurations.

   ```bash
   terraform apply -var-file variables.tfvars
   ```

   This will create the necessary resources for hosting your webpage.

3. **Destroy Resources:**
   If you want to remove the resources created, use the following command:

   ```bash
   terraform destroy -var-file variables.tfvars
   ```

4. **Edit Configuration:**
   Customize the configurations by modifying the `variables.tfvars` file according to your preferences.

5. **Host Your Webpage:**
   Use the `user-data.sh` script to set up and host your own webpage. Customize the script to include your content.

## Important Note

Ensure that you review and understand the changes made in the `variables.tfvars` file, as it contains crucial configurations for your infrastructure.

Feel free to explore and enhance the Terraform code to suit your specific needs!

**AWS Account Setup:**
- Before running Terraform, create an AWS account.
- Use your AWS access key and secret key to establish a connection.

Happy Cloud Programming!