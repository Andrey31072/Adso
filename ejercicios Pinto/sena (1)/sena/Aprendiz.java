// Clase que representa a un aprendiz (estudiante) en el sistema de formación.
public class Aprendiz {
    // Código único que identifica al aprendiz
    String codigo;
    // Cantidad de jornadas asignadas al aprendiz en una línea específica.
    int cantidadJornadas;
    // Cantidad total de jornadas asignadas al aprendiz en todas las líneas.
    int cantidadJornadasTotales;
    // Línea de formación a la que está asignado el aprendiz
    String linea;
    // Programa específico dentro de la línea .
    String programa;

    // Constructor para inicializar un aprendiz con su código. Inicializa las jornadas en 0.
    public Aprendiz(String codigo) {
        this.codigo = codigo;
        this.cantidadJornadas = 0;
        this.cantidadJornadasTotales = 0;
    }
}

/*En el caso de que se elimine el constructor:

Errores de compilación en el método asignarLineaPrograma que intenta crear objetos Aprendiz con un parámetro codigo.
Datos inválidos si se usa el constructor por defecto, ya que inicializa codigo, linea y programa como null, rompiendo la lógica de identificación, asignación y reportes.
Pérdida de funcionalidad en la asignación de líneas, programas y ambientes a aprendices, y en la generación de reportes útiles.
Validaciones inutilizadas, ya que el constructor por defecto no permite asignar un código único al crear el objeto. */