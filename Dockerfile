FROM mitmproxy/mitmproxy:4.0.4

COPY . /mitm-adblock

RUN apk add bash \
            git \
            gcc \
            python3-dev \
            musl-dev \
            build-base \
            libre2-dev &&\
    pip3 install Cython &&\
    pip3 install adblockparser git+https://github.com/andreasvc/pyre2.git &&\
    /mitm-adblock/update-blocklists

ENTRYPOINT [ "/bin/bash" ]

EXPOSE 8118

CMD /mitm-adblock/go
