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
    Balance NUMBER
);

INSERT INTO Accounts VALUES (101,'Katherine',15000);
INSERT INTO Accounts VALUES (102,'Damon',10000);
INSERT INTO Accounts VALUES (103,'Elena',18000);
INSERT INTO Accounts VALUES (104,'Klaus',12000);

COMMIT;

SELECT * FROM Accounts;

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_fromAccount IN NUMBER,
    p_toAccount IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_fromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_toAccount;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;
END;
/

BEGIN
    TransferFunds(101,102,3000);
END;
/

SELECT * FROM Accounts;