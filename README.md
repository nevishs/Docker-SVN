# Docker SNV (Alpine Linux)

## In this project you will:

* _Build a docker image with Alpine Linux._
* _Run the image to create a container._
* _Setup repositories._
* _Access repositories._

OR 

* _Pull and Run the image from docker HUB._


## Instructions:

__Step 1__: Clone the necessary files
> Note: /tmp/Docker-SVN -> working folder
```
> git clone https://github.com/nevishs/Docker-SVN.git /tmp/Docker-SVN
> cd /tmp/Docker-SVN
```

__Step 2__: Build the image
> Note: svn-server -> repo name
```
> docker build -t svn-server .
```

__Step 3__: Create the container
> Note: svnserver -> container name, svn-server -> repo name, /tmp/Docker-SVN/repos -> web files
```
> docker run --name svnserver -d -p 80:80 -p 3960:3960 -v /tmp/Docker-SVN/repos:/var/svn svn-server
```

__Step 4__: Create a username with password to access the repo
> Note: admin pass -> creating a user with its password
```
> docker exec -t svnserver htpasswd -b /etc/subversion/passwd admin pass
```

__Step 5__: Create a repository
> Note: new-repo -> the new repository name
```
> docker exec -it svnserver svnadmin create /var/svn/new-repo
```

__Step 6__: Interact with the repo
> Note: test out the functionality
```
> http://127.0.0.1/svn/new-repo/
```


### OR


__Step 1__: Prepare the files
> Note: /tmp/Docker-SVN -> working folder
```
> git clone https://github.com/nevishs/Docker-SVN.git /tmp/Docker-SVN
> cd /tmp/Docker-SVN
```

__Step 2__: Pull and Run the image
> Note: nevishs/docker-svn -> repo name, svnserver -> container name
```
> docker pull nevishs/docker-svn
> docker run --name svnserver -d -p 80:80 -p 3960:3960 -v /tmp/Docker-SVN/repos:/var/svn nevishs/docker-svn
> docker exec -t svnserver htpasswd -b /etc/subversion/passwd admin pass
> docker exec -it svnserver svnadmin create /var/svn/new-repo
> http://127.0.0.1/svn/new-repo/
```


## Useful Commands:
```
> docker image ls            //lists all the images, this command is useful to find the repo name and image id
> docker container ps -a     //lists all the containers
> docker stop CONTAINERID    //stops the container
> docker rm CONTAINERID      //destroys the container
```

