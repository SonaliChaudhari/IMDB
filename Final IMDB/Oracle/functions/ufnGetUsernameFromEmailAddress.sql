CREATE FUNCTION ufnGetUserNameFFromEmail (EmailAddress IN VARCHAR) 
RETURN VARCHAR   
-- Returns the USERNAME ON THE BASIS OF EMAIL ADDRESS 
  IS
    RET VARCHAR(20);
BEGIN  
    RET:= SUBSTR(EmailAddress,1,INSTR(EmailAddress,'@')-1);
    IF (LENGTH(RET)>10) THEN
      RET:= SUBSTR(RET,1,10);
    END IF;
    
    IF(RET IS NULL)THEN
      RET:='DUMMY123';
    END IF;
	RETURN RET;  
END;

--SELECT UFNGETUSERNAMEFFROMEMAIL('PALA@GMAIL.COM') FROM DUAL;




