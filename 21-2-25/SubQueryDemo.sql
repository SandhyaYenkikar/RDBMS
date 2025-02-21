-- Employees table
CREATE TABLE emp_2 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    loc VARCHAR(255),
    salary DECIMAL(10, 2)
);

INSERT INTO emp_2 (employee_id, employee_name, loc, salary) VALUES
(1, 'Sandhya', 'Pune', 70000.00),
(2, 'Neha', 'Mumbai', 80000.00),
(3, 'Anna', 'Delhi', 85000.00),
(4, 'Bob', 'Pune', 95000.00),
(5, 'Charls', 'Mumbai', 90000.00),
(6, 'David', 'Delhi', 92000.00);

-- Employee having the highest salary 
SELECT employee_name, loc, salary
FROM emp_2 as e1
WHERE salary = (
    SELECT MAX(salary)
    FROM emp_2 as e2
    WHERE e1.loc = e2.loc
);




