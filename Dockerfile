FROM ruby
MAINTAINER Joao Costa <joaocosta@zonalivre.org>

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs sqlite3 vim yarn

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

ADD . /myapp
