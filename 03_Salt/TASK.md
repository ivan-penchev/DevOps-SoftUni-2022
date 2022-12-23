

# Homework M3: Configuration Management with Salt

Tasks

We have a project used to build a set of two container images: 

- Project: https://github.com/shekeriev/bgapp 
- Image 1: https://hub.docker.com/repository/docker/shekeriev/bgapp-web 
- Image 2: https://hub.docker.com/repository/docker/shekeriev/bgapp-db

Utilizing what was discussed and shown during the lecture, try to do the following:



1. With the help of Salt and Vagrant create Docker host and run a nginx container in it

2. With the help of Salt and Vagrant create a two-host setup:

   · One of the hosts should be based on Debian/Ubuntu and the other one – on CentOS

   · Both hosts should see each other in terms of network communication. Their names should be web and db

   · One of the hosts should play the role of WEB server with web solution of your choice and PHP installed and the other one – DB server with MySQL/MariaDB installed

   · On the WEB host deploy the content of the web folder in M3-Homework-Challenge-Salt (files).zip archive and on the other – the content of the db folder from the same archive

Please note that the two tasks are two separate environments