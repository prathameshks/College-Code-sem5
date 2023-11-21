/*
Write a Row Level Before and After Trigger on Library table. The 
System should keep track of the records that are being updated or 
deleted. The old value of updated or deleted records should be 
added in Library_Audit table.

*/

CREATE TABLE library (
    id          NUMBER(5) PRIMARY KEY,
    book_name   VARCHAR2(50),
    author_name VARCHAR2(50)
);

CREATE TABLE library_audit (
    id          NUMBER(5),
    book_name   VARCHAR2(50),
    author_name VARCHAR2(50),
    action      VARCHAR2(10)
);

INSERT INTO library VALUES (1, 'The Alchemist', 'Paulo Coelho');
INSERT INTO library VALUES (2, 'The Monk Who Sold His Ferrari', 'Robin Sharma');
INSERT INTO library VALUES (3, 'The Power of Now', 'Eckhart Tolle');
INSERT INTO library VALUES (4, 'The Secret', 'Rhonda Byrne');
INSERT INTO library VALUES (5, 'The 7 Habits of Highly Effective People', 'Stephen Covey');

CREATE OR REPLACE TRIGGER library_audit_trg
BEFORE UPDATE OR DELETE ON library
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;
    INSERT INTO library_audit (id, book_name, author_name, action)
    VALUES (:old.id, :old.book_name, :old.author_name, v_action);
END;
/

UPDATE library SET book_name = 'The Alchemist (Updated)' WHERE id = 1;
DELETE FROM library WHERE id = 2;
UPDATE library SET book_name = 'The Power of Now (Updated)' WHERE id = 3;
DELETE FROM library WHERE id = 4;

SELECT * FROM library_audit;

/* after insertion also add record in library_audit table craete new trigger */

CREATE OR REPLACE TRIGGER library_audit_trg2
AFTER INSERT ON library
FOR EACH ROW
BEGIN
    INSERT INTO library_audit (id, book_name, author_name, action)
    VALUES (:new.id, :new.book_name, :new.author_name, 'INSERT');
END;
/

-- combined trigger

CREATE OR REPLACE TRIGGER library_audit_trg3
AFTER INSERT OR UPDATE OR DELETE ON library
FOR EACH ROW
DECLARE
    v_action VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_action := 'INSERT';
    ELSIF UPDATING THEN
        v_action := 'UPDATE';
    ELSE
        v_action := 'DELETE';
    END IF;
    INSERT INTO library_audit (id, book_name, author_name, action)
    VALUES (:old.id, :old.book_name, :old.author_name, v_action);
END;
/
