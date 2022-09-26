		----------------------UC1-Create Database-----------------------------------
CREATE DATABASE PayrollServices
use PayRollServices;
--------------------UC2-Create Table----------------------------------------

CREATE TABLE Employee_PayRoll(
EmployeeId int Identity(1,1) primary key,
EmployeeName varChar (255),
EmployeeSalary float,
StartDate Date 
);
-----------------------UC-3 Add Employee into table--------------------------
INSERT INTO Employee_PayRoll (EmployeeSalary, EmployeeName, StartDate)
VALUES  (2046563.67, 'Preeti', '2011-09-02'),
		(565654342.67, 'Radha', '2018-03-07'),
		(898087.61, 'Gaurav', '2020-04-01'),
		(8896443.57, 'Hemant', '1998-07-12'),
		(3243535.27, 'Preeti', '1998-07-12');
		
INSERT INTO Employee_PayRoll
VALUES  ('Sneha', 454656.67, getDate());
------------------------UC4-Read Data from Table-----------------------------------
SELECT * FROM Employee_PayRoll Where EmployeeName = 'Hemant';
------------------------UC-5 Select data into Range ----------------------------------
SELECT * FROM Employee_PayRoll 
WHERE StartDate BETWEEN CAST('2018-03-07' as Date) AND getDate();

SELECT * FROM Employee_PayRoll 
WHERE EmployeeId BETWEEN 03 AND 07;
-------------------UC-6- Add Gender Column and update value based on employee
ALTER TABLE Employee_PayRoll
ADD Gender varChar(1);

------------------Update Query--------------------------------------------------------
UPDATE Employee_PayRoll SET Gender = 'M' WHERE Gender is null;

UPDATE Employee_PayRoll SET Gender = 'F' WHERE EmployeeId = 5;

SELECT * FROM Employee_PayRoll
DELETE FROM Employee_PayRoll WHERE EmployeeId = 7;

---------------------------UC-7 Agregate Builtin Function--------------------------------------
--------------------------Sum,Min,Max,Count,Average-------------------------------------------------
SELECT SUM(EmployeeSalary) as TotalSalary FROM Employee_PayRoll GROUP BY Gender;
SELECT Min(EmployeeSalary) as MinimumSalary FROM Employee_PayRoll GROUP BY Gender;
SELECT Max(EmployeeSalary) as MaximumSalary FROM Employee_PayRoll GROUP BY Gender;
SELECT Avg(EmployeeSalary) as AverageSalary, Gender FROM Employee_PayRoll GROUP BY Gender;
SELECT Count(EmployeeId) as NumberOfEmp FROM Employee_PayRoll;
SELECT Count(EmployeeId) as NumberOfEmp, Gender FROM Employee_PayRoll GROUP BY Gender;


----------------------------------SECTION 2- ER-DIagram---------------------------------------------------------------
-------------------------------------UC-8-Ability to Extend EmployeePayroll Data INformation ----------------------------
  
ALTER TABLE Employee_PayRoll
ADD Phone bigint;

ALTER TABLE Employee_PayRoll
DROP COLUMN Department;

ALTER TABLE Employee_PayRoll
ADD Department varChar(200) not null default 'IT';

ALTER TABLE Employee_PayRoll
ADD Address varChar(200) not null default 'Gurugram';

--UC-9-Ability to extend-Employee_payroll table to have Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay-----------
----------here sp is Stored Procedure-------------
SELECT * FROM Employee_PayRoll 
exec sp_rename 'Employee_PayRoll.[Employee_PayRoll.BasicSalary]','BasicPay','COLUMN';

ALTER TABLE Employee_PayRoll
ADD Deduction float not null default 0;

ALTER TABLE Employee_PayRoll
ADD TexablePay float not null default 0;

ALTER TABLE Employee_PayRoll
ADD IncomeTax float not null default 0;

ALTER TABLE Employee_PayRoll
ADD NetPay float not null default 0;

UPDATE Employee_Payroll SET Department = 'Sales' WHERE EmployeeName = 'Terisa';

INSERT INTO Employee_PayRoll(EmployeeName,EmployeeSalary,StartDate,Gender,Department)
VALUES('Terisa',80000.00,'2018-01-03','F','Marketing');

INSERT INTO Employee_Payroll(EmployeeName,EmployeeSalary,StartDate,Gender,Department, Deduction,Taxable_pay,Income_tax,NetPay)
VALUES('Terisa',900000.00,'2018-01-03','F','Marketing',5000,2000,300500,1400000);
SELECT * FROM Employee_Payroll;

