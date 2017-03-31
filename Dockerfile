FROM ruby:2.4.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev

RUN gem install bundler

ENV APP_HOME /finance
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

COPY . $APP_HOME
