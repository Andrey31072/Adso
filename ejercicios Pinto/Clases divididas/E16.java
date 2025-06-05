public class E16 {
    public static void mensaje() {
        int num = Todos.numero1;
        if (num < 1 || num > 5) {
            System.out.println("Número fuera del rango (1-5)");
            return;
        }
        char[] vocales = {'a', 'e', 'i', 'o', 'u'};
        System.out.println("La vocal equivalente es: " + vocales[num - 1]);
    }
}

