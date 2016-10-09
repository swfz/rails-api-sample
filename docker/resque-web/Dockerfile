FROM ruby:2.3.1

COPY Gemfile /Gemfile
RUN gem install bundler
RUN bundle install --path vendor/bundle

EXPOSE 5678

ENTRYPOINT ["bundle","exec","resque-web","-F"]
CMD ["-h"]
