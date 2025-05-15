import java.util.Scanner;
public class Exercise28 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

    
        int NumeroDeVocales = 0; 
        int NumeroDeConsonantes = 0; 
        String Letra;  
        

       for (int K = 1; K <= 10; K++) {
            System.out.print("Ingrese la letra número " + K + ": ");
            Letra = teclado.nextLine().toLowerCase(); // convierte todo a minúscula directamente

            // Validar que sea una sola letra
            if (Letra.length() != 1 || !Character.isLetter(Letra.charAt(0))) {
                System.out.println("Entrada inválida. Debe ingresar solo una letra.");
                K--; // repetir intento
                continue;
            }

            // Usar equals() para comparar strings
            if (Letra.equals("a") || Letra.equals("e") || Letra.equals("i") || Letra.equals("o") || Letra.equals("u")) {
                NumeroDeVocales++;
            } else {
                NumeroDeConsonantes++;
            }
        }

        System.out.println("Cantidad de vocales ingresadas: " + NumeroDeVocales);
        System.out.println("Cantidad de consonantes ingresadas: " + NumeroDeConsonantes);

        teclado.close();
    }
}
