/*
	Name exercise:force
	Description: calculate the force
	Autor: Kevin Andrey
	Date: march 20th 2025
*/

let forcetotal= 0;
let counter= 0; 

while (counter < 10) {
  
       let mass = 10;
       let acceleration = 30;
 
 if (mass > 0 && acceleration > 0) {

      let force= mass * acceleration; 
      counter ++;
      forcetotal += force;
    
          console.log("Force:" + force);
          console.log("Forcetotal: " + forcetotal);
          console.log("Counter: " + counter);
 }

}  
