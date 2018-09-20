#/usr/bin/env bash

mkdir tmp && mkdir tmp/cache \
  && chmod -R 777 tmp && chmod -R 777 log

# install essential pakcages
yum install -y epel-release \
  && yum -y update \
  && yum install -y sudo net-tools gcc gcc-c++ patch readline zlib make bzip2 autoconf automake libtool bison \
  && yum install -y httpd sqlite nodejs

# install essential devel pakcages
yum install -y curl-devel readline-devel zlib-devel libyaml-devel libffi-devel openssl-devel iconv-devel libyaml-devel libffi-devel \
  && yum install -y httpd-devel sqlite-devel

# nodejs and npm version up
npm install -g n
n latest
ln -sf /usr/local/bin/node /usr/bin/node
npm update -g npm
ln -sf /usr/local/bin/npm /usr/bin/npm

# install yarn
npm install -g yarn

# install rbenv
if [ ! -e '/tmp/ruby-build/install.sh' ]; then
  git clone git://github.com/sstephenson/ruby-build.git /tmp/ruby-build
fi

if [ ! -e '/usr/local/rbenv/bin/rbenv' ]; then
  git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
  echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile
  echo 'eval "$(rbenv init -)"' >> /etc/profile
  source /etc/profile
  sh /tmp/ruby-build/install.sh
fi

# install ruby
ruby -v &> /dev/null
if [ $? -ne 0 ]; then
  rbenv install 2.5.1
  rbenv global 2.5.1
fi

# install bundler
bundle -v &> /dev/null
if [ $? -ne 0 ]; then
  gem install bundler
fi

# install rails at first
# bundle exec rails -v &> /dev/null
# if [ $? -ne 0 ]; then
#   bundle install --path vendor/bundle
# fi

# install gem
bundle install --path vendor/bundle
 
# install passenger
passenger -v &> /dev/null
if [ $? -ne 0 ]; then
  gem install -N passenger
fi

# passenger set up
if [ ! -e '/etc/httpd/conf.d/passenger.conf' ]; then
  /usr/bin/bash -lc "passenger-install-apache2-module --auto --language=ruby"
  /usr/bin/bash -lc "passenger-install-apache2-module --snippet > /etc/httpd/conf.d/passenger.conf && echo 'RailsEnv production' >> /etc/httpd/conf.d/passenger.conf"
fi

# apache set up
cp -rp httpd/quiz_master.conf /etc/httpd/conf.d/
systemctl restart httpd

# js package install
yarn install

exit 0
