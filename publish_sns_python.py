import boto3, datetime

# code to publish a message to an SNS topic

def publish_sns_message(topic_arn, message):
    sns_client = boto3.client("sns")
    response = sns_client.publish(
        TopicArn=topic_arn,
        Message=message
    )
    return response

if __name__ == "__main__":
    topic_arn = "arn:aws:sns:us-east-1:097984239498:test-cron-ec2"  # Replace with your SNS topic ARN
    current_time = datetime.datetime.now().isoformat()
    message = f"Hello, this is a test message from Python! Current time is {current_time}"
    
    response = publish_sns_message(topic_arn, message)
    print("Message published. Message ID:", response["MessageId"])