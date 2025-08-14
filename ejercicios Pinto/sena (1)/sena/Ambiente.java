// Clase que representa un ambiente de formación, como un aula o laboratorio.
public class Ambiente {
    // Código único que identifica el ambiente
    String codigo;
    // Indica si el ambiente es especializado
    boolean especializado;
    // Jornada en la que se usa el ambiente
    String jornada;

    // Constructor para inicializar un ambiente con su código, estado especializado y jornada.
    public Ambiente(String codigo, boolean especializado, String jornada) {
        this.codigo = codigo;
        this.especializado = especializado;
        this.jornada = jornada;
    }
}


/* En el caso de que se elimine el constructor:
Errores de compilación en los métodos que crean objetos Ambiente con parámetros (asignarAmbienteLinea y asignarAprendicesAmbiente).
Datos inválidos si se usa el constructor por defecto, ya que inicializa codigo y jornada como null y especializado como false, rompiendo la lógica de asignaciones y reportes.
Pérdida de funcionalidad en la asignación de ambientes especializados y en la generación de reportes útiles.
Validaciones inutilizadas, ya que los valores no se asignan correctamente al crear el objeto.*/