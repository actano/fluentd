# See https://github.com/kubernetes/kubernetes/tree/c1d2ac43ee26a83fd4045353937977c120b7246b/cluster/addons/fluentd-elasticsearch/fluentd-es-image
FROM quay.io/fluentd_elasticsearch/fluentd:v2.6.0

COPY Gemfile /Gemfile

# The Kafka plugin requires native extensions
# (taken from https://github.com/fluent/fluentd-docker-image#debian-version-1)
RUN buildDeps="make gcc g++ libc-dev ruby-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install --file Gemfile \
 && gem sources --clear-all \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
