public class Funeraria {
    public static String[] funeraria = new String[1];
    public static void transferirconductor() {
    for (int i = 0; i < Datos.ambulancias.length; i++) {
        if (Datos.ambulancias[i] != null) {
            System.out.println((i + 1) + ". " + Datos.ambulancias[i]);
        }
    }

    System.out.print("Ingrese el id del conductor que desea mover a la funeraria: ");
    int opcion = Main.teclado.nextInt();
    Main.teclado.nextLine();


    String conductorSeleccionado = Datos.ambulancias[opcion - 1];
    Datos.ambulancias[opcion - 1] = null;
    Datos.funeraria[0] = conductorSeleccionado;
}
}