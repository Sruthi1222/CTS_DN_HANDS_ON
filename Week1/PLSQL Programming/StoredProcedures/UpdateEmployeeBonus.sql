BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Department VARCHAR2(50),
    Salary NUMBER
);

INSERT INTO Employees VALUES (101,'Katherine','HR',50000);
INSERT INTO Employees VALUES (102,'Damon','IT',60000);
INSERT INTO Employees VALUES (103,'Elena','IT',55000);
INSERT INTO Employees VALUES (104,'Klaus','Finance',65000);
INSERT INTO Employees VALUES (105,'Stefan','HR',52000);

COMMIT;

SELECT * FROM Employees;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)
IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus/100)
    WHERE Department = p_department;

    COMMIT;
END;
/

BEGIN
    UpdateEmployeeBonus('IT',10);
END;
/

SELECT * FROM Employees;