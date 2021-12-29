ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION

RUN mkdir /railsapp
WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock

RUN bundle install
ADD . /railsapp

EXPOSE 3000
