 /*
    Description: In this exercise we will create a function that receives an array and can return the sum.
    Autor: Kevin Andrey
*/
	

	const randomNumbers = generateRandomArray(10, 27);

	function generateRandomArray(size, max) {
    		return Array.from({ length: size }, () => Math.floor(Math.random() * max) + 1);
}

	function sumArray(numbers) {
   	 	return numbers.reduce((total, number) => total + number, 0);
}

	console.log("Array :", randomNumbers);
	console.log("addition:", sumArray(randomNumbers));
