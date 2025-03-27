/*
	Name exercise: EGP
	Description: calculates the gravitational potential energy of an object
	Autor: Kevin Andrey
	Date: march 20th 2025
*/

let mass= 10;
let gravity= 9.81;
let counter= 0;
let totalepg= 0;
let height= 10;

while (height >=0) { 
  
let epg = (mass * gravity * height); 
   
totalepg += epg;
console.log("potential energy: " + height + " mass: " + epg);
             
    height--;    
    counter++; 
}

console.log("total potential energy:" + totalepg);
     

 
     


