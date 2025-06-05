public class E18 {
    public static void calcular() {
        int num = Todos.numero1;
        if (num == 0) {
            System.out.println("Número cero no válido");
            return;
        }
        if (num % 2 == 0) {
            System.out.println("El número es par");
        } else {
            System.out.println("El número es impar");
        }
    }
}

