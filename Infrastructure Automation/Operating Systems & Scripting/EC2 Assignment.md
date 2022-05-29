# EC2 Assignment

**Muhannad Sinan**


## Step 1:

> **Note:** To solve this, I used AWS Command Line Interface (AWS CLI) that runs on my windows machine.
>
> ![image-20220529204440560](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529204440560.png)

the following command line is to create an EC2 server using Amazon linux AMI (Image ID ami-0022f774911c1d690) with instance type (t2.micro) and the key pair (AZ-EC2) that I created earlier, and then I specify EBS volume with 20 GB.

```shell
$ aws ec2 run-instances
	--image-id ami-0022f774911c1d690
	--instance-type t2.micro
	--key-name AZ-EC2
	--block-device-mappings 'DeviceName=/dev/xvda,Ebs={VolumeSize=20}'
```

**Output:**

```json
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0022f774911c1d690",
            "InstanceId": "i-0ab44104ca777b5ac",
            "InstanceType": "t2.micro",
            "KeyName": "AZ-EC2",
            "LaunchTime": "2022-05-29T18:18:06+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1d",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-22-163.ec2.internal",
            "PrivateIpAddress": "172.31.22.163",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-061118af1cc6aee49",
            "VpcId": "vpc-0ae7c37590db4000e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "247de2c8-9b86-4e99-a429-c9c1c172a11f",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-05-29T18:18:06+00:00",
                        "AttachmentId": "eni-attach-0bd669111e7659474",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-0bae608cfe2776e82"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:bb:72:1d:e1:db",
                    "NetworkInterfaceId": "eni-08d2353800d2c2c6d",
                    "OwnerId": "568935291733",
                    "PrivateDnsName": "ip-172-31-22-163.ec2.internal",
                    "PrivateIpAddress": "172.31.22.163",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-22-163.ec2.internal",
                            "PrivateIpAddress": "172.31.22.163"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-061118af1cc6aee49",
                    "VpcId": "vpc-0ae7c37590db4000e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-0bae608cfe2776e82"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "568935291733",
    "ReservationId": "r-0095d7012aec3a1ab"
}
```

![image-20220529215245038](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529215245038.png)

Next, to be able to add SSH connection, I had to modify the security group rules that generated when I created the image. the group ID is (sg-0bae608cfe2776e82) but first I should find the security group rule ID.

The following command line shows how to find the security group rule ID for the group ID (sg-0bae608cfe2776e82):

```shell
$ aws ec2 describe-security-group-rules
	--filter Name="group-id",Values="sg-0bae608cfe2776e82"	
```

**Output:**

```json
{
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-07cb11a822823e93e",
            "GroupId": "sg-0bae608cfe2776e82",
            "GroupOwnerId": "568935291733",
            "IsEgress": false,
            "IpProtocol": "-1",
            "FromPort": -1,
            "ToPort": -1,
            "CidrIpv4": "0.0.0.0/0",
            "Tags": []
        },
        {
            "SecurityGroupRuleId": "sgr-0a48c059cce15535c",
            "GroupId": "sg-0bae608cfe2776e82",
            "GroupOwnerId": "568935291733",
            "IsEgress": true,
            "IpProtocol": "-1",
            "FromPort": -1,
            "ToPort": -1,
            "CidrIpv4": "0.0.0.0/0",
            "Tags": []
        }
    ]
}
```

So, the security group rule ID is (sgr-07cb11a822823e93e)

Now let's modify the security group rules, and the new rules should be (Protocol=tcp, Port=22).

The following command line shows how I did it:

```shell
$ aws ec2 modify-security-group-rules
	--group-id sg-0bae608cfe2776e82
	--security-group-rules 'SecurityGroupRuleId=sgr-07cb11a822823e93e,SecurityGroupRule={Description=SSH,IpProtocol=tcp,FromPort=22,ToPort=22,CidrIpv4=0.0.0.0/0}'
```

