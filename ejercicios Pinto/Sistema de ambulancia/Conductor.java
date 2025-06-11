import java.util.Scanner;

public class Conductor {

    public static  Main sapa = new Main();
    public static void registrarConductores() {
        Scanner teclado = new Scanner(System.in);
        for (int x = 0; x < 10; x++) {
            System.out.println("Introduce el nombre del conductor " + (x + 1) + ":");
            String nombre = Main.teclado.nextLine();

            System.out.println("Introduce el apellido del conductor " + (x + 1) + ":");
            String apellido = Main.teclado.nextLine();

            System.out.println("Introduce el número de teléfono del conductor " + (x + 1) + ":");
            String telefono = Main.teclado.nextLine();

            System.out.println("Introduce el ID de la ambulancia asignada al conductor " + (x+1) + ":");
            String id = Main.teclado.nextLine();

            Datos.Conductor[x] = nombre + " " + apellido + " - Tel: " + telefono;
        }

        System.out.println("Conductores registrados:");
        for (int i = 0; i < 10; i++) {
            System.out.println((i + 1) + ". " + Datos.Conductor[i]);
        }
    }
}

