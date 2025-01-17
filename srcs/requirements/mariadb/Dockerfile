FROM debian:bullseye

RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./config/my.cnf /etc/mysql/my.cnf
COPY ./db.sh /db.sh 

RUN chmod 644 /etc/mysql/my.cnf
RUN mkdir -p /var/run/mysqld/
RUN chmod 777 /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql/
RUN chmod +x /db.sh
RUN mysql_install_db --user=mysql

EXPOSE 3306

CMD ["/db.sh"]
