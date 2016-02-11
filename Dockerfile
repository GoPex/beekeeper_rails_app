# Uses GoPex ubuntu_ruby stock image
FROM gopex/ubuntu_ruby:2.3.0
MAINTAINER Albin Gilles "gilles.albin@gmail.com"
ENV REFRESHED_AT 2016-02-11

# Install rails dependencies
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs sqlite

# Prepare container for our app
ENV APP_DIR /rails_app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Set the port exposed by this application
EXPOSE 3000

# Override the rails entry point with launching our application with puma
ENTRYPOINT ["puma"]

# Send parameter to our entrypoint
CMD ["-C", "./config/puma.rb"]

ENV REFRESHED_AT 2016-02-11.1

# Copy our application into the container
COPY . .

# Install gems
RUN bundle install
