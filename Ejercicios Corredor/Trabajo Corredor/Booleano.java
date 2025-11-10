public class Booleano {
    boolean activo = true;
    boolean encendido = false;
    boolean aprobado = true;
    boolean disponible = false;
    boolean visible = true;

    public boolean esVerdadero(boolean valor) { return valor; }
    public boolean negacion(boolean valor) { return !valor; }
    public boolean ambosVerdaderos(boolean a, boolean b) { return a && b; }
    public boolean algunoVerdadero(boolean a, boolean b) { return a || b; }
    public boolean iguales(boolean a, boolean b) { return a == b; }
}
