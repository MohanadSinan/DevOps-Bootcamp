### DevOps

# Day3 - S3, Route 53, Lambda API gateway, SNS, SQS



1. **S3:**

   1. Creating an S3 bucket - `YourName-sda-devops-1`
      ![screencapture-s3-console-aws-amazon-s3-bucket-create-2022-06-21-09_56_19](./_img/screencapture-s3-console-aws-amazon-s3-bucket-create-2022-06-21-09_56_19-16605096478233.png)

      

   2. Uploading `Image.webp` file in the bucket and provide its S3 URI

      **S3 URI:** `s3://YourName-sda-devops-1/Image.webp`

      ![screencapture-s3-console-aws-amazon-s3-upload-YourName-sda-devops-1-2022-06-21-10_07_58](./_img/screencapture-s3-console-aws-amazon-s3-upload-muhannadsinan-sda-devops-1-2022-06-21-10_07_58-16605096397051.png)

      

   3. Upload a file in the bucket and provide its Object URL
      **Object URL:** `https://YourName-sda-devops-1.s3.me-south-1.amazonaws.com/Image.webp`

      

   4. Allow public access for this file & share the screenshot that it is accessible
      ![screencapture-s3-console-aws-amazon-s3-bucket-YourName-sda-devops-1-property-bpa-edit-2022-06-21-10_15_50](./_img/screencapture-s3-console-aws-amazon-s3-bucket-muhannadsinan-sda-devops-1-property-bpa-edit-2022-06-21-10_15_50-16605097229225.png)

   

      ![screencapture-s3-console-aws-amazon-s3-bucket-YourName-sda-devops-1-property-acl-edit-2022-06-21-10_18_11](./_img/screencapture-s3-console-aws-amazon-s3-bucket-muhannadsinan-sda-devops-1-property-acl-edit-2022-06-21-10_18_11-16605097437197.png)
    ![screencapture-s3-console-aws-amazon-s3-bucket-YourName-sda-devops-1-property-policy-edit-2022-06-21-10_30_10](_img/screencapture-s3-console-aws-amazon-s3-bucket-muhannadsinan-sda-devops-1-property-policy-edit-2022-06-21-10_30_10-16605097600559.png)

![image-20220621103143432](_img/image-20220621103143432-166050976934611.png)


​      

   5. Enable versioning.

      ![image-20220621103400610](_img/image-20220621103400610-166050977357313.png)
      
   6. Create lifecycle management of delete files after one month.
      ![screencapture-s3-console-aws-amazon-s3-management-YourName-sda-devops-1-lifecycle-create-2022-06-21-10_36_22](_img/screencapture-s3-console-aws-amazon-s3-management-muhannadsinan-sda-devops-1-lifecycle-create-2022-06-21-10_36_22-166050978626215.png)

      

   7. Host a static website in S3 and make it publicly accessible.
      ![screencapture-s3-console-aws-amazon-s3-bucket-YourName-sda-devops-1-property-website-edit-2022-06-21-10_52_57](_img/screencapture-s3-console-aws-amazon-s3-bucket-muhannadsinan-sda-devops-1-property-website-edit-2022-06-21-10_52_57-166050980873817.png)
      
      ![image-20220621105510107](_img/image-20220621105510107-166050981546519.png)


​      

   8. Configuring (Entire) Bucket Replica
      ![screencapture-s3-console-aws-amazon-s3-management-YourName-sda-devops-1-replication-create-2022-06-21-11_14_04](_img/screencapture-s3-console-aws-amazon-s3-management-muhannadsinan-sda-devops-1-replication-create-2022-06-21-11_14_04-166050982638721.png)

      

      ![screencapture-s3-console-aws-amazon-s3-management-muhannadsinan-sda-devops-1-replication-create-job-2022-06-21-11_15_45](_img/screencapture-s3-console-aws-amazon-s3-management-muhannadsinan-sda-devops-1-replication-create-job-2022-06-21-11_15_45.png)

   

