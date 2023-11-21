/*
Design and Develop MongoDB Queries using CRUD operations:
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
Insert at least 5 documents in collection by considering above 
attribute and execute following queries:
1. Final name of Employee where age is less than 30 and salary 
more than 50000. 
2. Creates a new document if no document in the employee 
collection contains
 {Designation: "Tester", Company_name: "TCS", Age: 25}
3. Selects all documents in the collection where the field age 
has a value less than 30 or the value of the salary field is 
greater than 40000.
4. Find documents where Designation is not equal to "Developer".
5. Find _id, Designation, Address and Name from all documents 
where Company_name is "Infosys".
6. Display only FName and LName of all Employees
*/

// Create Employee collection
db.employee.insertMany([
    {
        Name: { FName: "John", LName: "Doe" },
        CompanyName: "ABC Corp",
        Salary: 60000.50,
        Designation: "Software Engineer",
        Age: 28,
        Expertise: ["JavaScript", "Node.js", "MongoDB"],
        DOB: new Date("1995-05-15"),
        EmailId: "1@x.com",
        Contact: "123-456-7890",
        Address: [{ PAddr: "123 Main St", LAddr: "Apt 456" }]
    },
]);

db.employee.insertMany([
    {
        Name: { FName: "John", LName: "Doe" },
        CompanyName: "ABC Corp",
        Salary: 60000.50,
        Designation: "Software Engineer",
        Age: 28,
        Expertise: ["JavaScript", "Node.js", "MongoDB"],
        DOB: new Date("1995-05-15"),
        EmailId: "1@x.com",
        Contact: "123-456-7890",
        Address: [{ PAddr: "123 Main St", LAddr: "Apt 456" }]
    },
    {
        Name: { FName: "Jane", LName: "Smith" },
        CompanyName: "XYZ Corp",
        Salary: 70000.00,
        Designation: "Tester",
        Age: 27,
        Expertise: ["Python", "Django", "PostgreSQL"],
        DOB: new Date("1996-06-16"),
        EmailId: "2@x.com",
        Contact: "234-567-8901",
        Address: [{ PAddr: "234 Elm St", LAddr: "Apt 789" }]
    },
    {
        Name: { FName: "Alice", LName: "Johnson" },
        CompanyName: "TCS",
        Salary: 50000.00,
        Designation: "Tester",
        Age: 25,
        Expertise: ["Java", "Spring", "MySQL"],
        DOB: new Date("1998-07-17"),
        EmailId: "3@x.com",
        Contact: "345-678-9012",
        Address: [{ PAddr: "345 Pine St", LAddr: "Apt 012" }]
    },
    {
        Name: { FName: "Bob", LName: "Williams" },
        CompanyName: "Infosys",
        Salary: 80000.00,
        Designation: "Project Manager",
        Age: 35,
        Expertise: ["C#", ".NET", "SQL Server"],
        DOB: new Date("1988-08-18"),
        EmailId: "4@x.com",
        Contact: "456-789-0123",
        Address: [{ PAddr: "456 Oak St", LAddr: "Apt 345" }]
    },
    {
        Name: { FName: "Charlie", LName: "Brown" },
        CompanyName: "Infosys",
        Salary: 75000.00,
        Designation: "Software Engineer",
        Age: 30,
        Expertise: ["JavaScript", "React", "MongoDB"],
        DOB: new Date("1993-09-19"),
        EmailId: "5@x.com",
        Contact: "567-890-1234",
        Address: [{ PAddr: "567 Maple St", LAddr: "Apt 678" }]
    },
    {
        Name: { FName: "David", LName: "Davis" },
        CompanyName: "ABC Corp",
        Salary: 65000.00,
        Designation: "Developer",
        Age: 29,
        Expertise: ["Python", "Flask", "SQLite"],
        DOB: new Date("1994-10-20"),
        EmailId: "6@x.com",
        Contact: "678-901-2345",
        Address: [{ PAddr: "678 Cedar St", LAddr: "Apt 901" }]
    },
    {
        Name: { FName: "Eve", LName: "Miller" },
        CompanyName: "XYZ Corp",
        Salary: 55000.00,
        Designation: "Tester",
        Age: 26,
        Expertise: ["Java", "Spring Boot", "Oracle"],
        DOB: new Date("1997-11-21"),
        EmailId: "7@x.com",
        Contact: "789-012-3456",
        Address: [{ PAddr: "789 Birch St", LAddr: "Apt 234" }]
    },
    {
        Name: { FName: "Frank", LName: "Wilson" },
        CompanyName: "TCS",
        Salary: 45000.00,
        Designation: "Developer",
        Age: 24,
        Expertise: ["C#", "ASP.NET", "SQL Server"],
        DOB: new Date("1999-12-22"),
        EmailId: "8@x.com",
        Contact: "890-123-4567",
        Address: [{ PAddr: "890 Willow St", LAddr: "Apt 567" }]
    },
    {
        Name: { FName: "Grace", LName: "Moore" },
        CompanyName: "Infosys",
        Salary: 85000.00,
        Designation: "Project Manager",
        Age: 36,
        Expertise: ["JavaScript", "Angular", "Firebase"],
        DOB: new Date("1987-01-23"),
        EmailId: "9@x.com",
        Contact: "901-234-5678",
        Address: [{ PAddr: "901 Spruce St", LAddr: "Apt 890" }]
    },
    {
        Name: { FName: "Harry", LName: "Taylor" },
        CompanyName: "ABC Corp",
        Salary: 70000.50,
        Designation: "Software Engineer",
        Age: 31,
        Expertise: ["Python", "Django", "PostgreSQL"],
        DOB: new Date("1992-02-24"),
        EmailId: "10@x.com",
        Contact: "012-345-6789",
        Address: [{ PAddr: "012 Cherry St", LAddr: "Apt 123" }]
    }
]);

