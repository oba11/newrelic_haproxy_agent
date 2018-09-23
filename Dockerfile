FROM ruby:2.0

MAINTAINER Oluwaseun Obajobi <oba@obajobi.com>

ENV NEW_RELIC_LICENSE_KEY=

COPY . /src
WORKDIR /src

RUN bundle install
RUN bundler

CMD ["/src/bin/run.sh"]
