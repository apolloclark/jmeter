#
# Dockerfile to create a jmeter-server image.
# 
# Usage:
#  docker run -d \         
#             -p 0.0.0.0:port-on-host:1099 \
#             -p 0.0.0.0:some-other-port-on-host:60000 \
#             -v /some/local/path:/logs \
#             -v /some/other/local/path:/input-data \
#             apolloclark/jmeter-server
#

FROM apolloclark/jmeter-base
MAINTAINER Apollo Clark apolloclark@gmail.com 

ADD jmeter.properties /var/lib/apache-jmeter/bin/

# Expose access to logs & data files
VOLUME [ "/logs" ]
VOLUME [ "/input-data" ]

# Expose jmeter-server's port (values dicated by those specified in jmeter.properties.
EXPOSE 1099 60000

# Run jmeter-server 
ENTRYPOINT [ "/var/lib/apache-jmeter/bin/jmeter-server" ]