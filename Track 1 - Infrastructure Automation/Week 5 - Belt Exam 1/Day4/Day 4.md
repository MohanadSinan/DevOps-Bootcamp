### DevOps

# Day4 - SNS SQS Beanstalk and SSM



1. **Simple EB.**

​          1.1.     Launch the [2048](https://github.com/chandradeoarya/2048.git) application on EB `us-east-1` `php` **`--single instance`**. You must change make the following changes in the code.

> You have to open `index.html` line no. 76 and 80 and give your name and your cohort name in the place of player's name.

***Ans.***
![screencapture-me-south-1-console-aws-amazon-elasticbeanstalk-home-2022-06-22-11_46_49](_img/screencapture-me-south-1-console-aws-amazon-elasticbeanstalk-home-2022-06-22-11_46_49-16605103006781.png)
![screencapture-muhannadsinansingleinstance-env-eba-j9stetgx-me-south-1-elasticbeanstalk-2022-06-22-10_01_03](_img/screencapture-muhannadsinansingleinstance-env-eba-j9stetgx-me-south-1-elasticbeanstalk-2022-06-22-10_01_03-16605103086203.png)
**The Game URL: [http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/](http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/)**



​          1.2.     Now You must change make the following changes in the code.


You have to open `style/main.css` **line no. 5** and change color `background: #000000;` to `background: #faf8ef;` as blue-green deployment.

And create `version-2` version of the app.
**The Game version-2 URL:** [http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/](http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/)
![screencapture-muhannadsinansingleinstance-env-eba-j9stetgx-me-south-1-elasticbeanstalk-2022-06-22-10_40_38](_img/screencapture-muhannadsinansingleinstance-env-eba-j9stetgx-me-south-1-elasticbeanstalk-2022-06-22-10_40_38-16605103159605.png)



​          1.3.     Now perform the blue green deployment using url swap.
![image-20220622120630568](_img/image-20220622120630568-16605103390217.png)

![screencapture-me-south-1-console-aws-amazon-elasticbeanstalk-home-2022-06-22-12_07_05](_img/screencapture-me-south-1-console-aws-amazon-elasticbeanstalk-home-2022-06-22-12_07_05-16605103448439.png)

|                                                              |
| ------------------------------------------------------------ |
| **The Game version-1 URL:** [http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/](http://muhannadsinan2048gamev1-env.eba-aiqtvysv.me-south-1.elasticbeanstalk.com/) |
| **The Game version-2 URL:** [http://muhannadsinan2048gamev1-dev-env.me-south-1.elasticbeanstalk.com/](http://muhannadsinan2048gamev1-dev-env.me-south-1.elasticbeanstalk.com/) |

 

​          1.4.     Terminate the environment. 
![image-20220622132812014](_img/image-20220622132812014-166051035189711.png)

![image-20220622133218837](_img/image-20220622133218837-166051035881213.png)

   

​          1.5.     Delete the application. 
![image-20220622133311539](_img/image-20220622133311539-166051036282115.png)

![image-20220622113538136](_img/image-20220622113538136-166051036721717.png)



2. Use aws ssm parameters to store two credentials. **`/dev/db/database_username`** and **`/dev/db/database_password`**. Print that using AWS CLI or python

​     Print that using AWS CLI. Use the commands below in python code or use cli commands.

```python
import json
import boto3
client = boto3.client('ssm')
parameterUsername = client.get_parameter(Name='/dev/db/database_username')
parameterPassword = client.get_parameter(Name='/dev/db/database_password, WithDecryption=True)
print(parameterUsername['Parameter']['Value'])
print(parameterPassword['Parameter']['Value'])
```

| ![image-20220622134633377](_img/image-20220622134633377-166051037406119.png)<br />![image-20220622134610212](_img/image-20220622134610212-166051037406120.png) |
| ------------------------------------------------------------ |
| ![image-20220622135849671](_img/image-20220622135849671-166051038078223.png) |
| ![image-20220622143316841](_img/image-20220622143316841-166051038747325.png) |

 

3. **SNS**

​          3.1.     Create a topic `YourName-Server-down-alert` in SNS
![screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_21_50](_img/screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_21_50-166051039186227.png)



​          3.2.     Create a subscription `YourName-report-admin-email` with subscription type EMAIL
![screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_25_37](_img/screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_25_37-166051045278129.png)



​          3.3.     Confirm the subscription in the email that you receive from AWS.
![image-20220622141001266](_img/image-20220622141001266-166051045713131.png)



​          3.4.     Publish a sample message to SNS.
![screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_30_26](_img/screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-06-22-01_30_26-166051046642633.png)

![image-20220622140926247](_img/image-20220622140926247-166051047169935.png)



4. **SQS**

​          4.1.     Create an SQS queue with name `YourName-analytics-done`

- Keep parameters as this
- Visibility timeout - 30 sec
- Message retention period - 2 days

![screencapture-me-south-1-console-aws-amazon-sqs-v2-home-2022-06-22-14_15_47](_img/screencapture-me-south-1-console-aws-amazon-sqs-v2-home-2022-06-22-14_15_47-166051047745337.png) 

 

​         4.2.     Send a test message. Paste screenshot of the AWS console.
![screencapture-me-south-1-console-aws-amazon-sqs-v2-home-2022-06-22-01_52_07](_img/screencapture-me-south-1-console-aws-amazon-sqs-v2-home-2022-06-22-01_52_07-166051048406239.png)

![image-20220622154946360](_img/image-20220622154946360-166051048959941.png)

5. **AWS SSM**

​          5.1.     Create 2 two Amazon linux2 servers and tag one of them as **`Dev`** and Another **`Prod`.** Now create resource group **`OnPremise`** and Add these servers in a **`OnPremise`** resource group
![screencapture-me-south-1-console-aws-amazon-resource-groups-groups-new-2022-06-22-14_40_24](_img/screencapture-me-south-1-console-aws-amazon-resource-groups-groups-new-2022-06-22-14_40_24-166051049357543.png)



​          5.2.     Create document to install apache as given in the screenshot below and now install apache in the **`OnPremise`** resource group.

YML document code.

```yaml
---
schemaVersion: '2.2'
description: YAML template which will install Apache on an EC2 instance
parameters: 
  InitialWebText:
    type: "String"
    description: "Initial message"
    default: "Welcome to instance "
mainSteps:
- action: aws:runShellScript
  name: configureApache
  inputs:
    runCommand:
    - 'sudo yum update -y'
    - 'sudo yum install -y httpd'
    - 'sudo systemctl start httpd.service'
    - 'sudo systemctl enable httpd.service'
    - 'echo "{{InitialWebText}} $(hostname -f) , running Apache, installed with AWS Systems Manager" > /var/www/html/index.html'
```

![screencapture-me-south-1-console-aws-amazon-systems-manager-run-command-send-command-2022-06-22-14_47_47](_img/screencapture-me-south-1-console-aws-amazon-systems-manager-run-command-send-command-2022-06-22-14_47_47-166051050080245.png)

![screencapture-me-south-1-console-aws-amazon-systems-manager-run-command](_img/screencapture-me-south-1-console-aws-amazon-systems-manager-run-command.png)

![image-20220622192038372](_img/image-20220622192038372-166051053474653.png)