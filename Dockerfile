FROM ruby:2.7.1

# Install yarn
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update && \
    apt-get install -y build-essential nodejs yarn && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /railsapp
WORKDIR /railsapp

ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock

RUN bundle install
ADD . /railsapp

EXPOSE 3000
