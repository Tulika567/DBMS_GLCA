CREATE TABLE supplier (
  SUPP_ID INTEGER PRIMARY KEY,
  SUPP_NAME varchar(50) NOT NULL,
  SUPP_CITY varchar(50) NOT NULL,
  SUPP_PHONE varchar(50) NOT NULL
);

CREATE TABLE customer (
  CUS_ID INTEGER PRIMARY KEY,
  CUS_NAME varchar(20) NOT NULL,
  CUS_PHONE varchar(20) NOT NULL,
  CUS_CITY varchar(20) NOT NULL,
  CUS_GENDER char
);

CREATE TABLE category (
  CAT_ID INTEGER PRIMARY KEY,
  CAT_NAME varchar(20) NOT NULL
);

CREATE TABLE product (
  PRO_ID INTEGER PRIMARY KEY,
  PRO_NAME varchar(20) NOT NULL DEFAULT 'Dummy',
  PRO_DESC varchar(60),
  CAT_ID INTEGER,
  FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

CREATE TABLE supplier_pricing (
  PRICING_ID INTEGER PRIMARY KEY,
  PRO_ID INTEGER,
  SUPP_ID INTEGER,
  SUPP_PRICE INTEGER DEFAULT 0,
  FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE orders (
  ORD_ID INTEGER PRIMARY KEY,
  ORD_AMOUNT INTEGER NOT NULL,
  ORD_DATE date NOT NULL,
  CUS_ID INTEGER,
  PRICING_ID INTEGER,
  FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE rating (
  RAT_ID INTEGER PRIMARY KEY,
  ORD_ID INTEGER,
  PRICING_ID INTEGER,
  FOREIGN KEY (ORD_ID) REFERENCES orders(ORD_ID),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID),
  RAT_RATSTARS INTEGER NOT NULL
);


INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) VALUES ('1', 'Rajesh Retails', 'Delhi', '1234567890'),('2', 'Appario Ltd.', 'Mumbai', '2589631470'
),('3', 'Knome products', 'Banglore', '9785462315'),('4', 'Bansal Retails', 'Kochi', '8975463285'),('5', 'Mittal Ltd.', 'Lucknow', '7898456532'
);

INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES ('1', 'AAKASH', '9999999999', 'DELHI', 'M'),('2', 'AMAN', '9785463215', 'NOIDA', 'M'
),('3', 'NEHA', '9999999999', 'MUMBAI', 'F'),('4', 'MEGHA', '9994562399', 'KOLKATA', 'F'),('5', 'PULKIT', '7895999999', 'LUCKNOW', 'M'
);

INSERT INTO category (CAT_ID, CAT_NAME) VALUES ('1', 'BOOKS'),('2', 'GAMES'),('3', 'GROCERIES'),('4', 'ELECTRONICS'),('5', 'CLOTHES');

INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES ('1', 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', '2'),('2', 'TSHIRT', 'SIZE-L with Black, Blue and White variations', '5'),('3', 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', '4'),('4', 'OATS', 'Highly Nutritious from Nestle', '3'),('5', 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', '1'
),('6', 'MILK', '1L Toned MIlk', '3'),('7', 'Boat Earphones', '1.5Meter long Dolby Atmos', '4'),('8', 'Jeans', 'Stretchable Denim Jeans with various sizes and color', '5'),('9', 'Project IGI', 'compatible with windows 7 and above', '2'),('10', 'Hoodie', 'Black GUCCI for 13 yrs and above', '5'),('11', 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', '1'),('12', 'Train Your Brain', 'By Shireen Stephen', '1');

INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE) VALUES ('1', '1', '2', '1500'),('2', '3', '5', '30000'),('3', '5', '1', '3000'),('4', '2', '3', '2500'),('5', '4', '1', '1000'),('6', '12', '2', '780'),('7', '12', '4', '789'),('8', '3', '1', '31000'),('9', '1', '5', '1450'),('10', '4', '2', '999'),('11', '7', '3', '549'),('12', '7', '4', '529'),('13', '6', '2', '105'),('14', '6', '1', '99'),('15', '2', '5', '2999'),('16', '5', '2', '2999');

INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID) VALUES ('101', '1500', '2021-10-06', '2', '1'),('102', '1000', '2021-10-12', '3', '5'
),('103', '30000', '2021-09-16', '5', '2'),('104', '1500', '2021-10-05', '1', '1'),('105', '3000', '2021-08-16', '4', '3'),('106', '1450', '2021-08-18', '1', '9'),('107', '789', '2021-09-01', '3', '7'),('108', '780', '2021-09-07', '5', '6'),('109', '3000', '2021-01-10', '5', '3'),('110', '2500', '2021-09-10', '2', '4'),('111', '1000', '2021-09-15', '4', '5'),('112', '789', '2021-09-16', '4', '7'),('113', '31000', '2021-09-16', '1', '8'),('114', '1000', '2021-09-16', '3', '5'),('115', '3000', '2021-09-16', '5', '3'),('116', '99', '2021-09-17', '2', '14');

INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES ('1', '101', '4'),('2', '102', '3'),('3', '103', '1'),('4', '104', '2'),('5', '105', '4'),('6', '106',  '3'),('7', '107', '4'),('8', '108', '4'),('9', '109', '3'),('10', '110', '5'),('11', '111', '3'),('12', '112', '4'),('13', '113', '2'),('14', '114', '1'),('15', '115', '1'),('16', '116', '0');



SELECT COUNT(*), c.CUS_GENDER from customer c JOIN orders o
on c.CUS_ID=o.CUS_ID where o.ORD_AMOUNT>=3000
group by c.CUS_GENDER;


select o.ORD_ID, o.ORD_AMOUNT, o.ORD_DATE, o.CUS_ID, o.PRICING_ID, p.PRO_NAME
from orders o
join supplier_pricing s
on o.PRICING_ID=s.PRICING_ID
join product p
on s.PRO_ID=p.PRO_ID
where o.CUS_ID=2;



select s.SUPP_ID, s.SUPP_NAME, s.SUPP_CITY, s.SUPP_PHONE
from supplier s
join supplier_pricing sp
on s.SUPP_ID=sp.SUPP_ID
group by s.SUPP_ID, s.SUPP_NAME, s.SUPP_CITY, s.SUPP_PHONE
having COUNT(distinct sp.PRO_ID)>1;



select p.PRO_ID, p.PRO_NAME
from product p
join supplier_pricing sp
on p.PRO_ID=sp.PRO_ID
join orders o
on sp.PRICING_ID=o.PRICING_ID
where o.ORD_DATE > '2021-10-05';



Select CUS_NAME, CUS_GENDER
from customer
where CUS_NAME like 'A%' or CUS_NAME like '%A';