FROM  cyberdojofoundation/ubuntu-build-essential:16.04
LABEL maintainer=byran@adgico.co.uk

ADD install.sh .

RUN ./install.sh && \
    rm -f install.sh

RUN swiftc --version | grep -q 4.0.3
