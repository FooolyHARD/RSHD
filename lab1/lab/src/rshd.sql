drop procedure if exists get_db_info();
create procedure get_db_info()
as $$
declare
   base_name text;
   base_oid int;
   creation_date text;
   logging_collector text;
   archive_mode text;
   db_encoding text;
   max_connections int;
   timezone text;
   data_directory text;
   default_transaction_isolation text;
   wal_level text;
begin
   select current_database() into base_name;
   select oid into base_oid from pg_database where datname = base_name;
   begin
       select (pg_stat_file('base/'|| base_oid ||'/PG_VERSION')).modification into creation_date;
   exception
       when insufficient_privilege then
           select 'UNABLE TO GET' into creation_date;
   end;
   select current_setting('archive_mode') into archive_mode;
   select current_setting('logging_collector') into logging_collector;
   select pg_encoding_to_char(encoding) into db_encoding from pg_database where datname = base_name;
   select setting::int into max_connections from pg_settings where name = 'max_connections';
   select current_setting('timezone') into timezone;
   begin
        select setting into data_directory from pg_settings where name = 'data_directory';
        if data_directory IS NULL then
                select 'UNABLE TO GET' into data_directory;
            end if;
   end;
   select current_setting('default_transaction_isolation') into default_transaction_isolation;
   select current_setting('wal_level') into wal_level;

   raise notice '% %', rpad('DB_OID:', 32), base_oid;
   raise notice '% %', rpad('NAME:', 32), base_name;
   raise notice '% %', rpad('CREATED:', 32), creation_date;
   raise notice '% %', rpad('ARCHIVE_MODE:', 32), archive_mode;
   raise notice '% %', rpad('LOGGING_COLLECTOR:', 32), logging_collector;
   raise notice '% %', rpad('ENCODING:', 32), db_encoding;
   raise notice '% %', rpad('MAX_CONNECTIONS:', 32), max_connections;
   raise notice '% %', rpad('TIMEZONE:', 32), timezone;
   raise notice '% %', rpad('DATA_DIRECTORY:', 32), data_directory;
   raise notice '% %', rpad('DEFAULT_TRANSACTION_ISOLATION:', 32), default_transaction_isolation;
   raise notice '% %', rpad('WAL_LEVEL:', 32), wal_level;
end
$$ language PLPGSQL;

call get_db_info();