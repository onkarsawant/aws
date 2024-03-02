
resource "aws_lambda_function" "hello_world" {
  filename      = "hello_world.zip"
  function_name = "hello-world-lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "hello_world.lambda_handler"
  runtime       = "python3.8"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  })
}


