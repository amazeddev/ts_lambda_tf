provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id
  policy = file("lambda_execution_policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = file("lambda_assume_role_policy.json")
}

data "archive_file" "hello_ts_lambda_function" {
  type        = "zip"
  source_dir  = "../app"
  output_path = "hello_ts.zip"
  excludes    = ["src", "node_modules/.cache", "*.ts", "tsconfig.json", "package-lock.json"]
}

resource "aws_lambda_function" "hello_ts_lambda" {
  function_name = "hello_ts"
  filename = data.archive_file.hello_ts_lambda_function.output_path
  source_code_hash = data.archive_file.hello_ts_lambda_function.output_base64sha256
  role = aws_iam_role.lambda_role.arn
  handler = "dist/index.handler"
  runtime = "nodejs18.x"
}

resource "aws_lambda_function_url" "hello_ts_lambda_url" {
  function_name      = aws_lambda_function.hello_ts_lambda.function_name
  authorization_type = "NONE" # Change to "AWS_IAM" for restricted access
} 