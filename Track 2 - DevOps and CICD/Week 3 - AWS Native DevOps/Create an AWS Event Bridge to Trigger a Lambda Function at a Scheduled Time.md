# Core Assignment 3: Create an AWS Event Bridge to Trigger a Lambda Function at a Scheduled Time

**Muhannad Sinan**



> 1. Create a lambda function in any programming language of your choice (You can also use a simple hello-world function as well for this)
> 2. Create an AWS event bridge to trigger this above lambda function at regular intervals (say every 15 minutes)
> 3. Monitor the trigger of the events 
> 4. Share the screenshot of the event-triggered and the logs from the lambda function execution

------

## Step1:

Let's create a [Lambda](https://console.aws.amazon.com/lambda/home) function first. (You can also use a simple hello-world function blueprint)

![image-20220730151419980](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730151419980.png)

![image-20220730151746921](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730151746921.png)

creating a test event and deploy a new test

![image-20220730151927928](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730151927928.png)

------

## Step2:

Creating an AWS [EventBridge](https://console.aws.amazon.com/events/home) to trigger this above lambda function at regular intervals (say every 15 minutes)

![image-20220730152915008](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730152915008.png)

![image-20220730153132416](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730153132416.png)

![image-20220730153452109](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730153452109.png)

Monitoring the trigger of the events

![screencapture-us-east-1-console-aws-amazon-events-home-2022-07-30-15_36_20](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-us-east-1-console-aws-amazon-events-home-2022-07-30-15_36_20.png)

![screencapture-us-east-1-console-aws-amazon-lambda-home-2022-07-30-15_42_30](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-us-east-1-console-aws-amazon-lambda-home-2022-07-30-15_42_30.png)