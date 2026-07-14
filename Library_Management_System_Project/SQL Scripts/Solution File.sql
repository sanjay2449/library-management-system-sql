-- Library Management System Project
-- Project TASK

-- ### CRUD Operations

-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books
	(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
	('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


SELECT * FROM books;

-- Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = 'NX 12, Vishnupuri'
WHERE member_id = 'C101'


-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121';


-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101'


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT 
	ist.issued_member_id,
	m.member_name,
	COUNT(*) AS total_books_issued
FROM issued_status AS ist
JOIN 
	members AS m
	ON ist.issued_member_id = m.member_id
GROUP BY ist.issued_member_id, 
		 m.member_name
HAVING COUNT(*) > 1


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables: 
-- Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

CREATE TABLE total_issued_count
AS
SELECT 
	ist.issued_book_isbn,
	ist.issued_book_name,
	COUNT(*) AS total_issued_count
FROM 
issued_status AS ist
JOIN
books AS b
ON ist.issued_book_isbn = b.isbn
GROUP BY 
ist.issued_book_isbn,
ist.issued_book_name
ORDER BY COUNT(*) DESC

SELECT * FROM total_issued_count



-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:= "Classic"

SELECT 
	isbn,
	book_title,
	category
FROM books
WHERE category = 'Classic'



-- Task 8: Find Total Rental Income by Category:


SELECT 
	b.category,
	COUNT(*) AS books_issued,
	SUM(b.rental_price) AS rental_income
FROM 
books AS b
JOIN
issued_status AS ist
ON b.isbn = ist.issued_book_isbn
GROUP BY b.category
ORDER BY rental_income DESC


-- Task 9. **List Members Who Registered in the Last 4 Years**:

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '4 year'

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

SELECT 
	e.emp_id AS employee_ID,
	e.emp_name AS employee_Name,
	e2.emp_name AS manager_Name
FROM 
employees AS e
JOIN
branch b
ON b.branch_id = e.Branch_id
JOIN
employees e2
ON b.manager_id = e2.emp_id

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 7USD

CREATE TABLE expensive_books
AS
SELECT * FROM books
WHERE rental_price >=7

SELECT * FROM expensive_books

-- Task 12: Retrieve the List of Books Not Yet Returned


SELECT
	ist.issued_book_isbn,
	ist.issued_book_name,
	ist.issued_date
FROM 
issued_status AS ist
LEFT JOIN
return_status AS rts
ON  ist.issued_id = rts.issued_id
WHERE rts.return_id IS NULL


/*
### Advanced SQL Operations

Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30 days return period). Display the member's name, book title, issue date, and days overdue.
*/

SELECT
    m.member_name,
    ist.issued_book_name,
    ist.issued_date,
    (CURRENT_DATE - ist.issued_date) - 30 AS days_overdue
FROM issued_status AS ist
LEFT JOIN return_status AS rts
    ON ist.issued_id = rts.issued_id
JOIN members AS m
    ON m.member_id = ist.issued_member_id
WHERE rts.return_id IS NULL
  AND ist.issued_date <= CURRENT_DATE - INTERVAL '30 days';


/*
Task 14: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.
*/

CREATE TABLE performance_report
AS
SELECT 
	b.branch_id,
	COUNT(ist.issued_id) AS books_issued,
	COUNT(rts.return_id) AS books_returned,
	COALESCE(SUM(bk.rental_price),0) AS total_revenue
FROM 
branch AS b
JOIN 
employees AS e
ON b.branch_id = e.branch_id
JOIN
issued_status AS ist
ON e.emp_id = ist.issued_emp_id
LEFT JOIN
return_status AS rts
ON ist.issued_id = rts.issued_id
JOIN
books AS bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY b.branch_id;


SELECT * FROM performance_report;

/*
Task 17: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 2.5 months.
*/
CREATE TABLE active_members
AS
SELECT 
	ist.issued_member_id,
	m.member_name
	
FROM
issued_status AS ist
JOIN
members as m
ON ist.issued_member_id = m.member_id
WHERE ist.issued_date >= CURRENT_DATE - INTERVAL '2.5 year'
GROUP BY ist.issued_member_id, m.member_name;


select * from active_members

/*
Task 18: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.
*/

SELECT 
	ist.issued_emp_id,
	e.emp_name,
	COUNT(*) AS number_of_books,
	e.branch_id
FROM
issued_status AS ist
JOIN
employees e
ON ist.issued_emp_id = e.emp_id
GROUP BY Ist.issued_emp_id, e.emp_name, e.branch_id
ORDER BY number_of_books DESC
LIMIT 3

