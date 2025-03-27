/*
	Name exercise: Primer Ejercicio de erray 
	Description: Ejercio de variable erray 
	Autor: Kevin Andrey 
	Date: march 20th 2025
*/

 	let vector=[]
	let iteration; 
	let number;
	
	for(iteration=0; iteration<10;iteration++){
	number= Math.floor(Math.random()*101);
	vector.push(number);
}

	console.log(vector);

	for(iteration=0;iteration<vector.length;iteration ++){

	//Vector[iteration];
	console.log(vector[iteration]);

}

	let largestNumber= Math.max(...vector);
		console.log("largest Number is:" + largestNumber);
	let smallerNumber= Math.min(...vector);
		console.log("smaller Number is:" + smallerNumber);

	let evenNumbers = vector.filter(number => number % 2 === 0);
		console.log("Even numbers is:" + evenNumbers);
	let oddNumbers = vector.filter(number => number % 2 !== 0)
		console.log("Odd numbers is:" + oddNumbers);





