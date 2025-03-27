

/*
	Name exercise: tabla 5 for
	Description: five multiplication table in Java codes
	Autor: Kevin Andrey 
	Date: March 19th, 2025
*/


function calcularProducto() {
    let number = 5;  
    let product = 0;  

    for (let counter = 0; counter <= 9; counter++) {
        product = number * counter;  
        
       
        if (product % 2 === 0) {
            console.log(`Numero: ${number}, Contador: ${counter}, Producto: ${product}, Par`);
        } else {
            console.log(`Numero: ${number}, Contador: ${counter}, Producto: ${product}, Impar`);
        }
    }
}

calcularProducto();
