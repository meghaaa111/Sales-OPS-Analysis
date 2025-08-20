create database fashion;

use fashion;

create table salesman( SalesmanID int, SalesmanName varchar(255), Commission decimal(10,2), city varchar(255), Age int);

insert into salesman(salesmanID, SalesmanName, Commission, City, Age) values(101, 'Joe', 50, 'California', 17), (102, 'Simon', 75, 'Texas', 25),(103, 'Jessie', 105, 'Florida', 35), (104, 'Danny', 100, 'Texas', 22), (105, 'Lia', 65, 'New Jersey', 30);

select * from salesman

create table customer(SalesmanID int, CustomerID int, CustomerName varchar(255), PurchaseAmount int);

insert into customer(SalesmanID, CustomerID, CustomerName, PurchaseAmount) values (101, 2345, 'Andrew', 550), (103, 1575, 'Lucky', 4500), (104, 2345, 'Andrew', 4000), (107, 3747, 'Remona', 2700), (110, 4004, 'Julia', 4545);

select * from customer;

delete from salesman;


create table orders(OrderID int, CustomerID int, SalesmanID int, Orderdate Date, Amount money);

insert into orders values (5001,2345,101, '2021-07-01', 550), (5003, 1234, 105, '2022-02-15', 1500);

select  * from orders;

insert into orders (OrderID, CustomerID, SalesmanID, Orderdate, Amount) values (5002, 2345, 104, '2021-08-09', 1700);

select * from orders;

select * from orders order by OrderID;

alter table salesman alter column salesmanID int not null;

alter table salesman add constraint pk_salesmanID primary key (salesmanID);

select * from salesman;

alter table salesman add constraint df_city default 'Unknown' for city

select * from salesman;

update customer set SalesmanID= case salesmanID
when 110 then 102
when 107 then 105 
else SalesmanID
end 
where SalesmanID IN (110, 107);
alter table customer add constraint fk_customer foreign key (SalesmanID) references salesman(SalesmanID);

select * from customer;

alter table customer alter column CustomerName varchar(255) not null;

select * from customer;

select * from customer where CustomerName like '%N' and PurchaseAmount > 500;

select SalesmanID from salesman union select SalesmanID from customer; 

select SalesmanID from salesman intersect select SalesmanID from customer;

select o.Orderdate, s.SalesmanName, c.CustomerName, s.Commission, s.City from orders o join salesman s on o.salesmanID = s.SalesmanID
join customer  c on o.CustomerID = c.CustomerID
where c.PurchaseAmount between 500 and 1500;

select s.SalesmanID, s.SalesmanName, o.OrderID, o.Orderdate, o.Amount from salesman s right join orders o on s.SalesmanID = o.SalesmanID; 
