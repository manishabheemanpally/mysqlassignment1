create database employee1;
use employee;
 CREATE TABLE EmployeeDetails (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(50)
);
INSERT INTO EmployeeDetails(EmpId, FullName, ManagerId, DateOfJoining, City  )
  VALUES (101, 'Clark johns', 51, '2021-12-22', 'Delhi' ),
         (102, 'Dave dissuza', 52,  '2020-11-02',  'Kashmir'),
         (103, 'johnson', 53,  '2023-10-22',  'Mumbai'),
         (104, 'johnson Dave', 54,  '2021-10-30',  'Chennai'),
          (105, 'johnson', 55,  '2019-10-24',  'Kerala');
          select * from  EmployeeDetails;
  CREATE TABLE EmployeeSalary (
    EmpId INT PRIMARY KEY,
    Project VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Variable DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);
INSERT INTO EmployeeSalary(EmpId, Project, Salary, Variable ) 
  VALUES (101, 'Ava the rocking', 20000, 34),
          (102, 'Formulation', 30000, 35),
          (103, 'Artificial Intelligence', 40000, 36),
          (104, 'Meanig of science', 50000, 37);
select * from EmployeeSalary;






