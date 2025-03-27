/*
     Name exercise: force
     Description: This exercise is about finding the force and determining if it is greater than 100 Newtons.
     Autor:Kevin Andrey 
     Date: 16 of march of 2025 
*/

	let acceleration = 70;	
	let mass = 10;
	let force = mass * acceleration;
	let result = (force >= 100) ? "The force is high" : "The force is low";

	console.log("Resulting force is: " + force + " N");
	console.log("Result: " + result);