**Output:**

```json
{
    "Return": true
}
```

![image-20220529215046124](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529215046124.png)

That's it, this is how I created an EC2 server using Amazon linux AMI of t2.micro type with 20 GB of EBS storage and giving it port 22 public access for SSH.

------

## Step 2:

To create a new ssh key pair I run this line of command 

```shell
aws ec2 create-key-pair --key-name NewKeyPair
```

Output:

```json
{
    "KeyFingerprint": "e6:9e:7e:7f:fd:90:6c:45:f4:18:a6:e7:b6:26:d0:c2:6a:31:a4:4f",
    "KeyMaterial": "-----BEGIN RSA PRIVATE KEY-----\nMIIEpQIBAAKCAQEAzEQyxBhB2FNEISVL3c1MyfxgBu8nVx+FN0iK4OyOFbk4Y1QO\nX0YwM/vUXcJI39xZCasFjbTzyMfUCGoWs8wguJgBiRJW2wO1wQCHPor3FR/XYk8H\nN60VoFbrbaoRN2DeQ2m8ehiE1Mnq3NAd+co8dwsboDsgD1hjAm5RsXo2X+I5h4UM\nuXcrQO81tKuGy98pOkERr+a6mB8FLltBQzmRZjhVhiRz/YzROGIjgHAh+kaeGE3F\n1S2kDDVcmcbgYjLhERg6YqCwisI8T1uHS7bFH7IZmvIfxGNgguYS2U3w6s18zkMM\nfWK42VbSSO7CV7uTN00yFm6qmUWYhmG1F006OwIDAQABAoIBAQCS5TCE6NThVvAV\nzhaDCZMBZuc/1Vi7RMWufhKxsixz3uF4PQig537ew2lzi7aQlovJch3qTIlMiLgo\n3PI6lr+pQFdKVc/0bPSWOWUJSzJpFJ716dNM7MIyro9cLAN5icYNQMr0GxHbXOHz\nrg8Ahbl5+pkBX8OshWmeY+uH8FWOGX8Qmm54QGlVuPHmB4f2ZCpBW/tEOma2ltaX\n2eSY0wAtAcuqpmpLwDRFbXOD28I31ypxx9LDmpJ4S/V3R9/KB3vBc/I9yVmkOmhL\nlkWFcUjIunosGsqfB1XgYGZp1HgtsBqgjpsnjsf5jraWOIImqd59g6IyK+cFbpmF\nOy3nm/oBAoGBAO3vSJWlGg28EnQlsgPxUNA/leX2/vFheNGCZWfkDjMVEmYSBq0Z\nxB9cW/ZZIxn02Ph3wpYdqvBkvMDi1xtBPo9hpGQaI32lqocVqy1A9hTgwN7kViDS\nAPBxu6xfx6nI3fydyeYCiRGFmjuQCj5KdrFw6Oe8OzEvp7UBgM0SfZa7AoGBANvG\ngcIOYkyqiSFheGMGHkaGSTMhTl2VLPJ2/3BvyDCBWZlNlTHqsMMfqYbYzgDSIkYk\nXyR8rVR8DteDBe/P7U1pMERuKoe4TUX4uL5FVeX6HV++eu8hZDQfmhAIM6vWRO4d\nPO9jzE4JnyXP5U6NogUYhQjpSNuwIl1jMprk33KBAoGBAK62ZOsVZ9MsBbTptRS2\nDuxLtIs/WibutuPIxyOJT2/tCiyPEf3rjJqmnBSBkYfOxb91WRoXwNxybDOKnf8y\nYniwbyDeHK93hYdZvu8k402jV5yTuDazXeMw8Gj7j8Y5a9/CEW3m8LVAEGeqNgtV\nbGCRE0SOcDyGzLPZ3bU33aZfAoGATKqs7VMzO2dqOvjTlEe4HAYQVwPRYJf/e/3D\nEigMf88/wFjuKOGkFA1hiCbthh/H0QwzHHlZxdUZIFkWoxe3wn9lVRnRQFMssbIY\nUFfDpVxhDttV60GMwRodFmamD9XJaf9NGH2J8dcta3VgmsyRrpFlJzyqK+j/s/A8\n4QfiYwECgYEA4ZDGUEJsXA+9tqSdJRBNSTylY6nIaEEHqsdYNjz2Tjc3MjdvyNKM\n/mN/v6UOgdu8a09NvucV14k+ALt9Sff2gETLW15z6ZXCA5u7Y19qJF1OBFIOfFgh\naqZA1YcEZbpLcyxI8nyTTRD4WhtLhUGBpYwNlNIRgN1epzN167p/FuY=\n-----END RSA PRIVATE KEY-----",
    "KeyName": "NewKeyPair",
    "KeyPairId": "key-0204b8861f60df878"
}
```

