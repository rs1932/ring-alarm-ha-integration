ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8


RUN apk add --no-cache nodejs-npm jq git
RUN npm install mqtt async ring-alarm socket.io-client

# Copy data for add-on
COPY run.sh /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]