data "archive_file" "python_lambda_package" {
  type        = "zip"
  source_file = var.source_file
  output_path = "source.zip"
}

resource "aws_lambda_function" "test_lambda_function" {
  function_name    = "demo"
  filename         = "source.zip"
  source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
  role             = aws_iam_role.lambda_role.arn
  runtime          = "python3.12"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  environment {
    variables = var.environments
  }
}
