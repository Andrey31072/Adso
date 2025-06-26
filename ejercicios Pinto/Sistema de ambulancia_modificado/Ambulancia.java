import java.util.Scanner;

public class Ambulancia {
    public static void registrarAmbulancias() {
        Scanner teclado = Main.teclado;
        for (int i = 0; i < 3; i++) {
            System.out.print("Ingrese ID de la ambulancia " + (i + 1) + " (1-10): ");
            Datos.ambulancias[i] = teclado.nextLine();
        }

        System.out.println("Ambulancias registradas:");
        for (int i = 0; i < 3; i++) {
            if (Datos.ambulancias[i] != null) {
                System.out.println((i + 1) + ". " + Datos.ambulancias[i]);
            }
        }
    }

    public static void asignarRecorridos() {

        if (Datos.clinicas[0] == null) {
            Datos.clinicas[0] = new Clinica("Clínica de Factura", 27.5);
            Datos.clinicas[1] = new Clinica("Carmen Emilia Ospina", 17.5);
            Datos.clinicas[2] = new Clinica("Clínica Belo Horizonte", 22.5);
            Datos.clinicas[3] = new Clinica("Funeraria", 7.5);
        }


        for (int i = 0; i < 3; i++) {
            Datos.clinicas[i].solicitarAmbulancia();
        }

        for (int i = 0; i < Datos.ambulancias.length; i++) {
            if (Datos.ambulancias[i] != null && (Datos.funeraria[0] == null || !Datos.Conductores[i].equals(Datos.funeraria[0]))) {
                int recorridos = 0;
                double kmTotal = 0;

                while (recorridos < 8 && kmTotal < 400) {
                    boolean assigned = false;
                    for (int j = 0; j < 3; j++) {
                        if (Datos.clinicas[j].getSolicitudes() > 0) {
                            double distancia = Datos.clinicas[j].distanciaRecorrido();
                            if (kmTotal + distancia <= 400) {
                                Datos.recorridos[i][j]++;
                                kmTotal += distancia;
                                recorridos++;
                                Datos.recorridosPorConductor[i]++;
                                Datos.clinicas[j].solicitarAmbulancia(); 
                                assigned = true;
                            }
                        }
                    }
                    if (!assigned) break;
                }
                Datos.kmAmbulancias[i] = kmTotal;
            }
        }
    }
}