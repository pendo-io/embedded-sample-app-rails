FROM amazonlinux:2016.09.0.20161118
MAINTAINER jamesbalazs1

RUN yum update -y && yum clean all

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -

RUN yum install -y ruby23 ruby23-devel patch zlib-devel gcc git sqlite-devel nodejs && \
    yum clean all
RUN gem install --no-ri --no-rdoc bundler:1.16.6 sass

ENV BUNDLE_PATH=/bundle \
BUNDLE_JOBS=2

COPY ./ /var/app/current
WORKDIR /var/app/current

EXPOSE 3000

CMD bundle install && bundle exec rails s -p 3000 -b 0.0.0.0
