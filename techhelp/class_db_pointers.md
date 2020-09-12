# Some pointers for using the course database

Each group has their own database, named `{group_name}_database`. For example, team bills1 has `bills1_database`. Log in the same way you log into group_students_database: 
```bash
psql -h mlpolicylab.db.dssg.io -U {andrewid} -d {group_name}_database 
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
