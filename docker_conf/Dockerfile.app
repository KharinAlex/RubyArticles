FROM ruby:alpine

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install rails -v '5.1.6'

WORKDIR /ruby_test
COPY Gemfile /ruby_test/
COPY Gemfile.lock /ruby_test/

RUN bundle install