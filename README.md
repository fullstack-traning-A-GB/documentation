swagger http://localhost:8080/swagger-ui/index.html?configUrl=/v3/api-docs/swagger-config#


### SQL scripts

    create user bncadmin with password 'admin';
    create database bnc with owner 'bncadmin';
    grant all privileges on database bnc to bncadmin;
    grant connect on database bnc to bncadmin;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO bncadmin;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO bncadmin;
    
    create schema if not exists manager_schema;
    create schema if not exists crypto_schema;

    \c bnc
    
    
    create table if not exists manager_schema.users(

    id bigserial not null,
    username varchar(25) not null,
    password text not null,
    firstname varchar(30) not null,
    lastname varchar(30) not null,
    primary key(id),
    unique(username)

    );

    drop table if exists crypto_schema.currencies;
    create table if not exists crypto_schema.currencies(

    id bigserial not null,
    asset_id text not null,
    name varchar(30) not null,
    status varchar(10) not null,
    symbol varchar(10) not null,
    currency_type varchar(10) not null,
    price numeric not null,
    primary key(id),
    unique(asset_id)

    );

    drop table if exists manager_schema.users_currencies;
    create table if not exists manager_schema.users_currencies( 
    user_id bigserial not null,
    currency_id bigserial not null,
    favorite bool not null default false,
    unique(user_id,
    currency_id),
    constraint fk_users foreign key(user_id) references manager_schema.users(id),
    constraint fk_currencies foreign key(currency_id) references crypto_schema.currencies(id)
    );

