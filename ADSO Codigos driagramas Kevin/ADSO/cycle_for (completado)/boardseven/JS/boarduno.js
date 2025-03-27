	Name exercise: multiplication
	Description: multiplication in Javascript codes
	Autor: Kevin Andrey culma 
	Date: March 16th, 2025

let multiply = 1;
let number = 5;

    for (let counter = 1; counter <= number; counter++) {
        multiply += 1;
        let result = multiply * counter;

        if (result % 2 === 0) {
            console.log("buzz");
        } else {
            console.log("bass");
        }
}
