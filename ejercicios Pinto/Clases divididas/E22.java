public class E22 {
    public static void suma() {
        int a = Todos.numero1;
        int b = Todos.numero2;
        int producto = 0;
        for (int i = 0; i < Math.abs(b); i++) {
            producto += a;
        }
        if (b < 0) producto = -producto;
        Todos.calcularInt = producto;
        System.out.println("El producto es: " + producto);
    }
}
