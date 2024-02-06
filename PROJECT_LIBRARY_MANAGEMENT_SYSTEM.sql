#PROJECT

/*You are going to build a project based on the Library Management System. It
keeps track of all information about books in the library, their cost, status and
total number of books available in the library.
Create a database named library and create following TABLES in the database:
1. Branch
2. Employee
3. Customer
4. IssueStatus
5. ReturnStatus
6. Books

Attributes for the tables:
1. Branch
∙Branch_no - Set as PRIMARY KEY
∙Manager_Id
∙Branch_address
∙Contact_no

2. Employee
∙Emp_Id – Set as PRIMARY KEY
∙Emp_name
∙Position
∙Salary
∙Branch_no - Set as FOREIGN KEY and it should refer branch_no in
EMPLOYEE table

3. Customer
∙Customer_Id - Set as PRIMARY KEY
∙Customer_name
∙Customer_address
∙Reg_date

4. IssueStatus
∙Issue_Id - Set as PRIMARY KEY
∙Issued_cust – Set as FOREIGN KEY and it refer customer_id in
CUSTOMER table
∙Issued_book_name
∙Issue_date
∙Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table

5. ReturnStatus
∙Return_Id - Set as PRIMARY KEY
∙Return_cust
∙Return_book_name
∙Return_date
∙Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table

6. Books
∙ISBN - Set as PRIMARY KEY
∙Book_title
∙Category
∙Rental_Price
∙Status [Give yes if book available and no if book not available] 
∙Author
∙Publisher*/

/*
1. Retrieve the book title, category, and rental price of all available books.
2. List the employee names and their respective salaries in descending order of salary.
3. Retrieve the book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books in the month of June 2023.
9. Retrieve book_title from book table containing history.
10. Retrieve the branch numbers along with the count of employees
for branches having more than 5 employees.*/



CREATE DATABASE Library; 
USE Library;

#Create Table Branch 
CREATE TABLE Branch(
Branch_no  INT PRIMARY KEY,
Manager_Id VARCHAR(15) NOT NULL,
Branch_address VARCHAR(40),
Contact_no INT);

#Create Table Employee
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(15),
Position VARCHAR(40),
Salary INT,
Branch_no INT,
FOREIGN KEY(Branch_no) REFERENCES branch(Branch_no));

#Create Table Customer
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(15),
Customer_address VARCHAR(40),
Reg_date DATE);

#Create Table IssueStatus
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(40),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id),
FOREIGN KEY (Isbn_book) REFERENCES books(Isbn));

#Create Table ReturnStatus
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(40),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Isbn_book2) REFERENCES books(Isbn));

#Create Table Books
CREATE TABLE Books(
Isbn INT PRIMARY KEY,
Book_title VARCHAR(40),
Category VARCHAR(40),
Rental_Price INT,
Status VARCHAR(40),
Author VARCHAR(40),
Publisher VARCHAR(40)
);

#	Insert 10 rows into the Branch table.
INSERT INTO branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES
(1,'m11','1st cross',2654321),
(2,'m22','8th cross',3214562),
(3,'m33','1st main',21213421),
(4,'m44','3rd main',2657789),
(5,'m55','7th cross',2156678),
(6,'m66','10th main',5432179),
(7,'m77','8th main',2438967),
(8,'m88','9th cross',2989878),
(9,'m99','2nd cross',34562345),
(10,'m111','7th main',7823456);

SELECT * FROM Branch;

#	Insert 10 rows into the Employee table.
INSERT INTO employee (Emp_id, Emp_name, Position, Salary, Branch_no)
VALUES
(101,'Felix','Manager',51000,8),
(102,'Anant','HR',23000,8),
(103,'Anitha','Librarian',15000,2),
(104,'Meena','Operation',18000,5),
(105,'Sham','System Admin',20000,1),
(106,'Gayathri','Attender',12000,1),
(107,'Hima','Librarian',15000,2),
(108,'Roshni','System Admin',20000,3),
(109,'Gopal','Attender',12000,4),
(110,'Amar','Head',52000,5);

SELECT * FROM Employee;

