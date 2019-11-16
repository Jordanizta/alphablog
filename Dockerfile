FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /alphablog

WORKDIR /alphablog

COPY Gemfile /alphablog/Gemfile

COPY Gemfile.lock /alphablog/Gemfile.lock

RUN bundle install

COPY . /alphablog

RUN chown -R 1000:1000 /alphablog

EXPOSE 3000