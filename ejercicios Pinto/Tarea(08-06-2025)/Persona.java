public class Persona {
    private String nombre;
    private String segundoNombre;
    private String apellido;
    private String segundoApellido;
    private int telefono;
    private String direccion;
    private String email;
    private String profesion;
    private String rh;

    public Persona(String nombre, String segundoNombre, String apellido, String segundoApellido,
                   int telefono, String direccion, String email, String profesion, String rh) {
        this.nombre = nombre;
        this.segundoNombre = segundoNombre;
        this.apellido = apellido;
        this.segundoApellido = segundoApellido;
        this.telefono = telefono;
        this.direccion = direccion;
        this.email = email;
        this.profesion = profesion;
        this.rh = rh;
    }

    public void mostrarDatos() {
        System.out.println("Nombre completo: " + nombre + " " + segundoNombre + " " + apellido + " " + segundoApellido);
        System.out.println("Teléfono: " + telefono);
        System.out.println("Dirección: " + direccion);
        System.out.println("Email: " + email);
        System.out.println("Profesión: " + profesion);
        System.out.println("RH: " + rh);
        System.out.println();
    }

    public String getNombre() {
        return nombre;
    }

    public String getProfesion() {
        return profesion;
    }

    public String getRh() {
        return rh;
    }
}
