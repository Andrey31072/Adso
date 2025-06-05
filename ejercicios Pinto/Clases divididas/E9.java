public class E9 {
    public static void cuil() {
        int fechaActual = Todos.numero1;
        int fechaNacimiento = Todos.numero2;
        int edad = fechaActual - fechaNacimiento;
        if (edad >= 18) {
            System.out.println("La persona debe sacar su CUIL.");
        } else {
            System.out.println("La persona no necesita sacar su CUIL.");
        }
    }
}

