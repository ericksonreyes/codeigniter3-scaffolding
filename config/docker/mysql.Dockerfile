FROM mysql:5.5

WORKDIR /etc/mysql/conf.d

COPY config/docker/config/mysql/my.cnf .

RUN chown -R mysql:mysql /var/log/mysql && touch /var/log/mysql/mysql_error.log && touch /var/log/mysql/mysql_slow.log

EXPOSE 3306