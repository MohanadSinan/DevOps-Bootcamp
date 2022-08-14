# Core Assignment 1: Create a Dashboard in AWS CloudWatch

**Muhannad Sinan**



> **Create a dashboard in AWS CloudWatch with the following widgets.**
>
> 1. Add a widget to compare metrics over time
>
> 2. 1. Select data source as metrics
>    2. Resource – EC2 Instance (Select available EC2 instances)
>    3. Metrics – CPU Utilization 
>    4. Monitor the CPU Utilization for the selected EC2 instance.
>
> 3. Add a widget to present multiple metrics in a single view.
>
> 4. 1. Type – Pre-filled Explorer widget
>    2. Template – EC2
>    3. Choose some metrics like CPU Utilization, Network In, Network Out etc 
>    4. Choose some tags, for example – Instance type = t2.micro
>    5. Aggregate by–average 
>    6. Save the dashboard
>

------

## Step1:

Go to [CloudWatch](https://console.aws.amazon.com/cloudwatch/home) in AWS Console and navigate to **Dashboards** > **Create Dashboards** and let's call it for example `EC2instances`.

<img src="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730113612882.png" alt="image-20220730113612882" style="zoom:60%;" />

Now we'll add a new widget,  let's select **Line** as a widget type.

![image-20220730114136158](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730114136158.png)

And then select data source as metrics.

![image-20220730114223563](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730114223563.png)

Now let's select an existing EC2 Instance as a resource. **EC2 > Per-Instance Metrics > *(Select available EC2 instances)* > Metric name[CPUUtilization]**

![image-20220730115633308](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730115633308.png)

That's it now we can monitor the CPU Utilization of our EC2 instance.

![image-20220730123908345](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730123908345.png)

![image-20220730123849250](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730123849250.png)

------

## Step2:

To add a widget to present multiple metrics in a single view, go to the resent created dashboard and **Add widget > EC2 > Per-Instance Metrics > *(Select available EC2 instances)* > Metric name[CPUUtilization, NetworkIn and NetworkOut]**

![image-20220730124331177](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730124331177.png)

That's it now we can monitor the CPU Utilization, Network In and Network Out of our EC2 instance all in a single view.

![image-20220730125453790](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730125453790.png)

![image-20220730125225754](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 3 - AWS Native DevOps\Assignments\_img\image-20220730125225754.png)