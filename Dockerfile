# Starts from postgresql image
FROM postgres:13.2

# Set locales to portuguese
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8

# Copies database creation files 
COPY old_database.sql /docker-entrypoint-initdb.d/
#COPY app/initdb.sh /docker-entrypoint-initdb.d/init-user-db.sh

# Copies configuration files
#COPY configs/postgresql.conf /etc/postgresql/postgresql.conf
#COPY configs/pg_hba.conf /etc/postgresql/pg_hba.conf