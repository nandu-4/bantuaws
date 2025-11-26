# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi














#aws

in git copy the link
sudo apt update
sudo apt-get install docker.io
sudo apt install git
sudo apt install nano
nano index.html .in any codes of html.
git init
git add . 
git commit -m "mycommit" 
//now to go github
git remote add orgin <your_repo>
git push -u orgin master
snithuja
//settings in github 
git clone  <your_repo>
nano Dockerfile->
From nginx:alpine
COPY . /usr/share/nginx/html
sudo docker build -t myapp . 
sudo docker run -d -p 80:80 myapp








#kubernets

minikube start
docker login
minikube version
minikube status
kubectl create deployment myngnix --image=ngnix
kubectl get deployment
kubectl get pods
kubectl describe pods 
kubectl expose deployment myngnix --type-Nodeport --port=80 --target-port=80 --name=myngnix
kubectl get service myngnix
kubectl port-forward sevice/myngnix 3080:80
openbrowser and in url 127.0.0.1-3080
....
then open another powershell and 
minikube dashboard





# nagioss
docker pull jasonrivers/nagios:latest
docker images
docker run --name nagios4 -d -p 8888:80 jasonrivers/nagios:latest
docker start -ai nagios4








#jenkins
https://github.com/divya-12360/week4maven.git

