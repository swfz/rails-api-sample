FROM centos:centos7

COPY mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo

RUN yum install -y mongodb-org gcc glibc initscripts

RUN mkdir -p /data/db
RUN chown mongod:mongod /data/db
RUN chmod 755 /data/db

EXPOSE 27017 28017
ENTRYPOINT ["/usr/bin/mongod", "--profile=2", "--slowms=1"]
