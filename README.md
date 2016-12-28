# jmeter
JMeter Docker image, Vagrant build, with Terraform AWS build scripts

Images included:
- __jmeter-base__ base image with Java and JMeter installed
- __jmeter-master__ image with JMeter configured to run as a Server
- __jmeter-node__ image with JMeter configure to run as a Client

Build:
```shell
docker-compose up
docker-compose rm 
```