I.	Steps for MavenJava Automation:
Maven Java Automation Steps:
 Step 1: Open Jenkins (localhost:8080)
   	 ├── Click on "New Item" (left side menu
Step 2: Create Freestyle Project (e.g., MavenJava_Build)
        	├── Enter project name (e.g., MavenJava_Build)
        	├── Click "OK"
└── Configure the project:
            		├── Description: "Java Build demo"
            		├── Source Code Management:
            			└── Git repository URL: [GitMavenJava repo URL]
            		├── Branches to build: */Main   or  */master
  		└── Build Steps:
               	     ├── Add Build Step -> "Invoke top-level Maven targets"
                  		└── Maven version: MAVEN_HOME
                 		└── Goals: clean
                	├── Add Build Step -> "Invoke top-level Maven targets"
                		└── Maven version: MAVEN_HOME
                		└── Goals: install
                	└── Post-build Actions:
                    	       ├── Add Post Build Action -> "Archive the artifacts"
                    			└── Files to archive: **/*
                    	     ├── Add Post Build Action -> "Build other projects"
                    			└── Projects to build: MavenJava_Test
                    			└── Trigger: Only if build is stable
                    	     └── Apply and Save


    └── Step 3: Create Freestyle Project (e.g., MavenJava_Test)
        	├── Enter project name (e.g., MavenJava_Test)
        	├── Click "OK"
              └── Configure the project:
             ├── Description: "Test demo"
             ├── Build Environment:
            		└── Check: "Delete the workspace before build starts"
            ├── Add Build Step -> "Copy artifacts from another project"
            		└── Project name: MavenJava_Build
            		└── Build: Stable build only  // tick at this
            		└── Artifacts to copy: **/*
            ├── Add Build Step -> "Invoke top-level Maven targets"
            		└── Maven version: MAVEN_HOME
            		└── Goals: test
            		└── Post-build Actions:
                ├── Add Post Build Action -> "Archive the artifacts"
                	└── Files to archive: **/*
                	└── Apply and Save

    └── Step 4: Create Pipeline View for Maven Java project
        ├── Click "+" beside "All" on the dashboard
        ├── Enter name: MavenJava_Pipeline
        ├── Select "Build pipeline view"         // tick here
         |--- create
        └── Pipeline Flow:
            ├── Layout: Based on upstream/downstream relationship
            ├── Initial job: MavenJava_Build
            └── Apply and Save OK

    └── Step 5: Run the Pipeline and Check Output
        ├── Click on the trigger to run the pipeline
        ├── click on the small black box to open the console to check if the build is success
            Note : 
1.	If build is success and the test project is also automatically triggered with name       
                      “MavenJava_Test”
2.	The pipeline is successful if it is in green color as shown ->check the console of the test project
3.	The test project is successful and all the artifacts are archived successfully


https://github.com/Laxmiprasanna9126/MavenWebProject.git
II. Maven Web Automation Steps:
└── Step 1: Open Jenkins (localhost:8080)
    ├── Click on "New Item" (left side menu)
    
    └── Step 2: Create Freestyle Project (e.g., MavenWeb_Build)
        ├── Enter project name (e.g., MavenWeb_Build)
        ├── Click "OK"
        └── Configure the project:
            ├── Description: "Web Build demo"
            ├── Source Code Management:
            		└── Git repository URL: [GitMavenWeb repo URL]
            ├── Branches to build: */Main or master
            └── Build Steps:
                ├── Add Build Step -> "Invoke top-level Maven targets"
                	└── Maven version: MAVEN_HOME
                	 └── Goals: clean
                ├── Add Build Step -> "Invoke top-level Maven targets"
                	└── Maven version: MAVEN_HOME
                	└── Goals: install
                └── Post-build Actions:
                    ├── Add Post Build Action -> "Archive the artifacts"
                   	 └── Files to archive: **/*
                    ├── Add Post Build Action -> "Build other projects"
                    	└── Projects to build: MavenWeb_Test
                    	└── Trigger: Only if build is stable
                    └── Apply and Save

    └── Step 3: Create Freestyle Project (e.g., MavenWeb_Test)
        ├── Enter project name (e.g., MavenWeb_Test)
        ├── Click "OK"
        └── Configure the project:
            ├── Description: "Test demo"
            ├── Build Environment:
            		└── Check: "Delete the workspace before build starts"
            ├── Add Build Step -> "Copy artifacts from another project"
            		└── Project name: MavenWeb_Build
            		└── Build: Stable build only
            		└── Artifacts to copy: **/*
            ├── Add Build Step -> "Invoke top-level Maven targets"
           		└── Maven version: MAVEN_HOME
            		└── Goals: test
            └── Post-build Actions:
                ├── Add Post Build Action -> "Archive the artifacts"
                	└── Files to archive: **/*
                ├── Add Post Build Action -> "Build other projects"
                	└── Projects to build: MavenWeb_Deploy
                └── Apply and Save

    └── Step 4: Create Freestyle Project (e.g., MavenWeb_Deploy)
        ├── Enter project name (e.g., MavenWeb_Deploy)
        ├── Click "OK"
        └── Configure the project:
            ├── Description: "Web Code Deployment"
            ├── Build Environment:
            		└── Check: "Delete the workspace before build starts"
            ├── Add Build Step -> "Copy artifacts from another project"
            		└── Project name: MavenWeb_Test
            		└── Build: Stable build only
               	└── Artifacts to copy: **/*
            └── Post-build Actions:
                ├── Add Post Build Action -> "Deploy WAR/EAR to a container"
   └── WAR/EAR File: **/*.war
   └── Context path: Webpath
 └── Add container -> Tomcat 9.x remote
└── Credentials: Username: admin, Password: 1234
── Tomcat URL: https://localhost:8085/
                └── Apply and Save

    └── Step 5: Create Pipeline View for MavenWeb
        ├── Click "+" beside "All" on the dashboard
        ├── Enter name: MavenWeb_Pipeline
        ├── Select "Build pipeline view"
        └── Pipeline Flow:
            ├── Layout: Based on upstream/downstream relationship
            ├── Initial job: MavenWeb_Build
            └── Apply and Save

    └── Step 6: Run the Pipeline and Check Output
        ├── Click on the trigger “RUN” to run the pipeline
            Note: 
1.	After Click on Run -> click on the small black box to open the console to check if the build is success
2.	Now we see all the build has  success if it appears in green color
        ├── Open Tomcat homepage in another tab
        ├── Click on the "/webpath" option under the manager app
               Note:
1.	 It ask for user credentials for login ,provide the credentials of tomcat.
2.	It provide the page with out project name which is highlighted.
3.	After clicking on our project we can see output.





.\ngrok.exe http 8080
