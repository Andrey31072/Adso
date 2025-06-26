/*
public static void asignarRecorridos() {
    // Inicializar clínicas si no están definidas
    if (Datos.clinicas == null || Datos.clinicas.length < 4) {
        System.out.println("Error: Arreglo de clínicas no inicializado o insuficiente.");
        return;
    }
    if (Datos.clinicas[0] == null) {
        Datos.clinicas[0] = new Clinica("Clínica de Factura", 55.0);
        Datos.clinicas[1] = new Clinica("Carmen Emilia Ospina", 35.0);
        Datos.clinicas[2] = new Clinica("Clínica Belo Horizonte", 45.0);
        Datos.clinicas[3] = new Clinica("Funeraria", 15.0);
    }

    // Generar solicitudes iniciales
    for (int i = 0; i < Datos.clinicas.length; i++) {
        if (Datos.clinicas[i] != null) {
            Datos.clinicas[i].solicitarAmbulancia();
        }
    }

    // Asignar recorridos
    if (Datos.ambulancias == null || Datos.recorridos == null || Datos.recorridosPorConductor == null || Datos.kmAmbulancias == null) {
        System.out.println("Error: Arreglos de datos no inicializados.");
        return;
    }

    for (int i = 0; i < Datos.ambulancias.length; i++) {
        if (Datos.ambulancias[i] != null && (Datos.funeraria == null || Datos.funeraria[0] == null || !Datos.Conductores[i].equals(Datos.funeraria[0]))) {
            int recorridos = 0;
            double kmTotal = 0;

            while (recorridos < 8 && kmTotal < 400) {
                int solicitudesAtendidas = 0; // Contador para verificar si se atendió alguna solicitud
                for (int j = 0; j < Datos.clinicas.length; j++) {
                    if (Datos.clinicas[j] != null && Datos.clinicas[j].getSolicitudes() > 0) {
                        double distancia = Datos.clinicas[j].distanciaRecorrido();
                        if (kmTotal + distancia <= 400) {
                            Datos.recorridos[i][j]++;
                            kmTotal += distancia;
                            recorridos++;
                            Datos.recorridosPorConductor[i]++;
                            // Suponiendo un método para reducir solicitudes
                            // Datos.clinicas[j].disminuirSolicitudes();
                            solicitudesAtendidas++;
                        }
                    }
                }
                if (solicitudesAtendidas == 0) break; // Salir si no se atendió ninguna solicitud
            }
            Datos.kmAmbulancias[i] = kmTotal;
        }
    }
}
 */
