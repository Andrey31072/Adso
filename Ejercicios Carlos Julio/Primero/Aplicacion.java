import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Aplicacion {
    static List<Libro> libros = new ArrayList<>();
    static List<Lector> lectores = new ArrayList<>();
    static List<Prestamo> prestamos = new ArrayList<>();
    static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) throws Exception {
        int opcion = 0;
        do {
            System.out.println("Sistema de biblioteca");
            System.out.println("1. Registrar libro");
            System.out.println("2. Listar libro");
            System.out.println("3. Registrar lector");
            System.out.println("4. Listar lectores");
            System.out.println("5. Registrar prestamo");
            System.out.println("6. Listar prestamo");
            System.out.println("7. Devolver libros");
            System.out.println("8. Eliminar libros");
            System.out.println("9. Eliminar lectores");
            System.out.println("10. Eliminar prestamos");
            System.out.println("11. Salir");
                            
            opcion = teclado.nextInt();
            teclado.nextLine();
            switch (opcion) {
                case 1:
                    registarLibros();
                    break;
                case 2:
                    listarLibros();
                    break;  
                case 3:
                    registarLectores();
                    break;
                case 4:
                    listarLectores();
                    break;   
                case 5:
                    registrarPrestamos();
                    break;
                case 6:
                    listarPrestamos();
                    break;
                case 7:
                    devolverLibros();
                    break;    
                case 8:
                    eliminarLibros();
                    break;
                case 9:
                    eliminarLectores();
                    break;
                case 10: 
                    eliminarPrestamos();
                    break;
                case 11:
                    break;                           
                default:
                    System.out.println("Opcion invalida");
            }
        } while (opcion != 8);
        System.out.println("Chao con adios");
    }

    public static void registarLibros() {
        System.out.println("Ingrese la informacion del libro");
        System.out.println("ISBN");
        String isbn = teclado.nextLine();
        System.out.println("Titulo");
        String titulo = teclado.nextLine();
        System.out.println("Autor");
        String autor = teclado.nextLine();
        System.out.println("Genero");
        String genero = teclado.nextLine();
        System.out.println("Fecha de publicacion (yyyy-MM-dd)");
        LocalDate fechaDePublicacion = LocalDate.parse(teclado.nextLine());

        libros.add(new Libro(isbn, titulo, autor, genero, fechaDePublicacion));
    }

    public static void listarLibros() {
        for (int i = 0; i < libros.size(); i++) {
            System.out.println(libros.get(i));
        }
        if (libros.size() == 0) {
            System.out.println("No hay libros registrados");
        }
    }

    public static void registarLectores() {
        System.out.println("Ingrese la informacion del lector");
        System.out.println("Nombre completo ");
        String nombre = teclado.nextLine();
        System.out.println("Numero de identificacion");
        String id = teclado.nextLine();
        System.out.println("Correo electronico");
        String email = teclado.nextLine();

        lectores.add(new Lector(nombre, id, email));
    }

    public static void listarLectores() {
        for (int i = 0; i < lectores.size(); i++) {
            System.out.println(lectores.get(i));
        }
        if (lectores.size() == 0) {
            System.out.println("No hay lectores registrados");
        }
    }

    public static void registrarPrestamos() {
        System.out.println("Ingrese la informacion del prestamo");
        System.out.println("Informacion del libro ");
        String infoLibro = teclado.nextLine();
        System.out.println("informacion del lector");
        String infoLector = teclado.nextLine();
        System.out.println("Fecha prestamo");
        String fechaPrestamo = teclado.nextLine();
        System.out.println("Fecha devolucion");
        String fechaDevolucion = teclado.nextLine();

        prestamos.add(new Prestamo(infoLibro, infoLector, fechaPrestamo, fechaDevolucion));
    }

    public static void listarPrestamos() {
        for (int i = 0; i < prestamos.size(); i++) {
            System.out.println(prestamos.get(i));
        }
        if (prestamos.size() == 0) {
            System.out.println("No hay prestamos registrados");
        }
    }

    public static void devolverLibros() {
        System.out.println("Ingrese la informacion para devolver el libro");
        System.out.println("Informacion del libro");
        String infoLibro = teclado.nextLine();
        System.out.println("informacion del lector");
        String infoLector = teclado.nextLine();

        for (int i = 0; i < prestamos.size(); i++) {
            Prestamo p = prestamos.get(i);
            if (p.informacionLibro.equals(infoLibro) && p.informacionLector.equals(infoLector)) {
                prestamos.remove(i);
                System.out.println("Libro devuelto exitosamente");
                return;
            }
        }
        System.out.println("No se encontro el prestamo");
    }

    public static void eliminarLibros() {
        System.out.println("¿Estás seguro de que deseas eliminar todos los libros si o no?");
        String confirmacion = teclado.nextLine().toLowerCase();

        if (confirmacion.equals("si")) {
            libros.clear();
            System.out.println("Todos los libros han sido eliminados correctamente");
        } else {
            System.out.println("Operación cancelada. No se eliminaron los libros");
        }
    }

    public static void eliminarLectores() {
        System.out.println("¿Estás seguro de que deseas eliminar todos los lectores si o no?");
        String confirmacion = teclado.nextLine().toLowerCase();

        if (confirmacion.equals("si")) {
            lectores.clear();
            System.out.println("Todos los lectores han sido eliminados correctamente");
        } else {
            System.out.println("Operación cancelada. No se eliminaron los lectores");
        }
    }

    public static void eliminarPrestamos() {
        System.out.println("¿Estás seguro de que deseas eliminar todos los prestamos si o no?");
        String confirmacion = teclado.nextLine().toLowerCase();

        if (confirmacion.equals("si")) {
            prestamos.clear();
            System.out.println("Todos los prestamos han sido eliminados correctamente");
        } else {
            System.out.println("Operación cancelada. No se eliminaron los prestamos");
        }
    }
}

















    
