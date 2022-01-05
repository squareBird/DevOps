# 서버 환경변수로 관리
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_DEFAULT_REGION=""


provider "aws" {
  access_key = var.accesskey
  secret_key = var.secretkey
  region = "ap-northeast-2"
}