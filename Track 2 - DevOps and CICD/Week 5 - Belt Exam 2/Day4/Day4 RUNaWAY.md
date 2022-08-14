# Day4: RUNaWAY

**Muhannad Sinan**



![img](https://lh3.googleusercontent.com/nY8VvhvoUS66oGivdYBut46u_6iFd99igI6h4BLCLlAm_kpruS_8NMJY4USRAaECzahv-kDdv8hnKcFCbbBtNY80PUmAE8EI6Yd7Urgx5mpFOHIZCyGiY_s7kDCthg_IpaORsEvas6mccM8lJFd5bj4)

**Explanation**: Belt exams are stressful. Sitting so long can harm your health, Coding dojo is building a game RUNaWAY so that you can run at least virtually :P. Code base has been provided. You are supposed to build the docker image of the game and push on docker hub with CICD while following the given checkpoints. Then finally deploy using docker swarm. 

**Checkpoints**:

1. Take code base using git
   [ ](https://github.com/chandradeoarya/dojo-jump)https://github.com/chandradeoarya/RUNaWAY
2. Write Dockerfile.
3. Using Nginx launch the game on port 80.
4. Bind the code path to docker.
5. Rebuild image.
6. Push the image to dockerhub public.
7. CICD deployment using S3 and Elastic beanstalk.
8. Using DockerSwarm deploy on two nodes.

**Submissions** 

1. Building the image

   1. Docker file

      > ```dockerfile
      > FROM nginx
      > 
      > COPY . /usr/share/nginx/html
      > 
      > EXPOSE 80
      > ```
      >
   
   2. All commands used to build image and run container 
   
   > `docker build -t "mohanadsinan/runaway" .`
   >
   > ![image-20220810125828802](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810125828802.png)
   >
   > 
   >
   > `docker run -dit --name RUNaWAYfromDevOps -p 80:80 --mount type=bind,source="C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\RUNaWAY",target=/usr/share/nginx/html mohanadsinan/runaway`
   >
   > `docker run -dit --name RUNaWAYfromDevOps -p 80:80 mohanadsinan/runaway`
   >
   > ![image-20220810131047165](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810131047165.png)

2. Paste the screenshot of the game.
   *Score above 500 may get you 1 marks extra :P*

   > ![image-20220810132942859](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810132942859.png)

3. Push the image to dockerhub. Write the command for doing this

   > `docker push mohanadsinan/runaway`
   >
   > ![image-20220810133340516](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810133340516.png)

4. Push the image to dockerhub and Paste the link of dockerhub public image.

   > [https://hub.docker.com/repository/docker/mohanadsinan/runaway](https://hub.docker.com/repository/docker/mohanadsinan/runaway)
   >
   > ![screencapture-hub-docker-repository-docker-mohanadsinan-runaway-2022-08-10-13_35_56](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\screencapture-hub-docker-repository-docker-mohanadsinan-runaway-2022-08-10-13_35_56.png)

5. CICD using Jenkins with S3 and EB.

   1. Setting up GitHub

      1. Create the repository of the code. Paste the link of your GitHub repository URL.

         > [https://github.com/MohanadSinan/RUNaWAY](https://github.com/MohanadSinan/RUNaWAY)

   2. Setting up Jenkins.

      1. Create **`YOURNAME-dockerhub-token`** and store in Jenkins global credentials.

      2. Create a new IAM user with `S3Full` and `ElasticBeanStalkFullAccess`.

      3. Store this credentials in Jenkins global credentials with
         **`YOURNAME-aws-secret-key-id`** and
         **`YOURNAME-aws-secret-access-key`**.

         > **Screenshot of your global credentials store showing three credentials.**
         >
         > ![image-20220810152832180](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810152832180.png)

   3. Setting up S3 bucket.

      1. Create S3 bucket for the application with name. Store the artifact Dockerrun configuration json file in the S3 bucket.

         Bucket name should be **`YOURNAME-belt2-artifacts-123456`**
         In this naming format.

         > **AWS S3 console screenshot**
         >
         > ![image-20220810153056895](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810153056895.png)

   4. Setting up EB application

      1. Create EB application.

      2. Create EB environment name.

      3. Launch the sample application and test.

         > **Screenshot of AWS ElasticBeanstalk console**
         >
         > ![image-20220810173325912](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810173325912.png)

         > **Screenshot of AWS ElasticBeanstalk sample app**
         >
         > ![image-20220810171650033](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810171650033.png)

   5. Creating Jenkins pipeline.

      1. Create a new pipeline with GitHub as source and Jenkinsfile with pipeline.

      2. It should have Following stages. **Build, login, push, deploy and logout.**

         > **Paste the pipeline**
         >
         > ```json
         > pipeline {
         > 
         > 	agent any
         > 
         > 	environment {
         > 		DOCKERHUB_CREDENTIALS_PSW = credentials('MuhannadSinan-dockerhub-token')
         > 		DOCKERHUB_CREDENTIALS_USR = 'mohanadsinan'
         > 		AWS_ACCESS_KEY_ID = credentials('MuhannadSinan-aws-secret-key-id')
         > 		AWS_SECRET_ACCESS_KEY = credentials('MuhannadSinan-aws-secret-access-key')
         > 		ARTIFACT_NAME = 'Dockerrun.aws.json'
         > 		AWS_S3_BUCKET = 'muhannadsinan-belt2-artifacts-2022'
         > 		AWS_EB_APP_NAME = 'MuhannadSinan-Belt2D4-EB'
         > 		AWS_EB_ENVIRONMENT_NAME = 'muhannadsinanbelt2d4eb-env'
         > 		AWS_EB_APP_VERSION = "${BUILD_ID}"
         > 		AWS_REGION = 'me-south-1'
         > 	}
         > 
         > 	stages {
         > 
         > 		stage('Build') {
         > 			steps {
         > 				sh 'docker build -t mohanadsinan/runaway:latest .'
         > 			}
         > 		}
         > 
         > 		stage('Login') {
         > 			steps {
         > 				sh 'docker login -u=$DOCKERHUB_CREDENTIALS_USR -p=$DOCKERHUB_CREDENTIALS_PSW'
         > 			}
         > 		}
         > 
         > 		stage('Push') {
         > 			steps {
         > 				sh 'docker push mohanadsinan/runaway:latest'
         > 			}
         > 		}
         > 
         >         stage('Deploy') {
         >             steps {
         >                 sh 'aws configure set region $AWS_REGION'
         >                 sh 'aws elasticbeanstalk create-application-version --application-name $AWS_EB_APP_NAME --version-label $AWS_EB_APP_VERSION --source-bundle S3Bucket=$AWS_S3_BUCKET,S3Key=$ARTIFACT_NAME'
         >                 sh 'aws elasticbeanstalk update-environment --application-name $AWS_EB_APP_NAME --environment-name $AWS_EB_ENVIRONMENT_NAME --version-label $AWS_EB_APP_VERSION'
         >             }
         > 	}
         >     }
         > 	post {
         > 		always {
         > 			sh 'docker logout'
         > 		}
         > 	}
         > }
         > ```

         > **Paste the status of failure or success of pipeline from Jenkins server**
         >
         > ![screencapture-157-175-212-170-8080-job-MuhannadSinan-B2D4-2022-08-10-17_36_09](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\screencapture-157-175-212-170-8080-job-MuhannadSinan-B2D4-2022-08-10-17_36_09.png)

         > **Screenshot of the game launched on ElasticBeanstalk**
         >
         > ![image-20220810174607642](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810174607642.png)

6. Create a master and two slave nodes and make them join the master. Now deploy the replicas of the game on each node. 

   1. Paste all the commands for creating the master, slaves, joining the slaves and deploying replica.

      > **master:** 
      > `sudo hostnamectl set-hostname master`
      >
      > `docker swarm init`
      > ![image-20220810193430777](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810193430777.png)
      >
      > 
      >
      > **node1:** 
      > `sudo hostnamectl set-hostname worker1`
      >
      > `docker swarm join --token SWMTKN-1-5gu8j9eh4kyb4wyebko73afilwvu4rwsfh90woip3uz3ahkba0-dv7akob6vfprzvmdoiti18byp 172.31.38.144:2377`
      > ![image-20220810193458662](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810193458662.png)
      >
      > 
      >
      > **node2:**
      > `sudo hostnamectl set-hostname worker2`
      >
      > `docker swarm join --token SWMTKN-1-5gu8j9eh4kyb4wyebko73afilwvu4rwsfh90woip3uz3ahkba0-dv7akob6vfprzvmdoiti18byp 172.31.38.144:2377`
      > ![image-20220810193524341](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810193524341.png)
      >
      > 
      >
      > 
      >
      > **Continue from master:** 
      >
      > `docker node ls`
      >
      > ![image-20220810195225528](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810195225528.png)
      >
      > `git clone https://github.com/MohanadSinan/RUNaWAY.git`
      >
      > ![image-20220810194002332](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810194002332.png)
      >
      > `cd RUNaWAY/`
      >
      > `docker build -t "mohanadsinan/runaway" .`
      > ![image-20220810194536641](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810194536641.png)
      >
      > `docker service create --name RUNaWAYfromDevOps --mode global -p 80:80 mohanadsinan/runaway`
      >
      > ![image-20220810202711240](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810202711240.png)
      >
      > `docker service ls`
      >
      > ![image-20220810202736681](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810202736681.png)

   2. Screenshot of the game deployed on each node with IP address.

      > ![image-20220810202850797](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810202850797.png)

      > ![image-20220810202914433](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day4\_img\image-20220810202914433.png)