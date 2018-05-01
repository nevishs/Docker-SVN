# Docker-SVN
SVN Docker with Alpine Linux.


git clone ......
docker build -t svn-server .
docker run --name svnserver -d -p 80:80 -p 3960:3960 -v /SVN/svn-docker/repos:/var/svn svn-server

docker exec -t svnserver htpasswd -b /etc/subversion/passwd admin pass

svn info svn://localhost:3960/Test
docker exec -it svnserver svnadmin create /var/svn/new-repo

http://127.0.0.1/svn/new-repo/
