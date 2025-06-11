import java.util.Scanner;

public class Main {

    public static Scanner teclado = new Scanner(System.in);
    public  static  String nombre,apellido,telefono,tipoSangre;
    public static int edad, id;

    public static void main(String[] args) {
        int opcion = 0;

        while (opcion != 6) {
            System.out.println("--- Menú ---");
            System.out.println("1. Registrar Conductores");
            System.out.println("2. Registrar Pacientes");
            System.out.println("3. Registrar Fallecidos");
            System.out.println("4. Asignar conductor Funeraria");
            System.out.println("5. Registrar Ambulancias");
            System.out.println("6. Salir");
            System.out.print("Seleccione una opción: ");
            opcion = teclado.nextInt();
            teclado.nextLine();

            switch (opcion) {
                case 1:
                    Conductor.registrarConductores();
                    break;
                case 2:
                    Pacientes.resgistrarpacientes();
                    break;
                case 3:
                    Fallecidos.registrarMuertos();
                    break;
                case 4:
                    Funeraria.transferirconductor();
                    break;
                case 5:
                    Ambulancia.registrarAmbulancias();
                    break;
                case 6:
                    System.out.println("Gracias por usar el sistema.");
                    break;
                default:
                    System.out.println("Opción no válida. Intente de nuevo.");
            }
        }
    }
}

