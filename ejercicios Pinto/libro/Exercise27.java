import java.util.Scanner;

public class Exercise27 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("Ingrese el primer número: ");
        int PrimerNumero = teclado.nextInt();

        System.out.print("Ingrese el segundo número: ");
        int SegundoNumero = teclado.nextInt();

        System.out.print("Ingrese el operador (+, -, *, ^): ");
        String Operador = teclado.next();

        int Resultado = 0;
        boolean operadorValido = true;

        if (Operador.equals("+")) {
            Resultado = PrimerNumero + SegundoNumero;
        } else if (Operador.equals("-")) {
            Resultado = PrimerNumero - SegundoNumero;
        } else if (Operador.equals("*")) {
            Resultado = PrimerNumero * SegundoNumero;
        } else if (Operador.equals("^")) {
            Resultado = (int) Math.pow(PrimerNumero, SegundoNumero);
        } else {
            System.out.println("Operador no válido.");
            operadorValido = false;
        }

        if (operadorValido) {
            System.out.println("Resultado: " + Resultado);
        }

         teclado.close();
    }
}