public class E15 {
    public static void ventas () {
        double ventas = Todos.numero1D;
        double bono = 0;
        if (ventas > 10000) bono = ventas * 0.10;
        else if (ventas > 5000) bono = ventas * 0.05;
        System.out.println("Bonificación: " + bono);
    }
}