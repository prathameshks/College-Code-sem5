-- ORACLE PLSQL
SET SERVEROUTPUT ON

CREATE TABLE circle_area(radius number(5),area number(10,2));

SELECT * FROM circle_area;

DECLARE
pi constant number(4,2) := 3.14;
area number(10,2);
BEGIN
for radius in 5..9
loop 
area := pi * (radius * radius);
insert into circle_area values(radius,area);
end loop;
end;
/

SELECT * FROM circle_area;


-- MySQL PLSQL
delimiter //

CREATE PROCEDURE area()
BEGIN
  SET @x = 0;
  REPEAT 
  SET @x = @x + 1; 
  UNTIL @x > p1 
  END REPEAT;
END
//

delimiter ;

CALL dorepeat(1000);

SELECT @x;