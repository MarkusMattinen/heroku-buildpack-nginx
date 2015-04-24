#!/usr/bin/env bash

ruby $HOME/config/htpasswd.rb
erb $HOME/config/nginx.conf.erb > $HOME/config/nginx.conf

mkdir -p $HOME/logs/nginx
touch $HOME/logs/nginx/access.log $HOME/logs/nginx/error.log

chown -R root:root $HOME/config $HOME/logs
chmod -R g-g,o-o $HOME/config $HOME/logs

exec $HOME/vendor/nginx/sbin/nginx -p $HOME -c $HOME/config/nginx.conf
