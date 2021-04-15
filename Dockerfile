FROM alpine:3.13.5

RUN [ "apk", "add", "py3-pip", "texlive", "py-pygments" ]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
