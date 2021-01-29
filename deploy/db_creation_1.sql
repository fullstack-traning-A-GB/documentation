create user bncadmin with password 'admin';
create database bnc with owner 'bncadmin';
grant all privileges on database bnc to bncadmin;
grant connect on database bnc to bncadmin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO bncadmin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO bncadmin;
