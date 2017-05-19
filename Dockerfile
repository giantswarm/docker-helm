FROM alpine

RUN apk add --update ca-certificates \
    && apk add --update -t deps wget bash \
    && rm /var/cache/apk/*
    
RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.4.2-linux-amd64.tar.gz -qO- | tar xzf - linux-amd64/helm \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /bin/helm \
    && rm -rf ./linux-amd64

RUN mkdir -p ~/.helm/plugins/ \
    && wget https://github.com/app-registry/helm-plugin/releases/download/v0.3.7/registry-helm-plugin-v0.3.7-dev-linux-x64.tar.gz -qO- | tar xzf - registry \
    && mv ./registry ~/.helm/plugins/

ENTRYPOINT ["helm"]
