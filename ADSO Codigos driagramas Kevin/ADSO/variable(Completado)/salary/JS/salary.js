/*
	Name exercise: salary
	Description: Calculate net salary after deductions
	Author: Kevin Andrey 
	Date: March 15th, 2025
*/ 

let dayValue = 25;
let dayWorked = 45;
let salary = dayWorked * dayValue;

let health = salary * 0.12;
let pension = salary * 0.16;
let arl = salary * 0.052;
let discount = health + pension + arl;
let netSalary = salary - discount;

     console.log("Salary:", salary);
     console.log("Health discount:", health);
     console.log("Pension discount:", pension);
     console.log("ARL discount:", arl);
     console.log("Total discount:", discount);
     console.log("Net Salary:", netSalary);