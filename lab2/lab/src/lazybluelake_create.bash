mkdir -p $HOME/kdu94
mkdir -p $HOME/vdk81
mkdir -p $HOME/ygl69

CREATE TABLESPACE kdu94 LOCATION '/var/db/postgres0/kdu94';
CREATE TABLESPACE vdk81 LOCATION '/var/db/postgres0/vdk81';
CREATE TABLESPACE ygl69 LOCATION '/var/db/postgres0/ygl69';

CREATE DATABASE lazybluelake1 TEMPLATE template0;
CREATE DATABASE lazybluelake2 TEMPLATE template0;
CREATE DATABASE lazybluelake3 TEMPLATE template0;

alter DATABASE lazybluelake1 SET TABLESPACE kdu94;
alter DATABASE lazybluelake2 SET TABLESPACE vdk81;
alter DATABASE lazybluelake3 SET TABLESPACE ygl69;
CREATE ROLE USERS;
CREATE ROLE s335094 WITH LOGIN PASSWORD '228';

#inserting data

psql -d lazybluelake1  -p 9696 -h pg116 -U s335094 -W -f ./fill.sql
psql -d lazybluelake2  -p 9696 -h pg116 -U s335094 -W -f ./fill.sql
psql -d lazybluelake3  -p 9696 -h pg116 -U s335094 -W -f ./fill.sql