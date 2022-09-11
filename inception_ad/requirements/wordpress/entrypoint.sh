#!/bin/bash

sed -ie 's/$USER/'$DB_ADMIN'/' /var/www/wordpress/wp-config.php
sed -ie 's/$DB_NAME/'$DB_DATA_BASE_NAME'/' /var/www/wordpress/wp-config.php
sed -ie 's/$PWD/'$DB_ADMIN_PASSWORD'/' /var/www/wordpress/wp-config.php

if [ -f "var/www/wordpress/conf" ];then
    echo ""
else
    cd /var/www/wordpress
    wp core --allow-root install --url="https://adegadri.42.fr/" --title="Inception Adegadri" --admin_name=eli --admin_email=gadriadel@hotmail.fr --admin_password=123Soleil;
    wp --allow-root user create other other@gmail.com --user_pass=pass
    #wp --allow-root plugin install redis-cache --activate
    touch conf
fi

exec /usr/sbin/php-fpm7.3 -F -R