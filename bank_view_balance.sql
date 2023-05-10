DECLARE
    ACCOUNTID    ACCOUNT.ID%TYPE;
    ACCOUNT_TYPE ACCOUNT%ROWTYPE;
BEGIN
    ACCOUNTID:=&ACCOUNTID;
    SELECT
        ID,
        USER_NAME INTO ACCOUNT_TYPE.ID,
        ACCOUNT_TYPE.USER_NAME
    FROM
        ACCOUNT
    WHERE
        ID=ACCOUNTID;
    DECLARE
        CURSOR HISTORY_DATA IS
            SELECT
                OLD_BALANCE,
                NEW_BALANCE,
                AMOUNT_DORW,
                CURR_DATE,
                STATUS
            FROM
                HISTORY
            WHERE
                ID=ACCOUNTID;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('ACCOUNT ID '
            ||ACCOUNT_TYPE.ID);
        DBMS_OUTPUT.PUT_LINE('USER NAME '
            ||ACCOUNT_TYPE.USER_NAME);
        FOR LIST IN HISTORY_DATA LOOP
            DBMS_OUTPUT.PUT_LINE('OLD_BALANCE : '
                || LIST.OLD_BALANCE
                ||'    NEW_BALANCE : '
                || LIST.NEW_BALANCE
                ||'    Amount : '
                ||LIST.AMOUNT_DORW
                ||'    curr_Date: '
                || LIST.CURR_DATE
                ||'    status : '
                || LIST.STATUS);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error!');
    END;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error!');
END;