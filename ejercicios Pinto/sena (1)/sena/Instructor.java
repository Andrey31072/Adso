import java.util.ArrayList;
import java.util.List;

// Clase que representa a un instructor en el sistema de formación.
public class Instructor {
    // Código único que identifica al instructor
    String codigo;
    // Sede donde el instructor está asignado
    String sede;
    // Lista de líneas de formación asociadas al instructor
    List<String> lineas;
    // Lista de programas asociados al instructor
    List<String> programas;

    // Constructor para inicializar un instructor con su código y sede, y listas vacías para líneas y programas.
    public Instructor(String codigo, String sede) {
        this.codigo = codigo;
        this.sede = sede;
        this.lineas = new ArrayList<>();
        this.programas = new ArrayList<>();
    }
}
/*En el caso de que se elimine el constructor :
Errores de compilación en el método registrarInstructor que intenta crear objetos Instructor con parámetros codigo y sede.
Errores en tiempo de ejecución si se usa el constructor por defecto, ya que lineas y programas serán null, provocando NullPointerException al intentar agregar elementos.
Datos inválidos si se usa el constructor por defecto, ya que inicializa codigo y sede como null, rompiendo la lógica de identificación, asignación y reportes.
Validaciones inutilizadas, ya que el constructor por defecto no permite asignar 
un código único ni una sede específica al crear el objeto, y las validaciones como validarInstructorSede y validarInstructorLinea fallarán. */