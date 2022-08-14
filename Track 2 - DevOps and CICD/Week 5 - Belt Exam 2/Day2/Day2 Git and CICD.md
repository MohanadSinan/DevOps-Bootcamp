# Day2: Git and CICD

**Muhannad Sinan**

## Part-1: Git

Git is software for tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code during software development. In this project you have to take the source code and build your own GitHub repository.

Source code - https://gist.github.com/chandradeoarya/1f5006a7e49ce32ba9cec2765d791e2f/archive/596a33e3a6f2a97efd72f9452c6a484f89e00068.zip

1. Create a GitHub public repository and provide URL.

   > [https://github.com/MohanadSinan/resume](https://github.com/MohanadSinan/resume)

2. Download and Unzip the above file and save it only as **`README.md`** file.
   Now push this `README.md` file in the master branch.

   > **Screenshot of master branch.**
   >
   > ![image-20220808094619947](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808094619947.png)
   >
   > ![Web capture_8-8-2022_95542_github.com](D:\Users\MohanadSinan\Downloads\Web capture_8-8-2022_95542_github.com.jpeg)

3. Create a branch **`devops`** with a list of 5 projects you have done in the DevOps bootcamp.

   > **Screenshot of devops branch.**
   >
   > ![image-20220808101411250](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808101411250.png)
   >
   > ![image-20220808101510204](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808101510204.png)

4. Create a pull request request from `devops` branch to master branch.

   > **Screenshot of pull request.**
   >
   > ![image-20220808102706200](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808102706200.png)

5. Merge this branch with the master branch.

   > **Screenshot of the merging step.**
   >
   > ![image-20220808103225903](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808103225903.png)

6. Create a new issue with adding the CodingDojo-SDA DevOps bootcamp experience.

   > **Screenshot of the issue created in the repository**
   >
   > ![image-20220808103720466](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808103720466.png)

------

<div style="page-break-after:always" />

## Part-2 Jenkins

Jenkins is an open source automation server. It helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery.

Build and Deploy a Java-Maven application via the Jenkins pipeline

Sample application - https://drive.google.com/file/d/19QhPTNmKKyPbIK2ivBZT4Dyf4LhpdY94/view?usp=sharing

**Running application credentials:**
username - `admin1`
password - `secret1`

**Define environmental variable in Elastic beanstalk:**
Under configuration >> Software >> Environment Variable >> PORT 8080

**SonarQube**
You can use this command to start a SonarQube container on dockersudo docker
`run -d --name sonarqube -p 80:9000 -v sonarqube_data:/opt/sonarqube/data -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_logs:/opt/sonarqube/logs sonarqube`

**For backup you can use this server -** 
[52.23.193.18](http://52.23.193.18)
Username - `admin`
Password - `DevOps@2022`
Project naming convention - `online/onsite-YOUR_NAME-B2D2`

Write a Jenkins pipeline in Jenkins DSL language to build, test and deploy the code.

**Checkpoints:**

- Compile the code (This should create an artifact).
- Run unit test.
- Publish the report in Junit format.
- Scan the code using SonarQube (the SonarQube link will be provided by your instructor).
- Publish the artifacts.

7. CICD using Jenkins with S3 and EB.

   1. Setting up GitHub
      Create the repository of the code. Paste the link of your GitHub repository url.

      > [https://github.com/MohanadSinan/Java-Maven](https://github.com/MohanadSinan/Java-Maven)

   2. Setting up Jenkins

      1. Get the IAM user credentials which should have access to S3Full and `ElasticBeanStalkFullAccess`

      2. Store this credentials in Jenkins global credentials with
         **`YOURNAME-aws-secret-key-id`**
         and
         **`YOURNAME-aws-secret-access-key`**.

         > **Screenshot of your global credentials store showing two credentials.**
         >
         > ![image-20220808113156568](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808113156568.png)

   3. Setting up S3 bucket

      1. Create S3 bucket for the application with name. Store the artifact
         Bucket name should be `yourname-belt2d2-artifacts-123456`
         In this naming format

         > **AWS S3 console screenshot**
         >
         > ![image-20220808114609606](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808114609606.png)

   4. Setting up EB application

      1. Create EB application.

      2. Create EB environment name.

      3. Launch the sample application and test.

         > **Screenshot of AWS ElasticBeanstalk console **
         >
         > ![image-20220808174330679](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808174330679.png)

         > **Screenshot of AWS ElasticBeanstalk sample app**
         >
         > ![image-20220808140559791](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808140559791.png)

   5. Creating Jenkins pipeline

      1. Create a new pipeline with GitHub as source and Jenkinsfile with pipeline.
         You should include steps for **quality scan**, **maven build, junit publish report and deploy the application.**

         > **Paste Jenkinsfile code**
         >
         > ```json
         > pipeline {
         >  agent any
         > 
         >  environment {
         > 
         >      AWS_ACCESS_KEY_ID     = credentials('MuhanadSinan-aws-secret-key-id')
         >      AWS_SECRET_ACCESS_KEY = credentials('MuhannadSinan-aws-secret-access-key')
         > 
         >      AWS_S3_BUCKET         = "muhannadsinan-belt2d2-artifacts-2022"
         >      AWS_REGION            = "me-south-1"
         >      ARTIFACT_NAME         = "spring-boot-rest-services-0.0.1-SNAPSHOT.jar"
         >      AWS_EB_APP_NAME       = "MuhannadSinan-Belt2D2-EB"
         >      AWS_EB_APP_VERSION    = "${BUILD_ID}"
         >      AWS_EB_ENVIRONMENT    = "MuhannadSinanBelt2D2-env"
         > 
         >      SONAR_PROJECT_KEY     = "onsite-Muhannad_Sinan-B2D2"
         >      SONAR_IP              = "52.23.193.18"
         >      SONAR_TOKEN           = "sqp_372a3a6d9996be621fed718e863db09228e4d344"
         > 
         >  }
         > 
         >  stages {
         >      stage('Validate') {
         >          steps {                
         >              sh "mvn validate"
         >              sh "mvn clean"
         >          }
         >      }
         > 
         >       stage('Build') {
         >          steps {                
         >              sh "mvn compile"
         >          }
         >      }
         > 
         >      stage('Test') {
         >          steps {                
         >              sh "mvn test"
         >          }
         > 
         >          post {
         >              always {
         >                  junit '**/target/surefire-reports/TEST-*.xml'
         >              }
         >          }
         >      }
         > 
         >      stage('Quality Scan'){
         >          steps {
         >              sh '''
         >              mvn clean verify sonar:sonar \
         >                  -Dsonar.projectKey=$SONAR_PROJECT_KEY \
         >                  -Dsonar.host.url=http://$SONAR_IP \
         >                  -Dsonar.login=$SONAR_TOKEN
         >              '''
         >          }
         >      }
         > 
         >      stage('Package') {
         >          steps {                
         >              sh "mvn package"
         >          }
         > 
         >          post {
         >              success {
         >                  archiveArtifacts artifacts: '**/target/**.jar', followSymlinks: false                   
         >              }
         >          }
         >      }
         > 
         >      stage('Publish artefacts to S3 Bucket') {
         >          steps {
         >              sh "aws configure set region $AWS_REGION"
         >              sh "aws s3 cp ./target/**.jar s3://$AWS_S3_BUCKET/$ARTIFACT_NAME"                
         >          }
         >      }
         > 
         >      stage('Deploy') {
         >          steps {
         >              sh 'aws elasticbeanstalk create-application-version --application-name $AWS_EB_APP_NAME --version-label $AWS_EB_APP_VERSION --source-bundle S3Bucket=$AWS_S3_BUCKET,S3Key=$ARTIFACT_NAME'
         >              sh 'aws elasticbeanstalk update-environment --application-name $AWS_EB_APP_NAME --environment-name $AWS_EB_ENVIRONMENT --version-label $AWS_EB_APP_VERSION'
         >          }
         >      }        
         >  }
         > }
         > ```
         >
         > 

         > **Paste the status of failure or success of pipeline from Jenkins server**
         >
         > ![screencapture-localhost-8080-job-MuhannadSinan-B2D2-2022-08-08-17_43_55](D:\Users\MohanadSinan\Downloads\screencapture-localhost-8080-job-MuhannadSinan-B2D2-2022-08-08-17_43_55.png)

         > **Screenshot of the application launched on ElasticBeanstalk**
         >
         > ![image-20220808174524047](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808174524047.png)

------

<div style="page-break-after:always" />

## Part-3: CodeBuild

AWS CodeBuild is a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy. With CodeBuild, you don't need to provision, manage, and scale your own build servers.

AWS CodePipeline is a continuous delivery service that enables you to model, visualize, and automate the steps required to release your software.

In this question you have to build the project using AWS CodeBuild and deploy using AWS Code deploy or any other code deployment methodology. This whole release automation should be done using AWS code pipeline.

Code base - All details remain as the last question.

8. CICD using CodeBuild

   1. Create the code build project. Show the screenshot of CodeBuild from AWS console.

      > **Screenshot of CodeBuild from AWS console**
      >
      > ![image-20220808212950986](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808212950986.png)

   2. Running code build.

      1. Screenshot of the build history page. We would like to see the last build to be successful.

         > **Screenshot of build history page**
         >
         > ![image-20220808214216484](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808214216484.png)
         >
         > ![image-20220808214228630](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220808214228630.png)

   3. Setting up continuous deployment with AWS Elastic beanstalk or code deploy.

      > **Screenshot of AWS Elastic beanstalk or code deploy AWS console**
      >
      > ![image-20220809022223651](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220809022223651.png)

      4. Setting up code pipeline with name `YOURNAME-Belt2D2-pipeline`.
         Running the CodePipeline.

         > **Screenshot of Successful pipeline execution**
         >
         > ![screencapture-us-east-1-console-aws-amazon-codesuite-codepipeline-pipelines-MuhannadSinan-B2D2-view-2022-08-09-12_32_45](D:\Users\MohanadSinan\Downloads\screencapture-us-east-1-console-aws-amazon-codesuite-codepipeline-pipelines-MuhannadSinan-B2D2-view-2022-08-09-12_32_45.png)