public class E7 {
    public static void cds() {
        double gb = Todos.numero1D;
        int cdSizeMB = 700;
        int fileMB = (int)(gb * 1024);
        int cds = (int)Math.ceil((double)fileMB / cdSizeMB);
        Todos.calcularInt = cds;
        System.out.println("Cantidad de CDs necesarios: " + cds);
    }
}

