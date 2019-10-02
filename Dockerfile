FROM centos:6 as installer

RUN yum update -y && yum install pam_passwdqc -y

FROM alpine:latest

RUN mkdir -p "pam_passwdqc"

WORKDIR /pam_passwdqc

COPY --from=installer /lib64/security/pam_passwdqc.so /pam_passwdqc/pam_passwdqc.so
COPY . .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]