# Core Assignment 4: Log the State of an Amazon EC2 Instance Using CloudWatch Events

**Muhannad Sinan**





> Log the State of an AWS EC2 Instance Using CloudWatch Events (now EventsBridge)
>
> You can create an AWS Lambda function that logs the changes in state for an Amazon EC2 instance.
>
> You can choose to create a rule that runs the function whenever there is a state transition or a transition to one or more states that are of interest.
>
> **Follow the below steps:**
>
> 1. Create a Lambda function to log the state change events. You specify this function when you create your rule.
>
>    Example code for logging the state of EC2 instance
>
> ```
> 'use strict';
> exports.handler = (event, context, callback) => {
> console.log('LogEC2InstanceStateChange');
> console.log('Received event:', JSON.stringify(event, null, 2));
> callback(null, 'Finished');
> };
> ```
>
> 1. Create a rule to run your Lambda function whenever you launch an Amazon EC2 instance.
> 2. Test the rule -- To test your rule, launch an Amazon EC2 instance. After waiting a few minutes for the instance to launch and initialize, you can verify that your Lambda function was invoked.
> 3. Take a screen shot of your results.

## Step1:

Creating a Lambda function to log the state change events. You specify this function when you create your rule.

![screencapture-me-south-1-console-aws-amazon-lambda-home-2022-08-02-19_21_36](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-me-south-1-console-aws-amazon-lambda-home-2022-08-02-19_21_36.png)

Creating a rule to run your Lambda function whenever you launch an Amazon EC2 instance.

![image-20220802192805262](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220802192805262.png)

![image-20220802192832494](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220802192832494.png)

![screencapture-me-south-1-console-aws-amazon-events-home-2022-08-02-19_28_57](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-me-south-1-console-aws-amazon-events-home-2022-08-02-19_28_57.png)

Testing the rule -- To test your rule, launch an Amazon EC2 instance. After waiting a few minutes for the instance to launch and initialize, you can verify that your Lambda function was invoked.

- lunching an instance 

  ![image-20220802193355282](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220802193355282.png)

- EventBridge Monitoring

  ![screencapture-me-south-1-console-aws-amazon-events-home-2022-08-02-19_41_56](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-me-south-1-console-aws-amazon-events-home-2022-08-02-19_41_56.png)

- function Logs

  ![screencapture-me-south-1-console-aws-amazon-lambda-home-2022-08-02-19_43_57](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\screencapture-me-south-1-console-aws-amazon-lambda-home-2022-08-02-19_43_57.png)