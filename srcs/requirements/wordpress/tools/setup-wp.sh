#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'
#timeout=30
#elapsed=0


#PHP para gestionar wordpress
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#TOCAR
#chmod +x wp-cli.phar
#until mysqladmin ping -h mariadb -P 3306 --silent; do
#	sleep 2
#	elapsed=$((elapsed + 2))
#    if [ "$elapsed" -ge "$timeout" ]; then exit 1; fi
#done
if [ ! -f "/var/www/html/wp-config.php" ]; then
#	mv wp-cli.phar /usr/local/bin/wp #Direccion  global facil acceso
	wp core download --allow-root --path=/var/www/html #descargar el codigo base de Wordpress

	wp config create --allow-root \
                     --dbname=$DB_NAME \
                     --dbuser=$DB_USER \
                     --dbpass=$DB_PASS \
                     --dbhost=mariadb:3306 --path='/var/www/html'
	 wp core install --allow-root \
                    --url=https://mfuente.42.fr \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_ADMIN_PASS \
                    --admin_email=$WP_ADMIN_MAIL --path='/var/www/html'

	wp user create $WP_USER $WP_USER_MAIL --user_pass=$WP_PASS --allow-root --role=author --path='/var/www/html'
fi
#Creacion de usuario de Wordpress
chown -R wp_user:wp_group /var/www/html && chmod -R 775 /var/www/html
#chown -R www-data /var/www/html && chmod -R 775 /var/www/html


#Inicia el servicio PHP-FPM
exec /usr/sbin/php-fpm7.4 -F
