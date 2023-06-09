CREATE OR REPLACE TRIGGER DISPLAY_BALANCE AFTER
  UPDATE ON ACCOUNT FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Old BALANCE: '
    || :OLD.USER_BALANCE);
  DBMS_OUTPUT.PUT_LINE('New BALANCE: '
    || :NEW.USER_BALANCE);
END;
CREATE OR REPLACE TRIGGER DISPLAY_DELETE BEFORE
DELETE ON ACCOUNT FOR EACH ROW 
BEGIN 

DBMS_OUTPUT.PUT_LINE('ACCOUNT ID: '
  || :OLD.ID);
DBMS_OUTPUT.PUT_LINE('USER NAME: '
  || :OLD.USER_NAME);
DBMS_OUTPUT.PUT_LINE('YOUR ACCOUNT IS DELETED successful');
END;
drop TRIGGER DISPLAY_DELETE;