2. **SAM:**

   1. Take the lambda code given below and test it locally using AWS SAM.

   ```python
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
   ```

   **Step1:** Creating an AWS SAM template with this set of files:

   - `LambdaDevOps`
     - `app.py`
   - `template.yaml`

   **Step2:** `template.yaml` will be as follows:

   ```yaml
   AWSTemplateFormatVersion: "2010-09-09"
   Transform: AWS::Serverless-2016-10-31
   Description: >
     Belt Exam 1 Day 3: Deploying a Python code snippet in AWS SAM
   
   Resources:
     LambdaDevOpsFunction:
       Type: AWS::Serverless::Function
       Properties:
         CodeUri: LambdaDevOps/
         Handler: app.lambda_handler
         Runtime: python3.9
         Events:
           LambdaDevOps:
             Type: Api
             Properties:
               Path: /LambdaDevOps
               Method: get
   
   Outputs:
     LambdaDevOpsApi:
       Description: "API Gateway endpoint URL for Prod stage for LambdaDevOps function"
       Value: !Sub "https://${ServerlessRestApi}.execute-api.${AWS::Region}.amazonaws.com/Prod/LambdaDevOps/"
     LambdaDevOpsFunction:
       Description: "LambdaDevOps Lambda Function ARN"
       Value: !GetAtt LambdaDevOpsFunction.Arn
     LambdaDevOpsFunctionIamRole:
       Description: "Implicit IAM Role created for LambdaDevOps function"
       Value: !GetAtt LambdaDevOpsFunctionRole.Arn
   ```

   **Step3:** Building a serverless application with the command `sam build`

   ![image-20220621122454572](_img/image-20220621122454572-166050987916727.png)

   **Step4:** Deploying an AWS SAM application with the command `sam deploy --guided`



2. once it is successful, deploy the application to the lambda function
   Deploying an AWS SAM application with the command `sam deploy --guided`   ![image-20220621125217347](_img/image-20220621125217347-166050988423129.png)
   ![image-20220621125315958](_img/image-20220621125315958-166050989438231.png)
   ![image-20220621125359484](_img/image-20220621125359484-166050990035533.png)

   

3. access the application by invoking the newly created API

   ![image-20220621135519084](_img/image-20220621135519084-166050990534935.png)


3. **Lambda API using API gateway** 

   1. Creating function 
       - Name: `YourName-RandomNumber` 
       - Runtime: python 3.8 
       - Role: Create a new role with basic Lambda permissions 
       - Click "Create function"

   ![screencapture-me-south-1-console-aws-amazon-lambda-home-2022-06-21-13_58_09](_img/screencapture-me-south-1-console-aws-amazon-lambda-home-2022-06-21-13_58_09-166050991168437.png)

   2. Paste the function code 
   
     ```python
     from random import randint
     
     print('Loading RandomNumber function')
     
     def lambda_handler(event, context):
        myNumber = randint(0,1000)
        print(f"Random No. Dev [{myNumber}]")
        return myNumber
     ```
   3. Create a sample test 
      
      ![screencapture-me-south-1-console-aws-amazon-lambda-home-2022-06-21-14_04_11](_img/screencapture-me-south-1-console-aws-amazon-lambda-home-2022-06-21-14_04_11-166050991811339.png)
      
     1. Run the function and paste a screenshot of the successful log. 
        
        ![image-20220621141205705](_img/image-20220621141205705-166050992580941.png)
        
   5. Create a REST regional API `YourName-GetRandomNumber` API 
      
      ![image-20220621141552776](_img/image-20220621141552776-166050992987343.png)
      
      
      
   6. Create get method `/get-random-number`
      With following configuration.
   
      - Lambda Proxy integration: Leave blank 
      - Region: us-east-1
      - Name: `GetRandomNumber`
   
      ![image-20220621142317073](_img/image-20220621142317073-166050993494145.png)
   
   
   ![image-20220621142403317](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220621142403317.png)
   
   
   7. Create Dev stage and deploy method 
      
      ![image-20220621143543318](_img/image-20220621143543318-166050993906747.png)
      
      
      
   8. Create Prod stage and deploy prod method 
      ![image-20220621143623572](_img/image-20220621143623572-166050994364749.png)