![image-20220529220049517](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529220049517.png)



Now let's displays the fingerprint for the key pair (NewKeyPair):

```shell
aws ec2 describe-key-pairs --key-name NewKeyPair
```

**Output:**

```json
{
    "KeyPairs": [
        {
            "KeyPairId": "key-0204b8861f60df878",
            "KeyFingerprint": "e6:9e:7e:7f:fd:90:6c:45:f4:18:a6:e7:b6:26:d0:c2:6a:31:a4:4f",
            "KeyName": "NewKeyPair",
            "KeyType": "rsa",
            "Tags": [],
            "CreateTime": "2022-05-29T17:32:06+00:00"
        }
    ]
}
```

Good, now let's create a new instance with this new key pair (NewKeyPair) and assign the security group ID (sg-0bae608cfe2776e82):

```shell
aws ec2 run-instances
	--image-id ami-0022f774911c1d690
	--instance-type t2.micro
	--key-name NewKeyPair
	--security-group-ids sg-0bae608cfe2776e82
```

**Output:**

```json
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0022f774911c1d690",
            "InstanceId": "i-02d50006d5c575709",
            "InstanceType": "t2.micro",
            "KeyName": "NewKeyPair",
            "LaunchTime": "2022-05-29T19:05:38+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1d",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-29-65.ec2.internal",
            "PrivateIpAddress": "172.31.29.65",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-061118af1cc6aee49",
            "VpcId": "vpc-0ae7c37590db4000e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "1832254e-aa45-4607-8eb4-a913e58fe319",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-05-29T19:05:38+00:00",
                        "AttachmentId": "eni-attach-055fa1476420809c4",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-0bae608cfe2776e82"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:45:8c:d7:38:35",
                    "NetworkInterfaceId": "eni-06f640f31b05094ad",
                    "OwnerId": "568935291733",
                    "PrivateDnsName": "ip-172-31-29-65.ec2.internal",
                    "PrivateIpAddress": "172.31.29.65",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-29-65.ec2.internal",
                            "PrivateIpAddress": "172.31.29.65"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-061118af1cc6aee49",
                    "VpcId": "vpc-0ae7c37590db4000e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-0bae608cfe2776e82"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "568935291733",
    "ReservationId": "r-0b2397878573486c8"
}
```

![image-20220529220718856](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529220718856.png)

------

## Step 3:

> **Note:** To solve this , I used EC2 Instance Connect that running in Amazon linux AMI image I gust created.
>
> ![image-20220529221549052](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529221549052.png)

To install an Apache web server let's update the software on my instance by run the following command:

```bash
sudo yum update -y
```

Now in order to install Apache I should the following command:

```bash
sudo yum install -y httpd
```

Now let's go to the directory `/var/www/html` to create an html file that contains "hello world".

```bash
cd /var/www/html
sudo nano index.html
```
**Output:**

<img src="C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220529224104385.png" alt="image-20220529224104385" style="zoom: 67%;" />