public class Lector {

    public String nombreCompleto;
    public String numeroIdentificacion;
    public String correoElectronico;

    public Lector (String nombreCompleto, String numeroIdentificacion, String correoElectronico) {
        this.nombreCompleto = nombreCompleto;
        this.numeroIdentificacion = numeroIdentificacion;
        this.correoElectronico = correoElectronico;
    }

    @Override
   public String toString() {
        return "Lector [Nombre completo=" + nombreCompleto + ", Numero de identificacion" + numeroIdentificacion + ", Correo Electronico=" + correoElectronico + "]";

    }


}
