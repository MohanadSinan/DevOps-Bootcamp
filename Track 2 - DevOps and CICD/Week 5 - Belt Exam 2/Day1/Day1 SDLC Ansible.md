# Day1: SDLC Ansible

**Muhannad Sinan**

## **Part-1 SDLC: Scrum**

**Overview :**
Everyday we come across different problems, situations and we come up with ideas to solve them. You have to select one of the ideas yourself and describe the following requirements of the product development lifecycle. 

1. Identify the problems. Write the description of your app, software or website in 200 words or less.

   > ***Hobbyfriends website project***
   > A lot of people in cities can't pursue their hobbies because there are no partners. It would be a great idea for a web project if there was a platform that connects movie lovers, stamp collectors, joggers and video game lovers and gives them a chance to meet in person to do their thing.

2. Describe the roles and responsibilities in your project for the following roles.

   1. Scrum Master

      > - Helps the team perform at the highest level possible by removing roadblocks and protecting them from distractions.
      > - Holds the Developers and Product Owner accountable for meeting their commitments, maintaining the team ground rules, and helps the Developers to self-organize, correct, and improve.
      > - Ensuring that all Scrum events take place and are positive, productive, and kept within the timebox.

   2. Product Owner

      > - Learning the market and customers’ needs.
      > - Managing and prioritizing the product backlog.
      > - Staying accessible to development to answer questions.
      > - Serving as a liaison between product and development.

   3. Developers

      > - Creating a plan for the Sprint, the Sprint Backlog.
      > - Instilling quality by adhering to a Definition of Done.
      > - Deliver the Product to the customer.

3. Simulate the scrum events for your project and fill the table below with details on a simulated sprint.

   > | Events                   | Items planned in bullet points.                              |
   > | ------------------------ | ------------------------------------------------------------ |
   > | **Sprint Planning**      | - Product Owner and Developers discuss which Product Backlog Items will be included in Sprint.<br />- Product Owner has the right to priorities each Product Backlog Items for potential inclusion in the Sprint, the Developers are encouraged to respond, raise issues and push back where necessary.<br />- The Developers then forecasts how many Product Backlog Items they can deliver in the Sprint, given their knowledge of velocity, resources and any factors which could influence the time and resources they have available. |
   > | **Daily Scrum**          | - The Daily Scrum is timeboxed to 15 minutes.<br/>- Standing up is not compulsory.<br />- It is an opportunity for the Developers to check-in, assess progress towards achieving the Sprint Goal and to review and plan their activities for the next 24 hours. |
   > | **Sprint Review**        | - Inspect the outcome of the Sprint and determine future adaptations.<br />- collaborating with stakeholders to get feedback on the increment created during the Sprint. |
   > | **Sprint Retrospective** | - Plan ways to increase quality and effectiveness.<br />- Requires the mandatory attendance of the Scrum Team. This is where the Scrum Team look for improvements in their processes and collaboration. |
   > | **Sprint**               | - Turn ideas into Value.<br />- All the work required to achieve the Product Goal, and all other Scrum events, happen within Sprints. |

4. Write the definition of done for a sprint just before the first public launch of the software.

   > -  The website has been tried and there are some simple problems in UI problem and databases can not enter the personal information and has been modified from the Developers.

5. Write the list of items in following sprint artifacts.

   1. Product Backlog

      > -  As a user I want to login.
      > -  As a user I want to review my information.

   2. Sprint Backlog

      > -  As a user I want to login, so create a login page.
      > -  As a user I want to review my information, so create a personal page.

   3. Done Increment

      > -  We create a login page.
      > - We create a personal page.

------

## Part-2: Ansible

