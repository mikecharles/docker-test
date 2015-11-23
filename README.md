README
======

This repo is a proof-of-concept for turning any directory containing code into a Docker container. The idea is to be able to take an existing application (web-service or not) and create a Docker image out of it that when started has crond running so the application can run on cron.

Steps to create the container
-----------------------------

### 1 - Install Docker

Follow the [official instructions](https://docs.docker.com/v1.8/installation) to install Docker.

### 2 - Build a Docker image

You can build a Docker image from the Dockerfile in this repo:

    docker build -t docker-test  # arg to -t can be whatever you want to name the image

### 3 - Run the Docker image

This will create a new contain and run a command (in our case, start the cron daemon) in the background:

    docker run -it -d --name docker-test-container

That's it! You now have a container running with a cron daemon and the contents of the [cronfile](cronfile) running on cron. In our example Dockerfile, a user called 'cpc' is created, and the application copied to the cpc home dir.

Connecting to the Docker image
------------------------------

If you want to connect (as if you were to "SSH") to the container:

    docker exec -u cpc -it docker-test-container bash
  
This will bring you to a bash shell inside of the VM as the user 'cpc'. You can now run the application, etc. as if you were the user 'cpc' on a regular VM.

Stopping and removing the container
-----------------------------------

To stop the container:

    docker stop docker-test-container

To remove the container:

    docker rm docker-test-container
