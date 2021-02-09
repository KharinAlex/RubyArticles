FROM ruby:2.7-alpine

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install rails -v '5.1.6' 
RUN gem install bundler:1.16.6

WORKDIR /ruby_test
COPY Gemfile /ruby_test/
COPY Gemfile.lock /ruby_test/

RUN bundle install