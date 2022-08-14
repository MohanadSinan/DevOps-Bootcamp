import json
import os


def lambda_handler(event, context):
    # print (event)
    statusCode = 200
    return {
        "statusCode": statusCode,
        "body": json.dumps(["ansible", "jenkins", "docker", "k8s"]),
        "headers": {
            "Content-Type": "application/json"
        }
    }
