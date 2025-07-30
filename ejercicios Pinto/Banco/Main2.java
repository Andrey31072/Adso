import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int opcion;
        do {
            System.out.println("1Menú:");
            System.out.println("1. Registrar ciudad");
            System.out.println("2. Crear sucursales");
            System.out.println("3. Listar sucursales");
            System.out.println("4. Clientes por producto");
            System.out.println("5. Productos por sucursal");
            System.out.println("6. Clientes por sucursal");
            System.out.println("7. Clientes por producto");
            System.out.println("8. Buscar producto");
            System.out.println("9. Menu Campañas");
            System.out.println("10. Salir");
            System.out.print("Opción: ");
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {
                case 1: Ciudad43.registrarCiudad(); break;
                case 2: Ciudad43.sucursales(); break;
                case 3: Ciudad43.listarSucursales(); break;
                case 4: Ciudad43.listarProductosTotales(); break;
                case 5: Ciudad43.listarProductosPorSucursal(); break;
                case 6: Ciudad43.listarClientesPorSucursal(); break;
                case 7: Ciudad43.listarClientesPorProducto(); break;
                case 8: Ciudad43.buscarProducto(); break;
                case 9: Ciudad43.Campaña(); break;
                case 10: System.out.println("Saliendo..."); break;
                default: System.out.println("Opción no válida.");
            }
        } while (opcion != 9);
        sc.close();
    }
}
