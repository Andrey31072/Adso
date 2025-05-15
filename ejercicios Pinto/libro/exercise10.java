import java.util.Scanner;

public class exercise10 {
    public static void main(String[] args) {
       
        int EdadDelPrimerHermano; 
        int EdadDelSegundoHermano; 
        int DiferenciaDeEdades; 

        
        Scanner scanner = new Scanner(System.in);

        
        System.out.print("Ingrese la edad del primer hermano: ");
        EdadDelPrimerHermano = scanner.nextInt();

        
        System.out.print("Ingrese la edad del segundo hermano: ");
        EdadDelSegundoHermano = scanner.nextInt();

       
        if (EdadDelPrimerHermano > EdadDelSegundoHermano) {
            System.out.println(
                    "El Primer Hermano es el Mayor, por " + (EdadDelPrimerHermano - EdadDelSegundoHermano) + " años");
            DiferenciaDeEdades = EdadDelPrimerHermano - EdadDelSegundoHermano;
        } else {
            System.out.println(
                    "El segundo Hermano es el Mayor, por " + (EdadDelSegundoHermano - EdadDelPrimerHermano) + " años");
            DiferenciaDeEdades = EdadDelSegundoHermano - EdadDelPrimerHermano;
        }

        System.out.println("La diferencia de edades es: " + DiferenciaDeEdades + " años");

       
        scanner.close();
    }
}