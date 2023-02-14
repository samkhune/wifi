#!/bin/bash
cd /etc/php/7.4/fpm/pool.d/
sed -i 's/pm.max_children = 5/pm.max_children = 30/g' www.conf

cd /etc/php/7.4/fpm/
sed -i 's/short_open_tag = Off/short_open_tag = On/g' php.ini
sed -i 's/post_max_size = 11M/post_max_size=32M/g' php.ini
sed -i 's/upload_max_filesize = 10M/upload_max_filesize= 32M/g' php.ini
sed -i 's/unix:\/\/\/var\/run\/redis\/redis.sock?timeout=5/tcp:\/\/localhost:6379?timeout=30/g' php.ini
sed -i 's/session.gc_maxlifetime = 1440/session.gc_maxlifetime = 7200/g' php.ini


cd /etc/php/7.4/cli/
sed -i 's/session.gc_maxlifetime = 1440/session.gc_maxlifetime = 7200/g' php.ini


