public class Fallecidos {
    public static void registrarMuertos() {
        for (int x = 0; x < 15; x++) {
            System.out.println("Registro de Fallecidos");
            System.out.print("Ingresa el nombre del fallecido " + (x + 1) + ": ");
            String nombre = Main.teclado.nextLine();
            System.out.print("Ingresa el apellido del fallecido " + (x + 1) + ": ");
            String apellido = Main.teclado.nextLine();
            System.out.print("Ingresa el número de teléfono de contacto del fallecido " + (x + 1) + ": ");
            String telefono = Main.teclado.nextLine();
            System.out.print("Ingresa la edad del fallecido " + (x + 1) + ": ");
            int edad = Main.teclado.nextInt();
            Main.teclado.nextLine();

            Datos.muertos[x] = nombre + " " + apellido + " - Tel: " + telefono + " - Edad: " + edad;
        }
        System.out.println("Fallecidos registrados:");
        for (int i = 0; i < 15; i++) {
            if (Datos.muertos[i] != null) {
                System.out.println((i + 1) + ". " + Datos.muertos[i]);
            }
        }
    }
}