import java.util.Scanner;
public class Exercise30 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        
        double N1, N2, S, P;

        System.out.print("Ingrese el primer número: ");
        N1 = teclado.nextDouble();

        System.out.print("Ingrese el segundo número: ");
        N2 = teclado.nextDouble();

   
        S = N1 + N2;
        P = S / 2;

  
        System.out.println("El promedio es: " + P);

        teclado.close();
    }
}