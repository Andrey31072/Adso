public class Clinica {
    private String nombre;
    private double distancia; 
    private int solicitudes;

    public Clinica(String nombre, double distancia) {
        this.nombre = nombre;
        this.distancia = distancia;
        this.solicitudes = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public double getDistancia() {
        return distancia;
    }

    public void solicitarAmbulancia() {
        this.solicitudes++;
    }

    public int getSolicitudes() {
        return solicitudes;
    }

    public double distanciaRecorrido() {
        return 2 * distancia; 
    }
}