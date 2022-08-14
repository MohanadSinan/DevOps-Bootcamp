# Push to a Code Repository

**Muhannad Sinan**



You can create your first commit using the AWS CLI and **put-file** command. This command adds a file to your empty repository and creates a new branch with the name you specify. This branch becomes the default branch for your repository.

- Create the file you want to add to the CodeCommit repository on your local computer.

![image-20220804115947140](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 2 - DevOps and CI-CD\Assignments\_img\image-20220804115947140.png)

- To use the put-file this id the code for it: 

  ```bash
  aws codecommit put-file \
  --repository-name MyFirstRepo \
  --branch-name main \
  --file-content fileb://readme.md \
  --file-path readme.md \
  --parent-commit-id 2d8f643236b046cbe02443e2ac8b7339ce721631 \
  --name "MuhannadSinan" \
  --email  "mohanadsinan@hotmail.com" \
  --commit-message "I added a third randomization routine."
  ```

![image-20220804120444593](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 2 - DevOps and CI-CD\Assignments\_img\image-20220804120444593.png)

![image-20220804120530441](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 2 - DevOps and CI-CD\Assignments\_img\image-20220804120530441.png)