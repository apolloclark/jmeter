#
# Dockerfile for a jmeter master.
# A container from this image will be ready to run a jmeter client.
# 
# Usage:
#  docker run -d \
#             -v <absolute path on host>:/logs \
#             -v <absolute path on host>:/input-data \
#             -v <absolute path on host>:/scripts \
#             <docker image> -n \
#                            -t /scripts/<script file name> 
#                            -l /logs/<output jtl file name>
#                            -R<server IP addresses>
#

FROM apolloclark/jmeter-base

MAINTAINER Apollo Clark apolloclark@gmail.com 

# Create mount point for script, data and log files
VOLUME ["/scripts"]
VOLUME ["/input_data"]
VOLUME ["/logs"]

# Use a predefined configuration.  This sets the contract for connecting to jmeter servers.
ADD jmeter.properties /var/lib/apache-jmeter/bin/

ENTRYPOINT [ "/var/lib/apache-jmeter/bin/jmeter"]
