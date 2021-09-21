# Connecting Tableau to the Database

1. From your laptop, create an ssh tunnel through the server to the database 
  `ssh -i yourprivatekey -L 5433:database.mlpolicylab.dssg.io:5432 youusername@server.mlpolicylab.dssg.io`
  
2. On Tableau, choose connect to postgres and use the following settings:
  - server: localhost
  - port: 5433
  - Database: yourdatabasename
  - authentication: username and password
  - usernamne: yourusername
  - password: yourpassword
