import java.util.Scanner;

public class Ambulancia {

    static Main sapa = new Main();
    public static void registrarAmbulancias() {
        Scanner teclado = new Scanner (System.in);
        for (int i = 0; i < 3; i++) {
            System.out.print("Ingrese ID de la ambulancias del (1-10)" + (i + 1) + ": ");
            Datos.ambulancias[i] = Main.teclado.nextLine();
        }

        System.out.println("Ambulancias registradas:");
        for (int i = 0; i < 3; i++) {
            System.out.println((i + 1) + ". " + Datos.ambulancias[i]);
        }
    }
}
