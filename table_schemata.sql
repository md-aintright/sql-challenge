CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title VARCHAR   NOT NULL,
	birth_date DATE   NOT NULL,
	first_name VARCHAR   NOT NULL,
	last_name VARCHAR   NOT NULL,
	sex VARCHAR   NOT NULL,
	hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
	CONSTRAINT titles_title_id_fkey FOREIGN KEY (emp_title)
      REFERENCES titles (title_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
	dept_no VARCHAR   NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT employees_emp_no_fkey FOREIGN KEY (emp_no)
      REFERENCES employees (emp_no) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT departments_dept_no_fkey FOREIGN KEY (dept_no)
      REFERENCES departments (dept_no) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE dept_managers (
	dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	CONSTRAINT departments_dept_no_fkey FOREIGN KEY (dept_no)
      REFERENCES departments (dept_no) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT employees_emp_no_fkey FOREIGN KEY (emp_no)
      REFERENCES employees (emp_no) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
	salary VARCHAR   NOT NULL,
    PRIMARY KEY (emp_no),
	CONSTRAINT employees_emp_no_fkey FOREIGN KEY (emp_no)
      REFERENCES employees (emp_no) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);
