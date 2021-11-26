CREATE DATABASE rotators OWNER postgres;

CREATE USER Dotty WITH PASSWORD '${{ secrets.DB_USR_TERRA }}'; 
CREATE USER Fiber WITH PASSWORD '${{ secrets.DB_USR_FIBER }}'; 

GRANT ALL PRIVILEGES ON DATABASE rotators TO Dotty, Fiber;


CREATE DATABASE hydraulics OWNER postgres;
CREATE USER Terra WITH PASSWORD '${{ secrets.DB_USR_TERRA }}'; 
CREATE USER Azerty WITH PASSWORD '${{ secrets.DB_USR_AZERTY }}'; 

GRANT ALL PRIVILEGES ON DATABASE hydraulics TO Terra, Azerty;

CREATE DATABASE jumpers OWNER postgres; 
CREATE USER Efk WITH PASSWORD '${{ secrets.DB_USR_EFK }}'; 
CREATE USER Spark WITH PASSWORD '${{ secrets.DB_USR_SPARK }}'; 

GRANT ALL PRIVILEGES ON DATABASE jumpers TO Efk, Spark;

CREATE USER Alpha WITH PASSWORD '${{ secrets.DB_USR_ALPHA }}';

GRANT CONNECT ON DATABASE rotators, hydraulics, jumpers TO Alpha;