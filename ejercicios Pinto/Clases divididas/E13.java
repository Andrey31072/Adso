public class E13 {
    public static void triangulo() {
        int a = Todos.numero1;
        int b = Todos.numero2;
        int c = Todos.numero3;
        if (a == b && b == c) {
            System.out.println("El triángulo es equilátero");
        } else if (a == b || b == c || a == c) {
            System.out.println("El triángulo es isósceles");
        } else {
            System.out.println("El triángulo es escaleno");
        }
    }
}

