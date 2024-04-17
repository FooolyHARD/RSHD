[postgres0@pg116 ~]$ PGDATA=$HOME/qkl81
[postgres0@pg116 ~]$ PGLOCALE=eu_EU.ANSI1251
[postgres0@pg116 ~]$ PGENCODE=WIN1251
[postgres0@pg116 ~]$ PHUSERNAME=postgres0
[postgres0@pg116 ~]$ PGUSERNAME=postgres0
[postgres0@pg116 ~]$ PGHOST=pg116
[postgres0@pg116 ~]$ export PGDATA PGLOCALE PGUSERNAME PGHOST PGENCODE
[postgres0@pg116 ~]$ pg_ctl -D $HOME/qkl81 -l logfile start