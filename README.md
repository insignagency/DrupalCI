
## Getting Started 

A Dockerfile is a smart text tool allowing the user to recall all images commands in a more compact and effective way. You can find additional info on how to set this file at the following link:
https://docs.docker.com/engine/reference/builder/

## Prerequisites for Linux, Windows, MacOs
Install Docker and essential Linux commands if you're under Linux environment. 
You can alternatively follow this link if you're using Windows OS
https://docs.docker.com/docker-for-windows/install/
or this one if you're working under MacOs
https://docs.docker.com/docker-for-mac/

## Installing

Download automated build from public Docker Hub Registry
(or alternatively you can build an image from Dockerfile: `docker build -t="dockerfile/"image name" .` , then running the Dockerfile in the current folder). `
You can find here an exhaustive list of full build commands if necessary
https://docs.docker.com/engine/reference/commandline/build/


## Best (DevOps) practices for writing Dockerfile

It's strongly recommended to use the following guidelines 

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

especially about this special point "Don’t install unnecessary packages" , always recommended but you should be care of avoiding dependencies issue while compiling according to what you need for your project, recalling that "simpler is better" , "too much simple is risky and with consequences".   


## Break down into end to end tests




## Deployment