/*
1. Final name of Employee where age is less than 30 and salary 
more than 50000. 
2. Creates a new document if no document in the employee 
collection contains
 {Designation: "Tester", Company_name: "TCS", Age: 25}
3. Selects all documents in the collection where the field age 
has a value less than 30 or the value of the salary field is 
greater than 40000.
4. Find documents where Designation is not equal to "Developer".
5. Find _id, Designation, Address and Name from all documents 
where Company_name is "Infosys".
6. Display only FName and LName of all Employees
*/

db.employee.find({Age:{$lt:30},Salary:{$gt:50000}});

db.employee.updateOne({ Designation: "Tester", CompanyName: "TCS", Age: 25 }, 
{ $set: { Designation: "Tester", CompanyName: "TCS", Age: 25 } }, { upsert: true });
db.employee.updateOne(
    { Designation: "Tester", CompanyName: "TCS", Age: 25 },
    { $setOnInsert: {  Designation: "Tester", CompanyName: "TCS", Age: 25 }},
    { upsert: true }
);

db.employee.find({$or:[{Age:{$lt:30}},{Salary:{$gt:40000}}]});

db.employee.find({Designation:{$ne:"Developer"}});

db.employee.find({CompanyName:"Infosys"},{_id:1,Designation:1,Address:1,Name:1});

db.employee.find({},{Name:1});
//display fname and lname in 1 string
db.employee.find({},{Name:1,_id:0}).forEach(function(doc){print(doc.Name.FName+" "+doc.Name.LName)});

// aggregation pipeline match designation developer tester -> group by designation -> sum total salary -> match total salary is greater than 100000
db.employee.aggregate([
    {$match:{Designation:{$in:["Developer","Tester"]}}},
    {$group:{_id:"$Designation",totalSalary:{$sum:"$Salary"}}},
    {$match:{totalSalary:{$gt:100000}}}
]);

// avg salary by designation
db.employee.aggregate([
    {$group:{_id:"$Designation",avgSalary:{$avg:"$Salary"}}}
]);