import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Clase que contiene la lógica principal para gestionar ubicaciones, ambientes, aprendices e instructores.
public class SistemaGestion {
    // Lista de ubicaciones registradas (regional, centro, sede).
    private List<Ubicacion> ubicaciones;
    // Lista de ambientes registrados (aulas, laboratorios).
    private List<Ambiente> ambientes;
    // Lista de aprendices registrados.
    private List<Aprendiz> aprendices;
    // Lista de instructores registrados.
    private List<Instructor> instructores;
    // Mapa que asocia líneas de formación con la cantidad de aprendices permitidos.
    private Map<String, Integer> lineas;

    // Constructor que inicializa las listas y el mapa.
    public SistemaGestion() {
        this.ubicaciones = new ArrayList<>();
        this.ambientes = new ArrayList<>();
        this.aprendices = new ArrayList<>();
        this.instructores = new ArrayList<>();
        this.lineas = new HashMap<>();
    }

    // RF1: Registra una nueva ubicación si no existe previamente.
    public void registrarUbicacion(String regional, String centro, String sede) {
        Ubicacion ubicacion = new Ubicacion(regional, centro, sede);
        if (!ubicaciones.contains(ubicacion)) {
            ubicaciones.add(ubicacion);
        }
    }

    // RF2: Define la cantidad de aprendices que pueden asignarse a una línea de formación.
    public void definirCantidadAprendices(String linea, int cantidad) {
        lineas.put(linea, cantidad);
    }

    // RF3: Asigna un ambiente a una línea de formación si el ambiente es especializado.
    public void asignarAmbienteLinea(String linea, Ambiente ambiente) {
        if (ambiente.especializado) {
            System.out.println("Ambiente " + ambiente.codigo + " asignado a línea " + linea);
        }
    }

    // RF4: Asigna aprendices a una línea de formación, respetando la cantidad disponible.
    public void identificarYAsignarAprendices(String linea, int cantidad) {
        int disponibles = lineas.getOrDefault(linea, 0);
        for (Aprendiz aprendiz : aprendices) {
            if (disponibles > 0 && aprendiz.linea == null) {
                aprendiz.linea = linea;
                disponibles--;
            }
            if (disponibles == 0) break;
        }
    }

    // RF5: Asigna aprendices a un ambiente específico dentro de una línea de formación.
    public void asignarAprendicesAmbiente(String linea, Ambiente ambiente) {
        for (Aprendiz aprendiz : aprendices) {
            if (aprendiz.linea != null && aprendiz.linea.equals(linea)) {
                System.out.println("Aprendiz " + aprendiz.codigo + " asignado a ambiente " + ambiente.codigo);
            }
        }
    }

    // RF6: Asigna una línea y un programa de formación a un aprendiz específico.
    public void asignarLineaPrograma(Aprendiz aprendiz, String linea, String programa) {
        aprendiz.linea = linea;
        aprendiz.programa = programa;
    }

    // RF7: Registra un nuevo instructor y lo asocia a una línea de formación.
    public void registrarInstructor(String codigo, String sede, String linea) {
        Instructor instructor = new Instructor(codigo, sede);
        if (!instructores.contains(instructor)) {
            instructores.add(instructor);
            instructor.lineas.add(linea);
        }
    }

    // RNF1: Valida que un instructor no esté asignado a más de una sede.
    public void validarInstructorSede(Instructor instructor) {
        if (instructores.stream().filter(i -> i.codigo.equals(instructor.codigo)).count() > 1) {
            throw new IllegalStateException("Instructor asignado a múltiples sedes");
        }
    }

    // RNF2: Valida que la línea y el programa sean válidos.
    public void validarLineaPrograma(String linea, String programa) {
        if (!lineas.containsKey(linea) || programa == null || programa.isEmpty()) {
            throw new IllegalArgumentException("Línea o programa no válidos");
        }
    }

    // RNF3: Valida que un instructor no esté asignado a más de una línea o programa.
    public void validarInstructorLinea(Instructor instructor) {
        if (instructor.lineas.size() > 1 || instructor.programas.size() > 1) {
            throw new IllegalStateException("Instructor asignado a múltiples líneas o programas");
        }
    }

    // RNF4: Valida que un aprendiz no esté asignado a más de dos jornadas en una línea.
    public void validarJornadasAprendiz(Aprendiz aprendiz) {
        if (aprendiz.cantidadJornadas > 2) {
            throw new IllegalStateException("Aprendiz excedió límite de jornadas");
        }
    }

    // RNF5: Valida que un aprendiz no esté asignado a más de dos jornadas en total.
    public void validarJornadasTotales(Aprendiz aprendiz) {
        if (aprendiz.cantidadJornadasTotales > 2) {
            throw new IllegalStateException("Aprendiz excedió límite de jornadas totales");
        }
    }

    // Genera un reporte con información de todos los instructores registrados.
    public void generarReportesInstructores() {
        for (Instructor instructor : instructores) {
            System.out.println("Instructor: " + instructor.codigo + ", Sede: " + instructor.sede + ", Totalidad: N/A");
        }
    }

    // Genera un reporte con información de todos los aprendices registrados.
    public void generarReportesAprendices() {
        for (Aprendiz aprendiz : aprendices) {
            System.out.println("Aprendiz: " + aprendiz.codigo + ", Línea: " + aprendiz.linea + ", Programa: " + aprendiz.programa);
        }
    }

    // Genera un reporte con información de todos los ambientes registrados.
    public void generarReportesAmbientes() {
        for (Ambiente ambiente : ambientes) {
            System.out.println("Ambiente: " + ambiente.codigo + ", Especialidad: " + ambiente.especializado + ", Jornada: " + ambiente.jornada);
        }
    }

    // Agrega un aprendiz a la lista de aprendices.
    public void agregarAprendiz(Aprendiz aprendiz) {
        aprendices.add(aprendiz);
    }

    // Agrega un ambiente a la lista de ambientes.
    public void agregarAmbiente(Ambiente ambiente) {
        ambientes.add(ambiente);
    }
}

/* IllegalStateException es una funcion que nos ayuda a validar ciertos datos y en caso de que no se cumplan nos botara un mensaje en la
consola diciendonos que el argumento no existe, basicamente se utiliza para lanzar una excepción
que indica que el estado actual de un objeto o del sistema no es apropiado para realizar una operación solicitada

IllegalArgumentException nos Lanza  una excepción para indicar que un argumento es inválido, deteniendo la ejecución del método y
pasando el control al bloque catch más cercano.
 */