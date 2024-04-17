create table lake (id serial primary key, name text, square int);
insert into lake (name, square) values ("Baikal", 5647);
insert into lake (name, square) values ("Ozero", 999);

WITH objects as (SELECT
    current_database() AS database_name,
      pg_namespace.nspname AS schema_name,
		pg_class.relname AS object_name,
			pg_class.reltablespace as tbspc FROM
            pg_catalog.pg_class
			INNER JOIN    pg_catalog.pg_namespace ON pg_class.relnamespace = pg_namespace.oid
			LEFT JOIN pg_tablespace ON pg_tablespace.oid = pg_class.reltablespace WHERE  
			pg_class.relname NOT LIKE 'pg_%%' ORDER BY database_name,
				schema_name,object_name), tblspcs as (
			SELECT * FROM pg_database JOIN pg_tablespace ON pg_database.dattablespace = pg_tablespace.oid)
			SELECT (CASE WHEN objects.tbspc = 0 THEN (SELECT tblspcs.spcname FROM tblspcs WHERE datname = objects.database_name)
			ELSE (SELECT spcname FROM pg_tablespace WHERE oid = objects.tbspc)
			END), objects.object_name FROM objects;
