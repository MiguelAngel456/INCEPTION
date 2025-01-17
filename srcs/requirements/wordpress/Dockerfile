FROM debian:bullseye
#EN ORDEN DESDE INSTALL HACIA ABAJO
#	Instala el modulo necesario para PHP
#	Instala el modulo necesario para manejar bases de datos
#	Instala el modulo necesario para http y otras
#	Instala el modulo necesario para manejar imagenes en WP
#	Instala el modulo necesaria para manejar cadenas multibytes
#	Instala la herramienta de descomprim
#	obter info de servidores atraves de htpp y ftp
#	obter info de servidores atraves de htpp y ftp
RUN apt-get update -y && \	
    apt-get install -y \ 
	php7.4-fpm \	
	php7.4-mysql \	
	php7.4-curl \	
	php7.4-gd \	
	php7.4-mbstring \
	unzip \
	wget \ 
	curl

# PHP Settings
RUN mkdir -p /run/php/
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g"	/etc/php/7.4/fpm/pool.d/www.conf

RUN useradd wp_user && groupadd wp_group && usermod -aG wp_group wp_user

RUN mkdir -p /var/www/html && chown wp_user:wp_group /var/www/html

#RUN mkdir -p /var/www/html && chown www-data /var/www/html

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
RUN mkdir -p /var/www/html/wp-content/uploads
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup-wp.sh /scripts/setup-wp.sh
#COPY tools/title.txt /scripts/title.txt
#COPY config/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
#COPY config/wp-config.php /scripts/wp-config.php

RUN chmod +x /scripts/setup-wp.sh

EXPOSE 9000

CMD ["/scripts/setup-wp.sh"]
