# See https://github.com/kubernetes/kubernetes/tree/8743a0e3c67bbe7be4666cc68e1d63c92dd3b1bf/cluster/addons/fluentd-elasticsearch
FROM gcr.io/google-containers/fluentd-elasticsearch:v2.3.2

COPY Gemfile /Gemfile

RUN echo 'gem: --no-document' >> /etc/gemrc \
    && gem install --file Gemfile
