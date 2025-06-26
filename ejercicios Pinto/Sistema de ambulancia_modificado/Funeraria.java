public class Funeraria {
    public static void transferirConductor() {
        System.out.println("Conductores disponibles:");
        for (int i = 0; i < Datos.Conductores.length; i++) {
            if (Datos.Conductores[i] != null) {
                System.out.println((i + 1) + ". " + Datos.Conductores[i]);
            }
        }

        System.out.print("Ingrese el número del conductor que desea mover a la funeraria: ");
        int opcion = Main.teclado.nextInt();
        Main.teclado.nextLine();

        if (opcion > 0 && opcion <= Datos.Conductores.length && Datos.Conductores[opcion - 1] != null) {
            String conductorSeleccionado = Datos.Conductores[opcion - 1];
            Datos.funeraria[0] = conductorSeleccionado;
            System.out.println("Conductor " + conductorSeleccionado + " transferido a la funeraria.");
        } else {
            System.out.println("Opción no válida.");
        }
    }
}