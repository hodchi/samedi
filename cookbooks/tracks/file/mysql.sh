#!/bin/sh

shpass -p root mysql -u root -p -e "CREATE DATABASE tracks;" 
shpass -p root mysql -u root -p -e "GRANT ALL PRIVILEGES ON tracks.* TO root@localhost IDENTIFIED BY 'root' WITH GRANT OPTION;"
