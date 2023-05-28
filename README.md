## Dockerized Tomcat Sample

### Description

This project contains a Docker deployment of a [Tomcat 8.5](https://tomcat.apache.org/download-80.cgi "Tomcat 8.5") sample webapp with SSL enabled on port 4041, using [CentOS:7](https://hub.docker.com/_/centos/ "CentOS:7") as base image.

### Requirements

- [Docker](https://www.docker.com/ "Docker") installed.

### Instructions

1. Clone this repository: `git clone https://github.com/Miguelbrites/dockerizedtomcat.git`
2. Build the image (run this command inside the repository directory or reference the path): `docker build -t tomcat-sample-image .`
3. Run the container: `docker run -p 4041:4041 --name tomcat-sample-container tomcat-sample-image`
4. Once the container is running, access https://localhost:4041/sample/ in your browser to see the Tomcat Sample App.