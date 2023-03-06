FROM ruby:3.1.2-alpine

ENV BUNDLER_VERSION=2.3.18

RUN apk add --update --no-cache \
    build-base \
    file \
    git \
    nodejs \
    pkgconfig \
    postgresql-dev \
    tzdata \
    yarn 

WORKDIR /app

# ENV RAILS_ENV=production
# ENV RAILS_SERVE_STATIC_FILES=true

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install 

RUN yarn install --check-files

COPY . ./ 

# ENV SECRET_KEY_BASE=(key located in config/master.key, which is obviously hidden in this repo)
# RUN bundle exec rake assets:precompile

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]