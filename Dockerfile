FROM postgres:9.5
ADD ddl /docker-entrypoint-initdb.d
ADD functions /docker-entrypoint-initdb.d
