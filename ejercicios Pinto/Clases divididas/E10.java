public class E10 {
    public static void edadMayor() {
        int edad1 = Todos.numero1;
        int edad2 = Todos.numero2;
        int diferencia = Math.abs(edad1 - edad2);
        String mayor = (edad1 > edad2) ? "El primer hermano es mayor" : 
                      (edad2 > edad1) ? "El segundo hermano es mayor" : "Ambos tienen la misma edad";
        System.out.println("Diferencia de edad: " + diferencia);
        System.out.println(mayor);
    }
}

