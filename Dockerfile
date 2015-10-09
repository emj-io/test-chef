FROM ubuntu/14.04.3
MAINTAINER Eric Johnson <eric.johnson@mycase.com>

RUN mkdir -p /ops/{chef,cookbooks}
COPY zero.rb first-boot.json /ops/chef/
COPY cookbooks /ops/cookbooks/

#RUN apt-get update 
#RUN apt-get -yy install git
#RUN mkdir /tmp/cookbooks && \
#    cd /tmp/cookbooks && \
#    git clone 


# Create volumes
# VOLUME /tmp/chef

CMD [ "/opt/chef/bin/chef-client", "-c /ops/chef/zero.rb -z -j /ops/chef/first-boot.json"