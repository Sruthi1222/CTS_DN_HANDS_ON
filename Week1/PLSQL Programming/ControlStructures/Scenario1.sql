BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Age NUMBER,
    InterestRate NUMBER
);

INSERT INTO Customers VALUES (101,'Katherine',65,8);
INSERT INTO Customers VALUES (102,'Damon',45,7);
INSERT INTO Customers VALUES (103,'Elena',72,9);
INSERT INTO Customers VALUES (104,'Klaus',55,6);
INSERT INTO Customers VALUES (105,'Stefan',68,8);

COMMIT;

-- Before Update
SELECT * FROM Customers;

BEGIN
    FOR c IN (
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60
    )
    LOOP
        UPDATE Customers
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = c.CustomerID;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Interest rates updated successfully.');
END;
/

-- After Update
SELECT * FROM Customers;