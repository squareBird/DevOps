# make s3 bucket
# for version control
aws s3api create-bucket \
--bucket <bucket name> \
--region ap-northeast-2 \
--create-bucket-configuration LocationConstraint=ap-northeast-2