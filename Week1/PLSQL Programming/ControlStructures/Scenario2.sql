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
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);

INSERT INTO Customers VALUES (101,'Katherine',12000,'N');
INSERT INTO Customers VALUES (102,'Damon',8000,'N');
INSERT INTO Customers VALUES (103,'Elena',15000,'N');
INSERT INTO Customers VALUES (104,'Klaus',9500,'N');
INSERT INTO Customers VALUES (105,'Stefan',18000,'N');

COMMIT;

-- Before Update
SELECT * FROM Customers;

BEGIN
    FOR c IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP
        UPDATE Customers
        SET IsVIP = 'Y'
        WHERE CustomerID = c.CustomerID;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('VIP status updated successfully.');
END;
/

-- After Update
SELECT * FROM Customers;