FROM alpine:3.13.5

RUN [ "apk", "add", "py3-pip", "texlive", "py-pygments", "texlive-xetex", "texlive-luatex" ]
RUN [ "pip3", "install", "jsx-lexer" ]

COPY entrypoint.sh /entrypoint.sh

RUN [ "chmod", "+x", "/entrypoint.sh" ]

ENTRYPOINT [ "/entrypoint.sh" ]
