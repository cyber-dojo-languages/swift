FROM  cyberdojofoundation/ubuntu-build-essential:14.04
LABEL maintainer=byran@adgico.co.uk

ADD install.sh .

RUN ./install.sh && \
    rm -f install.sh
