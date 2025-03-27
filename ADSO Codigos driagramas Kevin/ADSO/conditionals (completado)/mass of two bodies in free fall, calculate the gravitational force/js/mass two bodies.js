/*
	Name exercise: Mass two bodies force.
	Description: Calculates gravitational force of two bodies and compares them.
	Autor: Kevin Andrey 
	Date: march 19th 2025
*/

const gravedad = 9.81;

function calculateGravitationalForce(masa) {
    return masa * gravedad;
}

let forceBodyOne = 70; 
let forceBodyTwo = 60;

if (forceBodyOne <= 0 || forceBodyTwo <= 0) {
    console.log("Please enter valid, positive values ​​for mass");
} else {
  
    forceBodyOne = calculateGravitationalForce(forceBodyOne);
    forceBodyTwo = calculateGravitationalForce(forceBodyTwo);

    console.log("Gravitational force of the first body: " + forceBodyOne.toFixed(2) + " N");
    console.log("Gravitational force of the second body: " + forceBodyTwo.toFixed(2) + " N");

    if (forceBodyOne > forceBodyTwo) {
        console.log("The first body exerts greater gravitational force.");
    } else if (forceBodyTwo > forceBodyOne) {
        console.log("The second body exerts greater gravitational force.");
    } else {
        console.log("Both bodies exert the same gravitational force.");
    }
}



