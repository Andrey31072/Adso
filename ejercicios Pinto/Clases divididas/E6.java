public class E6 {
    public static void areaTriangulo() {
        double a = Todos.numero1D;
        double b = Todos.numero2D;
        double c = Todos.numero3D;
        double d = (a + b + c) / 2.0;
        double area = Math.sqrt(d * (d - a) * (d - b) * (d - c));
        Todos.calcularDouble = area;
        System.out.println("El área del triángulo es: " + area);
    }
} 
