
/*
	Name exercise: culculates gravitional.
	Description: Calculates gravitational force of two bodies and compares them.
	Autor: Kevin Andrey 
	Date: march 20th 2025
*/

	let mass= 50;
	let coefficientfriction= 18;
	let gravity= 9.81;

	let normalForce= mass * gravity;
	let frictionForce= coefficientfriction * normalForce;

	let Result= (frictionForce >= 50) ? "The friction force is hig" : "The friction force is low"
	console.log("Resulting frictionForce:" + frictionForce + "N");
	console.log("Result:" + Result);

