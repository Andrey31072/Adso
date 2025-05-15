import java.util.Scanner;
public class exercise21 {


    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

      
        int EdadDePersona;  
        int mayores = 0;
        int menores = 0; 
        int K; //contador   

        for (K = 1; K <= 200; K++) {
            System.out.print("Ingrese la edad de la persona " + K + ": ");
            EdadDePersona = teclado.nextInt();

            if (EdadDePersona < 18) {
                menores = menores+ 1;
            } else {
                mayores = mayores+ 1;
            }
        }

    
        System.out.println("Cantidad de personas mayores de edad: " + mayores);
        System.out.println("Cantidad de personas menores de edad: " + menores);

    

        teclado.close();
    }
}