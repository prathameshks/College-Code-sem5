/*
Create a stored function titled 'Age_calc'.
Accept the date of birth of a person as a parameter.
Calculate the age of the person in years, months and days e.g. 3 
years, 2months, 10 days.
Return the age in years directly (with the help of Return 
statement).
The months and days are to be returned indirectly in the form of 
OUT parameters.

*/

CREATE OR REPLACE FUNCTION age_calc(dob IN DATE, months OUT NUMBER, days OUT NUMBER)
RETURN NUMBER
IS
years NUMBER;
BEGIN
years := TRUNC(MONTHS_BETWEEN(SYSDATE, dob)/12);
months := TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, dob), 12));
days := TRUNC(MOD(SYSDATE - ADD_MONTHS(dob, (years * 12) + months), 30));
RETURN years;
END;
/

SELECT age_calc('01-JAN-1990', months, days) FROM dual;

DECLARE
months NUMBER;
days NUMBER;
YEARs NUMBER;
BEGIN
YEARs := age_calc('01-JAN-1990', months, days);
DBMS_OUTPUT.PUT_LINE('Age in years: ' || YEARs);
DBMS_OUTPUT.PUT_LINE('Age in months: ' || months);
DBMS_OUTPUT.PUT_LINE('Age in days: ' || days);
END;
/
