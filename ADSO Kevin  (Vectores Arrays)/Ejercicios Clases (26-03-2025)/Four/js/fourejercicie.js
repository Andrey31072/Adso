/*
	Description:In this exercise we will make a function that receives force and mass and returns acceleration.
	Autor: Kevin Andrey
*/

	const mass= 20
	const force= 10

	function calculateAcceleration(force, mass) {
    	if (mass === 0) {
        return "The mass cannot be zero.";
    }
    return (force / mass).toFixed(2);
}	

	console.log("Force:", force, "N");
	console.log("Mass:", mass, "kg");
	console.log("Acceleration:", calculateAcceleration(force, mass), "m/s");



