/*
1. Creates a new document if no document in the employee 
collection contains
{Designation: "Tester", Company_name: "TCS", Age: 25}
2. Finds all employees working with Company_name: "TCS" and 
increase their salary by 2000. 
3. Matches all documents where the value of the field Address is 
an embedded document that contains only the field city with 
the value "Pune" and the field Pin_code with the value 
"411001".
4. Find employee details who are working as "Developer" or 
"Tester".
5. Drop Single documents where designation="Developer".
6. Count number of documents in employee collection.

*/

// Query 1: Creates a new document if no document in the employee collection contains {Designation: "Tester", Company_name: "TCS", Age: 25}
db.employee.updateOne(
    { Designation: "Tester", CompanyName: "TCS", Age: 25 },
    { $setOnInsert: { /* document fields here */ } },
    { upsert: true }
);

// Query 2: Finds all employees working with Company_name: "TCS" and increase their salary by 2000.
db.employee.updateMany(
    { CompanyName: "TCS" },
    { $inc: { Salary: 2000 } }
);

// Query 3: Matches all documents where the value of the field Address is an embedded document that contains only the field city with the value "Pune" and the field Pin_code with the value "411001".
db.employee.find({ "Address.city": "Pune", "Address.Pin_code": "411001" });

// Query 4: Find employee details who are working as "Developer" or "Tester".
db.employee.find({ Designation: { $in: ["Developer", "Tester"] } });

// Query 5: Drop Single documents where designation="Developer".
db.employee.deleteOne({ Designation: "Developer" });

// Query 6: Count number of documents in employee collection.
db.employee.countDocuments();
