/*
    Description: Calcula la fuerza total con la formula
    Autor: Kevin Andrey
*/


const forces = [
    [5, 0],  
    [-2, 3], 
    [1, -1]  
];

const mass = 2;


let totalForce = forces.reduce((accumulated, currentForce) => {
    return [
        accumulated[0] + currentForce[0], 
        accumulated[1] + currentForce[1]
    ];
}, [0, 0]); 


let acceleration = totalForce.map(component => (component / mass));

console.log("Total Force:", totalForce);
console.log("Total Force:", totalForce + "N");
console.log("Resulting Acceleration:", acceleration);
console.log("Acceleration:", acceleration + "m/s");

