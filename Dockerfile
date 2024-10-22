FROM ubuntu:latest


# Get packages that will be used
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates curl gpg git-all tar iputils-ping golang build-essential

# Download  and install the temporal binaries for both amd and arm.
RUN mkdir -p /usr/local/bin
RUN curl -vvv -o temporal-amd64.tgz -fsSL https://temporal.download/cli/archive/latest\?platform\=linux\&arch\=amd64
RUN curl -vvv -o temporal-arm64.tgz -fsSL https://temporal.download/cli/archive/latest\?platform\=linux\&arch\=arm64 
RUN tar xvfz temporal-amd64.tgz
RUN mv temporal /usr/local/bin/temporal-amd64
RUN tar xvfz temporal-arm64.tgz
RUN mv temporal /usr/local/bin/temporal-arm64

# Create a temporal script that works out the arch used and runs the relevant temporal executable.  (Not fully tested!)
RUN cat <<'EOF' > /usr/local/bin/temporal
#!/bin/bash
if [ $(arch) == 'amd64' ]; then
  /usr/local/bin/temporal-amd64 $@
else
  /usr/local/bin/temporal-arm64 $@
fi
EOF

RUN chmod +x /usr/local/bin/temporal*
RUN /usr/local/bin/temporal --version

# Test the go version and download the tcld source to build the executable needed.
RUN go version
RUN ls -lR /usr/local
RUN echo $PATH
RUN which go

RUN git clone https://github.com/temporalio/tcld.git
RUN cd tcld && make
RUN cp tcld/tcld /usr/local/bin/tcld
RUN tcld version


