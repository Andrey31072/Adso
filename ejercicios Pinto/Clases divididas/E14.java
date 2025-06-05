public class E14 {
    public static void romanos() {
        int num = Todos.numero1;
        if (num < 1 || num > 10) {
            System.out.println("Número fuera del rango (1-10)");
            return;
        }
        String[] romanos = {"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"};
        System.out.println("El número " + num + " en romano es: " + romanos[num - 1]);
    }
}