1. **Ansible basics.**
   Write a playbook adhering to the following requirements.

   1. Create an inventory file with **AmzLinuxservers** and **Ubuntuservers** groups. Add one server in each of these groups.

      > > ***Preparing***
      > > Creating three EC2 instances, one Amazon Linux server as an Ansible master, one Amazon Linux web server and one Ubuntu Linux web server using this CloudFormation template:
      > >
      > > **`D1Q2.1.yml`**
      > >
      > > 
      > >
      > > **` aws cloudformation create-stack --stack-name Ansible --template-body file://D1Q2.1.yml`**
      > >
      > > ![image-20220807151437491](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807151437491.png)
      > >
      > > The outputs:
      > >
      > > ![image-20220807151622571](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807151622571.png)
      > >
      >
      > > Connect to ansible-master server using ssh protocol:
      > >
      > > **`ssh -i "main.pem" ec2-user@ec2-157-175-208-200.me-south-1.compute.amazonaws.com`**
      > >
      > > ![image-20220807152016874](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807152016874.png)
      > >
      > > Add my private ssh key to the Ansible master server to this directory /home/ec2-user/main.pem and
      > > change the permissions to 400:
      > >
      > > **`sudo vim main.pem`**
      > > **`sudo chmod 400 main.pem`**
      > >
      > > ![image-20220807152301660](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807152301660.png)
      > >
      > > Creating an inventory file in the path `/home/ec2-user/MyHosts`
      > > **`sudo vim /home/ec2-user/MyHosts`**
      
      > **The inventory file.**
      >
      > ```
      > [AmzLinuxservers]
      > node1 ansible_host=157.175.88.107 ansible_user=ec2-user
      > 
      > [Ubuntuservers]
      > node2 ansible_host=157.175.93.203 ansible_user=ubuntu
      > 
      > [all:vars]
      > ansible_ssh_private_key_file=/home/ec2-user/main.pem
      > ```
      > 
      > ![image-20220807154400856](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807154400856.png)

   2. Create a playbook to perform the following tasks

      > Create a new directory with name playbooks under ansible folder:
      > **`mkdir ansible`**
      > **`cd ansible`**
      > **`mkdir playbooks`**
      > **`cd playbooks`**
      >
      > ![image-20220807155218157](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807155218157.png)

      1. Install apache on both the groups.

      2. Create or copy **index.html** with following content on both the groups.
         `<h1>Hello Muhannad Sinan</h1>`

         > Creating an html file `index.html` :
         >
         > ```html
         > <html>
         > <h1>Hello Muhannad Sinan</h1>
         > </html>
         > ```
         >
         > **`vim index.html`**
         >
         > ![image-20220807160827631](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807160827631.png)

      3. Install and start apache on both the groups.

         > **Paste the playbook file you wrote.**
         >
         > **`vim /home/ec2-user/ansible/playbooks/install-apache.yml`**
         >
         > ```yaml
         > ---
         >   - hosts: AmzLinuxservers
         >     become: true
         >     tasks:
         >       - name: Install apache in Amazon Linux server
         >         yum:
         >           name:
         >             - httpd
         >           state: present
         >           update_cache: yes
         >       - name: Start apache service
         >         service: name=httpd state=started enabled=yes
         >       - name: Copy index.html file
         >         copy: src=/home/ec2-user/index.html dest=/var/www/html/index.html
         > 
         >   - hosts: Ubuntuservers
         >     become: true
         >     tasks:
         >       - name: Install apache in Ubuntu server
         >         apt:
         >           name:
         >             - apache2
         >             - php
         >           state: present
         >           update_cache: yes
         >       - name: Start apache service
         >         service: name=apache2 state=started enabled=yes
         >       - name: Copy index.html file
         >         copy: src=/home/ec2-user/index.html dest=/var/www/html/index.html
         > ```

   3. Paste the screenshot of both the servers with their ip. It should be showing your name **Hello Muhannad Sinan**

      > **Write the command you used to run the playbook.**
      >
      > `sudo ansible-playbook /home/ec2-user/ansible/playbooks/install-apache.yml -i /home/ec2-user/MyHosts`
      >
      > ![image-20220808013958717](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220808013958717.png)

      > **Screenshot: AmzLinuxserver with IP address.**
      >
      > ![image-20220807164426165](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807164426165.png)

      > **Screenshot: Ubuntuserver with IP address.**
      >
      > ![image-20220807164438974](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807164438974.png)

4. **Ansible advanced.**

   1. Create an ansible vault using ansible-vault `secret.yml` and store a username and password in it.

      For example:

      *username: YOUR-NAME(without space)*
      *password: @sdf98w4tlkgf (anything)*

      > **Write the content of `secret.yml` file**
      >
      > ```yaml
      > username: MuhannadSinan
      > password: DevOps2022
      > ```

      > **Write the command to create the secret** 
      >
      > `ansible-vault create secret.yml`

      > **Show the screenshot of the `ansible-vault view secret.yml` command** 
      >
      > ![image-20220807173236104](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807173236104.png)

   2. Write a playbook to create user `create-user.yml` it should be using the username and password created in the last `secret.yml` ansible vault.

      > **Paste the content of `create-user.yml`**
      >
      > ```yaml
      > ---
      > - name: create a user
      >   hosts: all
      >   become: true
      >   vars_files:
      >     - secret.yml
      >     
      >   tasks:
      >   - name: creating user
      >     user:
      >       name: "{{ username }}"
      >       password: "{{ password }}"
      > ```
      >
      > ![image-20220807172317615](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807172317615.png)
      
      > **Write the command to create user using `create-user.yml` and with same inventory file**
      >
      > `sudo ansible-playbook --ask-vault-pass create-user.yml -i MyHosts`
      >
      > ![image-20220807173322476](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807173322476.png)
      
      > **Verify the user created or not in the group nodes. Screenshot of the output of the command to show users created in the inventory or not.**
      >
      > **`sudo ansible all -b -m command -a "grep MuhannadSinan /etc/shadow" -i MyHosts`**
      >
      > ![image-20220807173428653](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day1\_img\image-20220807173428653.png)