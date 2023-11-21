var before = new Date();
db.employee.find({ Salary: 50000 }).explain("executionStats");
var after = new Date();
print("Time before creating index: ", after - before);

db.employee.createIndex({ Salary: 1 });

var before = new Date();
db.employee.find({ Salary: 50000 }).explain("executionStats");
var after = new Date();
print("Time before creating index: ", after - before);

db.employee.aggregate([
    { $match: { "Name.FName": "Eve", "Name.LName": "Miller" } },
    { $unwind: "$Expertise" },
    { $unwind: "$Address" }
]);

db.employee.updateOne({ "Name.FName": "Eve", "Name.LName": "Miller" }, 
    { $set: { "Address": [ { PAddr: '789 Birch St', LAddr: 'Apt 234' },{ PAddr: 'Birch St', LAddr: 'L 234' } ] } });


var mapFunction3 = function() {
    if (this.Address.some(addr => addr.PAddr === "Pune")) {
        emit(this.CompanyName, this.Salary);
    }
};
var reduceFunction3 = function(key, values) {
    return Array.avg(values);
};
db.employee.mapReduce(mapFunction3,reduceFunction3,{ out: "average_salary_per_company_in_pune" });


var mapFunction6 = function() {
    if (this.Expertise.some(addr => addr === "JavaScript") && this.Age > 30) {
        emit("JS", 1);
    }
};
db.employee.mapReduce(
    mapFunction6,
    reduceFunction4,
    { out: "js_count" }
);

db.employee.updateOne({Age:31},{$set:{$push:{Expertise:"JavaScript"}}});