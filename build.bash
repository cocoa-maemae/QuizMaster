#/usr/bin/env bash

# install essential pakcages
yum install -y epel-release \
  && yum install -y sudo net-tools gcc gcc-c++ patch readline zlib make bzip2 autoconf automake libtool bison \
  && yum install -y httpd sqlite

# install essential pakcages for development
arg=$@
if [ ${arg} = 'dev' ]; then
  yum install -y readline-devel zlib-devel libyaml-devel libffi-devel openssl-devel iconv-devel libyaml-devel libffi-devel \
    && yum install -y httpd-devel sqlite-devel
fi

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

# passenger set up
if [ ! -e '/etc/httpd/conf.d/passenger.conf' ]; then
  /usr/bin/bash -lc "vendor/bundle/ruby/2.5.0/bin/passenger-install-apache2-module --auto --language=ruby"
  /usr/bin/bash -lc "vendor/bundle/ruby/2.5.0/bin/passenger-install-apache2-module --snippet > /etc/httpd/conf.d/passenger.conf && echo 'RailsEnv production' >> /etc/httpd/conf.d/passenger.conf"
fi

systemctl restart httpd

exit 0
