BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Loans';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(100),
    DueDate DATE
);

INSERT INTO Loans VALUES (201,'Katherine',SYSDATE+10);
INSERT INTO Loans VALUES (202,'Damon',SYSDATE+45);
INSERT INTO Loans VALUES (203,'Elena',SYSDATE+20);
INSERT INTO Loans VALUES (204,'Klaus',SYSDATE+5);
INSERT INTO Loans VALUES (205,'Stefan',SYSDATE+60);

COMMIT;

-- Before
SELECT * FROM Loans;

BEGIN
    FOR loan IN (
        SELECT LoanID, CustomerName, DueDate
        FROM Loans
        WHERE DueDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID '
            || loan.LoanID
            || ' for '
            || loan.CustomerName
            || ' is due on '
            || TO_CHAR(loan.DueDate,'DD-MON-YYYY')
        );
    END LOOP;
END;
/