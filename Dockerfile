FROM alpine
MAINTAINER nevishs

# Install Apache2 and other stuff needed to access svn via WebDav
RUN apk add --no-cache apache2 apache2-utils apache2-webdav mod_dav_svn &&\
        # Install svn
        apk add --no-cache subversion &&\
        # Create required folders
        mkdir -p /run/apache2/ &&\
        mkdir /home/svn/ &&\
        mkdir /etc/subversion &&\
        # Create the authentication file for http access
        touch /etc/subversion/passwd

# Add WebDav configuration
ADD vh-davsvn.conf /etc/apache2/conf.d/vh-davsvn.conf

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 80 443 3960

# Define default command
CMD ["/run.sh"]
