public class Reportes {
    public static void generarReportes() {
        // r7
        
        System.out.println("Reporte de recorridos:");
        for (int i = 0; i < Datos.ambulancias.length; i++) {
            if (Datos.ambulancias[i] != null && (Datos.funeraria[0] == null || !Datos.ambulancias[i].equals(Datos.funeraria[0]))) {
                System.out.println("Ambulancia " + Datos.ambulancias[i] + ":");
                System.out.println("Kilómetros recorridos: " + Datos.kmAmbulancias[i]);
                System.out.println("Recorridos realizados: " + Datos.recorridosPorConductor[i]);
                for (int j = 0; j < 3; j++) {
                    if (Datos.recorridos[i][j] > 0) {
                        System.out.println("  - " + Datos.clinicas[j].getNombre() + ": " + Datos.recorridos[i][j] + " recorridos");
                    }
                }
            }
        }


        System.out.println("No movidos:");
        boolean hayNoMovidos = false;
        for (int i = 0; i < Datos.ambulancias.length; i++) {
            if (Datos.ambulancias[i] != null && Datos.kmAmbulancias[i] == 0 && 
                (Datos.funeraria[0] == null || !Datos.ambulancias[i].equals(Datos.funeraria[0]))) {
                System.out.println("Ambulancia " + Datos.ambulancias[i] + " no se movió.");
                hayNoMovidos = true;
            }
        }
        for (int i = 0; i < 3; i++) {
            if (Datos.clinicas[i].getSolicitudes() == 1) { 
                System.out.println(Datos.clinicas[i].getNombre() + " no fue atendida.");
                hayNoMovidos = true;
            }
        }
        if (!hayNoMovidos) {
            System.out.println("Todos se movieron.");
        }

        
        int totalRecorridos = 0;
        for (int i = 0; i < Datos.recorridosPorConductor.length; i++) {
            totalRecorridos += Datos.recorridosPorConductor[i];
        }
        System.out.println("Cantidad total de recorridos: " + totalRecorridos);
    }
}
