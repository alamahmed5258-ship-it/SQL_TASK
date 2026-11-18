CREATE TABLE Projects (
    ProjectID INT,
    ProjectName VARCHAR(50)
);

--6- Add a primary key constraint to the "Employees" table for the "ID" column.


ALTER TABLE Employees
ALTER COLUMN ID INT NOT NULL;

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees
PRIMARY KEY (ID);

--7- Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").


-- First: Add Primary Key to Projects

ALTER TABLE Projects
ALTER COLUMN ProjectID INT NOT NULL;

ALTER TABLE Projects
ADD CONSTRAINT PK_Projects
PRIMARY KEY (ProjectID);

-- Second: Create Foreign Key
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Projects
FOREIGN KEY (ID)
REFERENCES Projects(ProjectID);

--8- Remove the foreign key relationship between "Employees" and "Projects."


ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Projects;

--9- Add a unique constraint to the "Name" column in the "Employees" table.


ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name
UNIQUE (Name);

--10- Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).


CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
);

--11- Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.


ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_FullName
UNIQUE (FirstName, LastName);

--12- Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.


ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status
DEFAULT 'Active' FOR Status;

--13- Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).


CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
);

--14- Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.


ALTER TABLE Orders
ADD CONSTRAINT CK_Orders_TotalAmount
CHECK (TotalAmount > 0);

--15- Create a schema named "Sales" and move the "Orders" table into this schema.

CREATE SCHEMA Sales;
GO

ALTER SCHEMA Sales
TRANSFER dbo.Orders;
GO

--16- Rename the "Orders" table to "SalesOrders."


EXEC sp_rename
    'Sales.Orders',
    'SalesOrders';