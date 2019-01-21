FROM ruby:2.6.0

ENV APP_DIR=/app

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Cache bundle install
COPY Gemfile ./

COPY . $APP_DIR
RUN bundle install