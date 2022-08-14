# Connect to a Repository

**Muhannad Sinan**



> **Assignment Overview**
>
> This assignment will test the students' overall understanding of working with AWS CodeCommit, connecting to and cloning a repository.
>
> In the IAM console, you can configure Git credentials for AWS CodeCommit repositories, and then use those credentials for HTTPS connections. With a static user name and password, you can also use these credentials with third-party tools and individual development environments (IDEs) that support HTTPS authentication.

## Step1: Initial configuration for CodeCommit

> Follow these steps for setting up an Amazon Web Services account, creating an IAM user, and configuring CodeCommit access.
>
> **To create and configure an IAM user for accessing CodeCommit**
>
> 1. Create an AWS account [here](http://aws.amazon.com/) by clicking on **Sign Up**.
>
> 2. Create an IAM user in your AWS account, or use an existing one. Ensure that the IAM user has an access key ID and secret access key.
>
> 3. Sign in to the AWS Management Console and open the IAM console [here](https://console.aws.amazon.com/iam/).
>
> 4. Choose **Users** from the navigation pane of the IAM console, and then select the IAM user you wish to configure for CodeCommit access.
>
> 5.  Choose **Add Permissions** on the **Permissions** tab.
>
> 6. Choose **Attach existing policies directly** in the **Grant Permissions** tab.
>
> 7. Select
>
>     
>
>    AWSCodeCommitPowerUser
>
>     
>
>    or another managed policy for CodeCommit access from the list of policies. 
>
>    After you have selected the policy you want to attach, choose **Next: Review** to review the list of policies to attach to the IAM user. If the list is correct, choose to **Add permissions**.
>    Use the AWS CLI commands with CodeCommit by installing the AWS CLI.
>
> > **Note
> > **CodeCommit requires AWS Key Management Service. Ensure there are no policies associated with the IAM user that restrict the AWS KMS actions required by CodeCommit if you are using an existing IAM user. 

**First:**  go to the `aws IAM page > users > add user`

**Second:** Ensure that the IAM user has an **access key ID** and **secret access key**.

![Web capture_4-8-2022_112154_us-east-1.console.aws.amazon.com](D:\Users\MohanadSinan\Downloads\Web capture_4-8-2022_112154_us-east-1.console.aws.amazon.com.jpeg)

**Third:**

- Choose **Add Permissions** on the **Permissions** tab.
- Choose **Attach existing policies directly** in the **Set Permissions** tab.
- Select the **Permissions for** CodeCommit access from the list of policies.
- in this case the Permission is AWSCodeCommitFullAccess.

![image-20220804112408751](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220804112408751.png)

**Forth:**  now press the create user button and download the csv file for the credn of the user ( we will need it to connect in the aws cli file

![image-20220804112633395](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220804112633395.png)

### Step 2: Creating credentials for Git connections via HTTPS

> You need to create Git credentials for your IAM user after installing Git.
>
> ***\*To set up HTTPS Git credentials for CodeCommit\****
>
> 1. Log in to the AWS Management Console and open the IAM console [here](https://console.aws.amazon.com/iam/). Verify that you are logged in as the IAM user that will create and use the Git credentials for connections to CodeCommit.
> 2. Select your IAM user from the list of users in the **Users** section of the IAM console.
> 3. Select the **Security Credentials** tab, and then choose to **Generate** in the **HTTPS Git credentials for the AWS CodeCommit** section.
>
> **Figure 1** ***CodeCommit Console\***
>
> ![img](https://s3.us-east-1.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/1650458987__CodeCommit%20activity%201.png)
>
> Note: *CodeCommit Console.* AWS CodeCommit User Guide. Retrieved April 20, 2022, from https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html.
>
> > **Note
> > **Your CodeCommit credentials can be viewed and managed directly in My Security Credentials.
>
> \4. IAM will generate a user name and password for you. You can copy and paste this information into a secure file on your local computer, or you can download it as a .CSV file by choosing **Download credentials**. This information is required to connect to CodeCommit.
>
> **Figure 2** ***CodeCommit Console\***
>
> ![img](https://s3.us-east-1.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/1650459272__CodeCommit%20activity%202.png)
>
> Note: *CodeCommit Console.* AWS CodeCommit User Guide. Retrieved April 20, 2022, from https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html.
>
> \5. After saving your credentials, choose **Close**.
>
> **Important!
> **
>
> **This is your only chance to save your username and password. If you don't save them, you can copy the user name from the IAM console, but you won't be able to see the password. To view the password in that case, you must first reset it.**

**First:**

- Select your IAM user from the list of users in the **Users** section of the IAM console.
- Select the **Security Credentials** tab, and then choose to **Generate** in the **HTTPS Git credentials for the AWS CodeCommit** section.

![image-20220804112952779](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220804112952779.png)

### Step 3: Connect to the CodeCommit console and clone the repository

> If an administrator has already provided you with the name and connection details for the CodeCommit repository, you can skip this step and go directly to cloning the repository.
>
> **To connect to a CodeCommit repository**
>
> 1. Visit [here](https://console.aws.amazon.com/codesuite/codecommit/home) to open the CodeCommit console
>
> 2. Choose the AWS Region in which the repository was created in the region selector. Repositories are specific to an AWS Region. 
>
> 3. Choose the repository you want to connect to from the list. Choose
>
>     
>
>    Clone URL
>
>     
>
>    and then the protocol you want to use to clone or connect to the repository. Your Clone URL will be copied.
>
>    - You will need to copy the HTTPS URL if you are using Git credentials with your IAM user or the credential helper included with the AWS CLI.
>    - When using the **git-remote-codecommit** command on a local computer, copy the HTTPS (GRC) URL.
>    - If you are using an SSH public/private key pair with your IAM user, copy the SSH URL.
>
>    > **Note
>    > **You will see the **Welcome** page instead of a list of repositories if no repositories are associated with your AWS account in the AWS Region where you are logged in. 
>
> 4. Launch a terminal, command line, or Git shell. Run the **git clone** command with the HTTPS clone URL you copied. This will clone the repository. As an example, to clone a repository named `MyDemoRepo` into a local repository named `my-demo-repo` in the US East (Ohio) Region:
>
> ```
> git clone https://git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo my-demo-repocopy
> ```
>
> The repository's user name and password are required the first time you connect. Depending on your computer configuration, this prompt could appear from an operating system credential system (for instance, Keychain Access for macOS), from an embedded credential manager (for instance, Git Credential Manager included with Git for Windows), or from Git itself. Create an IAM user name and password for Git credentials (the ones you created in ***Step 3:** Creating Git credentials for HTTPS connections*). Depending on your operating system and other software, your credentials may be stored in a credential store or credential management tool. In that case, you will not be prompted again unless you change the password, deactivate the Git credentials, or delete the Git credentials from IAM.
>
> You can install a credential store or credential management utility on your local computer if you don't have one already.

**First** : Switch to the IAM user Created earlier

**Then** connect via any SSH platform and configure the IAM user credentials

**The CMD** Run `aws configure --profile codecommit`  and Enter the credentials for the IAM user you created earlier and the region

**Second:** Go to the aws CodeCommit page chose the repository and follow the connection steps:

- Run  `git clone https://git-codecommit.me-south-1.amazonaws.com/v1/repos/MyFirstRepo`  to clone repository

![image-20220804114655832](C:\Users\MohanadSinan\AppData\Roaming\Typora\typora-user-images\image-20220804114655832.png)