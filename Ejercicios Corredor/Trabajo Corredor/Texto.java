public class Texto {
    String nombre = "Kevin";
    String apellido = "Andrey";
    String ciudad = "Bogotá";
    String pais = "Colombia";
    String profesion = "Desarrollador";

    public String concatenar(String a, String b) { return a + " " + b; }
    public int contar(String texto) { return texto.length(); }
    public String mayuscula(String texto) { return texto.toUpperCase(); }
    public String minuscula(String texto) { return texto.toLowerCase(); }
    public boolean contiene(String texto, String palabra) { return texto.contains(palabra); }
}
