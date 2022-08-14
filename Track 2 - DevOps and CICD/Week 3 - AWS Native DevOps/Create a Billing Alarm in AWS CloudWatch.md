# Core Assignment 2: Create a Billing Alarm in AWS CloudWatch

**Muhannad Sinan**



> Create a Billing Alarm in AWS CloudWatch to send an email notification when the estimated charges go above $10USD.

------

## Step1:

Go to [CloudWatch](https://console.aws.amazon.com/cloudwatch/home) in AWS Console and navigate to **Alarms > Billing  >Create Alarm > Select metric> Billing > Total Estimated Charge**

![image-20220730131220792](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730131220792.png)

In **Conditions** let's add the maximum amount of money to trigger the notification `[$10USD]`.

![image-20220730131545626](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730131545626.png)

After that let's create a new SNS topic and let's call it for example `Billing_CloudWatch_Alarms_Topic` and then specify the email address that will be able to reserve the notifications.

![image-20220730132039861](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730132039861.png)

Preview 

<img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730132344125.png" alt="image-20220730132344125" style="zoom:150%;" />

<img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730132408006.png" alt="image-20220730132408006" style="zoom:150%;" />

Alarm created successfully 

![image-20220730132524820](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730132524820.png)