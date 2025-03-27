/*
	Name exercise:weigth
	Description: calculate the weigth of the different planets
	Autor: Kevin Andrey
	Date: march 20th 2025
*/
	let weigthtotal= 0;
	let counter= 0; 

	while(counter < 10) {
  
       	let gravity = 9.81;
       	let mass = 20;
 
	if (gravity > 0 && mass > 0) {

		let weight= mass * gravity; 
		counter ++;
 		weigthtotal += weight;
    
          console.log("Weight:" + weight);
          console.log("Weigthtotal: " + weigthtotal);
          console.log("Counter: " + counter);
 }

}  
