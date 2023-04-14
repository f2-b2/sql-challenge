﻿-- Drop tables if they exist
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Dept_Emp;

--Create tables
CREATE TABLE Titles (
    title_id varchar(255)   NOT NULL,
    title varchar(255)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(255)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(255)   NOT NULL,
    last_name varchar(255)   NOT NULL,
    sex varchar(255)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_title_id)
        REFERENCES Titles (title_id)
);

CREATE TABLE Departments (
    dept_no varchar(255)   NOT NULL,
    dept_name varchar(255)   NOT NULL,
    PRIMARY KEY (dept_no)
);
 
CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_no)
        REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_Manager (
    dept_no varchar(255)   NOT NULL,
    emp_no int   NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY(dept_no)
        REFERENCES Departments (dept_no),
    FOREIGN KEY(emp_no)
        REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_Emp (
    emp_no int   NOT NULL,
    dept_no varchar(255)   NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY(emp_no)
        REFERENCES Employees (emp_no),
    FOREIGN KEY(dept_no)
        REFERENCES Departments (dept_no)
);


