## Database tips 

If your queries are taking a long time to run, it could be that they are idle. 

Idle queries are zoombie queries that for some reason were unable to finish and are hanging on your DB using resources and could be blocking other queries. 

### Look up for *idle* queries 

To see if your database has idle queries, check on the `pg_stat_activity` table:

```sql
select *  
from pg_stat_activity
where datname = 'bill_passage_bills1'
and state = 'idle';
--you can also filter by user
--and usename = 'liliana';
```

You can kill a query (any query!, **be careful** with this) in two ways: 

1. Gentle terminate: `pg_cancel_backend(pid);` This will "ask politely" to exit and kill the process. It could also take time to actually terminate the process.  
2. Force terminate: `pg_terminate_backend(pid);` This forces to kill the process. 

To kill a proces, get the process id (`pid`) associate with the query that is idle by querying the `pg_stat_activity` and execute: 

```sql
--with the pid got from pg_stat_activity
select pg_terminate_backend(1076643);
```

This will return a `T` (true) if it successfully terminate the process or `F` (false) if it didn't. You can get `F` if the `pid` doesn't exist, if it is not a postgresql process, or if you don't have the permissions to terminate it. 


### Why a query becomes `idle`

Some of the common reasons: 

* You are not running your process (`run.py`) within a screen session. You suddenly close the connection, or computer. Your query is still "running" on the backend and becomes idle. 
* You run a query in DBeaver, it was taking some time to finish, you loose your patience and close/kill the connection. That doesn't kill the query, it keeps running even when you close your connection and becomes idle. 
* Each time you connect to DBeaver it opens a connection to the DB, if you don't stop/cancel your running queries before closing DBeaver those will become idle. 

**To avoid idle queries**

* If you are running Triage, **always** use a screen session so you are able to detach from the session letting the process safely running while you do other stuff (even closing your computer)
* If you are running a query directly in DBeaver and hasn't finished by the time you need to go, cancel the query or stop it (both options in DBeaver). Do not just close DBeaver, that will leave your queries running on the backend
* If you are running a query in `psql` you must do it within a screen session. Otherwise, if you kill the process (`Ctlr+c`) it won't kill the query and will be running on the backend

> In case you don't know if your actions while desconnecting got your queries effectively killed, look for `idle` queries querying `pg_stat_activity`. 