#!/bin/bash

cd /etc/mysql/
sed -i 's/#sql_mode/sql_mode/g' my.cnf
sed -i 's/NO_ENGINE_SUBSTITUTION,TRADITIONAL//g' my.cnf
