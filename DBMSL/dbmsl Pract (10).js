/*
Create Employee collection by considering following Fields: 
i. Name: Embedded Doc (FName, LName)
ii. Company Name: String 
iii. Salary: Number
iv. Designation: String
v. Age: Number
vi. Expertise: Array 
vii. DOB: String or Date
viii. Email id: String
ix. Contact: String 
x. Address: Array of Embedded Doc (PAddr, LAddr)
 */
db.employee.insertOne(
    { CompanyName: "TCS", Name: { FName: "Rahul", LName: "Kumar" }, Salary: 50000, Designation: "Software Developer", Age: 25, Expertise: ["Java", "C++", "Python", "JavaScript"], DOB: "1995-01-01", Email: "1@x.com", Contact: "1234567890", Address: [{ PAddr: "Mumbai" }, { LAddr: "Delhi" }] });

db.employee.insertOne({ CompanyName: "TCS", Name: { FName: "Rahul", LName: "Kumar" }, Salary: 50000, Designation: "SoftwareDeveloper", Age: 25, Expertise: ["Java", "C++", "Python", "JavaScript"], DOB: "1995-01-01", Email: "1@x.com", Contact: "1234567890", Address: [{ PAddr: "Mumbai" }, { LAddr: "Delhi" }] });

// Insert documents into the Employee collection
db.employee.insertMany([    {        Name: { FName: "John", LName: "Doe" },        CompanyName: "ABC Corp",        Salary: 60000.50,        Designation: "Software Engineer",        Age: 28,        Expertise: ["JavaScript", "Node.js", "MongoDB"],        DOB: new Date("1995-05-15"),        EmailId: "john.doe@example.com",        Contact: "123-456-7890",        Address: [{ PAddr: "123 Main St", LAddr: "Apt 456" }]    },    {        Name: { FName: "Alice", LName: "Smith" },        CompanyName: "XYZ Inc",        Salary: 75000.75,        Designation: "Data Scientist",        Age: 32,        Expertise: ["Python", "Machine Learning"],        DOB: new Date("1990-08-20"),        EmailId: "alice.smith@example.com",        Contact: "987-654-3210",        Address: [{ PAddr: "456 Oak St", LAddr: "Suite 789" }]    },    {        Name: { FName: "Bob", LName: "Johnson" },        CompanyName: "123 Tech",        Salary: 50000.25,        Designation: "Web Developer",        Age: 25,        Expertise: ["HTML", "CSS", "React"],        DOB: new Date("1998-03-10"),        EmailId: "bob.johnson@example.com",        Contact: "555-123-4567",        Address: [{ PAddr: "789 Pine St", LAddr: "Unit 101" }]    },    {        Name: { FName: "Eva", LName: "Williams" },        CompanyName: "Tech Innovators",        Salary: 90000.00,        Designation: "Senior Engineer",        Age: 35,        Expertise: ["Java", "Spring", "MySQL"],        DOB: new Date("1988-12-05"),        EmailId: "eva.williams@example.com",        Contact: "777-888-9999",        Address: [{ PAddr: "321 Elm St", LAddr: "Floor 12" }]    }]);

/*
1. Select all documents where the Designation field has the value 
"Programmer" and the value of the salary field is greater than 
30000.
2. Creates a new document if no document in the employee 
collection contains
 {Designation: "Tester", Company_name: "TCS", Age: 25}
3. Increase salary of each Employee working with “Infosys" 10000. 
4. Finds all employees working with "TCS" and reduce their salary 
by 5000.
5. Return documents where Designation is not equal to "Tester".
6. Find all employee with Exact Match on an Array having 
Expertise: ['Mongodb','Mysql','Cassandra']
*/

// 1. Select all documents where the Designation field has the value "Programmer" and the value of the salary field is greater than 30000.
db.employee.find({ Designation: "Programmer", Salary: { $gt: 30000 } });

// 2. Creates a new document if no document in the employee collection contains {Designation: "Tester", Company_name: "TCS", Age: 25}
db.employee.updateOne({ Designation: "Tester", CompanyName: "TCS", Age: 25 }, { $set: { Designation: "Tester", CompanyName: "TCS", Age: 25 } }, { upsert: true });

// 3. Increase salary of each Employee working with “Infosys" 10000.
db.employee.updateMany({ CompanyName: "Infosys" }, { $inc: { Salary: 10000 } });

// 4. Finds all employees working with "TCS" and reduce their salary by 5000.
db.employee.updateMany({ CompanyName: "TCS" }, { $inc: { Salary: -5000 } });

// 5. Return documents where Designation is not equal to "Tester".
db.employee.find({ Designation: { $ne: "Tester" } });

// 6. Find all employee with Exact Match on an Array having Expertise: ['Mongodb','Mysql','Cassandra']
db.employee.find({ Expertise: ["Mongodb", "Mysql", "Cassandra"] });

