-- creation des roles northwwind_readonly, northwind_dbt
CREATE ROLE northwwind_readonly WITH NOLOGIN;
CREATE ROLE northwind_dbt WITH NOLOGIN;

-- connection a la base de données
GRANT CONNECT ON DATABASE "Northwind" TO northwwind_readonly, northwind_dbt;

-- lire le schema public
GRANT USAGE ON SCHEMA public TO northwwind_readonly, northwind_dbt;

-- cree un schema pour dbt_dev
CREATE SCHEMA dbt_dev AUTHORIZATION northwind_dbt;

-- permetre de cree des schémas (dbt_dev)
GRANT USAGE, CREATE ON SCHEMA dbt_dev  TO northwind_dbt;
--permission SELECT,INSERT,UPDATE,DELETE 
GRANT SELECT, INSERT,UPDATE,DELETE 
ON ALL TABLES IN SCHEMA dbt_dev 
TO northwind_dbt;


--Creation des utilisateur
CREATE USER analyste PASSWORD 'analyste123';
-- ajoute le role northwwind_readonly a utilisateur analyste
GRANT northwwind_readonly TO analyste;

CREATE USER dbt_user PASSWORD 'dbt123';
GRANT northwind_dbt TO dbt_user;