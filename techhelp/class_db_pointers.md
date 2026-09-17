# Some pointers for using the course database

Each group has their own database, named `{group_name}_database`. For example, team bills1 has `bills1_database`. Log in the same way you log into group_students_database: 
```bash
psql -h database.mlpolicylab.dssg.io -U {andrewid} -d {group_name}_database 
```
Or, if using DBeaver, simply update the Database field to your group's database name.

## Access and permissions
Within your group database, you'll find several schemas (depending on your particular project). Most of these schemas are read-only in order to avoid accidentally modifying or overwriting the raw data for the project, but you should be able to write to the `sketch` schema as well as create new schemas to help organize your project work. You can run the following query to get more information on permissions:
```sql
SELECT *
FROM information_schema.role_table_grants
```

### Creating new schemas
When you create a new schema, you'll want to be sure to grant permissions to everyone in your group, which can be done by granting privileges to your group name, for instance:
```sql
CREATE SCHEMA my_new_schema;
GRANT ALL ON SCHEMA my_new_schema TO {group_name};
```
(replacing `{group_name}` with your group name, such as `bills1`)

### Creating new tables
Likewise, when you create a new table, you'll want to grant permissions to everyone in your group:
```sql
CREATE TABLE my_schema.my_new_table (
  some_column_name INT,
  some_other_column VARCHAR,
);
GRANT ALL ON my_schema.my_new_table TO {group_name};
```
(replacing `{group_name}` with your group name, such as `bills1`)

## Query Performance
Most of these projects use moderately large data. While postgres can work with this type of structured data very efficiently if your queries and tables are properly optimized, if they aren't, some queries can be painfully slow. A few pointers:
- Especially when creating relatively large tables, using [appropriate indices](https://www.postgresqltutorial.com/postgresql-indexes/postgresql-create-index/) will vastly improve accessing data and joining to the table
- For large, complex queries, subqueries are typically less performant that [CTEs](http://www.craigkerstiens.com/2013/11/18/best-postgres-feature-youre-not-using/) or building up pieces with temporary tables (which, in turn, can be indexed as well)
- Be sure you're making use of the relational nature of the database; often, if you find yourself doing a large number of small queries in a loop to do the same thing to different slices of the data, you could likely optimize by reworking this into a single query that works on everything at once.
- Pandas is very, very bad at moving large amounts of data into databases from python -- take a look at [Ohio](https://github.com/dssg/ohio) for a more efficient option.

### Killing hung or run-away queries
If you think one of your queries has hung (or is taking far longer or too many resources than it should), you can run the following query to confirm that it is still running:
```sql
SELECT * FROM pg_stat_activity;
```
If you need to kill your query, you can note down the PID from that result and then use:
```sql
SELECT pg_cancel_backend({PID});
```
To kill it (it's a good idea to check `pg_stat_activity` again to ensure it's been killed). Sometimes that may not work, and you need to use the more aggressive:
```sql
SELECT pg_terminate_backend({PID});
```

### Remember to close your database connections
It's always a good practice to close out your database connections explicitly, both for database software (such as dbeaver) as well as `psycopg2` connections from python (e.g., make sure you run `cursor.close()` as well as `connection.close` after running all your queries).

### Troubleshooting Slow Queries

If your queries are taking a long time to run, it could be that they are idle. 

Idle queries are zoombie queries that for some reason were unable to finish and are hanging on your DB using resources and could be blocking other queries. 

#### Look  for *idle* queries 

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


#### Why a query becomes `idle`

Some of the common reasons: 

* You are not running your process (`run.py`) within a screen session. You suddenly close the connection, or computer. Your query is still "running" on the backend and becomes idle. 
* You run a query in DBeaver, it was taking some time to finish, you loose your patience and close/kill the connection. That doesn't kill the query, it keeps running even when you close your connection and becomes idle. 
* Each time you connect to DBeaver it opens a connection to the DB, if you don't stop/cancel your running queries before closing DBeaver those will become idle. 

**To avoid idle queries**

* If you are running Triage, **always** use a screen session so you are able to detach from the session letting the process safely running while you do other stuff (even closing your computer)
* If you are running a query directly in DBeaver and hasn't finished by the time you need to go, cancel the query or stop it (both options in DBeaver). Do not just close DBeaver, that will leave your queries running on the backend
* If you are running a query in `psql` you must do it within a screen session. Otherwise, if you kill the process (`Ctlr+c`) it won't kill the query and will be running on the backend

> In case you don't know if your actions while desconnecting got your queries effectively killed, look for `idle` queries querying `pg_stat_activity`. 
