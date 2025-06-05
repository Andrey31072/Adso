public class E8 {
    public static void puntos() {
        double x1 = Todos.numero1D;
        double y1 = Todos.numero2D;
        double x2 = Todos.numero3D;
        double y2 = Todos.numero4D;
        double distancia = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
        Todos.calcularDouble = distancia;
        System.out.println("La distancia entre puntos es: " + distancia);
    }
}

