FROM alpine:3.13.5

RUN [ "apk", "add", "py3-pip", "texlive-full", "py-pygments" ]
RUN [ "pip3", "install", "jsx-lexer" ]

COPY entrypoint.sh /entrypoint.sh

RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]
