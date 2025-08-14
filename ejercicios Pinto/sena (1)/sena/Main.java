import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Main main = new Main();
        main.mostrarMenu();
    }

    private SistemaGestion sistema;
    private Scanner scanner;

    public Main() {
        this.sistema = new SistemaGestion();
        this.scanner = new Scanner(System.in);
    }

    public void mostrarMenu() {
        while (true) {
            System.out.println("=== Sistema de Gestión de Aprendices ===");
            System.out.println("1. Registrar Ubicación");
            System.out.println("2. Definir Cantidad de Aprendices por Línea");
            System.out.println("3. Asignar Ambiente a Línea");
            System.out.println("4. Identificar y Asignar Aprendices");
            System.out.println("5. Asignar Aprendices a Ambiente");
            System.out.println("6. Asignar Línea y Programa a Aprendiz");
            System.out.println("7. Registrar Instructor");
            System.out.println("8. Generar Reporte de Instructores");
            System.out.println("9. Generar Reporte de Aprendices");
            System.out.println("10. Generar Reporte de Ambientes");
            System.out.println("0. Salir");
            System.out.print("Seleccione una opción: ");

            try {
                int opcion = scanner.nextInt();
                scanner.nextLine(); // Consumir salto de línea
                if (opcion < 0 || opcion > 10) {
                    System.out.println("Opción no válida. Por favor, seleccione entre 0 y 10.");
                    continue;
                }

                switch (opcion) {
                    case 1:
                        registrarUbicacion();
                        break;
                    case 2:
                        definirCantidadAprendices();
                        break;
                    case 3:
                        asignarAmbienteLinea();
                        break;
                    case 4:
                        identificarYAsignarAprendices();
                        break;
                    case 5:
                        asignarAprendicesAmbiente();
                        break;
                    case 6:
                        asignarLineaPrograma();
                        break;
                    case 7:
                        registrarInstructor();
                        break;
                    case 8:
                        sistema.generarReportesInstructores();
                        break;
                    case 9:
                        sistema.generarReportesAprendices();
                        break;
                    case 10:
                        sistema.generarReportesAmbientes();
                        break;
                    case 0:
                        System.out.println("Saliendo del sistema...");
                        scanner.close();
                        return;
                    default:
                        System.out.println("Opción no válida. Intente de nuevo.");
                }
            } catch (InputMismatchException e) {
                System.out.println("Error: Ingrese un número válido.");
                scanner.nextLine(); 
            } catch (Exception e) {
                System.out.println("Ocurrió un error: " + e.getMessage());
                scanner.nextLine(); // Limpiar buffer
            }
        }
    }

   // Función auxiliar para leer una cadena no vacía desde la consola.
    private String leerEntrada(String mensaje) {
        while (true) {
            System.out.print(mensaje);
            String entrada = scanner.nextLine().trim();
            if (!entrada.isEmpty()) return entrada;
            System.out.println("Error: " + mensaje.replace(":", "") + " no puede estar vacío.");
        }
    }

    // Función auxiliar para leer un entero no negativo desde la consola.
    private int leerEntero(String mensaje) {
        while (true) {
            System.out.print(mensaje);
            try {
                int valor = scanner.nextInt();
                scanner.nextLine(); // Consumir salto de línea
                if (valor >= 0) return valor;
                System.out.println("Error: La cantidad no puede ser negativa.");
            } catch (InputMismatchException e) {
                System.out.println("Error: Ingrese un número válido.");
                scanner.nextLine();
            }
        }
    }
    /* Función de leerEntero: Lee un número entero no negativo desde la consola, valida que sea un entero válido y no negativo,
    y maneja errores de entrada (como texto o números negativos) solicitando nuevas entradas hasta que sean válidas.
    */

    // Registra una nueva ubicación con regional, centro y sede.
    private void registrarUbicacion() {
        String regional = leerEntrada("Ingrese regional: ");
        String centro = leerEntrada("Ingrese centro: ");
        String sede = leerEntrada("Ingrese sede: ");
        sistema.registrarUbicacion(regional, centro, sede);
        System.out.println("Ubicación registrada.");
    }

    // Define la cantidad de aprendices para una línea de formación.
    private void definirCantidadAprendices() {
        String linea = leerEntrada("Ingrese línea: ");
        int cantidad = leerEntero("Ingrese cantidad de aprendices: ");
        sistema.definirCantidadAprendices(linea, cantidad);
        System.out.println("Cantidad definida.");
    }

    // Asigna un ambiente a una línea de formación.
    private void asignarAmbienteLinea() {
        String linea = leerEntrada("Ingrese línea: ");
        String codigo = leerEntrada("Ingrese código del ambiente: ");
        System.out.print("¿Es especializado? (true/false): ");
        boolean especializado = Boolean.parseBoolean(scanner.nextLine().trim());
        String jornada = leerEntrada("Ingrese jornada: ");
        Ambiente ambiente = new Ambiente(codigo, especializado, jornada);
        sistema.agregarAmbiente(ambiente);
        sistema.asignarAmbienteLinea(linea, ambiente);
        System.out.println("Ambiente asignado.");
    }

    // Identifica y asigna aprendices a una línea de formación.
    private void identificarYAsignarAprendices() {
        String linea = leerEntrada("Ingrese línea: ");
        int cantidad = leerEntero("Ingrese cantidad a asignar: ");
        sistema.identificarYAsignarAprendices(linea, cantidad);
        System.out.println("Aprendices asignados.");
    }

    // Asigna aprendices a un ambiente dentro de una línea.
    private void asignarAprendicesAmbiente() {
        String linea = leerEntrada("Ingrese línea: ");
        String codigo = leerEntrada("Ingrese código del ambiente: ");
        System.out.print("¿Es especializado? (true/false): ");
        boolean especializado = Boolean.parseBoolean(scanner.nextLine().trim());
        String jornada = leerEntrada("Ingrese jornada: ");
        Ambiente ambiente = new Ambiente(codigo, especializado, jornada);
        sistema.asignarAprendicesAmbiente(linea, ambiente);
        System.out.println("Aprendices asignados al ambiente.");
    }

    // Asigna una línea y un programa a un aprendiz.
    private void asignarLineaPrograma() {
        String codigoAprendiz = leerEntrada("Ingrese código del aprendiz: ");
        Aprendiz aprendiz = new Aprendiz(codigoAprendiz);
        sistema.agregarAprendiz(aprendiz);
        String linea = leerEntrada("Ingrese línea: ");
        String programa = leerEntrada("Ingrese programa: ");
        sistema.asignarLineaPrograma(aprendiz, linea, programa);
        System.out.println("Línea y programa asignados.");
    }

    // Registra un nuevo instructor con código, sede y línea.
    private void registrarInstructor() {
        String codigo = leerEntrada("Ingrese código del instructor: ");
        String sede = leerEntrada("Ingrese sede: ");
        String linea = leerEntrada("Ingrese línea: ");
        sistema.registrarInstructor(codigo, sede, linea);
        System.out.println("Instructor registrado.");
    }
}