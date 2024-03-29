FROM ubuntu

RUN apt-get -y update \
    && apt-get -y install \
    wget
    
RUN wget https://get.helm.sh/helm-v2.12.0-linux-amd64.tar.gz -qO- | tar xzf - linux-amd64/helm \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /bin/helm \
    && rm -rf ./linux-amd64

RUN mkdir -p ~/.helm/plugins/ \
    && wget https://github.com/app-registry/helm-plugin/releases/download/v0.3.7/registry-helm-plugin-v0.3.7-dev-linux-x64.tar.gz -qO- | tar xzf - registry \
    && mv ./registry ~/.helm/plugins/

ENTRYPOINT ["helm"]
