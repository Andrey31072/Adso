import java.util.Scanner;
public class exercise7 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        double cd;
        double gb;
        double mg;

        System.out.println("Número de CDs (se calculará automáticamente):");

        System.out.println("Número de Gigabytes del Disco Duro:");
        gb = teclado.nextDouble();

       
        mg = gb * 1024;


        cd = Math.floor(mg / 700) + 1;

        System.out.println("El número de CDs necesarios: " + (int)cd);

        teclado.close();
    }
}