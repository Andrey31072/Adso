public class Pacientes {
    public static void registrarPacientes() {
        for (int x = 0; x < 100; x++) {
            System.out.print("Ingresa el nombre del paciente " + (x + 1) + ": ");
            String nombre = Main.teclado.nextLine();
            System.out.print("Ingresa el apellido del paciente " + (x + 1) + ": ");
            String apellido = Main.teclado.nextLine();
            System.out.print("Ingresa el número de teléfono del paciente " + (x + 1) + ": ");
            String telefono = Main.teclado.nextLine();
            System.out.print("Ingresa la edad del paciente " + (x + 1) + ": ");
            int edad = Main.teclado.nextInt();
            Main.teclado.nextLine();
            System.out.print("Ingresa el tipo de sangre del paciente " + (x + 1) + ": ");
            String tipoSangre = Main.teclado.nextLine();

            Datos.pacientes[x] = nombre + " " + apellido + " - Tel: " + telefono + " - Edad: " + edad + " - Tipo de Sangre: " + tipoSangre;
        }
        System.out.println("Pacientes registrados:");
        for (int i = 0; i < 100; i++) {
            if (Datos.pacientes[i] != null) {
                System.out.println((i + 1) + ". " + Datos.pacientes[i]);
            }
        }
    }
}

