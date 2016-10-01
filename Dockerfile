FROM alpine:edge

#RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
#RUN apk add --no-cache texlive-xetex

RUN apk add --no-cache \
 perl \
 wget \
 python \
 xz

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz \
    && mkdir -p /profiles/ \
    && mkdir -p /source

ENV PATH /usr/local/texlive/2015/bin/x86_64-linux:$PATH
ENV INFOPATH /usr/local/texlive/2015/texmf-dist/doc/info
ENV MANPATH /usr/local/texlive/2015/texmf-dist/doc/man

COPY texlive.profile /profiles/

RUN cd install-tl-*/ && \
 ./install-tl --profile=/profiles/texlive.profile && \
 tlmgr install texliveonfly

WORKDIR /source

ENTRYPOINT ["texliveonfly"]
