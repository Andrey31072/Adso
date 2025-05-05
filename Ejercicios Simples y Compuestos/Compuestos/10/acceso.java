public class acceso {

    private static final String USUARIO_CORRECTO = "Kevin Andrey";
    private static final String CONTRASENA_CORRECTA = "700890";
    public static void main(String[] args) {
        
        String usuarioIngresado = "Kevin Andrey";  
        String contrasenaIngresada = "700890"; 

        if (USUARIO_CORRECTO.equals(usuarioIngresado) && 
            CONTRASENA_CORRECTA.equals(contrasenaIngresada)) {
            System.out.println("Acceso concedido.");
        } else {
            System.out.println("Acceso denegado.");
        }
    }
}