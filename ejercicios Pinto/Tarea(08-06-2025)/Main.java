import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        System.out.print("¿Cuántas personas desea ingresar? ");
        int cantidad = teclado.nextInt();
        teclado.nextLine(); // limpiar buffer

        RegistroPersonas registro = new RegistroPersonas(cantidad);

        registro.registrarPersonas();
        registro.mostrarTodas();

        teclado.close();
    }
}
