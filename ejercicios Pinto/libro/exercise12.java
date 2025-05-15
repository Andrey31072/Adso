import java.util.Scanner;

public class exercise12 {
    public static void main(String[] args) {
      
        int PrimerNumeroEntero;
        int SegundoNumeroEntero; 
        int TercerNumeroEntero;
        int NumeroMayor; 
        Scanner teclado = new Scanner(System.in);

       
        System.out.print("Ingrese el primer número entero: ");
        PrimerNumeroEntero = teclado.nextInt();

     
        System.out.print("Ingrese el segundo número entero: ");
        SegundoNumeroEntero = teclado.nextInt();

       
        System.out.print("Ingrese el tercer número entero: ");
        TercerNumeroEntero = teclado.nextInt();

        if ((PrimerNumeroEntero > SegundoNumeroEntero) && (PrimerNumeroEntero > TercerNumeroEntero)) {
            NumeroMayor = PrimerNumeroEntero;
        } else {
            if (SegundoNumeroEntero > TercerNumeroEntero) {
                NumeroMayor = SegundoNumeroEntero;
            } else {
                NumeroMayor = TercerNumeroEntero;
            }
        }

        System.out.println("El número mayor es: " + NumeroMayor);

   
        teclado.close();
    }
}
