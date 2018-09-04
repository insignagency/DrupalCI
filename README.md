
## Getting Started with Dockerfile

A Dockerfile is a smart text tool allowing the user to recall all images commands in a more compact and effective way. You can find additional info on how to set this file at the following link:
https://docs.docker.com/engine/reference/builder/

Dockerfile also defines what goes on in the environment inside your container.
More specifically for Windows, we recommend this link 
https://github.com/docker/labs/blob/master/windows/windows-containers/README.md

## Prerequisites for Linux, Windows, MacOs
Install Docker and essential Linux commands if you're under Linux environment. 
You can alternatively follow these links if you're using Windows OS
https://docs.docker.com/docker-for-windows/install/
https://docs.docker.com/docker-for-windows/install/#start-docker-for-windows

or this one if you're working under MacOs
https://docs.docker.com/docker-for-mac/


You can find here an exhaustive list of full build commands if necessary
https://docs.docker.com/engine/reference/commandline/build/


## Dockerfile customization (Drupal image using PHP7.1)
Our Dockerfile has been configured with Drupal Open Source CMS using PHP7.1.  

## Features used and part of our Drupal project 
- Composer 1.7.2
- Node 7.1.0
- Npm 4.2 and Yarn 1.5.1
- Drush9
- Drupal console launcher
- Chromedriver

## Installing

Download automated build from public Docker Hub Registry
(or alternatively you can build an image from Dockerfile: `docker build -t="dockerfile/"image name" .` , then running the Dockerfile in the current folder). If you want the no cache version of your build, simply write `docker build --no-cache.`


## Best (DevOps) practices for writing a Dockerfile

It's strongly recommended to use the following guidelines 

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

especially about this special point "Don’t install unnecessary packages" , always recommended but you should care of avoiding dependencies issue while compiling according to what you need for your project, recalling that "simpler is better" , "too much simple is risky and with consequences".   


## Deployment
Dockerfile is also the starting point for running the Docker compose file, normally called`docker-compose.yml` which is  a tool for running multi-container applications

https://docs.docker.com/compose/
https://docs.docker.com/compose/gettingstarted/#step-2-create-a-dockerfile

## Debugging

This commmand will run a bash session in the container.

docker run --rm -v $(pwd):/src -it --entrypoint=bash insignagency/DrupalCI
