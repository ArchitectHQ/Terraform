data "aws_ssm_parameter" "slack_web_hook_url" {
  name = "/nadcm/slack/webhook_url"
}

data "aws_ssm_parameter" "spark_api_key" {
  name = "/nadcm/spark/api_key"
}

data "aws_ssm_parameter" "spark_url" {
  name = "/nadcm/spark/url"
}

module "demo" {
  source      = "./modules/lambda"
  source_file = "source/lambda_function.py"
  environments = {
    webhook_url = data.aws_ssm_parameter.slack_web_hook_url.value
    api_key     = data.aws_ssm_parameter.spark_api_key.value
    spark_url   = data.aws_ssm_parameter.spark_url.value
  }
}
