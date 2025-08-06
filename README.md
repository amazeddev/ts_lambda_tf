# TypeScript Lambda with Terraform

A simple AWS Lambda function written in TypeScript and deployed using Terraform.

## Project Structure

```
ts_lambda_tf/
├── app/                    # TypeScript Lambda application
│   ├── src/
│   │   └── index.ts       # Lambda handler
│   ├── package.json        # Node.js dependencies
│   └── tsconfig.json      # TypeScript configuration
└── terraform/             # Infrastructure as Code
    ├── main.tf            # Terraform configuration
    ├── lambda_assume_role_policy.json    # IAM trust policy
    └── lambda_execution_policy.json     # IAM execution policy
```

## Features

- **TypeScript Lambda**: Modern TypeScript with strict type checking
- **Terraform IaC**: Infrastructure as Code for AWS resources
- **Automatic Build**: TypeScript compilation during deployment
- **Function URL**: Direct HTTP access to Lambda function
- **Dependency Management**: Proper packaging of Node.js dependencies

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed
- Node.js and npm

## Setup

1. **Install dependencies:**

   ```bash
   cd app
   npm install
   ```

2. **Build TypeScript:**

   ```bash
   npm run build
   ```

3. **Deploy infrastructure:**
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

## Usage

After deployment, the Lambda function will be available via:

- **Function URL**: Direct HTTP endpoint (no authentication required)
- **AWS Console**: Lambda service in AWS Console

The function returns a JSON response with a timestamp:

```json
{
  "message": "Hello World 2024-01-15T10:30:00.000Z"
}
```

## Infrastructure

The Terraform configuration creates:

- **IAM Role**: With Lambda execution permissions
- **Lambda Function**: TypeScript handler with Node.js 18.x runtime
- **Function URL**: Public HTTP endpoint
- **CloudWatch Logs**: Automatic logging

## Development

- Edit `app/src/index.ts` for Lambda logic
- Run `npm run build` to compile TypeScript
- Use `terraform plan` to preview changes
- Use `terraform apply` to deploy updates

## Cleanup

To remove all resources:

```bash
cd terraform
terraform destroy
```
