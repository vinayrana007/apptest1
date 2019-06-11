# Mulit Stage Build

It's a goLang based application is getting build in a Docker image, using Docker multistage build.
The size of image using multistage build reduced to 13.5MB from 500-600MB.

[root@ip-172-31-47-190 AppTest1]# docker image ls


REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
apptest1                     v1.0                0901bf922245        19 seconds ago      13.5MB
<none>                       <none>              18695ccc28f3        20 seconds ago      581MB
apptest1                     latest              afcecc286629        23 minutes ago      519MB


# Clone the repository

[root@ip-172-31-47-190 AppTest1]# git clone https://github.com/vinayrana007/apptest1.git

# Build Docker Image using following command.

[root@ip-172-31-47-190 AppTest1]# docker image build -t apptest1:v1.0 .

# Run container with host network and application can be access only local using CURL command.

[root@ip-172-31-47-190 AppTest1]# docker run -itd --rm --name golangapp --net host apptest1:v1.0
[root@ip-172-31-47-190 AppTest1]# docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS               NAMES
25e30db8330f        apptest1:v1.0       "/app/golang-test"   2 seconds ago       Up 2 seconds                            golangapp

# Verify application locally by using CURL

[root@ip-172-31-47-190 AppTest1]#  curl http://127.0.0.1:8000/ ======= OUTPUT ======>
Hello, world.

[root@ip-172-31-47-190 AppTest1]#  curl http://127.0.0.1:8000/go ======= OUTPUT ======>
Don't communicate by sharing memory, share memory by communicating.

[root@ip-172-31-47-190 AppTest1]# curl http://localhost:8000/opt ======= OUTPUT ======>
Don't communicate by sharing memory, share memory by communicating.
