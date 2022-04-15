# Create a base image using CentOS version 7
FROM centos:7

# LABEL is tag instruction adds metadata to an image. A LABEL is a key-value pair.
LABEL maintainers = "DevOp team"

# Update tehe system and install httpd using RUN command
RUN yum -y update && yum clean all

# install httpd 'apache'
RUN yum install httpd

#have to copy the application put it inside the container using copy command
COPY index.html /var/www/html/
COPY images /var/www/html/
#COPY css /var/www/html/
#COPY fontawesome-free-5.15.3-web /var/www/html/

# defind the port command
EXPOSE 80

#this direction is where it cans go feth apache and run it
# Maining when the container will start it will also start apache
ENTRYPOINT ["/usr/sbin/httpd"]

# and to stop the CMD command runing container in the background you have to do it manually Control D command
CMD ["-D", "FOREGROUND"]
