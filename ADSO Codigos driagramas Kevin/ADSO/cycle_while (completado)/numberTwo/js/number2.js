/*
	Name exercise: number2
	Description: multiply the numbers from 1 to 5 from the 9 times table	
        Autor: Kevin Andrey 
	Date: march 20th 2025
*/

let number = 9;
let counter = 0;

while (counter < 5) {
    counter++;
    let product = number * counter;
    console.log("number * counter: " + product);
    
        if (product % 2 === 0) {
        console.log("The product is even");
    } else {
        console.log("The product is odd");
    }
}




 


