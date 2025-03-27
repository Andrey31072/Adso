/*
	Name exercise: number
	Description: multiply the numbers from 1 to 5 from the table of 1,2,3,4,5
        Autor: Kevin Andrey
	Date: march 20th 2025
*/

let numbers = 6; 
let counter = 1;

while (counter < numbers) {
       let multiply = 1;

while (multiply <= 5) {
       let result = counter * multiply;
           console.log(counter + " * " + multiply + " = " + result);

        if (result % 2 === 0) {
            console.log("buzz");
        } else {
            console.log("bass");
        }

       multiply++; 
    }

      counter++; 
    }