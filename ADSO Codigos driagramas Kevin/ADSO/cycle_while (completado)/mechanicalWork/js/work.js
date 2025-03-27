/*
	Name exercise: mechanical work 
	Description: The mechanical work (W) r will be calculated
	Autor: Kevin Andrey
	Date: march 20th 2025
*/

let worktotal= 0;
let counter= 0; 
let appliedforce= 15;
let distance= 20;

while (distance >=0) {
      
    let work= (appliedforce * distance); 
    
  worktotal += work;

console.log("work: "+ work); 

 counter ++;
  distance --;

console.log("Worktotal:" + worktotal);
}






