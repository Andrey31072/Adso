public class Prestamo {

    public String informacionLibro;
    public String informacionLector;
    public String fechaPrestamo;
    public String fechaDevolucion;

    public Prestamo(String informacionDelLibro, String informacionDelLector, String fechaPrestamo, String fechaDevolucion) {
        this.informacionLibro = informacionDelLibro;
        this.informacionLector = informacionDelLector;
        this.fechaPrestamo = fechaPrestamo;
        this.fechaDevolucion = fechaDevolucion;    
    }

    @Override
    public String toString() {
        return "Prestamo [Informacion del libro=" + informacionLibro + ", Informacion del usuario=" + informacionLector + ", Fecha prestamo=" + fechaPrestamo + ", Fecha devolucion=" + fechaDevolucion + "]";
    
}

}