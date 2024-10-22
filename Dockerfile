FROM ubuntu:latest

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates curl gpg git-all
RUN mkdir -p /usr/local/bin
RUN mkdir -p /tmp
RUN cd /tmp
RUN curl -fsSL https://temporal.download/cli/archive/latest?platform=linux&arch=amd64 -o temporal-amd64.tgz
RUN curl -fsSL https://temporal.download/cli/archive/latest?platform=linux&arch=arm64 -o temporal-arm64.tgz
RUN tar xvfz temporal-amd64.tgz
RUN mv temporal /usr/local/bin/temporal-amd64
RUN tar xvfz temporal-arm64.tgz
RUN mv temporal /usr/local/bin/temporal-arm64

RUN echo "if [ $(arch) == 'arm64' ]; then" > /usr/local/bin/temporal
RUN echo "    /usr/local/bin/temporal-arm64 $@" >> /usr/local/bin/temporal
RUN echo "else" >> /usr/local/bin/temporal
RUN echo "    /usr/local/bin/temporal-amd64 $@" >> /usr/local/bin/temporal
RUN echo "fi" >> /usr/local/bin/temporal

RUN chmod +x /usr/local/bin/temporal*

