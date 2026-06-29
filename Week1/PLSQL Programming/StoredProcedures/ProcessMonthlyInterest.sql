BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    AccountType VARCHAR2(20),
    Balance NUMBER
);

INSERT INTO Accounts VALUES (101,'Katherine','Savings',10000);
INSERT INTO Accounts VALUES (102,'Damon','Current',8000);
INSERT INTO Accounts VALUES (103,'Elena','Savings',15000);
INSERT INTO Accounts VALUES (104,'Klaus','Savings',12000);
INSERT INTO Accounts VALUES (105,'Stefan','Current',9000);

COMMIT;

SELECT * FROM Accounts;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType='Savings';

    COMMIT;
END;
/

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM Accounts;