drop database link site2;

create database link site2
connect to system identified by "123456"
using '(DESCRIPTION =
        (ADDRESS_LIST =
            (ADDRESS = (PROTOCOL = TCP)
            (HOST = 192.168.119.145)
            (PORT = 1521))
        )
        (CONNECT_DATA =(SID = XE))
        )'
;