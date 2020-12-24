MYSQL_ROOT_PWD=123321
MYSQL_USER=moodle
MYSQL_USER_PWD=123321
MYSQL_USER_DB=moodledb

service mysql start $ sleep 1011

# mysql --user=root --password=root -e "UPDATE mysql.user set authentication_string=password('$MYSQL_ROOT_PWD') where user='root'; FLUSH PRIVILEGES;"

# new database
mysql --user=root --password=root -e "CREATE DATABASE $MYSQL_USER_DB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# new user
mysql --user=root --password=root -e "CREATE USER $MYSQL_USER@'%' IDENTIFIED WITH mysql_native_password BY '$MYSQL_USER_PWD';"

# GRANT PERMISSIONS
mysql --user=root --password=root -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON $MYSQL_USER_DB.* TO $MYSQL_USER@'%'; FLUSH PRIVILEGES;"

