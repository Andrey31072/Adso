
/*
	Name exercise: acceleration of an object.
	Description: Calculating the acceleration of an object subjected to a force
	Autor: Kevin Andrey 
	Date: march 20th 2025
*/

	let mass= 25;
	let appliedForce= 10;
	
	let acceleration= appliedForce/mass
		console.log("Aceleración:" + acceleration + "m/s²");

	let Result= (acceleration >= 5) ? "The acceleration is hig" : "acceleration is low"
		console.log("Result:" + Result);
