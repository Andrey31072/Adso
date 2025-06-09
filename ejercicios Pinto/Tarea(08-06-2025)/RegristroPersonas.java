import java.util.Scanner;

public  class RegistroPersonas {
    public Persona[] personas;

    public RegistroPersonas(int cantidad) {
        personas = new Persona[cantidad];
    }

    public void registrarPersonas() {
        Scanner teclado = new Scanner(System.in);

        for (int i = 0; i < personas.length; i++) {
            System.out.println("\nPersona #" + (i + 1));

            System.out.print("Nombre: ");
            String nombre = teclado.nextLine();

            System.out.print("Segundo nombre: ");
            String segundoNombre = teclado.nextLine();

            System.out.print("Apellido: ");
            String apellido = teclado.nextLine();

            System.out.print("Segundo apellido: ");
            String segundoApellido = teclado.nextLine();

            System.out.print("Teléfono: ");
            int telefono = teclado.nextInt();
            teclado.nextLine();

            System.out.print("Dirección: ");
            String direccion = teclado.nextLine();

            System.out.print("Email: ");
            String email = teclado.nextLine();

            System.out.print("Profesión: ");
            String profesion = teclado.nextLine();

            System.out.print("RH: ");
            String rh = teclado.nextLine();

            personas[i] = new Persona(nombre, segundoNombre, apellido, segundoApellido, telefono, direccion, email, profesion, rh);
        }
    }

    public void mostrarTodas() {
        System.out.println("\n=== LISTA DE PERSONAS INGRESADAS ===");
        for (Persona p : personas) {
            p.mostrarDatos();
        }
    }

    public Persona[] getPersonas() {
        return personas;
    }
}

