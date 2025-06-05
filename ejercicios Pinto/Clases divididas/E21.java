public class E21 {
    public static void docientos() {
        int mayores = 0, menores = 0;
        for (int i = 0; i < 200; i++) {
            System.out.println("Ingrese la edad de la persona " + (i + 1) + ":");
            int edad = Todos.teclado.nextInt();
            if (edad >= 18) {
                mayores++;
            } else {
                menores++;
            }
        }
        System.out.println("Mayores de edad: " + mayores);
        System.out.println("Menores de edad: " + menores);
    }
}
