import java.util.Scanner;

public class Ciudad43 {
    static Scanner sc = new Scanner(System.in);
    static String[][][] clientesPorSucursal;
    static int[] numClientesPorSucursal;
    static int totalSucursales = 0;
    static String[] productos = {"CAA", "CAC", "CDT", "TC", "Préstamos Libres", "Préstamos LI", "Préstamos H"};

    public static void registrarCiudad() {
        System.out.print("Nombre de la ciudad: ");
        String nombre = sc.nextLine().trim();
        System.out.println("Ciudad: " + (nombre.isEmpty() ? "No especificada" : nombre));
    }

    public static void sucursales() {
        System.out.print("Número de sucursales: ");
        int numSucursales = Math.max(1, sc.nextInt());
        sc.nextLine();

        System.out.print("Máximo de clientes por sucursal: ");
        int maxClientesPorSucursal = Math.max(1, sc.nextInt());
        sc.nextLine();

        totalSucursales = numSucursales;
        clientesPorSucursal = new String[numSucursales][maxClientesPorSucursal][2];
        numClientesPorSucursal = new int[numSucursales];

        for (int sucursalIndex = 0; sucursalIndex < numSucursales; sucursalIndex++) {
            System.out.println("Sucursal " + (sucursalIndex + 1) + ":");
            System.out.print("  Número de clientes: ");
            int numClientes = Math.min(Math.max(0, sc.nextInt()), maxClientesPorSucursal);
            sc.nextLine();

            numClientesPorSucursal[sucursalIndex] = numClientes;
            for (int clienteIndex = 0; clienteIndex < numClientes; clienteIndex++) {
                System.out.print("  Nombre cliente " + (clienteIndex + 1) + ": ");
                String nombre = sc.nextLine().trim();
                nombre = nombre.isEmpty() ? "Anónimo" : nombre;

                System.out.println("  Productos:");
                for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
                    System.out.println("    " + (productoIndex + 1) + ". " + productos[productoIndex]);
                }
                System.out.print("  Seleccione producto (1-" + productos.length + "): ");
                int productoSeleccionado = Math.min(Math.max(0, sc.nextInt() - 1), productos.length - 1);
                sc.nextLine();

                clientesPorSucursal[sucursalIndex][clienteIndex][0] = nombre;
                clientesPorSucursal[sucursalIndex][clienteIndex][1] = productos[productoSeleccionado];
            }
        }
    }

    public static void listarSucursales() {
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
            System.out.println("Sucursal " + (sucursalIndex + 1) + ":");
            if (numClientesPorSucursal[sucursalIndex] == 0) {
                System.out.println("  Sin clientes.");
            } else {
                for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                    System.out.println("  - " + clientesPorSucursal[sucursalIndex][clienteIndex][0] + ": " + clientesPorSucursal[sucursalIndex][clienteIndex][1]);
                }
            }
        }
    }

    public static void listarProductosTotales() {
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        int[] productoCount = new int[productos.length];
        for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
            for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
                    if (clientesPorSucursal[sucursalIndex][clienteIndex][1].equals(productos[productoIndex])) {
                        productoCount[productoIndex]++;
                        break;
                    }
                }
            }
        }
        System.out.println("Clientes por producto:");
        for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
            System.out.println("  - " + productos[productoIndex] + ": " + productoCount[productoIndex]);
        }
    }

    public static void listarProductosPorSucursal() {
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
            System.out.println("Sucursal " + (sucursalIndex + 1) + ":");
            int[] productoCount = new int[productos.length];
            for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
                    if (clientesPorSucursal[sucursalIndex][clienteIndex][1].equals(productos[productoIndex])) {
                        productoCount[productoIndex]++;
                        break;
                    }
                }
            }
            for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
                System.out.println("  - " + productos[productoIndex] + ": " + productoCount[productoIndex]);
            }
        }
    }

    public static void listarClientesPorSucursal() {
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        System.out.println("Clientes por sucursal:");
        for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
            System.out.println("Sucursal " + (sucursalIndex + 1) + ":");
            if (numClientesPorSucursal[sucursalIndex] == 0) {
                System.out.println("  Sin clientes.");
            } else {
                for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                    System.out.println("  - " + clientesPorSucursal[sucursalIndex][clienteIndex][0]);
                }
            }
        }
    }

    public static void listarClientesPorProducto() {
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        System.out.println("Clientes por producto:");
        for (int productoIndex = 0; productoIndex < productos.length; productoIndex++) {
            System.out.println(productos[productoIndex] + ":");
            boolean hasClients = false;
            for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
                for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                    if (clientesPorSucursal[sucursalIndex][clienteIndex][1].equals(productos[productoIndex])) {
                        System.out.println("  - " + clientesPorSucursal[sucursalIndex][clienteIndex][0] + " (Sucursal " + (sucursalIndex + 1) + ")");
                        hasClients = true;
                    }
                }
            }
            if (!hasClients) System.out.println("  Sin clientes.");
        }
    }

    public static void buscarProducto() {
        System.out.print("Producto a buscar: ");
        String productoBuscado = sc.nextLine().trim();
        int productoIndex = -1;
        for (int prodIndex = 0; prodIndex < productos.length; prodIndex++) {
            if (productos[prodIndex].equalsIgnoreCase(productoBuscado)) {
                productoIndex = prodIndex;
                break;
            }
        }
        if (productoIndex == -1) {
            System.out.println("Producto no válido.");
            return;
        }
        if (totalSucursales == 0) {
            System.out.println("Sin sucursales.");
            return;
        }
        System.out.println("Sucursales con " + productos[productoIndex] + ":");
        for (int sucursalIndex = 0; sucursalIndex < totalSucursales; sucursalIndex++) {
            System.out.println("Sucursal " + (sucursalIndex + 1) + ":");
            boolean hasClients = false;
            for (int clienteIndex = 0; clienteIndex < numClientesPorSucursal[sucursalIndex]; clienteIndex++) {
                if (clientesPorSucursal[sucursalIndex][clienteIndex][1].equals(productos[productoIndex])) {
                    System.out.println("  - " + clientesPorSucursal[sucursalIndex][clienteIndex][0]);
                    hasClients = true;
                }
            }
            if (!hasClients) System.out.println("  Sin clientes.");
        }
    }
    public static void Campaña() {
    int opcion=0;
    String campañaInterés;
    String CampañaFactura;
    String campañaNueva;
    do {
        System.out.println("------------ Menú de Campaña -----------");
        System.out.println("1. Camapaña de Interes");
        System.out.println("2. Campaña de factura");
        System.out.println("3. Camapaña Nueva");
        System.out.println("4. Salir");
        System.out.print("Seleccione una opción: ");
        opcion = sc.nextInt();
        sc.nextLine();
        switch (opcion) {
            case 1:
                System.out.println("Iniciando campaña de interés...");
                System.out.print("Ingrese el nombre de la campaña: ");
                campañaInterés = sc.nextLine().trim();
                if (campañaInterés.isEmpty()) {
                    System.out.println("Nombre de campaña no especificado.");
                } else {
                    System.out.println("Campaña de interés: " + campañaInterés);
                }
                break;
            case 2:
                System.out.println("Iniciando campaña de factura...");
                System.out.print("Ingrese el nombre de la campaña: ");
                CampañaFactura = sc.nextLine().trim();
                if (CampañaFactura.isEmpty()) {
                    System.out.println("Nombre de campaña no especificado.");
                } else {
                    System.out.println("Campaña de factura: " + CampañaFactura);
                }
                break;
            case 3:
                System.out.println("Iniciando campaña nueva...");
                System.out.print("Ingrese el nombre de la campaña: ");
                campañaNueva = sc.nextLine().trim();
                if (campañaNueva.isEmpty()) {
                    System.out.println("Nombre de campaña no especificado.");
                } else {
                    System.out.println("Campaña nueva: " + campañaNueva);
                }
                break;
            default:
                System.out.println("Opción no válida. Intente nuevamente.");
        }
    } while (opcion != 0);

}
}