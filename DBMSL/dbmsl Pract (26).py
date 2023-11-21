"""Implement MYSQL/Oracle database connectivity with PHP/ 
python/Java Implement Database navigation operations (add, 
delete, edit,)."""
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="1234",
    database="practical1"
)

cur = conn.cursor()

cur.execute("CREATE TABLE n_student (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), address VARCHAR(255))")

cur.execute("SHOW TABLES")

for x in cur:
    print(x)

cur.execute("INSERT INTO n_student (name, address) VALUES (%s, %s)", ("John", "Highway 21"))
conn.commit()

print(cur.rowcount, "record inserted.")

cur.execute("SELECT * FROM n_student")

result = cur.fetchall()

for x in result:
    print(x)

cur.execute("SELECT * FROM n_student WHERE address = 'Highway 21'")
result = cur.fetchall()

for x in result:
    print(x)

cur.execute("UPDATE n_student SET address = 'Canyon 123' WHERE address = 'Highway 21'")
conn.commit()

print(cur.rowcount, "record(s) affected")

cur.execute("SELECT * FROM n_student")
result = cur.fetchall()

for x in result:
    print(x)

cur.execute("DELETE FROM n_student WHERE address = 'Canyon 123'")
conn.commit()

print(cur.rowcount, "record(s) deleted")

cur.close()
conn.close()
