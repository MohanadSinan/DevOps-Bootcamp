import json
import boto3
client = boto3.client('ssm')
parameterUsername = client.get_parameter(Name='/dev/db/database_username')
parameterPassword = client.get_parameter(Name='/dev/db/database_password', WithDecryption=True)
print(parameterUsername['Parameter']['Value'])
print(parameterPassword['Parameter']['Value'])
