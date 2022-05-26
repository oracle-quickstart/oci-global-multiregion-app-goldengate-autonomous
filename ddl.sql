ACCEPT GGADMIN_PWD CHAR PROMPT 'Enter the Password for ggadmin user >' HIDE

ACCEPT APP_PWD CHAR PROMPT 'Enter the Password for app user >' HIDE

--Activate Goldengate User on ADB

alter user ggadmin identified by &GGADMIN_PWD ;

--Create APP user for Apex Application

create user app identified by &APP_PWD ;

create table customers (
  customer_id     integer ,
  email_address   varchar2(255 char) not null,
  full_name       varchar2(255 char) not null)
;

create table stores (
  store_id          integer ,
  store_name        varchar2(255 char) not null,
  web_address       varchar2(100 char),
  physical_address  varchar2(512 char),
  latitude          number,
  longitude         number,
  logo_mime_type    varchar2(512 char),
  logo_filename     varchar2(512 char),
  logo_charset      varchar2(512 char),
  logo_last_updated date)
;

create table products (
  product_id         integer ,
  product_name       varchar2(255 char) not null,
  unit_price         number(10,2),
  image_mime_type    varchar2(512 char),
  image_filename     varchar2(512 char),
  image_charset      varchar2(512 char),
  image_last_updated date)
;

create table orders (
  order_id        integer ,
  order_datetime  timestamp not null,
  customer_id     integer not null,
  order_status    varchar2(10 char) not null,
  store_id        integer not null)
;

create table shipments (
  shipment_id          integer ,
  store_id             integer not null,
  customer_id          integer not null,
  delivery_address     varchar2(512 char) not null,
  shipment_status      varchar2(100 char) not null)
;

create table order_items (
  order_id        integer not null,
  line_item_id    integer not null,
  product_id      integer not null,
  unit_price      number(10,2) not null,
  quantity        integer not null,
  shipment_id     integer)
;

create table inventory (
  inventory_id          integer,
  store_id              integer not null,
  product_id            integer not null,
  product_inventory     integer not null)
;

create table customers_seq (
  customer_id     NUMBER PRIMARY KEY ,
  email_address   varchar2(255 char) not null,
  full_name       varchar2(255 char) not null)
;


create index customers_name_i on customers ( full_name );
create index orders_customer_id_i on orders ( customer_id );
create index orders_store_id_i on orders ( store_id );
create index shipments_store_id_i on shipments ( store_id );
create index shipments_customer_id_i on shipments ( customer_id );
create index order_items_shipment_id_i on order_items ( shipment_id );
create index inventory_product_id_i on inventory ( product_id );

--Sydney Sequence --
create sequence member_seq_syd start with 100 increment by 4 cache 100;

--Singapore Sequence --
create sequence member_seq_sgp start with 101 increment by 4 cache 100;

--Frankfurt Sequence --
create sequence member_seq_fra start with 102 increment by 4 cache 100;

--Ashburn Sequence --
create sequence member_seq_iad start with 103 increment by 4 cache 100;

--Sydney Insert Procedure --
create or replace procedure INSERT_CUSTOMERS_SYD (rows_inserted_nbr in number)
is
    rows_inserted number := 0;
Begin
    Loop
        Begin
            INSERT INTO customers_seq(customer_id, email_address, full_name)
            VALUES(member_seq_syd.nextval,dbms_random.string('L', 10) || '@' || dbms_random.string('L', 6) || '.com' , dbms_random.string('L', 10) || ' ' || dbms_random.string('L', 10));
            --Only increment counter when no duplicate exception
            rows_inserted := rows_inserted + 1;
        Exception When DUP_VAL_ON_INDEX Then Null;
        End;
        exit when rows_inserted = rows_inserted_nbr ;
    End loop;
    commit;
End;
/

--Singapore Insert Procedure --
create or replace procedure INSERT_CUSTOMERS_SGP (rows_inserted_nbr in number)
is
    rows_inserted number := 0;
Begin
    Loop
        Begin
            INSERT INTO customers_seq(customer_id, email_address, full_name)
            VALUES(member_seq_sgp.nextval,dbms_random.string('L', 10) || '@' || dbms_random.string('L', 6) || '.com' , dbms_random.string('L', 10) || ' ' || dbms_random.string('L', 10));
            --Only increment counter when no duplicate exception
            rows_inserted := rows_inserted + 1;
        Exception When DUP_VAL_ON_INDEX Then Null;
        End;
        exit when rows_inserted = rows_inserted_nbr ;
    End loop;
    commit;
End;
/

--Frankfurt Insert Procedure --
create or replace procedure INSERT_CUSTOMERS_FRA (rows_inserted_nbr in number)
is
    rows_inserted number := 0;
Begin
    Loop
        Begin
            INSERT INTO customers_seq(customer_id, email_address, full_name)
            VALUES(member_seq_fra.nextval,dbms_random.string('L', 10) || '@' || dbms_random.string('L', 6) || '.com' , dbms_random.string('L', 10) || ' ' || dbms_random.string('L', 10));
            --Only increment counter when no duplicate exception
            rows_inserted := rows_inserted + 1;
        Exception When DUP_VAL_ON_INDEX Then Null;
        End;
        exit when rows_inserted = rows_inserted_nbr ;
    End loop;
    commit;
End;
/

--Ashburn Insert Procedure --
create or replace procedure INSERT_CUSTOMERS_IAD (rows_inserted_nbr in number)
is
    rows_inserted number := 0;
Begin
    Loop
        Begin
            INSERT INTO customers_seq(customer_id, email_address, full_name)
            VALUES(member_seq_iad.nextval,dbms_random.string('L', 10) || '@' || dbms_random.string('L', 6) || '.com' , dbms_random.string('L', 10) || ' ' || dbms_random.string('L', 10));
            --Only increment counter when no duplicate exception
            rows_inserted := rows_inserted + 1;
        Exception When DUP_VAL_ON_INDEX Then Null;
        End;
        exit when rows_inserted = rows_inserted_nbr ;
    End loop;
    commit;
End;
/

-- Grant Access to App user for Admin Schema Objects--

grant create session to app;

grant dwrole to app;

grant select on admin.customers_seq to app;

grant insert on admin.customers_seq to app;

grant update on admin.customers_seq to app;

create public synonym customer for admin.customers_seq ;

--Unlock Goldengate user --

alter user ggadmin account unlock;

--Enable Supplemental logging with admin user for Replicat -- 

ALTER PLUGGABLE DATABASE ADD SUPPLEMENTAL LOG DATA;

select minimal from dba_supplemental_logging;

-- Delete Data -- 
 
--   truncate table order_items;

--   truncate table inventory;

--   delete shipments cascade;

--   delete orders cascade;

--   delete stores cascade;

--   delete customers cascade;

--   delete products cascade;

--   delete customers_seq cascade;
   
--   drop table customers cascade constraints;
   
--   drop table orders cascade constraints;
   
--   drop table order_items; 
  
--   drop table products; 
   
--   drop table shipments; 
   
--   drop table stores; 

--   drop table customers_seq; 

--   drop table inventory; 

--   drop table CKPT;

--   drop table CKPt_LOX;
  