#	Insert 10 rows into the Customer table. 
INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES
(201,'Aadhira','kecheri thrissur','2021-10-05'),
(202,'Anakha','Palayam calicut','2022-05-05'),
(203,'Neha','Kadampuzha malappuram','2022-03-07'),
(204,'Riya','Valanchery malappuram','2022-10-10'),
(205,'Rashida','Chelari Calicut','2021-08-09'),
(206,'Shamna','Feroke calicut','2023-04-29'),
(207,'Ziya','kulathur malappuram','2024-02-01'),
(208,'Hiza','BPBazar Palakkad','2024-01-01'),
(209,'Hanan','Kakkad calicut','2020-01-24'),
(210,'Hadin','Moorkanad Malappuram','2022-11-30');
SELECT * FROM Customer;

#	Insert 10 rows into the Books table.
INSERT INTO Books (Isbn, Book_title, Category, Rental_price, Status, Author, Publisher)VALUES
(301,'Alice in Wonderland','Story',50,'yes','Lewis Carrol','ABC'),
(302,'Time Machine','Fiction',55,'yes','H.G. Wells','DFG'),
(303,'Adventures of Sherlock Holmes','Adventure',70,'yes','Arthur Conan Doyle','FGH'),
(304,'Mein Kampf','Fiction',45,'yes','Adolf Hitler','KLM'),
(305,'Animal Farm','Novel',55,'yes','George Orwell','ABC'),
(306,'A Dangerous place','Novel',37,'yes','D.P. Moynihan','DFG'),
(307,'Agni Veena','History',44,'yes','Kazi Nasrul Islam','FGH'),
(308,'Pride and Prejudice','Novel',78,'yes','Jane Austen','HJK'),
(309,'Utopia','history',78,'yes','Sir Thomas Moor','HJK'),
(310,'Chitra','Story',34,'yes','R.N.Tagore','KNM');

SELECT * FROM Books;

#	Insert 10 rows into the Issuestatus table.
INSERT INTO Issuestatus (Issue_id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401,202,'Time Machine','2024-01-11',302),
(402,201,'Animal Farm','2024-02-03',305),
(403,205,'A Dangerous place','2023-12-30',306),
(404,207,'Pride and Prejudice','2024-01-30',308),
(405,205,'Utopia','2023-11-11',309),
(406,210,'Agni Veena','2023-06-23',307),
(407,202,'Chitra','2023-07-29',310),
(408,209,'Mein Kampf','2023-06-28',304),
(409,201,'Adventures of Sherlock Holmes','2024-01-21',303),
(410,205,'Alice in Wonderland','2023-12-05',301);

SELECT * FROM Issuestatus;	

#	Insert 10 rows into the Returnstatus table.
INSERT INTO Returnstatus (Return_id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(501,205,'A Dangerous place','2024-02-02',306),
(502,209,'Mein Kampf','2023-10-25',304),
(503,201,'Adventures of Sherlock Holmes','2024-02-04',303),
(504,205,'Alice in Wonderland','2024-01-30',301),
(505,210,'Agni Veena','2023-11-28',307),
(506,202,'Time Machine','2024-02-01',302),
(507,201,'Animal Farm','2024-02-06',305),
(508,207,'Pride and Prejudice','2024-02-04',308),
(509,202,'Chitra','2023-09-06',310),
(510,205,'Utopia','2023-12-30',309);

SELECT * FROM Returnstatus;

#1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,Category,Rental_Price FROM Books WHERE Status='yes';

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name , Salary FROM Employee ORDER BY Salary DESC;
  
#3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT IssueStatus.Issued_Book_name,customer.customer_name
FROM customer INNER JOIN IssueStatus ON customer.customer_id=IssueStatus.Issued_cust;

 #4. Display the total count of books in each category.
 SELECT Category,COUNT(*) AS Total_count FROM Books GROUP BY Category;
 
 #5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
 SELECT Emp_name,Position FROM Employee WHERE Salary >50000;
 
 
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
  #since no customers registered before 2022-01-01 who were not issued any books,we add two entries 
INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES
(211,'Hima','gh thrissur','2021-11-06'),
(212,'Jeena','sen calicut','2020-05-04');

 SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
 AND Customer_id NOT IN (SELECT Issued_cust FROM Issuestatus);
 
 
#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no , count(*) AS Employee_count FROM Employee GROUP BY Branch_no;
 

#8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name,I.Issue_date FROM Customer c JOIN Issuestatus i
ON c.Customer_id = i.Issued_cust
WHERE month(i.Issue_date)=6 AND year(i.Issue_date) =2023;


#9. Retrieve book_title from book table containing history.
SELECT Book_title,Category FROM Books WHERE Category='History';


#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no , count(*) AS Employee_count FROM Employee GROUP BY Branch_no HAVING count(*)>5;
