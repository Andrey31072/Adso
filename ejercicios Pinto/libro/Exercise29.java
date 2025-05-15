import java.util.Scanner;
public class Exercise29 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        
        int VE;
        int C1 = 0; // candidato 1
        int C2 = 0; // candidato 2
        int C3 = 0; // candidato 3
        int C0 = 0; // voto blanco
        int K;// contador

        
        for (K = 1; K <= 160; K++) {
            System.out.print("Ingrese el voto #" + K + " (1, 2, 3 o cualquier otro para nulo/blanco): ");
            VE = teclado.nextInt();

            switch (VE) {
                case 1:
                    C1++;
                    break;
                case 2:
                    C2++;
                    break;
                case 3:
                    C3++;
                    break;
                default:
                    C0++;
                    break;
            }
        }

       
        System.out.println("\nRESULTADOS FINALES:");
        System.out.println("Candidato 1: " + C1 + " votos");
        System.out.println("Candidato 2: " + C2 + " votos");
        System.out.println("Candidato 3: " + C3 + " votos");
        System.out.println("Votos nulos/blancos: " + C0);

        if (C1 > C2 && C1 > C3 && C1 > C0) {
            System.out.println("Ganador: Candidato 1 con " + C1 + " votos.");
        } else if (C2 > C3 && C2 > C0) {
            System.out.println("Ganador: Candidato 2 con " + C2 + " votos.");
        } else if (C3 > C0) {
            System.out.println("Ganador: Candidato 3 con " + C3 + " votos.");
        } else {
            System.out.println("Los votos nulos/blancos ganaron con " + C0 + " votos.");
        }

        teclado.close();
    }
}