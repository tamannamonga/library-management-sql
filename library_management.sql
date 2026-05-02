
DROP DATABASE IF EXISTS library_management;
CREATE DATABASE library_management;
USE library_management;
-- TABLES
CREATE TABLE author (
    author_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    publications_count INT
);

CREATE TABLE publisher (
    publisher_id VARCHAR(50) PRIMARY KEY,
    publisher VARCHAR(100),
    distributor VARCHAR(100),
    releases_count INT,
    last_release DATE
);

CREATE TABLE books (
    book_id VARCHAR(50) PRIMARY KEY,
    book_code VARCHAR(50),
    book_name VARCHAR(100),
    author_id VARCHAR(50),
    publisher_id VARCHAR(50),
    book_version VARCHAR(20),
    release_date DATE,
    available_from DATE,
    is_available BOOLEAN,
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE readers (
    reader_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    registered_on DATE,
    books_issued_total INT,
    books_issued_current INT,
    is_issued BOOLEAN,
    last_issue_date DATE,
    total_fine FLOAT,
    current_fine FLOAT
);

CREATE TABLE books_issue (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id VARCHAR(50),
    issued_to VARCHAR(50),
    issued_on DATE,
    return_on DATE,
    current_fine FLOAT,
    fine_paid BOOLEAN,
    payment_transaction_id VARCHAR(50),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (issued_to) REFERENCES readers(reader_id)
);
-- INSERT DATA
INSERT INTO author VALUES
('A1','J.K.','Rowling',7),
('A2','George','Orwell',6),
('A3','Chetan','Bhagat',5),
('A4','Dan','Brown',8),
('A5','Paulo','Coelho',10);

INSERT INTO publisher VALUES
('P1','Bloomsbury','ABC Dist',15,'2021-01-01'),
('P2','Penguin','XYZ Dist',20,'2022-02-02'),
('P3','HarperCollins','LMN Dist',12,'2023-03-03');

INSERT INTO books VALUES
('B1','C101','Harry Potter','A1','P1','v1','2000-01-01','2000-02-01',TRUE),
('B2','C102','1984','A2','P2','v1','1949-01-01','1950-01-01',TRUE),
('B3','C103','2 States','A3','P2','v1','2009-01-01','2009-02-01',TRUE),
('B4','C104','Da Vinci Code','A4','P3','v1','2003-01-01','2003-02-01',TRUE),
('B5','C105','Alchemist','A5','P1','v1','1988-01-01','1989-01-01',TRUE);

INSERT INTO readers VALUES
('R1','Tamanna','Monga','2024-01-01',2,1,TRUE,'2024-02-01',10,5),
('R2','Rahul','Sharma','2024-01-02',1,0,FALSE,NULL,0,0),
('R3','Priya','Singh','2024-01-03',3,1,TRUE,'2024-02-02',15,10);

INSERT INTO books_issue (book_id, issued_to, issued_on, return_on, current_fine, fine_paid, payment_transaction_id) VALUES
('B1','R1','2024-02-01','2024-02-10',5,TRUE,'T1'),
('B2','R3','2024-02-02','2024-02-12',10,FALSE,'T2');
-- QUERIES 
-- Show all books
SELECT * FROM books;
-- Show all readers
SELECT * FROM readers;
-- JOIN Query 
SELECT r.first_name, b.book_name, bi.issued_on
FROM books_issue bi
JOIN readers r ON bi.issued_to = r.reader_id
JOIN books b ON bi.book_id = b.book_id;
