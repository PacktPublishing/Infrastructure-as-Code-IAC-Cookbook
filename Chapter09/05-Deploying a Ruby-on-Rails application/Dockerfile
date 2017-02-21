FROM ruby:2.3
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -qy nodejs && \
  rm -rf /var/lib/apt/* && \
  rm -rf /var/lib/cache/* && \
  rm -rf /var/lib/log/* && \
  rm -rf /tmp/*
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --without test development --jobs 20 --retry 5
COPY . /usr/src/app
RUN RAILS_ENV=production rake assets:precompile
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
