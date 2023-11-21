db.Works.aggregate([{ $group: { _id: "$company_name", totalSalary: { $sum: "$salary" } } }]);
// - This command displays the total salary per company.
db.Works.aggregate([{ $match: { company_name: "TCS" } }, { $group: { _id: "$company_name", totalSalary: { $sum: "$salary" } } }]);
// - This command displays the total salary of the company named ‘TCS’.
db.Works.aggregate([{ $lookup: { from: "Company", localField: "company_name", foreignField: "company_name", as: "company_info" } }, { $match: { "company_info.city": "Pune" } }, { $group: { _id: "$company_name", averageSalary: { $avg: "$salary" } } }]);
// - This command returns the average salary of companies whose address is ‘Pune’.
db.Company.find({ city: "Pune" }).count();
// - This command displays the total count for the city ‘Pune’.
db.Employee.find({ city: "Pune", age: { $gt: 40 } }).count();
// - This command returns the count for the city ‘Pune’ and age greater than 40.