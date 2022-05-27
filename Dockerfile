FROM alpine

RUN apk update && apk add curl jq
COPY file.txt /file.txt

CMD "sh"
