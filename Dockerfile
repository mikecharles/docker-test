# Start from the latest Ubuntu image
FROM ubuntu:latest
# Install dependencies
# RUN apt-get update
# RUN apt-get -y install <package>
# Set environment variables
ENV HOME /home/cpc
ENV USER cpc
# Create a user
RUN groupadd -r ${USER} && useradd -ms /bin/bash -r -g ${USER} ${USER}
# Add all the code in this package to $HOME in the Docker container
ADD . ${HOME}
# Crontab the cronfile
RUN crontab -u ${USER} ${HOME}/cronfile
# Start cron daemon
CMD cron -f
