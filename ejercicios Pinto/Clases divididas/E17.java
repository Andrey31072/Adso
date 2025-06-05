public class E17 {
    public static void decenas() {
        int num = Todos.numero1;
        if (num < 10 || num > 99) {
            System.out.println("El número debe tener dos cifras.");
            return;
        }
        int decenas = num / 10;
        int unidades = num % 10;
        System.out.println("Decenas: " + decenas + ", Unidades: " + unidades);
    }
}
