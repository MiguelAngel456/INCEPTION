#!/bin/bash

#cat << EOF > create_db.sql
#ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
#CREATE DATABASE IF NOT EXISTS ${DB_NAME};
#ALTER DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
#CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
#GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
#FLUSH PRIVILEGES;
#EOF
#chown -R mysql:mysql /var/lib/mysql
#mysqld --user=mysql --bootstrap < create_db.sql
#exec mysqld


set -e

# Check if WordPress database exists
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then

	# Initialization file
	cat << EOF > create_db.sql
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
ALTER DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

	# Execute initialization file
	mysqld --user=mysql --bootstrap < create_db.sql

	chown -R www-data /var/lib/mysql
	chmod -R 777 /var/lib/mysql

	# Check if initialization failed
	if [ $? -ne 0 ]; then echo "Failed to initialize database"; exit 1; fi
	echo "Database and user created successfully"
fi

chown -R www-data /var/lib/mysql
chmod -R 777 /var/lib/mysql

# Execute MariaDB
exec mysqld --bind-address=0.0.0.0

