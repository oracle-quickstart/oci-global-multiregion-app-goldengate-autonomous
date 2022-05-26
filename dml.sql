  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (1,'tammy.bryant@internalmail','Tammy Bryant');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (2,'roy.white@internalmail','Roy White');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (3,'gary.jenkins@internalmail','Gary Jenkins');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (4,'victor.morris@internalmail','Victor Morris');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (5,'beverly.hughes@internalmail','Beverly Hughes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (6,'evelyn.torres@internalmail','Evelyn Torres');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (7,'carl.lee@internalmail','Carl Lee');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (8,'douglas.flores@internalmail','Douglas Flores');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (9,'norma.robinson@internalmail','Norma Robinson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (10,'gregory.sanchez@internalmail','Gregory Sanchez');

  
  commit;
  
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (1,to_timestamp('04-FEB-2018 13.20.22.245676861','DD-MON-YYYY HH24.MI.SS.FF'),3,1,'CANCELLED');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (2,to_timestamp('08-FEB-2018 20.58.10.472721115','DD-MON-YYYY HH24.MI.SS.FF'),45,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (3,to_timestamp('09-FEB-2018 23.17.07.242517323','DD-MON-YYYY HH24.MI.SS.FF'),18,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (4,to_timestamp('10-FEB-2018 13.43.36.061928731','DD-MON-YYYY HH24.MI.SS.FF'),45,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (5,to_timestamp('11-FEB-2018 18.01.30.906119035','DD-MON-YYYY HH24.MI.SS.FF'),2,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (6,to_timestamp('13-FEB-2018 20.11.48.702319539','DD-MON-YYYY HH24.MI.SS.FF'),74,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (7,to_timestamp('22-FEB-2018 00.57.11.011114421','DD-MON-YYYY HH24.MI.SS.FF'),9,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (8,to_timestamp('22-FEB-2018 15.00.52.003836100','DD-MON-YYYY HH24.MI.SS.FF'),109,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (9,to_timestamp('23-FEB-2018 13.25.26.824165229','DD-MON-YYYY HH24.MI.SS.FF'),127,1,'COMPLETE');
  Insert into ORDERS (ORDER_ID,ORDER_DATETIME,CUSTOMER_ID,STORE_ID,ORDER_STATUS) values (10,to_timestamp('23-FEB-2018 14.02.10.185866897','DD-MON-YYYY HH24.MI.SS.FF'),106,1,'COMPLETE');
  
  commit;

 insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (1,'Online','https://www.example.com',null,null,null,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (2,'San Francisco',null,'Redwood Shores
    500 Oracle Parkway
    Redwood Shores, CA 94065',37.529395,-122.267237,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (3,'Seattle',null,'1501 Fourth Avenue
    Suite 1800
    Seattle, WA 98101',47.6053,-122.33221,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (4,'New York City',null,'205 Lexington Ave
    7th Floor
    New York, NY 10016',40.745216,-73.980518,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (5,'Chicago',null,'233 South Wacker Dr.
    45th Floor
    Chicago, IL 60606',41.878751,-87.636675,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (6,'London',null,'One South Place
    London
    EC2M 2RB',51.519281,-0.087296,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (7,'Bucharest',null,'Floreasca Park
    43 Soseaua Pipera, corp B.
    Sector 2
    Bucharest , 014254
    RO',44.43225,26.10626,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (8,'Berlin',null,'Behrenstraße 42 (Humboldt Carré)
    10117 Berlin',52.5161,13.3873,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (9,'Utrecht',null,'Hertogswetering 163-167, 3543 AS Utrecht, Netherlands',52.103263,5.061644,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (10,'Madrid',null,'C/ José Echegaray 6B
    Las Rozas
    28230 Madrid',40.4929,-3.8737,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (11,'Johannesburg',null,'Woodmead North Office Park
    54 Maxwell Drive
    Jukskeiview, Sandton, 2196',-26.044222,28.094662,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (12,'Lagos',null,'1391 Tiamiyu Savage St, Victoria Island, Lagos, Nigeria',6.42806,3.42199,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (13,'Bengaluru',null,'193, Bannerghatta Main Rd, Industrial Area, Stage 2, BTM Layout, Bengaluru, Karnataka 560076, India',12.8939,77.5978,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (14,'Mumbai',null,'First International Financial Center
    Unit No. 501, Level 5
    No. C54 55, G Block
    Bandra Kurla Complex
    CTS No. 4207, Kolekalyan Village
    Mumbai - 400 051
    India',19.069405,72.870143,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (15,'New Dehli',null,'F-01/02, First Floor
    Salcon Rasvillas
    D-1, District Centre,
    Saket, New Delhi - 110017
    India',28.527693,77.220135,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (16,'Sydney',null,'Riverside Corporate Park
    4 Julius Avenue
    North Ryde
    NSW 2113',-33.797279,151.143826,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (17,'Perth',null,'Level 9
    225 St Georges Terrace
    Perth WA 6000',-31.953715,115.851645,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (18,'São Paulo',null,'Rua Dr. Jose Aureo Bustamante,
    455 - Vila Cordeiro,
    CEP 04710-090 São Paulo',-23.5475,-46.63611,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (19,'Buenos Aires',null,'Juana Manso 1069, Buenos Aires, Argentina',-34.61016,-58.362867,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (20,'Mexico City',null,'Montes Urales # 470 P3
    Col. Lomas de Chapultepec
    Delegación Miguel Hidalgo - C.P. 11000',19.428489,-99.205745,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (21,'Bejing',null,'China, Beijing Shi, Haidian Qu, Dongbeiwang W Rd, 8, 100085',40.0572,116.290061,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (22,'Tokyo',null,'2 Chome-5-? Kitaaoyama, Minato City, Tokyo 107-0061, Japan',35.671534,139.718584,null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO_MIME_TYPE) values (23,'Tel Aviv',null,'B, Aharon Bart St 18, Petah Tikva, 4951400, Israel',32.100664,34.862138,null);

commit;