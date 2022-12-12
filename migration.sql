create database product_management;

use product_management;

create table regional_offices (
    code char(3),
    name varchar(255),
    primary key (code)
);

create table branches (
    regional_office_code char(3),
    code char(2),
    name varchar(255),
    primary key (regional_office_code, code),
    foreign key (regional_office_code) references regional_offices(code)
);

create table product_types (
    code char(2),
    name varchar(255),
    primary key (code)
);

create table products (
    code char(3),
    name varchar(255),
    product_type_code char(2),
    primary key (code),
    foreign key (product_type_code) references product_types(code)
);

create table inventories (
    regional_office_code char(3),
    code char(2),
    product_code char(3),
    primary key (regional_office_code, code, product_code),
    foreign key (regional_office_code) references regional_offices(code),
    foreign key (product_code) references products(code)
);