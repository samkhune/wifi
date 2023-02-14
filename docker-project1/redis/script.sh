#!/bin/bash

cd /etc/redis/
sed -i 's/port 0/port 6379/g' redis.conf
