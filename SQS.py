import boto3, json

sqs_client = boto3.client(
    service_name='sqs',
    region_name='ap-northeast-2'
)

response = sqs_client.send_message(
    QueueUrl='https://sqs.ap-northeast-2.amazonaws.com/910002914058/TEST',
    MessageBody='메시지 내용'
)

print(json.dumps(response))