-- creation des roles northwind_readonly, northwind_dbt
CREATE ROLE northwind_readonly WITH NOLOGIN;
CREATE ROLE northwind_dbt WITH NOLOGIN;

-- connection a la base de données
GRANT CONNECT ON DATABASE "Northwind" TO northwind_readonly, northwind_dbt;

-- lire le schema public
GRANT USAGE ON SCHEMA public TO northwind_readonly, northwind_dbt;

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
-- ajoute le role northwind_readonly a utilisateur analyste
GRANT northwind_readonly TO analyste;

CREATE USER dbt_user PASSWORD 'dbt123';
GRANT northwind_dbt TO dbt_user;

-- toutes les tables futures auront les meme regles
ALTER DEFAULT PRIVILEGES
FOR ROLE dbt_user
IN SCHEMA public
GRANT SELECT ON TABLES TO northwind_readonly;

-- Supprimer les utilisateurs de connexion
-- DROP USER IF EXISTS analyste;
-- DROP USER IF EXISTS dbt_user;

-- -- Supprimer les rôles de groupe
-- DROP ROLE IF EXISTS northwind_readonly;
-- DROP ROLE IF EXISTS northwind_dbt;

-- REVOKE ALL PRIVILEGES ON DATABASE "Northwind" FROM northwind_dbt;

-- REVOKE ALL PRIVILEGES ON SCHEMA public FROM northwind_dbt;