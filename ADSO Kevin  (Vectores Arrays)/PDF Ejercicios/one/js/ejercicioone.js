/*
    Description: Calcula la aceleración usando la 2ª Ley de Newton (F = m * a)
    Autor: Kevin Andrey
*/

const accelerations = [];
const forces = [
    [10, 5, 0],
    [4, -3, 2],
    [0, 0, 6]
];

const mass = [2, 4, 3];

for (let iterationOne = 0; iterationOne < forces.length; iterationOne++) {
    let values = []; 

    for (let iterationTwo = 0; iterationTwo < forces[iterationOne].length; iterationTwo++) {
        let acceleration = forces[iterationOne][iterationTwo] / mass[iterationOne];
        values.push(acceleration);
    }

    accelerations.push(values);
}

console.log("Matriz de Aceleraciones:");
console.table(accelerations);