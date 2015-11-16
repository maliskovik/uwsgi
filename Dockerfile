################################################################################
#                                                                              #
#                                 {o,o}                                        #
#                                 |)__)                                        #
#                                 -"-"-                                        #
#                                                                              #
################################################################################
#
# UWSGI image dockerfile
#
##################################---BASE---####################################

FROM debian

################################################################################

################################---MAINTAINER---################################

MAINTAINER Lovrenc Avsenek <a.lovrenc@gmail.com>

################################################################################

###################################---BUILD---##################################

# Make enviorment noninteractive
ENV DEBIAN_FRONTEND noninteractive

#Add and lunch the install script
ADD install.sh install.sh
RUN chmod +x install.sh
RUN ./install.sh; \
    rm install.sh
ADD default.yml /opt/uwsgi/default.yml

# Set the working conditions
WORKDIR /opt/web
EXPOSE 9000
CMD  uwsgi --yaml /opt/uwsgi/default.yml

################################################################################
