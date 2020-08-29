CREATE TABLE Employee (EmpId INT, EmpName varchar(20), Department varchar(20), ContactNo int, EmailId varchar(20), EmpHeadId int);
INSERT INTO Employee (EmpId,EmpName,Department,ContactNo,EmailId,EmpHeadId) VALUES 
('101','Isha','E-101','1234567890','isha@gmail.com','105'),
('102','Priya','E-104','1234567890','priya@yahoo.com','103'),
('103','Neha','E-101','1234567890','neha@gmail.com','101'),
('104','Rahul','E-102','1234567890','rahul@yahoo.com','105'),
('105','Abhishek','E-101','1234567890','abhishek@gmail.com','102');
CREATE TABLE EmpDept (
  DeptId varchar(20), DeptName varchar(20), Dept_off varchar(20), DeptHead int
);
INSERT INTO EmpDept (Deptid,DeptName,Dept_off,DeptHead) VALUES 
('E-101','HR','Monday','105'),
('E-102','Development','Tuesday','101'),
('E-103','Hous Keeping','Saturday','103'),
('E-104','Sales','Sunday','104'),
('E-105','Purchage','Tuesday','104');
CREATE TABLE EmpSalary (
  EmpId INT, Salary int, IsPermanent varchar(20));
INSERT INTO EmpSalary (EmpId,Salary,IsPermanent) VALUES 
('101','2000','Yes'),
('102','10000','Yes'),
('103','5000','No'),
('104','1900','Yes'),
('105','2300','Yes');
CREATE TABLE Project (
  ProjectId varchar(20) , Duration int);
INSERT INTO Project (ProjectId,Duration) VALUES 
('p-1','23'),
('p-2','15'),
('p-3','45'),
('p-4','2'),
('p-5','30');
CREATE TABLE Country (
  cid varchar(20) , cname varchar(20));
INSERT INTO Country (cid,cname) VALUES 
('c-1','India'),
('c-2','USA'),
('c-3','China'),
('c-4','Pakistan'),
('c-5','Russia');
CREATE TABLE ClientTable (
  ClientId varchar(20), ClientName varchar(20), cid varchar(20));
INSERT INTO ClientTable (ClientId,ClientName,cid) VALUES 
('c1-1','ABC Group','c-1'),
('c1-2','PQR','c-1'),
('c1-3','XYZ','c-2'),
('c1-4','tech altum','c-3'),
('c1-5','mnp','c-5');
CREATE TABLE EmpProject (
  EmpId INT, ProjectId varchar(20), ClientId varchar(20), StartYear int, EndYear int
);
INSERT INTO EmpProject (EmpId,ProjectId,ClientId,StartYear,EndYear) VALUES 
('101','p-1','C1-1','2010','2010'),
('102','p-2','C1-2','2010','2012'),
('103','p-1','C1-3','2013','0'),
('104','p-4','C1-1','2014','2015'),
('105','p-4','C1-5','2015','0');
Select * from Employee where EmpName like "P%";
Select Count(*) from EmpSalary where EmpSalary.Salary>5000 and EmpSalary.IsPermanent = "Yes";
Select * from Employee where EmailId like "%gmail%";
Select * from Employee where Department = "E-104" or Department = "E-102";
Select DeptName from EmpDept where Deptid = "E-102";
Select Sum(EmpSalary.Salary) from EmpSalary where EmpSalary.IsPermanent = "Yes";
select Employee.EmpName from Employee where Employee.Empname like "%a";
select EmpId,ProjectId,Count(*) from EmpProject order by ProjectId;
select * from EmpProject where StartYear = 2010;
select * from EmpProject where StartYear = EndYear;
select EmpName from Employee where substring(EmpName,3,1)="h";
select DeptName from EmpDept left join Employee on EmpDept.DeptId = Employee.Department where Employee.EmpId>103; 
select EmpName from Employee left join EmpDept on Employee.EmpId=EmpDept.DeptHead where Department="E-101"; 
select EmpName from Employee right join EmpDept  on EmpDept.DeptId=Employee.Department where EmpDept.Deptname="HR" and Employee.EmpId=EmpDept.DeptHead;
select EmpName from Employee right join EmpSalary on EmpSalary.EmpId=Employee.EmpHeadId where EmpSalary.IsPermanent = "Yes";
select EmpName, EmailId from Employee left join EmpDept on Employee.EmpId=EmpDept.DeptHead left join EmpSalary on Employee.EmpId=EmpSalary.EmpId where EmpSalary.IsPermanent="No";
select EmpName from Employee right join EmpDept on EmpDept.DeptId=Employee.Department where EmpDept.Dept_off="Monday";
select * from ClientTable right join Country on Country.cid=ClientTable.ClientId where Country.cname="India";
select * from Employee right join EmpDept on EmpDept.DeptId=Employee.Department where EmpDept.DeptName="Development";