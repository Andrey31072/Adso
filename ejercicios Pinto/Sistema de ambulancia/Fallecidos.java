
    import java.util.Scanner;

    public class Fallecidos {

        public static  Main sapa = new Main();
    public static void registrarMuertos() {

        Scanner teclado= new Scanner(System.in);

        for (int x = 0; x < 15; x++){
            System.out.println("Registro de Fallecidos");
            System.out.println("Ingresa el nombre del fallecido " + (x+1) + ":");
            String nombre = Main.teclado.nextLine();
            System.out.println("Ingresa el apellido del fallecido " + (x+1) + ":");
            String apellido = Main.teclado.nextLine();
            System.out.println("Ingresa el número de teléfono de contacto del fallecido " + (x+1) + ":");
            String telefono = Main.teclado.nextLine();
            System.out.println("Ingresa la edad del fallecido " + (x+1) + ":");
            int edad = Main.teclado.nextInt();
            Main.teclado.nextLine();

            Datos.muertos[x] = nombre + " " + apellido + " - Tel: " + telefono + " - Edad: " + edad;
        }
        System.out.println("Fallecidos registrados:");
        for (int i = 0; i < 15; i++) {
            System.out.println((i + 1) + ". " + Datos.muertos[i]);
        }
    }

}
