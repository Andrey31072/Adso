/*  
    Name exercise: Salary Calculation  
    Description: This program calculates the total salary of a person after applying subsidies and deductions.  
    Author: Kevin Andrey   
    Date: March 15th, 2025  
*/  

let salary=14500000;
let dayValue=48000;
let dayWorked=30;
let health=174000;
let pension=232000;
let arl=81200;
let discount=487000;
let netSalary=963000;

  salary=dayWorked * dayValue;
  health=salary * 0.12;
  pension=salary * 0.16;
  arl=salary * 0.052;
  discount=health + pension + arl;
  netSalary=salary - discount; 


console.log("Salary:", salary);
console.log("Health Deduction:", health);
console.log("Pension Deduction:", pension);
console.log("ARL Deduction:", arl);
console.log("Total Discount:", discount);
console.log("Net Salary:", netSalary)