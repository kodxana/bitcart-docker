FROM python:3.6-alpine

ENV IN_DOCKER=1
LABEL org.bitcartcc.image=backend

COPY bitcart /app
COPY scripts/docker-entrypoint.sh /usr/local/bin/
WORKDIR /app
RUN adduser -D electrum && \
    adduser electrum electrum && \
    apk add --virtual build-deps --no-cache build-base libffi-dev && \
    apk add postgresql-dev && \
    pip install -r requirements.txt && \
    pip install -r requirements/production.txt && \
    rm -rf /root/.cache/pip && \
    apk del build-deps
USER electrum
RUN mkdir -p /app/images && \
    mkdir -p /app/images/products
VOLUME /app/images
CMD ["sh"]