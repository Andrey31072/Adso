import java.util.Scanner;

public class exercise16 {
    public static void main(String[] args) {

        int NumeroEntero;
        String Vocal;

        Scanner teclado = new Scanner(System.in);

        System.out.print("Ingrese un número entero (1-5): ");
        NumeroEntero = teclado.nextInt();

        switch (NumeroEntero) {
            case 1:
                Vocal = "A";
                break;
            case 2:
                Vocal = "E";
                break;
            case 3:
                Vocal = "I";
                break;
            case 4:
                Vocal = "O";
                break;
            case 5:
                Vocal = "U";
                break;
            default:
                Vocal = "Valor Incorrecto";
                break;
        }

        System.out.println("La vocal correspondiente es: " + Vocal);

        teclado.close();
    }
}
