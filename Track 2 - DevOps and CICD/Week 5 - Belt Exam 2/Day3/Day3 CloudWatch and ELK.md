# Day3: CloudWatch and ELK

**Muhannad Sinan**

## Part-1: CloudWatch

Amazon CloudWatch is a monitoring and management service that provides data and actionable insights for AWS, hybrid, and on-premises applications and infrastructure resources.
In this question you have to create AWS events, alarms and dashboard with the given requirements.

1. **CloudWatch event rule**

   1. Trigger SNS on root login using AWS console
      Rule name format - **`YOURNAME-root-login-trigger-sns`**
      **How to trigger -** You must login with root login user in your AWS account.

      > **Screenshot of event rule in WAS console**
      >
      > ![screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-08-10-01_11_24](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\screencapture-me-south-1-console-aws-amazon-sns-v3-home-2022-08-10-01_11_24.png)
      >
      > 
      >
      > ![screencapture-me-south-1-console-aws-amazon-events-home-2022-08-10-01_13_19](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\screencapture-me-south-1-console-aws-amazon-events-home-2022-08-10-01_13_19.png)
      >
      > .
      >
      > 

      > **Screenshot of SNS subscription confirmation email received in your inbox**
      >
      > <img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810010827989.png" alt="image-20220810010827989" style="zoom:67%;" />
      >
      > <img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810010925891.png" alt="image-20220810010925891" style="zoom: 67%;" />
      >
      > 
      >
      > <img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810013609275.png" alt="image-20220810013609275" style="zoom: 50%;" />

   2. Trigger SNS on CodeBuild failure

      Rule name format - **`YOURNAME-codebuild-failure`**
      **How to trigger -** You can create a new CodeBuild or use the one from the last exam/assignment. You have to trigger a failure. You can either delete the S3 bucket being used (easiest) , remove the artifact etc.

      > **Screenshot of event rule in AWS console**
      >
      > ![image-20220809172640224](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220809172640224.png)
      >
      > ![image-20220809172809656](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220809172809656.png)
      >
      > 
      >
      > ![screencapture-me-south-1-console-aws-amazon-events-home-2022-08-10-01_44_18](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\screencapture-me-south-1-console-aws-amazon-events-home-2022-08-10-01_44_18.png)

      > **Screenshot of SNS subscription confirmation email received in your inbox**
      >
      > ![image-20220809172727510](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220809172727510.png)
      >
      > <img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220809172743741.png" alt="image-20220809172743741" style="zoom:67%;" />

2. **CloudWatch alarm**

   1. Alarm whenever the second item is uploaded in S3 bucket
      Alarm naming format - **`yourname-s3-upload-maxout-123456`**
      **How to trigger -** Create a new S3 bucket and upload an item. Now upload the second item and it should trigger an alarm.
      **Hint** - You can use *`NumberOfObjects`* as metric in S3 metrics

      > **Screenshot of alarm raised**
      >
      > ![image-20220810045304894](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810045304894.png)
      >
      > ![image-20220810050335880](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810050335880.png)

3. **CloudWatch dashboard**

   1. Create a CloudWatch dashboard with four widgets - 
      EC2 All resources - `NetworkPacketsOut`
      EC2 All resources - `NetworkOut`
      EC2 All resources - `CPUUtilization`
      AWS Lambda All lambda - `Invocations`

      > ![image-20220810021015798](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810021015798.png)

------

<div style="page-break-after:always" />

## Part-2: ELK

**Overview:**
User registration is an essential component of any application. We must monitor any error like user not found etc. as it could point to a potential problem in our application, database or just a simple ddos attack to overwhelm our backend system. 

In this project you have been given a maven spring boot project and instructions on how to run it. You can follow the following steps to complete the whole project and monitor using ELK stack with filebeat.

