# Day5: English2Arabic

**Muhannad Sinan**

<img src="https://lh3.googleusercontent.com/SvFJ7R2nDbsnzZ0BcvWCcLVRAZzagdhM7KABqjqYXb6FIXUzSF9wNG4I4WDrfX9wImtLO-jMerPiOsC9ZPE4F4jbpE_ZmPgHNf1ImaxRGkqvmjINu60B2xle89L3YoQ6nydROVf7bNd0AsiAOIgVves" alt="img" style="zoom:67%;" />

<img src="https://lh5.googleusercontent.com/3ZqsnlCXRkvdFsZP5dhtOy0ge03BWwZnsdKsvxULDQQHp36Ui3shkt1Z7sIfSOlgbD-2QStG0NAn5nSd0gnoaunMRLK4bcmyB5snos8nVQx-yqonhMyA3LMAtWBEI9Hcu6eq8Oxs7kF_uUSkH8Wa2D8" alt="img" style="zoom:33%;" />

**Overview:**
Most instructors of CodingDojo are not from the Saudi region so their knowledge of Arabian culture and language is very limited. Being an effective instructor requires us to have basic knowledge of the Arabic language. But we don’t know anyone who can teach us this.
So, CodingDojo has started a crowdsourced dictionary of the most common words for learning. Please help us build and launch this application on docker using the given requirements below.



**Codebase -**
https://drive.google.com/file/d/11ld9vENX98tklxeHBzDIC0-IDg41UIm7/view?usp=sharing



**Checkpoints:**

1. Day5 **English2Arabic**
   1. Take the code base of English2Arabic app.
   2. Write Dockerfile for API with node:10-alpine.
   3. Write Dockerfile for web with node:10-alpine.
   4. Write Command line for running postgres container postgres:11.2-alpine.
   5. Write Docker-compose file with .
      1. Create two bridge networks for public and private communication.
      2. Correct volumes for database.
      3. API(backend) service with node:10-alpine.
         1. Env - CONNECTION_STRING of db.
         2. Don’t Publish API endpoint, API services will open on 3001.
         3. Attach correct network you just created.
         4. Correct context.
         5. Correct dependence.
      4. Web service with node:10-alpine.
         1. Publish web on 80.
         2. Env- API endpoint.
         3. Attach correct network you just created.
         4. Publish correct port.
         5. Correct dependence.
      5. DB service using *postgres:11.2-alpine*.
         1. Volume for postgres config.
         2. Volume for database.
         3. Publish postgres on 5432.
         4. Correct environments.
         5. Initialize database with given data.
         6. Attach correct network you just created.
      6. Screenshot of final UI.
      7. Exec inside postgres db screenshot and command.



**Submissions**

1. Write Dockerfile for API
   *Unnecessary port exposing will cost you 2 marks.*

   > ```dockerfile
   > FROM node:10-alpine
   > 
   > LABEL Auther=MuhannadSinan
   > 
   > WORKDIR /usr/src/app
   > 
   > COPY package*.json ./
   > 
   > RUN npm install
   > COPY . .
   > 
   > EXPOSE 3001
   > CMD [ "node", "index.js" ]
   > ```
   
2. Write Dockerfile for web
   *Unnecessary port exposing will cost you  2 marks.*

   > ```dockerfile
   > FROM node:10-alpine
   > 
   > LABEL Auther=MuhannadSinan
   > 
   > WORKDIR /usr/src/app
   > 
   > COPY package*.json ./
   > 
   > RUN npm install
   > COPY . .
   > 
   > EXPOSE 3000
   > CMD [ "node", "index.js" ]
   > ```
   
3. Write Command for running postgres container with volume mount database and database configurations.

   > ```bash
   > docker run --rm -d \
   > 	--name English2Arabic_DB \
   > 	-e POSTGRES_USER=MuhannadSinan \
   > 	-e POSTGRES_PASSWORD=DevOps@2022 \
   > 	-e POSTGRES_DB=English2Arabic \
   > 	-v ${HOME}/B2D5/sql_scripts:/docker-entrypoint-initdb.d \
   > 	postgres:11.2-alpine
   > ```
   >
   > ![image-20220812153625386](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day5\_img\image-20220812153625386.png)

4. Write Docker-compose file

   1. Services for API, web and postgres db.

   2. volume mount database and database configurations.

   3. Correct network to connect all services.

   4. context for codebase mounting.

   5. Correct environment.

   6. Correct name.

   7. Correct alias.

   8. Smart db initialization.

      

   > ```yaml
   > version: "3.9"
   > 
   > services:
   >   api:
   >     container_name: English2Arabic_API
   >     build: ./api
   >     environment:
   >       - CONNECTION_STRING=postgres://MuhannadSinan:DevOps@2022@db/English2Arabic
   >     depends_on:
   >       - db
   >     networks:
   >       - private-network
   >       - public-network
   > 
   >   webapp:
   >     container_name: English2Arabic_WEB
   >     build: ./web
   >     environment:
   >       - API_URL=http://api:3001/data
   >     depends_on:
   >       - api
   >     ports:
   >       - "80:3000"
   >     networks:
   >       - public-network
   > 
   >   db:
   >     image: postgres:11.2-alpine
   >     container_name: English2Arabic_DB
   >     environment:
   >       POSTGRES_USER: MuhannadSinan
   >       POSTGRES_PASSWORD: DevOps@2022
   >       POSTGRES_DB: English2Arabic
   >     volumes:
   >       - ./sql_scripts/:/docker-entrypoint-initdb.d
   >     ports:
   >       - "5432:5432"
   >     networks:
   >       - private-network
   > 
   > networks:
   >   private-network:
   >   public-network:
   > ```

5. Screenshot of final UI

   > `docker-compose --project-name "English2Arabic" up --build `
   >
   > ![image-20220812155849341](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day5\_img\image-20220812155849341.png)

6. Exec inside postgres db. Write command

   > `docker exec -it English2Arabic_DB psql -U MuhannadSinan -d English2Arabic `

7. Exec inside postgres db and show all records in english2arabic table screenshot.
   *`select * from english2arabic;`*

   > ![image-20220812160003000](C:\Users\MohanadSinan\Desktop\DevOps\Track 2 - DevOps and CICD\Week 5 - Belt Exam 2\Day5\_img\image-20220812160003000.png)