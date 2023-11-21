// Query 1: Using aggregation Return Designation with Total Salary is Above 200000.
db.employee.aggregate([
    { $group: { _id: "$Designation", totalSalary: { $sum: "$Salary" } } },
    { $match: { totalSalary: { $gt: 200000 } } }
]);

// Query 2: Using Aggregate method returns names and _id in upper case and in alphabetical order.
db.employee.aggregate([
    { $project: { _id: 1, FName: { $toUpper: "$Name.FName" }, LName: { $toUpper: "$Name.LName" } } },
    { $sort: { FName: 1, LName: 1 } }
]);

// Query 3: Using Aggregate method find Employee with Total Salary for Each City with Designation="DBA".
db.employee.aggregate([
    { $match: { Designation: "DBA" } },
    { $group: { _id: "$Address.city", totalSalary: { $sum: "$Salary" } } }
]);

// Query 4: Create Single Field Indexes on Designation field of employee collection
db.employee.createIndex({ Designation: 1 });

// Query 5: To Create Multikey Indexes on Expertise field of employee collection.
db.employee.createIndex({ Expertise: 1 });

// Query 6: Create an Index on Emp_id field, compare the time require to search Emp_id before and after creating an index. (Hint Add at least 10000 Documents)
// Create index
db.employee.createIndex({ Emp_id: 1 });

// Compare time before and after creating index
var before = new Date();
db.employee.find({ Emp_id: 1 }).explain("executionStats");
var after = new Date();
print("Time before creating index: ", after - before);

// Query 7: Return a List of Indexes on created on employee Collection.
db.employee.getIndexes();
