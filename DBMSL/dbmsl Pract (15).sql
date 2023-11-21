/*
15. Write a PL/SQL code block to calculate the area of a circle for a 
value of radius varying from 5 to 9. Store the radius and the 
corresponding values of calculated area in an empty table named 
areas, consisting of two columns, radius and area.
*/

DECLARE
    radius NUMBER(2,0);
    area NUMBER(5,2);
    pi CONSTANT NUMBER := 3.14;
BEGIN
    FOR radius in 5..9 LOOP
        area := pi * radius * radius;
        INSERT INTO areas VALUES (radius, area);
    END LOOP;
END;
/

CREATE TABLE areas (
    radius NUMBER(2,0),
    area NUMBER(5,2)
);