**Architecture:**![img](https://lh6.googleusercontent.com/KOuwklPjSdB1yzWiAXp2-z_Hwoqg9lKfqLugJtoFvGERspPnuBdraQHZsBTj5UCh581VbgFMIplSe0YSFpzZ5IUAqMMzJ83TmhApuYsdt5cODgGnK86uA5V4bDrhdm6dQ7f7LGquUxzYbRmFsM8bU1o)
**Checkpoints:**
We recommend you to set up this project on t2.medium on ubuntu-22 and minimum 15gb EBS volume space as it is resource heavy. You must terminate the server after finishing the work.

You have to do the following three setup properly.

- **ELK stack setup**
  - Setup ELK stack.
  - Enable Logstash to take input from beats.
  - Install Filebeat and enable it to send logs to logstash.

- **Application setup**

  - On the same server git clone the code
    https://github.com/chandradeoarya/elk-mvnSpring-logging

  - Install maven on the same server and run the following commands.
    `cd elk-mvnSpring-logging`
    `nohup mvn spring-boot:run > mvn-spring.log &`

  - This will create a log file with the name elk-stack.log in this path- 
    `/home/ubuntu/elk-mvnSpring-logging`

    ![img](https://lh4.googleusercontent.com/Vz5VgSnM9cXYnfrcyFgdlyHEqZhKkhSH2G0i1v4nZiBD2jNL98qMcfWJEVmvZzjMevuepaa59evnYJscZxJ18R_o2TpFsh5L3QB_MybYJY793ryLTiWqsSmFvOx28votvAY5h40INcEBymFKN239lxY)

  

- **Monitoring setup**

  - You should give this path in filebeat configuration in log type filestream.
  - Now make some 5-10 API requests with existing and non-existing user IDs using chrome browser or postman. Must open **port 9898** on Security group. This generated logs on this path `/home/ubuntu/elk-mvnSpring-logging`
  - Following user IDs are present. 1,2,3,4,5,6
  - Rest all users are not present.
  - For example:
    Found - [http://YOUR-SERVER-IP:9898/getUser/1](http://your-server-ip:9898/getUser/1)
    Unfound - [http://YOUR-SERVER-IP:9898/getUser/543](http://your-server-ip:9898/getUser/543)

4. **ELK Exam questions:**

   1. Show the successful setup of elasticsearch in ELK stack. Paste the screenshot of following command.
      `curl localhost:9200`

      > ![image-20220810031326826](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810031326826.png)

   2. Show the successful setup of ELK stack. Paste the screenshot of Kibana with the IP address.

      > ![image-20220810031731650](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810031731650.png)

   3. Show the successful setup of filebeat in ELK stack. Paste the screenshot of the following command.
      `curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty' | grep -i 'path'`
      It should look something like this.
      ![img](https://lh4.googleusercontent.com/vtJs22Lsa57JMBaEmjs0t8MDRY2ZdMBTpaNKadci0btzA8qTc-r8l1_IjLDRIX_TGHqYZd9nWbWwSVVHPZMALqb0m7Xef8ugqGrlJFmIrmWmi8l_eTosj5diRXVfitcLePE5ft6XS3vFw-ExEkJgxvk)

      > ![image-20220810042347216](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810042347216.png)

   4. If your setup of ELK with filebeat was successful then you should get the logs in Kibana. Show this filestream in Kibana discover.
      It should look something like this.
      ![img](https://lh6.googleusercontent.com/wSexQlEnJMIG9RtWLi7qq9mrUpicim2LO-UMBaQFu4Jd5-rSHFqrr6eUwOuWRfSlkyeXgDZBPVe0e3EEC1Lmac3gz9o9jwurFQFX7gfU5elw-gLng5Uvf-27qiPQbj3eef94LayIc_YafkA1M4QQ20w)

      > **filestream in Kibana discover.**
      >
      > ![image-20220810042447577](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810042447577.png)

   5. Show User found messages
      ![img](https://lh4.googleusercontent.com/SI2WnDjMUNpZO8WX9CwLyc8nNSNbZSGvrB4qT3ocmMYPTRi3_z8j5iR_g7awW8XGvKgi_LfYCqEGj8hw48YqyXFr1bS6L5WAUlNJ2ujMUGLFBigHJl4DswU1xfHTlNYrOwvrpiyyc_-5VHrjiPaEOVA)
      It should look something like this.

      > **Screenshot of User found messages**
      >
      > ![image-20220810042803783](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810042803783.png)
      >
      > ![image-20220810042901470](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810042901470.png)

   6. Show User unfound messages
      It should look something like this.
      ![img](https://lh6.googleusercontent.com/o32ttcOmCk1of9IQCIhtu2oaD82ysFLFCg4Da4EalIpl7BorRzEUxn0jeugidhyu8WhQJ4-xQtrHvpgcdCE0ggWzI0XY3lPvkFLbt5NkMDgMTzJjFRbOrt-k9gWiEIaSfKls3-kEWc5bpjeGXNufCKU)

      > **Screenshot of user unfound messages**
      >
      > ![image-20220810043137320](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day3\_img\image-20220810043137320.png)