FROM alpine:3.13.5

RUN [ "apk", "add", "py3-pip", "texlive", "py-pygments", "texlive-xetex", "texlive-luatex" ]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
