# See https://github.com/kubernetes/kubernetes/tree/c1d2ac43ee26a83fd4045353937977c120b7246b/cluster/addons/fluentd-elasticsearch/fluentd-es-image
FROM quay.io/fluentd_elasticsearch/fluentd:v2.6.0

COPY Gemfile /Gemfile

RUN echo 'gem: --no-document' >> /etc/gemrc \
    && gem install --file Gemfile
