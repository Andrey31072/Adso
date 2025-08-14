// Clase que representa una ubicación física en el sistema, definida por regional, centro y sede.
public class Ubicacion {
    // Región administrativa 
    String regional;
    // Centro de formación dentro de la región 
    String centro;
    // Sede específica dentro del centro 
    String sede;

    // Constructor para inicializar una ubicación con regional, centro y sede.
    public Ubicacion(String regional, String centro, String sede) {
        this.regional = regional;
        this.centro = centro;
        this.sede = sede;
    }

    // Sobrescribe el método equals para comparar ubicaciones basándose en sus atributos.
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Ubicacion other = (Ubicacion) obj;
        return regional.equals(other.regional) && centro.equals(other.centro) && sede.equals(other.sede);
    }

}

/*  en el caso de eliminar el override :
Errores de compilación en el método registrarUbicacion que intenta crear objetos Ubicacion con parámetros regional, centro y sede.
Errores en tiempo de ejecución si se usa el constructor por defecto, ya que regional, centro y sede serán null, provocando NullPointerException en el método equals al intentar comparar ubicaciones.
Datos inválidos si se usa el constructor por defecto, rompiendo la lógica de registro de ubicaciones y la capacidad de evitar duplicados.
Validaciones inutilizadas, ya que el constructor por defecto no permite asignar valores específicos al crear el objeto, haciendo que las validaciones en Main.java sean irrelevantes.*/