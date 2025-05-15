import java.util.Scanner;
public class Exercise25 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

    
       String letra;
        boolean continuar = true;

        while (continuar) {
            System.out.print("Ingrese una letra: ");
            letra = teclado.nextLine();

            if (letra.equalsIgnoreCase("a") ||
                letra.equalsIgnoreCase("e") ||
                letra.equalsIgnoreCase("i") ||
                letra.equalsIgnoreCase("o") ||
                letra.equalsIgnoreCase("u")) {
                continuar = false;
            } else {
                System.out.println("No es una vocal, intente nuevamente.");
            }
        }

        System.out.println("Ingresó una vocal. Fin del programa.");
        teclado.close();
    }
}